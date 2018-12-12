# Lambda Laravel Template

## Lambda Layer Deploy

```
cd php-layer-for-laravel5
```

edit scripts for your environmets.

```
make && make deploy
```

## Laravel Install

```
cd src/laravel
php composer.phar install --no-dev
```

## Laravel Deploy

```
$sam package \
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
