require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/menuItems/search?query=burger&offset=0&number=10&minCalories=0&maxCalories=5000&minProtein=0&maxProtein=100&minFat=0&maxFat=100&minCarbs=0&maxCarbs=100")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'SIGN-UP-FOR-KEY'
request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

response = http.request(request)
puts response.read_body
