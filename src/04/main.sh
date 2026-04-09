#!/bin/bash

source ./1.sh
source ./2.sh 

if [ $# -ne 0 ]
    then
    echo "Ошибка: скрипт не принимает параметры"
    exit 1
fi

CONFIG_FILE="conf.conf"

DEFAULT_COLUMN1_BACKGROUND=6
DEFAULT_COLUMN1_FONT_COLOR=1
DEFAULT_COLUMN2_BACKGROUND=4  
DEFAULT_COLUMN2_FONT_COLOR=6
    
get_config_value() {
    local key=$1
    local default_value=$2
    local value=$(grep "^$key=" "$CONFIG_FILE" | cut -d'=' -f2 | tr -d '\r')
    
    if [[ "$value" =~ ^[1-6]$ ]]
        then
        echo "$value"
    else
        echo "$default_value"
    fi
}

column1_background=$(get_config_value "column1_background" "$DEFAULT_COLUMN1_BACKGROUND")
column1_font_color=$(get_config_value "column1_font_color" "$DEFAULT_COLUMN1_FONT_COLOR")
column2_background=$(get_config_value "column2_background" "$DEFAULT_COLUMN2_BACKGROUND")
column2_font_color=$(get_config_value "column2_font_color" "$DEFAULT_COLUMN2_FONT_COLOR")

check_colors "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color" || exit 1

Header_Back=$(get_background_color "$column1_background")
Header_Text=$(get_text_color "$column1_font_color")
Background_Values=$(get_background_color "$column2_background")
Value_Text=$(get_text_color "$column2_font_color")

print_colored_line() {
    printf "${Header_Back}${Header_Text}%-15s${COLOR_RESET} = ${Background_Values}${Value_Text}%s${COLOR_RESET}\n" "$1" "$2"
}

print_colored_line "HOSTNAME" "$(HOSTNAME)"
print_colored_line "TIMEZONE" "$(TIMEZONE)"
print_colored_line "USER" "$(USER)"
print_colored_line "OS" "$(OS)"
print_colored_line "DATE" "$(DATE)"
print_colored_line "UPTIME" "$(UPTIME)"
print_colored_line "UPTIME_SEC" "$(UPTIME_SEC)"
print_colored_line "IP" "$(IP)"
print_colored_line "MASK" "$(MASK)"
print_colored_line "GATEWAY" "$(GATEWAY)"
print_colored_line "RAM_TOTAL" "$(RAM_TOTAL)"
print_colored_line "RAM_USED" "$(RAM_USED)"
print_colored_line "RAM_FREE" "$(RAM_FREE)"
print_colored_line "SPACE_ROOT" "$(SPACE_ROOT)"
print_colored_line "SPACE_ROOT_USED" "$(SPACE_ROOT_USED)"
print_colored_line "SPACE_ROOT_FREE" "$(SPACE_ROOT_FREE)"

get_color_name() {
    case $1 in
        1) echo "white";;
        2) echo "red";;
        3) echo "green";;
        4) echo "blue";;
        5) echo "purple";;
        6) echo "black";;
        *) echo "unknown";;
    esac
}

print_color_scheme_info() {
    local col1_bg=$1
    local col1_font=$2
    local col2_bg=$3
    local col2_font=$4
    
    echo
    echo "Column 1 background = $([ "$col1_bg" -eq "$DEFAULT_COLUMN1_BACKGROUND" ] && echo "default" || echo "$col1_bg") ($(get_color_name "$col1_bg"))"
    echo "Column 1 font color = $([ "$col1_font" -eq "$DEFAULT_COLUMN1_FONT_COLOR" ] && echo "default" || echo "$col1_font") ($(get_color_name "$col1_font"))"
    echo "Column 2 background = $([ "$col2_bg" -eq "$DEFAULT_COLUMN2_BACKGROUND" ] && echo "default" || echo "$col2_bg") ($(get_color_name "$col2_bg"))"
    echo "Column 2 font color = $([ "$col2_font" -eq "$DEFAULT_COLUMN2_FONT_COLOR" ] && echo "default" || echo "$col2_font") ($(get_color_name "$col2_font"))"
}

print_color_scheme_info "$column1_background" "$column1_font_color" "$column2_background" "$column2_font_color"

