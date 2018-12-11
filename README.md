#

## Lambda Layer Deploy

```
cd php-layer-for-laravel5
```

edit scripts for your environmets.

```
make && make deploy
```

## Laravel Deploy

```
$sam package \ 23:57:00
  --template-file template.yml \
  --output-template-file serverless-laravel.yml \
  --s3-bucket <bucket-name>
```

```
sam deploy \
  --template-file serverless-laravel.yml \
  --stack-name serverless-laravel \
  --capabilities CAPABILITY_IAM
```
