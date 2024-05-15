#!/bin/bash

# Source this file in the `.zshrc` / `.bashrc`
# You can then create a new document immediately in this folder with `new-doc document-name`

# Replace with `path/to/docs`
NOTEBOOK_SYSTEM_PATH="~/Documents/markdown-notebook"

# Replace with whatever you'd like the command to be to jump to this notebook in your terminal
DOCS_ALIAS_IDENTIFIER="docs"

alias $DOCS_ALIAS_IDENTIFIER="cd $NOTEBOOK_SYSTEM_PATH"

new-doc () {
    # Feel free to add / change the folders you want suggested here
    local exclude_folders=("assets")
    local doc_name="$1"
    local dir="$NOTEBOOK_SYSTEM_PATH/src"

    # Build the exclude pattern for grep
    local exclude_pattern=$(printf "|%s" "${exclude_folders[@]}")
    exclude_pattern=${exclude_pattern:1} # remove the leading '|'

    # List all folders in the current directory excluding the ones specified
    local folders=$(find "$dir" -type d ! -path "$dir" | sed "s|$dir/||" | grep -vE "^($exclude_pattern)")

    echo $folders

    local folders_array=()
    while IFS= read -r line; do
        folders_array+=("$line")
    done <<< "$folders"

    local file_path=""
    folders_array=("root" "${folders_array[@]}")

    echo "Choose one of the following folders:"

    select folder in $folders_array; do
        if [ -n "$folder" ]; then  
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done
    if [ $folder = "root" ]; then
        file_path="$dir/$doc_name.md"
    else
        file_path="$dir/$folder/$doc_name.md"
    fi

    touch $file_path
    code $file_path
}
