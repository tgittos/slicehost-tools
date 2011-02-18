#! /usr/bin/env ruby

$: << File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)
require 'dns'

# Find the zone for the domain specified
zone = Zone.find(:first, :params => { :origin => "#{ARGV[0]}." } )
puts "Could not find DNS for #{ARGV[0]}" and exit if zone.nil?

record = Record.new(:record_type => 'A', :zone_id => zone.id, :name => "#{ARGV[1]}", :data => SLICE_PUBLIC_IP)
record.save
