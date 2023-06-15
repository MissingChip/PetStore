const express = require('express')
const app = express()
const port = 3000

app.use(express.json())
let global_database = { pets: {} }

app.get('/', (req, res) => {
  console.log("GET /")
  res.send('Hello World!')
})

app.put('/pet', (req, res) => {
  console.log(req.body)
  let new_pet = req.body
  if(new_pet.id in global_database.pets) {
    global_database.pets[new_pet.id] = new_pet
    res.send(new_pet)
  }
  res.status(404).send("Pet not found")
})

app.post('/pet', (req, res) => {
  console.log(req.body)
  let new_pet = req.body
  global_database.pets[new_pet.id] = new_pet
  res.send(new_pet)
})

app.get('/pet/findByStatus', (req, res) => {
  console.log(req.body)
  let status = req.query.status
  let matching_pets = []
  for (let pet_id in global_database.pets) {
    let pet = global_database.pets[pet_id]
    if (pet.status === status) {
      matching_pets.push(pet)
    }
  }
  res.send(matching_pets)
})

app.get('/pet/findByTags', (req, res) => {
  console.log(req.body)
  let tags = req.query.tags
  console.log("TAGS", tags)
  let matching_pets = []
  for (let pet_id in global_database.pets) {
    let match = false;
    let pet = global_database.pets[pet_id]
    for (let tag of tags) {
      if (match) break;
      for (let pet_tag of pet.tags) {
        if (match) break;
        if (tag === pet_tag.name) {
          matching_pets.push(pet)
          match = true
        }
      }
    }
  }
  res.send(matching_pets)
})


app.get("/pet/:id", (req, res) => {
  console.log("GET pet id", req.params)
  const id = req.params.id
  const pet = global_database.pets[id]
  res.send(pet)
})

app.post("/pet/:id", (req, res) => {
  console.log("POST pet id", req.params)
  const id = req.params.id
  const pet = global_database.pets[id]
  res.send(pet)
})

app.delete("/pet/:id", (req, res) => {
  console.log("DELETE pet id", req.params)
  const id = req.params.id
  const pet = global_database.pets[id]
  res.send(pet)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})