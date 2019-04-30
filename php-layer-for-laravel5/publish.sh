#!/bin/bash -e

MD5SUM=$(md5 -q php-layer.zip)
S3KEY="php-layer/${MD5SUM}"
region="ap-northeast-1"
bucket_name="stackery-layers.k-masatany"

echo "Publishing Lambda Layer php-layer in region ${region}..."
# Must use --cli-input-json so AWS CLI doesn't attempt to fetch license URL
version=$(aws --region $region lambda publish-layer-version --cli-input-json "{\"LayerName\": \"php-layer\",\"Description\": \"Laravel on PHP7.1 Lambda Runtime\",\"Content\": {\"S3Bucket\": \"${bucket_name}\",\"S3Key\": \"${S3KEY}\"},\"CompatibleRuntimes\": [\"provided\"],\"LicenseInfo\": \"http://www.php.net/license/3_01.txt\"}"  --output text --query Version)
echo "Published Lambda Layer php-layer in region ${region} version ${version}"

echo "Setting public permissions on Lambda Layer php-layer version ${version} in region ${region}..."
aws --region $region lambda add-layer-version-permission --layer-name php-layer --version-number $version --statement-id=public --action lambda:GetLayerVersion --principal '*' > /dev/null
echo "Public permissions set on Lambda Layer php-layer version ${version} in region ${region}"
