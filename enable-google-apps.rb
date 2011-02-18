#! /usr/bin/env ruby

$: << File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)
require 'dns'

# Find the zone for the domain specified
zone = Zone.find(:first, :params => { :origin => "#{ARGV[0]}." } )
puts "Could not find DNS for #{ARGV[0]}" and exit if zone.nil?

#Create Google Apps records for that zone
mx_values = [
  '10 ASPMX.L.GOOGLE.COM.', 
  '20 ALT1.ASPMX.L.GOOGLE.COM.',
  '20 ALT2.ASPMX.L.GOOGLE.COM.',
  '30 ASPMX2.GOOGLEMAIL.COM.',
  '30 ASPMX3.GOOGLEMAIL.COM.',
  '30 ASPMX4.GOOGLEMAIL.COM.',
  '30 ASPMX4.GOOGLEMAIL.COM.',
  '30 ASPMX5.GOOGLEMAIL.COM.'
]

mx_values.each do |mx|
  record = Record.new(:record_type => 'MX', :zone_id => zone.id, :name => 'mail', :data => mx)
  record.save 
end

record = Record.new(:record_type => 'CNAME', :zone_id => zone.id, :name => 'mail', :data => 'ghs.google.com.')
record.save
