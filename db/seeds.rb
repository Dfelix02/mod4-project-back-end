require 'uri'
require 'net/http'
require 'openssl'
require 'json'

Category.destroy_all
Item.destroy_all
GameGenre.destroy_all

url = URI("https://rapidapi.p.rapidapi.com/genres")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'rawg-video-games-database.p.rapidapi.com'
request["x-rapidapi-key"] = 'a369ed1ebemshdc55bc79b68db6fp19caddjsnc953c6bbd429'

response = http.request(request)
parseResponse = JSON.parse(response.body)

parseResponse["results"].each do |genre| 
    Category.create!(:name => genre["name"], :image => genre["image_background"])
end



url = URI("https://rapidapi.p.rapidapi.com/games")
100.times do |index|

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'rawg-video-games-database.p.rapidapi.com'
    request["x-rapidapi-key"] = 'My-Key'

    response = http.request(request)

    parseResponse = JSON.parse(response.body)
    if !parseResponse["results"].empty?
        parseResponse["results"].each do |game| 
            num = rand(50..70)
            num = num.ceil()
            screen = game["short_screenshots"]
            screenshots = screen.map do |screenshot|  
                screenshot["image"]
            end
            if game["clip"]
                clip = game["clip"]["clip"]
                preview = game["clip"]["preview"]
            else
                preview = "no preview found"
                clip = "no clip found"
            end
            data = {
                :name => game["name"],
                :released => game["released"],
                :background_image => game["background_image"],
                :rating => game["rating"],
                :rating_top => game["rating_top"],
                :playtime => game["playtime"],
                :clip => clip,
                :clip_preview => preview,
                :screenshots => screenshots,
                :price => num += 0.99,
            }
            
            item = Item.create(data)

            Category.all.each do |category|
                game["genres"].each do |gameGenre|
                    if category["name"] == gameGenre["name"]
                        GameGenre.create!(category: category, item: item)
                    end
                end
    
            end
        end
    end
    url = URI(parseResponse["next"])

end

puts "SEEDEEDDDDDD"

