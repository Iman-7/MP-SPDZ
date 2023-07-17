cd ./results
mkdir -p timeResults

for file in *.txt
do
    python3 ../extract_input.py $file >> ./timeResults/${file}.txt

done