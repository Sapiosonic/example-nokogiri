require 'net/http'
require 'nokogiri'

page = Net::HTTP::new('example.com', 443)
page.use_ssl = true

resp = page.get('/')

document = Nokogiri::HTML(resp.body)
paragraph = document.at('p')

File.open('result.txt', 'r+') do |line|
  line.puts(paragraph.content)
end
