class GoogleNewsEverything
  attr_accessor :id, :name, :author, :title, :description, :content, :url, :urlToImage, :publishedAt

  def self.parse_hash(hash)
    obj = GoogleNewsEverything.new
    obj.id = hash[:id]
    obj.name = hash[:name]
    obj.author = hash[:author]
    obj.title = hash[:title]
    obj.description = hash[:description]
    obj.content = hash[:content]
    obj.url = hash[:url]
    obj.urlToImage = hash[:urlToImage]
    obj.publishedAt = hash[:publishedAt]
    obj
  end
end
