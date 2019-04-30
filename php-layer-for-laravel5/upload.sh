#!/bin/bash -e

MD5SUM=$(md5 -q php-layer.zip)
S3KEY="php-layer/${MD5SUM}"
region="ap-northeast-1"
bucket_name="stackery-layers.k-masatany"

echo "Uploading php-layer.zip to s3://${bucket_name}/${S3KEY}"
aws --region $region s3 cp php-layer.zip "s3://${bucket_name}/${S3KEY}"
