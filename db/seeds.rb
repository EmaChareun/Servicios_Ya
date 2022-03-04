# require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lista_oficio = ["A/A", "Albañil",	"Arquitecto",	"Autos",	"Belleza",	"Bienestar",	"Carpintero",	"Cerrajero", "Colocador", "Control de plagas", "Cuidador",	"Decorador", "Electricista",	"Gasista",	"Herrero",	"Jardinero", "Limpieza",	"Mascotas", "Mudanzas", "Piletas", "Pintor",	"Plomero", "Reformas", "Seguridad", "Tapicero", "Técnico"]

10.times do |i|
  User.create(email: "client#{i}@example.com", password: "111111", password_confirmation: "111111", first_name: "cliente#{i}", last_name: "elapellido#{i}", city: "Buenos Aires", phone_number: "12345678" , role: "cliente", job: ["clientes"], avatar: "")
end

10.times do |i|
  User.create(email: "profesional#{i}@example.com", password: "111111", password_confirmation: "111111", first_name: "profesional#{i}", last_name:  "elapellido#{i}", city: "Buenos Aires", phone_number: "12344566778", role: "profesional", job: lista_oficio.sample(3), validation: random_boolean = [true, false].sample, avatar: "")
end
