for i in 1 2 3
do 
    for name in bench_add_A bench_mul_A bench_add_B bench_and_B bench_xor_B bench_equality_B bench_inequality_B # bench_add_A bench_mul_A bench_equality_A bench_inequality_A bench_xor_A bench_and_A  #
    do 

        ./compile_local_single.sh $name

    done
done