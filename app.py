from flask import Flask
import redis
import os

app = Flask(__name__)
redis_host = os.getenv("REDIS_HOST", "localhost")
redis_port = 6379
r = redis.Redis(host=redis_host, port=redis_port)

@app.route('/')
def hello():
    r.incr('hits')
    return f'Hello from {os.getenv("ENVIRONMENT", "test")}! Hits: {r.get("hits").decode()}'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
