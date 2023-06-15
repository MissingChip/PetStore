curl -X 'POST' 'localhost:3000/pet' -H 'accept: application/xml' -H 'Content-Type: application/json' -d '{
  "id": 10,
  "name": "doggie",
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}'

curl -X 'POST' 'localhost:3000/pet/10?name=joseph&status=inactive'