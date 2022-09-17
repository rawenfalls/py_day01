#!/bin/sh
	if [ $# -eq 1 ]; then
		curl -k "https://api.hh.ru/vacancies?text=${1// /%20}&page=0&per_page20" | jq '.' > hh.json
	else
		echo "Usage: ./hh.sh 'data scientist'"
	fi
