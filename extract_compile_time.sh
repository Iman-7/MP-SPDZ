cd ./results
mkdir -p timeResults

for file in *.txt
do
    python3 ../extract_compile_time.py $file >> ./timeResults/compile_${file}

done