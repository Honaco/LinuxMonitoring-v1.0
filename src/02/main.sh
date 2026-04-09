#!/bin/bash

source ./1.sh

if [ $# -ne 0 ]
    then
    echo Ошибка: скрипт не принимает параметры
    exit 1
fi


echo "HOSTNAME = $(HOSTNAME)"
echo "TIMEZONE = $(TIMEZONE)"
echo "USER = $(USER)"
echo "OS = $(OS)"
echo "DATE = $(DATE)"
echo "UPTIME = $(UPTIME)"
echo "UPTIME_SEC = $(UPTIME_SEC)"
echo "IP = $(IP)"
echo "MASK = $(MASK)"
echo "GATEWAY = $(GATEWAY)"
echo "RAM_TOTAL = $(RAM_TOTAL)"
echo "RAM_USED = $(RAM_USED)"
echo "RAM_FREE = $(RAM_FREE)"
echo "SPACE_ROOT = $(SPACE_ROOT)"
echo "SPACE_ROOT_USED = $(SPACE_ROOT_USED)"
echo "SPACE_ROOT_FREE = $(SPACE_ROOT_FREE)"

echo "Сохранить в файл? (Y/N)": 
read answer
if [ "$answer" = "Y" ] || [ "$answer" = "y" ]
    then
    filename=$(FILENAME)
    SAVE_TO_FILE "$filename"
fi