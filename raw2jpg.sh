#!/bin/bash

old_format=CR2
new_format=jpg
quality=80

output=output

mkdir -p ./$output

file_count=0

for i in *.$old_format
do
    sips -s format jpeg -s formatOptions $quality $i --out "./$output/${i%.*}.$new_format"
    file_count=$((file_count+1))
done

echo "Exported $file_count image(s) from $old_format to $new_format into the $output directory"
