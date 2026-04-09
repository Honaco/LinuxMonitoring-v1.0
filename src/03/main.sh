#!/bin/bash

source ./1.sh
source ./2.sh

if [ $# -ne 4 ]
    then
    echo Ошибка: необходимо указать 4 параметра
    exit 1
fi

for p in $1 $2 $3 $4
    do
    if [[ ! "$p" =~ ^[1-6]$ ]]
        then
        echo "Ошибка: параметры должны быть числами от 1 до 6"
        exit 1
    fi
done

check_colors $1 $2 $3 $4 || exit 1

Header_Back=$(get_background_color $1)
Header_Text=$(get_text_color $2)
Background_Values=$(get_background_color $3)
Value_Text=$(get_text_color $4)

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
