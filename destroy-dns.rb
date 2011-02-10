#! /usr/bin/env ruby

$: << File.dirname(__FILE__) unless $:.include? File.dirname(__FILE__)
require 'dns'

zones = Zone.all
zones.each do |zone|
  if zone.origin == "#{ARGV[0]}." then
    puts "Deleting zone #{zone.origin}"
    zone.destroy
  end
end
