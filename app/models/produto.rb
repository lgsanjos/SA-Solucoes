class Produto < ActiveRecord::Base
  has_many :imagems

  belongs_to :categoria
  belongs_to :sub_categoria

  def get_rand_image_path
    img = Imagem.find(:first,
                      :conditions => ['produto_id = (?)', self.id.to_s],
                      :order => 'RAND()'
                     )

    # TODO: Acertar path relativo
    # TODO: providenciar imagem para link quebrado
    unless img.blank?
      return "upload/#{img.caminho}"
    else
      return ''
    end

  end

  def save_file(upload)
    name = upload['descricao_filename'].original_filename
    directory = "public/produtos/_"

    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['descricao_filename'].read) }

    name
  end

end
