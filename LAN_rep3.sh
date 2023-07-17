# ./Scripts/setup-ssl.sh 4

mpcfile=${1}

mkdir -p results
touch ./results/${mpcfile}_rep3_1.txt
touch ./results/${mpcfile}_rep3_2.txt
touch ./results/${mpcfile}_rep3_3.txt

for ROWS in 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304
# for ROWS in 1 2 4 8 16 32 64

do
    
    ((cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS; ./compile.py -R 64 Programs/Source/${mpcfile}.mpc; ./replicated-ring-party.x --my-port 5301 --batch-size 128 -h mp-spdz-aws-1 0 ${mpcfile}) >> ./results/${mpcfile}_rep3_1.txt 2>> ./results/${mpcfile}_rep3_1.txt) \
    & ((ssh mp-spdz-aws-2 "cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS; ./compile.py -R 64 Programs/Source/${mpcfile}.mpc; ./replicated-ring-party.x --my-port 5302 --batch-size 128 -h mp-spdz-aws-1 1 ${mpcfile};") >> ./results/${mpcfile}_rep3_2.txt 2>> ./results/${mpcfile}_rep3_2.txt) \
    & ((ssh mp-spdz-aws-3 "cd ~/MP-SPDZ; python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS; ./compile.py -R 64 Programs/Source/${mpcfile}.mpc; ./replicated-ring-party.x --my-port 5303 --batch-size 128 -h mp-spdz-aws-1 2 ${mpcfile};") >> ./results/${mpcfile}_rep3_3.txt 2>> ./results/${mpcfile}_rep3_3.txt) \
    && fg && fg
    wait

    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep3_1.txt 
    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep3_2.txt 
    echo "-------------------------------------------------------" >> ./results/${mpcfile}_rep3_3.txt 

done

