# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

clients = Client.create([{ username: 'ara', lastname: 'Perez', email: 'ara@uc.cl', password: '123123', password_confirmation: '123123', address: 'Los Bravos 4500'},
  { username: 'fran', lastname: 'Gonzalez', email: 'fran@uc.cl', password: '123123', password_confirmation: '123123', address: 'Santuario 1'},
  { username: 'elisa', lastname: 'Morales', email: 'elisa@uc.cl', password: '123123', password_confirmation: '123123', address: 'Santuario 2'},
  [{username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address},
    {username: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address}]])
  # clients = Client.create([{username: Faker::Internet.user_name, email: Faker::Internet.email, encrypted_password: Faker::Internet.password(min_length: 6, max_length: 12), address: Faker::Address.street_address}])


restaurantes = Restaurante.create([{name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Av. Las Condes 10295, Las Condes", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.first.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Av. 11 de Septiembre 2249, Providencia", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.first.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Av. Irarrázaval 2928, Ñuñoa", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.first.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Huérfanos 827, Santiago", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.third.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Pedro de Valdivia 1885, Providencia", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.third.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Av. Padre Alberto Hurtado 060, Estacion Central", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.third.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Apoquindo 6060, Las Condes", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.second.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Av. Pajarito 2689, Maipú", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.second.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Cuarto Centenario 1016, Las Condes", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.second.id, approved: true},
  {name: Faker::Restaurant.name, mail: Faker::Internet.email, adress: "Américo Vespucio 6325, La Florida", valoration: '', phone_number: Faker::PhoneNumber.phone_number, created_at: 2.years.ago..Time.now, client_id: clients.third.id, approved: true}])

restaurantes.first.avatar.attach(io: File.open("rest_1.jpg"), filename: "rest_1.jpg", content_type: "image/jpg")
restaurantes.second.avatar.attach(io: File.open("rest_2.jpg"), filename: "rest_2.jpg", content_type: "image/jpg")
restaurantes.third.avatar.attach(io: File.open("rest_3.jpg"), filename: "rest_3.jpg", content_type: "image/jpg")
restaurantes.fourth.avatar.attach(io: File.open("rest_4.jpeg"), filename: "rest_4.jpeg", content_type: "image/jpg")
restaurantes.fifth.avatar.attach(io: File.open("rest_5.jpg"), filename: "rest_5.jpg", content_type: "image/jpg")
restaurantes[5].avatar.attach(io: File.open("rest_6.jpeg"), filename: "rest_6.jpeg", content_type: "image/jpg")
restaurantes[6].avatar.attach(io: File.open("rest_7.jpg"), filename: "rest_7.jpg", content_type: "image/jpg")
restaurantes[7].avatar.attach(io: File.open("rest_8.jpeg"), filename: "rest_8.jpeg", content_type: "image/jpg")
restaurantes[8].avatar.attach(io: File.open("rest_9.jpeg"), filename: "rest_9.jpeg", content_type: "image/jpg")
restaurantes[9].avatar.attach(io: File.open("rest_10.jpg"), filename: "rest_10.jpg", content_type: "image/jpg")

platos = Plate.create([{name: 'Papas con mayo', price: 3000, description: "Papas cocidas con una exquisita salsa de mayonnesa, cilantro y la salsa especial de la casa", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 1, rate: []},
{name: 'La temerosa', price: 7500, description: "carne Hereford, con lechuga, tomate, queso, tocino, cebolla y la salsa de la casa", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 2, rate: []},
{name: 'Camarón tempura', price: 5500, description: "Camarón tempura con salsa de la cilantro", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 5, rate: []},
{name: 'Cazuela de vacuno', price: 4000, description: "Cazuela a la chilena con vacuno", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 1, rate: []},
{name: 'Congrio frito', price: 7500, description: "Congrio fresco frito, acompañado de una porción de papas fritas", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 5, rate: []},
{name: 'Esparragos', price: 3500, description: "Esparragos al horno con aceite y queso parmesano", portions: 4, created_at: 2.years.ago..Time.now, restaurante_id: 1, rate: []},
{name: 'La cebollenta', price: 8500, description: "Dos pedazos de carne Hereford 750 kg con un aro de cebolla frito, tomate, pepinillos, queso cheddar y lechuga", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 2, rate: []},
{name: 'La Hawaiana', price: 8500, description: "Hamburguesa Hereford 750kg con un trozo de piña", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 2, rate: []},
{name: 'La Venezolana', price: 8500, description: "Hamburguesa con tomate, lechuga y queso cheddar", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 2, rate: []},
{name: 'Humitas', price: 3500, description: "Humitas clásicas chilenas, acompañadas de tomate", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 1, rate: []},
{name: 'Lasaña', price: 6800, description: "Lasaña de carne molida con salsa de tomate casera", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 3, rate: []},
{name: 'Ostras', price: 3700, description: "Ostras frescas con limón", portions: 2, created_at: 2.years.ago..Time.now, restaurante_id: 5, rate: []},
{name: 'La española', price: 9000, description: "Pizza con aceitunas, salame, jamón y tomates cherry", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 4, rate: []},
{name: 'La napolitana', price: 8500, description: "Pizza con queso gruyere, una exquisita salsa casera y finas hierbas", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 4, rate: []},
{name: 'Peperoni', price: 7500, description: "Clásica pizza con peperoni", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 4, rate: []},
{name: 'Queso', price: 7500, description: "Clásica pizza 4 quesos", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 4, rate: []},
{name: 'Ravioles', price: 3000, description: "Ravioles con carne mólida y la salsa especial del chef", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 3, rate: []},
{name: 'Reineta', price: 7000, description: "Reineta a la plancha, acompañada de una exquisita ensalada", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 5, rate: []},
{name: 'Sopaipillas', price: 2500, description: "Sopaipillas de zapallo, acompañadas de pebre", portions: 5, created_at: 2.years.ago..Time.now, restaurante_id: 1, rate: []},
{name: 'Tallarines a la boloñesa', price: 7500, description: "Exquisitos tallarines a la boloñesa", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 3, rate: []},
{name: 'Papas con mayo', price: 3000, description: "Papas cocidas con una exquisita salsa de mayonnesa, cilantro y la salsa especial de la casa", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 6, rate: []},
{name: 'La temerosa', price: 7500, description: "Carne Hereford, con lechuga, tomate, queso, tocino, cebolla y la salsa de la casa", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 7, rate: []},
{name: 'Camarón tempura', price: 5500, description: "Camarón tempura con salsa de la cilantro", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 10, rate: []},
{name: 'Cazuela de vacuno', price: 4000, description: "Cazuela a la chilena con vacuno", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 6, rate: []},
{name: 'Congrio frito', price: 7500, description: "Congrio fresco frito, acompañado de una porción de papas fritas", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 10, rate: []},
{name: 'Esparragos', price: 3500, description: "Esparragos al horno con aceite y queso parmesano", portions: 4, created_at: 2.years.ago..Time.now, restaurante_id: 6, rate: []},
{name: 'La cebollenta', price: 8500, description: "Dos pedazos de carne Hereford 750 kg con un aro de cebolla frito, tomate, pepinillos, queso cheddar y lechuga", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 7, rate: []},
{name: 'La Hawaiana', price: 8500, description: "Hamburguesa Hereford 750kg con un trozo de piña", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 7, rate: []},
{name: 'La Venezolana', price: 8500, description: "Hamburguesa con tomate, lechuga y queso cheddar", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 7, rate: []},
{name: 'Humitas', price: 3500, description: "Humitas clásicas chilenas, acompañadas de tomate", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 6, rate: []},
{name: 'Lasaña', price: 6800, description: "Lasaña de carne molida con salsa de tomate casera", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 8, rate: []},
{name: 'Ostras', price: 3700, description: "Ostras frescas con limón", portions: 2, created_at: 2.years.ago..Time.now, restaurante_id: 10, rate: []},
{name: 'La española', price: 9000, description: "Pizza con aceitunas, salame, jamón y tomates cherry", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 9, rate: []},
{name: 'La napolitana', price: 8500, description: "Pizza con queso gruyere, una exquisita salsa casera y finas hierbas", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 9, rate: []},
{name: 'Peperoni', price: 7500, description: "Clásica pizza con peperoni", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 9, rate: []},
{name: 'Queso', price: 7500, description: "Clásica pizza 4 quesos", portions: 3, created_at: 2.years.ago..Time.now, restaurante_id: 9, rate: []},
{name: 'Ravioles', price: 3000, description: "Ravioles con carne mólida y la salsa especial del chef", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 8, rate: []},
{name: 'Reineta', price: 7000, description: "Reineta a la plancha, acompañada de una exquisita ensalada", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 10, rate: []},
{name: 'Sopaipillas', price: 2500, description: "Sopaipillas de zapallo, acompañadas de pebre", portions: 5, created_at: 2.years.ago..Time.now, restaurante_id: 6, rate: []},
{name: 'Tallarines a la boloñesa', price: 7500, description: "Exquisitos tallarines a la boloñesa", portions: 1, created_at: 2.years.ago..Time.now, restaurante_id: 8, rate: []}])

platos[0].avatar.attach(io: File.open("papas_mayo.jpg"), filename: "papas_mayo.jpg", content_type: "image/jpg")
platos[1].avatar.attach(io: File.open("49176_1.jpg"), filename: "49176_1.jpg", content_type: "image/jpg")
platos[2].avatar.attach(io: File.open("camaron.jpeg"), filename: "camaron.jpeg", content_type: "image/jpg")
platos[3].avatar.attach(io: File.open("cazuela_de_vacuno.jpg"), filename: "cazuela_de_vacuno.jpg", content_type: "image/jpg")
platos[4].avatar.attach(io: File.open("congrio_frito.jpg"), filename: "congrio_frito.jpg", content_type: "image/jpg")
platos[5].avatar.attach(io: File.open("esparragos.jpeg"), filename: "esparragos.jpeg", content_type: "image/jpg")
platos[6].avatar.attach(io: File.open("hamburguesa-al-carbon-clasica.png"), filename: "hamburguesa-al-carbon-clasica.png", content_type: "image/jpg")
platos[7].avatar.attach(io: File.open("hamburguesahawaiana.jpg"), filename: "hamburguesahawaiana.jpg", content_type: "image/jpg")
platos[8].avatar.attach(io: File.open("hamburguesas-venezolanas.jpg"), filename: "hamburguesas-venezolanas.jpg", content_type: "image/jpg")
platos[9].avatar.attach(io: File.open("humitas.jpg"), filename: "humitas.jpg", content_type: "image/jpg")
platos[10].avatar.attach(io: File.open("lasaña.jpeg"), filename: "lasaña.jpeg", content_type: "image/jpg")
platos[11].avatar.attach(io: File.open("ostras.jpg"), filename: "ostras.jpg", content_type: "image/jpg")
platos[12].avatar.attach(io: File.open("pizza-espanola.jpg"), filename: "pizza-espanola.jpg", content_type: "image/jpg")
platos[13].avatar.attach(io: File.open("pizza_napolitana.jpeg"), filename: "pizza_napolitana.jpeg", content_type: "image/jpg")
platos[14].avatar.attach(io: File.open("pizza_peperoni.jpg"), filename: "pizza_peperoni.jpg", content_type: "image/jpg")
platos[15].avatar.attach(io: File.open("pizza_queso.jpeg"), filename: "pizza_queso.jpeg", content_type: "image/jpg")
platos[16].avatar.attach(io: File.open("ravioles.jpeg"), filename: "ravioles.jpeg", content_type: "image/jpg")
platos[17].avatar.attach(io: File.open("reineta-a-la-planch.jpg"), filename: "reineta-a-la-planch.jpg", content_type: "image/jpg")
platos[18].avatar.attach(io: File.open("sopaipillas.jpg"), filename: "sopaipillas.jpg", content_type: "image/jpg")
platos[19].avatar.attach(io: File.open("tallarines_con_salsa.jpg"), filename: "tallarines_con_salsa.jpg", content_type: "image/jpg")
platos[20].avatar.attach(io: File.open("papas_mayo.jpg"), filename: "papas_mayo.jpg", content_type: "image/jpg")
platos[21].avatar.attach(io: File.open("49176_1.jpg"), filename: "49176_1.jpg", content_type: "image/jpg")
platos[22].avatar.attach(io: File.open("camaron.jpeg"), filename: "camaron.jpeg", content_type: "image/jpg")
platos[23].avatar.attach(io: File.open("cazuela_de_vacuno.jpg"), filename: "cazuela_de_vacuno.jpg", content_type: "image/jpg")
platos[24].avatar.attach(io: File.open("congrio_frito.jpg"), filename: "congrio_frito.jpg", content_type: "image/jpg")
platos[25].avatar.attach(io: File.open("esparragos.jpeg"), filename: "esparragos.jpeg", content_type: "image/jpg")
platos[26].avatar.attach(io: File.open("hamburguesa-al-carbon-clasica.png"), filename: "hamburguesa-al-carbon-clasica.png", content_type: "image/jpg")
platos[27].avatar.attach(io: File.open("hamburguesahawaiana.jpg"), filename: "hamburguesahawaiana.jpg", content_type: "image/jpg")
platos[28].avatar.attach(io: File.open("hamburguesas-venezolanas.jpg"), filename: "hamburguesas-venezolanas.jpg", content_type: "image/jpg")
platos[29].avatar.attach(io: File.open("humitas.jpg"), filename: "humitas.jpg", content_type: "image/jpg")
platos[30].avatar.attach(io: File.open("lasaña.jpeg"), filename: "lasaña.jpeg", content_type: "image/jpg")
platos[31].avatar.attach(io: File.open("ostras.jpg"), filename: "ostras.jpg", content_type: "image/jpg")
platos[32].avatar.attach(io: File.open("pizza-espanola.jpg"), filename: "pizza-espanola.jpg", content_type: "image/jpg")
platos[33].avatar.attach(io: File.open("pizza_napolitana.jpeg"), filename: "pizza_napolitana.jpeg", content_type: "image/jpg")
platos[34].avatar.attach(io: File.open("pizza_peperoni.jpg"), filename: "pizza_peperoni.jpg", content_type: "image/jpg")
platos[35].avatar.attach(io: File.open("pizza_queso.jpeg"), filename: "pizza_queso.jpeg", content_type: "image/jpg")
platos[36].avatar.attach(io: File.open("ravioles.jpeg"), filename: "ravioles.jpeg", content_type: "image/jpg")
platos[37].avatar.attach(io: File.open("reineta-a-la-planch.jpg"), filename: "reineta-a-la-planch.jpg", content_type: "image/jpg")
platos[38].avatar.attach(io: File.open("sopaipillas.jpg"), filename: "sopaipillas.jpg", content_type: "image/jpg")
platos[39].avatar.attach(io: File.open("tallarines_con_salsa.jpg"), filename: "tallarines_con_salsa.jpg", content_type: "image/jpg")
