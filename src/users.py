from pymilvus import utility
from pymilvus import connections
from utils import get_secret

my_secret = get_secret(secret_name="milvus-root-password")

connections.connect(
    alias='default',
    host="ec2-18-234-47-2.compute-1.amazonaws.com",
    port=19530,
    user='',
    password="",
)


print(utility.list_usernames())
# utility.create_user('miguel_elhaiek', 'momaso', using='default')
# print(utility.list_usernames())