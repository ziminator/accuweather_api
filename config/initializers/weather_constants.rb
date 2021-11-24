#Location Key - Moscow
# "http://dataservice.accuweather.com/currentconditions/v1/571951?apikey=BklnPnq0pgD5Gd94IjwkHBL3cp6JCAMy"
LOCATION_KEY = '571951'.freeze
#API_KEY = 'BklnPnq0pgD5Gd94IjwkHBL3cp6JCAMy'.freeze
API_KEY = 'aGApAGiKZDiwV6qrVL8MJwVZ5zn99Qob'.freeze
HTTP_STRING = "http://dataservice.accuweather.com/currentconditions/v1/".freeze


HTTP_CURRENT = "#{HTTP_STRING}#{LOCATION_KEY}?apikey=#{API_KEY}&language=ru-ru&details=false".freeze
HTTP_24 = "#{HTTP_STRING}#{LOCATION_KEY}/historical/24?apikey=#{API_KEY}&language=ru-ru&details=false".freeze
