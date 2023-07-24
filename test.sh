# make setup
echo 1 2 3 4 > Player-Data/Input-P0-0
echo 1 2 3 4 > Player-Data/Input-P1-0
echo 1 2 3 4 > Player-Data/Input-P2-0
echo 1 2 3 4 > Player-Data/Input-P3-0
Scripts/compile-run.py -E rep4-ring test_bench_operations
# Scripts/compile-run.py -E ring test_bench_operations
# Scripts/compile-run.py -E mascot tutorial