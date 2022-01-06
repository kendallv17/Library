require_relative "persona.rb"

class Autor < Persona

attr_accessor :estilo

def initialize(estilo,id,anno_nac,nombre,apellido)
@estilo=estilo
super(id,nombre,apellido,anno_nac)
end

def imprimirAutor()
puts "ID:#{@id} \nNombre: #{@nombre} \napellido: #{@apellido} \nAnno de nacimiento: #{@anno_nac} \nEstilo:#{@estilo}"
end
end


