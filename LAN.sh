# ./Scripts/setup-ssl.sh 4

mpcfile=${1}

mkdir -p results
touch ./results/${mpcfile}_rep4_1.txt
touch ./results/${mpcfile}_rep4_2.txt
touch ./results/${mpcfile}_rep4_3.txt
touch ./results/${mpcfile}_rep4_4.txt

for ROWS in 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304
do
    
    (cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> ./results/${mpcfile}_rep4_1.txt; (./compile.py -R 64 Programs/Source/${mpcfile}.mpc) > log.txt; ./rep4-ring-party.x -pn 5500 -h mp-spdz-aws-1 0 ${mpcfile} >> ./results/${mpcfile}_rep4_1.txt)\
    & ((ssh mp-spdz-aws-2 "cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> res.txt; (./compile.py -R 64 Programs/Source/${mpcfile}.mpc) > log.txt; ./rep4-ring-party.x -h mp-spdz-aws-1 1 ${mpcfile} >> res.txt; cat res.txt") >> ./results/${mpcfile}_rep4_2.txt) \
    & ((ssh mp-spdz-aws-3 "cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> res.txt; (./compile.py -R 64 Programs/Source/${mpcfile}.mpc) > log.txt; ./rep4-ring-party.x -h mp-spdz-aws-1 2 ${mpcfile} >> res.txt; cat res.txt") >> ./results/${mpcfile}_rep4_3.txt) \
    & ((ssh mp-spdz-aws-4 "cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> res.txt; (./compile.py -R 64 Programs/Source/${mpcfile}.mpc) > log.txt; ./rep4-ring-party.x -h mp-spdz-aws-1 3 ${mpcfile} >> res.txt; cat res.txt") >> ./results/${mpcfile}_rep4_4.txt) \
    && fg && fg && fg
    wait

    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep4_1.txt 
    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep4_2.txt 
    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep4_3.txt 
    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep4_4.txt

done

