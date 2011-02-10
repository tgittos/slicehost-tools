#! /usr/bin/env ruby

$: << File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)
require 'dns'

#Create a new Zone
new_zone = Zone.new(:origin => ARGV[0], :ttl => 86400)
new_zone.save

#Creating new records for that zone
new_record = Record.new(:record_type => 'A', :zone_id => new_zone.id, :name => "#{ARGV[0]}.", :data => SLICE_PUBLIC_IP)
new_record.save
new_record = Record.new(:record_type => 'A', :zone_id => new_zone.id, :name => "www", :data => SLICE_PUBLIC_IP)
new_record.save
new_record = Record.new(:record_type => 'NS', :zone_id => new_zone.id, :name => "#{ARGV[0]}", :data => 'ns3.slicehost.net.')
new_record.save
new_record = Record.new(:record_type => 'NS', :zone_id => new_zone.id, :name => "#{ARGV[0]}", :data => 'ns2.slicehost.net.')
new_record.save
new_record = Record.new(:record_type => 'NS', :zone_id => new_zone.id, :name => "#{ARGV[0]}", :data => 'ns1.slicehost.net.')
new_record.save
