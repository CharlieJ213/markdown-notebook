#!/bin/bash

# Define the output directory
output_dir="./out"

rm -rf "$output_dir"
mkdir -p "$output_dir"

dir="$(eval pwd)/src"

cp -r $dir/assets $output_dir/assets

find $dir -type f -name "*.md" | while read -r markdown_file; do
    file_dir=$(dirname "$markdown_file")
    relative_path=${file_dir#$dir}


    mkdir -p "$output_dir/$relative_path"

    pandoc -o "$output_dir/$relative_path/$(basename "$markdown_file" .md).html" "$markdown_file"
done

echo "Conversion complete!"
