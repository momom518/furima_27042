# README

# Data Base 設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|firstname|string|null:false|
|firstname_kana|string|null:false|
|lastname|string|null:false|
|lastname_kana|string|null:false|
|password|string|null:false|
|email|string|null:false, unique:true|
|birth_day|integer|null:false, unique:true|
|birth_month|integer|null:false, unique:true|
|birth_year|integer|null:false, unique:true|
### association
- has_many:items
- has_many:parchases
- has_many:cards

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|name|string|null:false|
|image|text|null:false|
|infomation|text|null:false|
|category_id|integer|null:false|
|condition_id|integer|null:false|
|delivery_id|integer|null:false|
|price|integer|null:false|
### association
- belongs_to:user
- has_many:parchase

## purchaseテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|interger|nill:false,foreigh:true|
|item_id|interger|nill:false,foreign:true|
### association
- belongs_to:user
- belongs_to:item

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|interger|null:false|
|expiration_year|interger|null:false|
|expiration_month|interger|null:false|
|security_code|interger|null:false|
- belongs_to:user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|interger|null:false
|prefecture_id|interger|null:false|
|city|string|null:false|
|address|string|null:false|
|building|string||
|telephone_number|string|null:false|
- belongs_to:user
- belongs_to:parchase



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
