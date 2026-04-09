#!/bin/bash

validate_directory() {
    local dir_path="$1"
    if [ ! -d "$dir_path" ]
        then
        echo "Ошибка: директория не существует"
        return 1
    fi
    
    if [[ "$dir_path" != */ ]]
        then
        echo "Ошибка: путь к директории должен заканчиваться на '/'"
        return 1
    fi
    
    return 0
}
