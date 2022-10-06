class Place < ApplicationRecord
=begin
NOTA: Al usar la gema 'shrine' para subir archivos, se debe usar el método 'attachment' para indicar que el campo es un archivo. Adicionalmente se debe crear o renombrar el atributo de la clase que va a contener el archivo, en este caso 'picture' y se debe crear un atributo que se llame 'picture_data' que va a contener la información del archivo la palabra 'image' puede variar, pero '_data' debe ser obligatorio, sino se generan errores al tratar de interactuar con el.
=end

  # Implementando la clase ImageUploader para subir imagenes
  include ImageUploader::Attachment(:picture)

  belongs_to :user
end
