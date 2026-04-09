#!/bin/bash

source ./utils.sh
source ./dir_analyzer.sh
source ./file_analyzer.sh

if [ $# -ne 1 ]
    then
    echo "Ошибка: скрипт требует ровно один параметр - путь к директории, заканчивающийся на '/'"
    exit 1
fi

DIR_PATH="$1"

if ! validate_directory "$DIR_PATH"
    then
    exit 1
fi

START_TIME=$(date +%s.%N)

analyze_directory "$DIR_PATH"
analyze_files "$DIR_PATH"

END_TIME=$(date +%s.%N)
ELAPSED_TIME=$(echo "$END_TIME - $START_TIME" | bc)

FORMATTED_TIME=$(echo "$ELAPSED_TIME" | awk '{printf("%.5f\n", $1)}')
echo "Время выполнения скрипта = $FORMATTED_TIME секунд"