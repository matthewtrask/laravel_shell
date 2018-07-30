#! /bin/bash

PROJECT_NAME=$1;

if [ -z ${PROJECT_NAME} ]
  then
    echo "Error: You must supply project name"
    exit
fi

echo "---- Creating ${PROJECT_NAME} ----"
cd ~/Code
composer create-project laravel/laravel --prefer-dist ${PROJECT_NAME}
cd ${PROJECT_NAME}
git init
composer require laravel/homestead && ./vendor/bin/homestead make
composer require spatie/laravel-fractal
composer require doctrine/dbal
composer require league/commonmark
composer require sentry/sentry-laravel
composer require laravel/passport
yarn add tailwindcss --save
yarn add vue-router --save
yarn add vue-resource --save
cp .env.example .env
php artisan key:generate
php artisan make:auth
echo "---- ${PROJECT_NAME} has been created. Make something awesome! ----"
