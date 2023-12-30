import boto3
import os
import json

def lambda_handler(event, context):
    
    TABLE_NAME = "VISIT_COUNTER"
    db_client = boto3.client('dynamodb')
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)

    update = db_client.update_item(
        TableName=TABLE_NAME,
        Key={"id": {"N": "0"}},
        UpdateExpression="ADD TopScore :inc",
        ExpressionAttributeValues={":inc": {"N": "1"}}
    )

    getItems = table.get_item(Key={"id": 0})
    itemsObjectOnly = getItems["Item"]
    visitcount1 = itemsObjectOnly["TopScore"]

    # update = db_client.update_item(
    #     TableName=TABLE_NAME,
    #     Key={"id": {"N": "0"}},
    #     UpdateExpression="ADD visitcount :inc",
    #     ExpressionAttributeValues={":inc": {"N": "1"}}
    # )

    result = {
            "count": int(visitcount1)
        }
    response = {
        "isBase64Encoded": False,
         "headers": {
            "content-type" : "application/json",
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
        },
        "statusCode": 200,
        "body" : json.dumps(result)
    }

    return response