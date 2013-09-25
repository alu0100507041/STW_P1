require 'twitter'
require './configure'

screen_name = ARGV[0] || 'Riesse_'
a_user = Twitter.user(screen_name)

usuarios = (ARGV[1] || 4).to_i

puts "USUARIO PRINCIPAL"
puts "Username: #{a_user.screen_name}"
puts
puts "------------------------"
puts "USUARIOS AMIGOS"

seguido = Twitter.friend_ids(screen_name)
seguido = seguido.ids[0..usuarios]

#almacenar en el hash numero de following con sus followers correspondientes
guardar = Hash.new

for a in seguido
 # if usuarios > 0
   # puts "Seguido : #{a.name}, Seguidores: #{a.followers_count}"
    usu = Twitter.user(a)
    guardar[usu.screen_name] = usu.followers_count
    puts "Amigo: #{usu.screen_name}, Seguidores: #{usu.followers_count}"
   # usuarios = usuarios-1
  #end
end

#ordenar el hash por el usuario que tenga mas followers
puts
puts "--------------------------------------------" 
puts "USUARIOS AMIGOS ORDENADOS POR EL MAS POPULAR"
guardar.sort_by{|x| -x[1]}.each do |usuario,seguidores|
  puts "Amigo: #{usuario}, Seguidores: #{seguidores}"
end
