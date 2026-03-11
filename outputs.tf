output "pet_name" {
  value = random_pet.my_pet_name.id
}

output "uuid" {
  value = random_uuid.my_uuid.result
}