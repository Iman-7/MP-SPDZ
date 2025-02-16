echo 1 2 3 4 > Player-Data/Input-P0-0
echo 5 6 7 8 > Player-Data/Input-P1-0
echo 9 10 11 12 > Player-Data/Input-P2-0

mpcfile=${1}

mkdir -p results
touch ./results/${mpcfile}_local_rep3.txt
#Testing with the rep3 protocoal

for ROWS in 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304
do  
    # for THREADS in 1 2 4 8 16 32 64
    # do
    python3 inputgen.py "./Programs/Source/${mpcfile}.mpc" $ROWS >> ./results/${mpcfile}_local_rep3.txt 
    Scripts/compile-run.py -E ring ${mpcfile} >> ./results/${mpcfile}_local_rep3.txt
    echo "----------------------------------------------" >> ./results/${mpcfile}_local_rep3.txt
    # done
done