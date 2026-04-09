#!/bin/bash

analyze_files() {
    local dir_path="$1"
    
    local total_files=$(find "$dir_path" -type f 2>/dev/null | wc -l)
    
    local conf_files=$(find "$dir_path" -type f -name "*.conf" 2>/dev/null | wc -l)
    local text_files=$(find "$dir_path" -type f -exec file {} \; 2>/dev/null | grep -c "text")
    local exec_files=$(find "$dir_path" -type f -executable 2>/dev/null | wc -l)
    local log_files=$(find "$dir_path" -type f -name "*.log" 2>/dev/null | wc -l)
    local archive_files=$(find "$dir_path" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.bz2" -o -name "*.rar" \) 2>/dev/null | wc -l)
    local symlinks=$(find "$dir_path" -type l 2>/dev/null | wc -l)
    
    echo "Общее количество файлов = $total_files"
    echo "Конфигурационных файлов (с расширением .conf) = $conf_files"
    echo "Текстовых файлов = $text_files"
    echo "Исполняемых файлов = $exec_files"
    echo "Логов (файлов с расширением .log) = $log_files"
    echo "Архивов = $archive_files"
    echo "Символических ссылок = $symlinks"
    


    echo "Топ-10 файлов с самым большим весом в порядке убывания:"
    find "$dir_path" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | awk '{print NR " - " $2 ", " $1}' | while read -r line
        do
        file_path=$(echo "$line" | awk -F', ' '{print $1}' | awk '{print $3}')
        file_type=$(file -b "$file_path" 2>/dev/null | cut -d',' -f1)
        echo "${line}, ${file_type}"
    done
    


    echo "Топ-10 исполняемых файлов с самым большим весом в порядке убывания:"
    find "$dir_path" -type f -executable 2>/dev/null -exec du -h {} + | sort -rh | head -n 10 | awk '{print NR " - " $2 ", " $1}' | while read -r line
        do
        file_path=$(echo "$line" | awk -F', ' '{print $1}' | awk '{print $3}')
        file_hash=$(md5sum "$file_path" 2>/dev/null | awk '{print $1}')
        echo "${line}, ${file_hash}"
    done
}