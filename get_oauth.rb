require 'oauth'

print 'Consumer Key: '
con_key = gets.chomp

print 'con_secret: '
con_secret = gets.chomp

oauth = OAuth::Consumer.new(
  con_key,
  con_secret,
  site: "http://twitter.com"
)

request_token = oauth.get_request_token

puts "Verified."
puts "Please, access this URL: #{request_token.authorize_url}"
puts "and get the PIN code."

print "Enter your PIN code: "
pin = gets.to_i

access_token = request_token.get_access_token(
  oauth_verifier: pin
)

puts "Your Access token: #{access_token.token}"
puts "Your Access token secret: #{access_token.secret}"

