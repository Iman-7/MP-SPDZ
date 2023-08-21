for name in bench_add_B  # bench_equality_B  bench_inequality_B # bench_mul_B bench_and_B bench_xor_B # bench_add_A bench_mul_A bench_equality_A bench_inequality_A bench_xor_A bench_and_A  #
do 

    ./local_rep3.sh $name
    ./local_rep4.sh $name

done