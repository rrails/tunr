# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Genre.destroy_all
Song.destroy_all
Album.destroy_all
Artist.destroy_all
User.destroy_all
Mixtape.destroy_all

g1 = Genre.create(:name => 'Classical')
g2 = Genre.create(:name => 'Rock')
g3 = Genre.create(:name => 'Top 40')

s1 = Song.create(:name => 'Thriller')
s2 = Song.create(:name => 'Billie Jean')
s3 = Song.create(:name => 'Smells Like Teen Spirit')

a1 = Album.create(:name => 'Thriller')
a2 = Album.create(:name => 'Nevermind')
a3 = Album.create(:name => 'The White Album')

r1 = Artist.create(:name => 'Michael Jackson')
r2 = Artist.create(:name => 'Nirvana')
r3 = Artist.create(:name => 'Beatles')

u1 = User.create(:name => 'Bob', :image => 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFZF-PEZ0H5W0Z3JAqXU2WFjP1KmpnO7Q0Q3w7QKjFIyoQtkAjvQ', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:name => 'Sam', :image => 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFZF-PEZ0H5W0Z3JAqXU2WFjP1KmpnO7Q0Q3w7QKjFIyoQtkAjvQ', :password => 'a', :password_confirmation => 'a')
u3 = User.create(:name => 'Jill',:image => 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFZF-PEZ0H5W0Z3JAqXU2WFjP1KmpnO7Q0Q3w7QKjFIyoQtkAjvQ', :password => 'a', :password_confirmation => 'a')
u4 = User.create(:name => 'Admin',:image => 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFZF-PEZ0H5W0Z3JAqXU2WFjP1KmpnO7Q0Q3w7QKjFIyoQtkAjvQ', :password => 'a', :password_confirmation => 'a')
u4.is_admin = true
u4.save

m1 = Mixtape.create(:name => 'Easy Listening')
m2 = Mixtape.create(:name => 'Workout Music')
m3 = Mixtape.create(:name => 'Old School')

r1.songs << s1 << s2
r2.songs = [s3]
a1.songs = [s1, s2]
a2.songs << s3
g3.songs = [s1, s2, s3]
u1.mixtapes = [m1, m2]
u3.mixtapes = [m3]
m3.songs = [s1, s2, s3]
u1.albums = [a1, a2]
