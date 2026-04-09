#!/bin/bash

check_number() {
  local re='^[-+]?+[0-9]+([.][0-9]+)?$'
  if [[ $1 =~ $re ]]
    then
    return 0
  fi

  return 1
}


check_input() {
  if [ $# -ne 1 ]
    then
    echo Ошибка: скрипт должен запускаться с одним параметром
    exit 1
  fi

  if check_number $1
    then  
    echo Ошибка: параметр не должен быть числом
    exit 1
  fi
}