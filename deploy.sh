#!/bin/sh


# Move the files to S3 bucket for hosting
aws s3 sync ./ s3://zincsearch-website/ --profile=zinc-prod

# invalidate cloudfront cache so that latest files can be served
aws cloudfront create-invalidation --distribution-id E1RESO2ZLOD5I0 --paths=/* --profile=zinc-prod
