class Imagem < ActiveRecord::Base
   belongs_to :produto

  def self.save_file(upload)
    name = upload['imagem'].original_filename
    directory = "public/upload"

    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['imagem'].read) }

    self.caminho = path
  end

end
