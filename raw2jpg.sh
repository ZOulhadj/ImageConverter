#!/bin/bash

# Note: SIPS requires 'jpeg' instead of jpg for such files

old_format=CR2
new_format=jpeg
compression_quality=80

output_folder=output

file_count=0

# TODO: Create a boolean flag to only create a folder if at least one file has been found
mkdir -p ./$output_folder

for i in *.$old_format; do
    sips -s format $new_format -s formatOptions $compression_quality $i --out "./$output_folder/${i%.*}.$new_format"
    file_count=$((file_count+1))
done

echo "Exported $file_count image(s) from $old_format to $new_format into the $output_folder directory"
