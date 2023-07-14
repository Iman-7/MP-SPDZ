Scripts/tldr.sh
echo 1 2 3 4 > Player-Data/Input-P0-0
echo 5 6 7 8 > Player-Data/Input-P1-0
echo 9 10 11 12 > Player-Data/Input-P2-0
echo 13 14 15 16 > Player-Data/Input-P3-0
chmod +x *.x

#Testing with the rep4 protocoal

for ROWS in 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304
do
    python inputgen.py "./Programs/Source/bench_add.mpc" $ROWS >> ./results/add_rep4.txt >> ./results/add_mascot.txt
    Scripts/compile-run.py -E rep4-ring bench_add >> ./results/add_rep4.txt
    Scripts/compile-run.py -E mascot bench_add >> ./results/add_mascot.txt
done
# Scripts/compile-run.py -E replicated-ring bench_add
# Scripts/compile-run.py -E rep4-ring bench_add
# ./compile.py -R 64 tutorial
# python ./Programs/Source/test_args.mpc -E mascot

