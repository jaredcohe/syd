# gems
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'pp'

# TODO
## add rest of pages

# get the data
source_url = "https://www.teacherspayteachers.com/Browse/Search:pete+the+cat/Page:2"
doc = Nokogiri::HTML(open(source_url))

# get anchor link objects
anchor_link_object_list = doc.xpath("//div[@id='browse_list']//div[@class='title']//a")

# make array of URL list
product_url_list = []
anchor_link_object_list.each do |anchor_link_object|
  product_url_list << anchor_link_object['href']
end

# print to file
output_file = File.open('results', 'w')
  product_url_list.each do |product_url|
    output_file.puts product_url
  end
output_file.close
