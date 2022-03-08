require 'faker'
puts "Destruyendo seeds"
Review.destroy_all
Request.destroy_all
User.destroy_all

puts "Creando seeds"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lista_oficio = ["A/A", "Albañil",	"Arquitecto",	"Autos",	"Belleza",	"Bienestar",	"Carpintero",	"Cerrajero", "Colocador", "Control de plagas", "Cuidador",	"Decorador", "Electricista",	"Gasista",	"Herrero",	"Jardinero", "Limpieza",	"Mascotas", "Mudanzas", "Piletas", "Pintor",	"Plomero", "Reformas", "Seguridad", "Tapicero", "Técnico"]

lista_ciudades = ["Buenos Aires", "Tigre", "San Fernando", "Don Torcuato", "El Talar", "Tortuguitas"]

lista_nombres = ["Marcos", "Florencia", "Marines", "Juan", "Esteban", "Santiago"]

lista_apellidos = ["Sanchez", "Avila", "Viera", "Chareun", "Ponce de Leon", "Garcia", "Perez"]

10.times do |i|
  User.create!(email: Faker::Internet.email, password: "111111", password_confirmation: "111111", first_name: lista_nombres.sample, last_name: lista_apellidos.sample, city: lista_ciudades.sample, phone_number: Faker::PhoneNumber.cell_phone, role: "cliente", job: ["clientes"], avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"))
end

10.times do |i|
  User.create!(email: Faker::Internet.email, password: "111111", password_confirmation: "111111", first_name: lista_nombres.sample, last_name: lista_apellidos.sample, city: lista_ciudades.sample, phone_number: Faker::PhoneNumber.cell_phone, role: "profesional", job: lista_oficio.sample(3), validation: random_boolean = [true, false].sample, avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"))
end

request1 = Request.create!(title: "Plomero", city: "Tigre", detail: "Necesito cambiar un grifo", user: User.first, professional: User.last)

review1 = Review.create!(content: "Buen trabajo", rating: 4, user: User.first, request: request1)

puts "Seeds creadas!"
