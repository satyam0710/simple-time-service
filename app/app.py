from flask import Flask, request, Response, jsonify
from datetime import datetime
import pytz
import json
import os

app = Flask(__name__)
app.config['JSON_SORT_KEYS'] = False

@app.route('/')
def index():
    # Get current time in IST
    ist = pytz.timezone('Asia/Kolkata')
    timestamp = datetime.now(ist).strftime('%Y-%m-%d %H:%M:%S')
    
    # Get visitor IP (handle proxy headers)
    ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    if ',' in str(ip):
        ip = ip.split(',')[0].strip()
    
    # Use json.dumps to ensure order
    response_data = json.dumps({
        'timestamp': timestamp,
        'ip': ip
    }, ensure_ascii=False)
    
    return Response(response_data, mimetype='application/json')

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
