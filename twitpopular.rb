require 'twitter'
require './configure'

screen_name = ARGV[0] || 'timorielly'
a_user = Twitter.user(screen_name)

usuarios = (ARGV[1] || 5).to_i

puts "USUARIO PRINCIPAL"
puts "Username: #{a_user.screen_name}"
puts
puts "------------------------"
puts "USUARIOS AMIGOS"

seguido = Twitter.following(screen_name)

prueba = Hash.new

for a in seguido
  if usuarios > 0
    puts "amigo: #{a.name}, Seguidores: #{a.followers_count}"
    prueba[a.name] = a.followers_count
    usuarios = usuarios-1
  end
end

puts "--------------------------------------------" 
puts "USUARIOS AMIGOS ORDENADOS POR EL MAS POPULAR"
prueba.sort_by{|x| -x[1]}.each do |usuario,seguidores|
  puts "Amigo: #{usuario}, Seguidores: #{seguidores}"
end
