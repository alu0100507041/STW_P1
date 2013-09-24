require 'twitter'
require './configure'

screen_name = ARGV[0] || 'Riesse_'
a_user = Twitter.user(screen_name)

usuarios = ARGV[1].to_i || 20

puts "Usuario principal"
puts "Username   : #{a_user.screen_name}"

puts "Usuarios Amigos"

seguido = Twitter.following(screen_name)

prueba = Hash.new

for a in seguido
  if usuarios > 0
    puts "Seguido : #{a.name}, Seguidores: #{a.followers_count}"
    prueba[a.name] = a.followers_count
    usuarios = usuarios-1
  end
end

puts "Hash"
puts prueba

puts "Usuarios Amigos Ordenados por el mas popular" 
puts "#{prueba.sort_by{|x| -x[1]}}"

