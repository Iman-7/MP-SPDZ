echo 1 2 3 4 > Player-Data/Input-P0-0
echo 5 6 7 8 > Player-Data/Input-P1-0
echo 9 10 11 12 > Player-Data/Input-P2-0
echo 13 14 15 16 > Player-Data/Input-P3-0

mpcfile=${1}

mkdir -p results
touch ./results/${mpcfile}_local_rep4.txt
#Testing with the rep4 protocoal

for ROWS in 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304
do  
    python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> ./results/${mpcfile}_local_rep4.txt 
    Scripts/compile-run.py -E rep4-ring ${mpcfile} >> ./results/${mpcfile}_local_rep4.txt
    echo "----------------------------------------------" >> ./results/${mpcfile}_local_rep4.txt
done