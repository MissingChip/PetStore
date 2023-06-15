
printf "test POST /pet\n"

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

printf "\n\n   test findByStatus\n"

curl -X 'GET' 'localhost:3000/pet/findByStatus?status=available'

printf "\n\n   test findByTags\n"

curl -X 'GET' 'localhost:3000/pet/findByTags?tags=randomtag&tags=active'

printf "\n\n   test POST pet/{id}\n"

curl -X 'POST' 'localhost:3000/pet/10?name=joseph&status=inactive'

printf "\n\n   test GET pet/{id}\n"

curl -X 'GET' 'localhost:3000/pet/10'

printf "\n\n   test PUT nonexistent pet\n"
curl -X 'PUT' 'localhost:3000/pet' -H 'accept: application/xml' -H 'Content-Type: application/json' -d '{
  "id": 87,
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