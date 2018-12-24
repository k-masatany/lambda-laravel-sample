#!/bin/bash -e

MD5SUM=$(md5 -q php71.zip)
S3KEY="php71-laravel/${MD5SUM}"
region="ap-northeast-1"
bucket_name="stackery-layers.k-masatany"

echo "Uploading php71.zip to s3://${bucket_name}/${S3KEY}"
aws --region $region s3 cp php71.zip "s3://${bucket_name}/${S3KEY}"
