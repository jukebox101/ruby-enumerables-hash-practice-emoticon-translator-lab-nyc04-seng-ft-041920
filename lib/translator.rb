# require modules here
require "yaml"
require 'pry'

def load_library(data_file)
  emoticons = YAML.load_file(data_file)
  emoticon_hash = Hash.new

  emoticons.each do |key, value|
    emoticon_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  emoticon_hash
end

def get_japanese_emoticon(data_file, eng_emoticon)
  # code goes here
  library = load_library(data_file)
  japn_version = []
  library.each do |key, value|
    value.each do |key2, value2|
      if value2 == eng_emoticon
        japn_version << value2
      end
    end
  end
  
  japn_version
end

def get_english_meaning(data_file, japn_emoticon)
  # code goes here
  library = load_library(data_file)
  eng_meaning = nil
  not_found = "Sorry, that emoticon was not found"
  
  library.each do |key, value|
    value.each do |key2, value2|
      if value2 == japn_emoticon
        eng_meaning = key
      end
    end
  end
  eng_meaning == nil ? not_found : eng_meaning
end