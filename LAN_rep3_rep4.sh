for name in bench_add bench_mul bench_xor bench_and bench_equality bench_inequality 
do 

    ./LAN_rep3.sh $name
    ./LAN_rep4.sh $name

done

