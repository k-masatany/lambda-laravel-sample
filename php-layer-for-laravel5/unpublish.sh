#!/bin/bash -e

VERSION=$1

MD5SUM=$(md5 -q php-layer.zip)
S3KEY="php-layer/${MD5SUM}"
region="ap-northeast-1"
bucket_name="stackery-layers.k-masatany"

echo "Deleting Lambda Layer php-layer version ${VERSION} in region ${region}..."
aws --region $region lambda delete-layer-version --layer-name php-layer --version-number $VERSION > /dev/null
echo "Deleted Lambda Layer php-layer version ${VERSION} in region ${region}"
