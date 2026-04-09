#!/bin/bash

analyze_directory() {
    local dir_path="$1"
    
    local total_folders=$(find "$dir_path" -type d 2>/dev/null | wc -l)
    echo "Общее число папок, включая вложенные = $((total_folders - 1))"
    
    echo "Топ-5 папок с самым большим весом в порядке убывания:"
    du -h "$dir_path" --max-depth=1 2>/dev/null | sort -rh | head -n 6 | tail -n 5 | awk '{print NR " - " $2 ", " $1}' | while read -r line
    do
        echo "$line"
    done
}