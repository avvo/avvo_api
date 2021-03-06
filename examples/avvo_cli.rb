#!/usr/bin/env ruby
#
# A command-line interface to the Avvo API, as an example of how the
# API can be used. Before using the API, you must create a YAML file
# in ~/.avvo containing your email and password.
require 'optparse'
require 'avvo_api'

professional_klass = nil
professional_param = nil

opts = OptionParser.new("Usage: avvo_cli.rb ID")
rest = opts.parse ARGV

professional_klass = AvvoApi::Lawyer
professional_param = :lawyer_id

if !rest.first
  puts "You must specify the ID of the professional you are looking for"
  puts opts
  exit(1)
else
  begin
    config = YAML.load(File.read(File.expand_path("~/.avvo")))
  rescue
    puts "Please put your Avvo API credentials in ~/.avvo. This is a simple yaml file, which should look like:
email: email@domain.com
password: your_avvo_password"
    exit(1)
  end
  AvvoApi.setup(config["email"], config["password"])
  AvvoApi::Base.site = 'https://api.avvo.com/'

  professional = professional_klass.find(rest.first)

  address = AvvoApi::Address.main(professional_param => professional.id)
  phones =  address.phones
  specialties = professional.specialties
  reviews = professional.reviews

  format = "%12s %s\n"
  puts
  printf format, "ID:", professional.id
  printf format, "Name:", [professional.firstname, professional.middlename, professional.lastname].join(' ')
  printf format, "Website:", professional.website_url if professional.website_url
  printf format, "Profile URL:", professional.profile_url

  printf format, "Address:", address.address_line1
  printf format, "", address.address_line2 if address.address_line2
  printf format, "", address.city + ", " + address.state + " " + address.postal_code

  phones.each do |phone|
    printf format, "#{phone.phone_type}:", phone.phone_number
  end

  specialties.each_with_index do |specialty, i|
    header = i == 0 ? "Specialties:" : ""
    printf format, header, "#{specialty.specialty_name.strip} (#{specialty.specialty_percent}%)"
  end

  puts
  printf format, "Reviews ", ''
  reviews.each do |review|
    printf format, "Rating:", review.overall_rating
    printf format, "Title:", review.title
    printf format, "URL:", review.url
    printf format, "By:", review.posted_by
    puts
  end

end
