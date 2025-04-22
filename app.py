from flask import Flask
import redis
import os

app = Flask(__name__)
redis_host = os.getenv("REDIS_HOST", "localhost")
redis_port = 6379
redis_conn = redis.Redis(host=redis_host, port=redis_port)

@app.route('/')
def hello():
    redis_conn.incr('counter')
    return f"Hello from {os.getenv('ENVIRONMENT', 'unknown')}! Count: {redis_conn.get('counter').decode()}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
