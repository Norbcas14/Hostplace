# Clase que nos permite subir imagenes a nuestro servidor
class ImageUploader < Shrine
  # plugins and uploading logic

  # Validaciones de Shrine
  # Valida el tipo de archivo, el tamaño y la extension
  # Attacher.validate do
  #   validate_size      1..5*1024*1024
  #   validate_mime_type %w[image/jpeg image/png image/webp image/tiff]
  #   validate_extension %w[jpg jpeg png webp tiff tif]
  # end
end
