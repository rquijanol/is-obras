# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


r1 = Role.create({name: "User", description: "Can read items"})
r2 = Role.create({name: "Supervisor", description: "Can read and create projects"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})


u1 = User.create(email: "rquijanol@gmail.com", password: "mares1186", role_id: r3.id)
u2 = User.create(email: "rquijanol@hotmail.com", password: "mares1186", role_id: r2.id)
u2 = User.create(email: "rquijanol@yahooo.com", password: "mares1186", role_id: r1.id)

i1 = Empresa.create({nombre: "Rayban Sunglasses"})
i2 = Empresa.create({nombre: "Gucci watch"})
i3 = Empresa.create({nombre: "Henri Lloyd Pullover"})
i4 = Empresa.create({nombre: "Porsche socks"})

