require "open-uri"

class PropertiesFetcher
  SEARCH_TERM = /proyecto/i

  def self.refresh!
    new("http://www.plusvalia.com/inmuebles").fetch_properties!
  end

  def initialize(url)
    @url = url
  end

  def fetch_properties!
    (1..3).each do |page_number|
      @current_page = fetch_page(page_number)
      relevant_properties.each do |property|
        Property.create(
          title: title_for(property),
          desc: desc_for(property),
          price: price_for(property),
          image: image_for(property),
          pv_id: id_for(property)
        )
      end
    end
  end

  private

  def relevant_properties
    @current_page.css("li.post").select do |post|
      puts "crawling: #{title_for(post)}.."
      title_for(post) =~ SEARCH_TERM || desc_for(post) =~ SEARCH_TERM
    end
  end

  def fetch_page(number)
    puts "fetching page #{number}"
    url = @url
    if number != 1
      url += "-pagina-#{number}"
    end
    url += ".html"
    puts "url"
    Nokogiri::HTML(
      open(url)
    )
  end

  def title_for(post)
    post.css(".post-title").text
  end

  def desc_for(post)
    post.css(".post-text-desc p").text
  end

  def price_for(post)
    post.css(".precio-valor").text
  end

  def image_for(post)
    post.css(".rsImg").first["href"]
  end

  def id_for(post)
    post["data-aviso"]
  end
end
