curl -X 'POST' 'localhost:3000/pet' -H 'accept: application/xml' -H 'Content-Type: application/json' -d '{
  "id": 10,
  "name": "fido",
  "category": {
    "id": 1,
    "name": "Dogs"
  },
  "tags": [
    {
      "id": 0,
      "name": "active"
    }
  ],
  "status": "available"
}'

echo \n   test findByStatus

curl -X 'GET' 'localhost:3000/pet/findByStatus?status=available'

echo \n   test findByTags

curl -X 'GET' 'localhost:3000/pet/findByTags?tags=randomtag&tags=active'

echo \n   test POST pet/{id}

curl -X 'POST' 'localhost:3000/pet/10?name=joseph&status=inactive'

echo \n   test GET pet/{id}

curl -X 'GET' 'localhost:3000/pet/10'