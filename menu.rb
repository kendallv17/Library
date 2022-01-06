require_relative "libro.rb"

class Menu
attr_accessor :autores, :libros

def get_id
  puts "ID:"
  id = gets.chomp.to_i
  yield(id)
end

def initialize()
@autores=Hash.new( "autor no encontrado." )
@libros=Hash.new( "libro no encontrado." )
end

def get_datos_aut
  puts "Nombre:"
  nom = gets.chomp.to_s
  puts "Apellido:"
  ape = gets.chomp.to_s
  puts "ID:"
  id = gets.chomp.to_i
  puts "Nacimiento:"
  nac = gets.chomp.to_i
  puts "Estilo:"
  est = gets.chomp.to_s
  yield(nom,ape,id,nac,est)
end

def get_datos_per
  puts "Nombre:"
  nom = gets.chomp.to_s
  puts "Apellido:"
  ape = gets.chomp.to_s
  puts "ID:"
  id = gets.chomp.to_i
  puts "Nacimiento:"
  nac = gets.chomp.to_i
  yield(nom,ape,id,nac)
end

def get_datos_libro
  puts "Nombre:"
  nom_lib = gets.chomp.to_s
  puts "Editorial:"
  edit = gets.chomp.to_s
  puts "ID del autor:"
  id_libro = gets.chomp.to_i
  
  yield(nom_lib,edit,id_libro)
end

def clear
  if Gem.win_platform?
    system 'cls'
  else
    system 'clear'
  end
end


def iniciarMenu()

n=9

while n!=7 do
clear()

puts "MENU:
1. Ingresar Autor
2. Ingresar Libro
3. Ingresar Persona
4. Listar Libros con su autor
5. Listar Autores
6. Listar Libros por Autor
7. Exit
"

n = gets.chomp.to_i

case n
  when 1
  clear()
      get_datos_aut do |nom,ape,id,nac,est|
      a=Autor.new(est,id,nac,nom,ape)
	  @autores[id]=a
	  puts a.nombre + " ha sido ingresado correctamente."
	  gets()
    end
  when 2
  clear()
     get_datos_libro do |nom_lib,edit,id_aut|
	 a=@autores[id_aut]
	 libro=Libro.new(a,nom_lib,edit)
	 @libros[nom_lib]=libro
	 puts nom_lib + " ha sido ingresado correctamente."
	 gets()
	end
  when 3
  clear()
      get_datos_per do |nom,ape,id,nac|
      p=Persona.new(id,nom ,ape ,nac)
	  puts p.nombre + " ha sido ingresado correctamente."
	  gets()
    end
  when 4
  clear()
     for key in @libros.keys()
    print key, @libros[key].imprimir(), "\n", "\n","\n"
	gets()
	end
  when 5
  clear()
  for key in @autores.keys()
    print key, @autores[key].imprimirAutor(), "\n", "\n","\n"
end
gets()
  when 6
  clear()
     get_id do |id| 
	 @libros.each {|key, value| puts value.imprimir() if value.autor.id==id}
end
gets()

  else 
    puts "Exiting"
end
end


end
end
