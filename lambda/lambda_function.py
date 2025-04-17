import boto3
from PIL import Image
import io
import os

s3 = boto3.client('s3')
output_bucket = os.environ['OUTPUT_BUCKET']

def lambda_handler(event, context):
    for record in event['Records']:
        source_bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']

        response = s3.get_object(Bucket=source_bucket, Key=key)
        image_data = response['Body'].read()

        with Image.open(io.BytesIO(image_data)) as img:
            img = img.resize((128, 128))
            buffer = io.BytesIO()
            img.save(buffer, 'JPEG')
            buffer.seek(0)

        s3.put_object(
            Bucket=output_bucket,
            Key=f"resized-{key}",
            Body=buffer,
            ContentType='image/jpeg'
        )

