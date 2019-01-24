require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
require 'player'
require 'router'
require 'view'
# require 'views/index'
# require 'views/done'
require 'csv'
require 'open-uri'
require 'resolv-replace'
require 'colorize'
require 'pry'
Router.new.perform