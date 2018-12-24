#!/bin/bash -e

VERSION=$1

MD5SUM=$(md5 -q php71.zip)
S3KEY="php71-laravel/${MD5SUM}"
region="ap-northeast-1"
bucket_name="stackery-layers.k-masatany"

echo "Deleting Lambda Layer php71-laravel version ${VERSION} in region ${region}..."
aws --region $region lambda delete-layer-version --layer-name php71-laravel --version-number $VERSION > /dev/null
echo "Deleted Lambda Layer php71-laravel version ${VERSION} in region ${region}"
