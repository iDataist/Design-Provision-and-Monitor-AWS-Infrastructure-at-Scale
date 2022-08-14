import os

def handler(event, context):
    return "{} from Lambda!".format(os.environ['greeting'])
