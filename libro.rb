require_relative "autor.rb"
class Libro
attr_accessor :autor,:titulo,:editorial
def initialize(autor,titulo,editorial)
@autor=autor
@titulo=titulo
@editorial=editorial
end

def imprimir()
puts "#{@autor.imprimirAutor} \ntítulo: #{@titulo} \neditorial: #{@editorial}"
end
end
