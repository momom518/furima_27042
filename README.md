# README

# Data Base 設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|password|string|null:false|
|email|string|null:false, unique:true|
### association
- has_many:items
- has_many:parchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|interger|null:false,foreign_key:true|
|name|string|null:false|
|image|text|null:false|
|infomation|text|null:false|
|condition|strig|null:false|
|postage|string|null:false|
|prefecture|string|null:false|
|delivery_day|string|null:false|
|price|interger|null:false|
### association
- belongs_to:user
- has_many:parchase

## purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|interger|nill:false,foreigh:true|
|item_id|interger|nill:false,foreign:true|
|card_number|interger|null:false|
|expiration_year|interger|null:false|
|expiration_month|interger|null:false|
|security_code|interger|null:false|
|postal_code|interger|null:false
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building|string||
|telephone_number|interger|null:false|
### association
- belongs_to:user
- belongs_to:item


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
