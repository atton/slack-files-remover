#!/usr/bin/env ruby

require 'dotenv/load'
require 'json'
require 'net/http'
require 'pry'
require 'uri'

@token = ENV['TOKEN']

def list_files
  ts_to = (Time.now - 30 * 24 * 60 * 60).to_i # 30 days ago
  params = { token: @token, ts_to: ts_to, count: 50 }
  uri = URI.parse('https://slack.com/api/files.list')
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get_response(uri)
  json = JSON.parse(response.body)
  json['files']
end

def delete_files(file_ids)
  file_ids.each do |file_id|
    params = { token: @token, file: file_id }
    uri = URI.parse('https://slack.com/api/files.delete')
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    p "#{Time.now}: #{file_id}: #{JSON.parse(response.body)['ok']}"
    sleep 1 + (Random.rand * 2)
  end
end

while true
  files = list_files
  break if files.empty?
  delete_files(files.map{|f| f['id'] })
  num = 100 + (Random.rand * 50)
  puts('----------  ' + num.to_s + '  ----------')
  sleep num
end
