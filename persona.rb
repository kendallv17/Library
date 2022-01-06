class Persona

attr_accessor :id,:nombre,:apellido,:anno_nac

def initialize(id,nombre ,apellido ,anno_nac )
@id=id
@nombre=nombre
@apellido=apellido
@anno_nac=anno_nac
end

def imprimir()
puts "ID: #{id} \nNombre: #{@nombre} \nApellido: #{@apellido} \nAnno de nacimiento: #{@anno_nac}"
end

end

