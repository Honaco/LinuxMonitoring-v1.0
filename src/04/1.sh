#!/bin/bash


BACKGROUND_WHITE='\e[107m'
BACKGROUND_RED='\e[41m'
BACKGROUND_GREEN='\e[42m'
BACKGROUND_BLUE='\e[44m'
BACKGROUND_PURPLE='\e[45m'
BACKGROUND_BLACK='\e[40m'

TEXT_WHITE='\e[97m'
TEXT_RED='\e[31m'
TEXT_GREEN='\e[32m'
TEXT_BLUE='\e[34m'
TEXT_PURPLE='\e[35m'
TEXT_BLACK='\e[30m'

COLOR_RESET='\e[0m' 

check_colors() {
    if [ $1 -eq $2 ]
        then
        echo Ошибка: цвет фона и текста заголовков совпадают
        echo Выберите разные цвета для фона и текста в первом столбце
        echo Вызовете скрипт еще раз 
        return 1
    fi

    if [ $3 -eq $4 ]
        then
        echo Ошибка: цвет фона и текста значений совпадают
        echo Выберите разные цвета для фона и текста во втором столбце
        echo Вызовете скрипт еще раз 
        return 1
    fi

    return 0
}

get_background_color() {
    case $1 in
        1) echo -n "$BACKGROUND_WHITE";;
        2) echo -n "$BACKGROUND_RED";;
        3) echo -n "$BACKGROUND_GREEN";;
        4) echo -n "$BACKGROUND_BLUE";;
        5) echo -n "$BACKGROUND_PURPLE";;
        6) echo -n "$BACKGROUND_BLACK";;
    esac
}

get_text_color() {
    case $1 in
        1) echo -n "$TEXT_WHITE";;
        2) echo -n "$TEXT_RED";;
        3) echo -n "$TEXT_GREEN";;
        4) echo -n "$TEXT_BLUE";;
        5) echo -n "$TEXT_PURPLE";;
        6) echo -n "$TEXT_BLACK";;
    esac
}