import boto3
from botocore.exceptions import ClientError
import base64

def get_secret(secret_name, region_name: str = "us-east-1"):
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # Handle exceptions as before
        raise e
    else:
        if 'SecretString' in get_secret_value_response:
            secret = get_secret_value_response['SecretString']
        elif 'SecretBinary' in get_secret_value_response:
            binary_secret_data = get_secret_value_response['SecretBinary']
            # Assuming the binary secret is a string encoded in base64
            secret = base64.b64decode(binary_secret_data).decode('utf-8')
        else:
            raise ValueError("Secret value not found in response")

        return secret


# def get_secret(secret_name, region_name: str = "us-east-1"):

#     # Create a Secrets Manager client
#     session = boto3.session.Session()
#     client = session.client(
#         service_name='secretsmanager',
#         region_name=region_name
#     )

#     try:
#         get_secret_value_response = client.get_secret_value(
#             SecretId=secret_name
#         )
#     except ClientError as e:
#         if e.response['Error']['Code'] == 'DecryptionFailureException':
#             # Secrets Manager can't decrypt the protected secret text using the provided KMS key.
#             raise e
#         elif e.response['Error']['Code'] == 'InternalServiceErrorException':
#             # An error occurred on the server side.
#             raise e
#         elif e.response['Error']['Code'] == 'InvalidParameterException':
#             # You provided an invalid value for a parameter.
#             raise e
#         elif e.response['Error']['Code'] == 'InvalidRequestException':
#             # You provided a parameter value that is not valid for the current state of the resource.
#             raise e
#         elif e.response['Error']['Code'] == 'ResourceNotFoundException':
#             # We can't find the resource that you asked for.
#             raise e
#     else:
        # Decrypts secret using the associated KMS key.
        # Depending on whether the secret is a string or binary, one of these fields will be populated.
        if 'SecretString' in get_secret_value_response:
            secret = get_secret_value_response['SecretString']
        else:
            binary_secret_data = get_secret_value_response['SecretBinary']
            # Your code to handle binary data here

        return secret
