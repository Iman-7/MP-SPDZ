echo 1 2 3 4 > Player-Data/Input-P0-0
echo 5 6 7 8 > Player-Data/Input-P1-0
echo 9 10 11 12 > Player-Data/Input-P2-0

mpcfile=${1}

mkdir -p results
touch ./results/${mpcfile}_local.txt

for ROWS in 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304
do  
    python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> ./results/${mpcfile}_local.txt 
    time Scripts/compile.py -R 64 ${mpcfile} >> ./results/${mpcfile}_local.txt
    echo "----------------------------------------------" >> ./results/${mpcfile}_local.txt
done