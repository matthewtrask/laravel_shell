#! /bin/bash

PROJECT_NAME=$1;
PROJECT_PATH=$2;

if [ -z ${PROJECT_NAME} ]
  then
    echo "Error: You must supply project name"
fi

if [ -z ${PROJECT_PATH} ]
  then
    echo "Error: You must specify a project path"
fi



echo "== Creating ${PROJECT_NAME} =="
cd ${PROJECT_PATH}
mkdir ${PROJECT_NAME}
cd ${PROJECT_NAME}
mkdir public
cp /Users/trask/Scripts/vagrantfile /Users/trask/Code/${PROJECT_NAME}
echo $PWD
cd public
composer create-project --prefer-dist laravel/laravel ${PROJECT_NAME}
cd ${PROJECT_NAME}/public/${PROJECT_NAME}
echo "---- inside your project ----"
./vendor/bin/phpunit --coverage-html docs/
composer require predis/predis
echo "---- ${PROJECT_NAME} has been created. Make something awesome! ----"
