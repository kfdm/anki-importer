#!/usr/bin/env ruby

raise 'Missing Input File' if not ARGV[0]

def format words
	if words[0] == words[1] then
		# If there are only 2 'words' then we only have hiragana
		puts "#{words[0]}\t#{words[2]}\t#{words[1]}"
	else
		# Otherwise we have kanji
		puts "#{words[0]}\t#{words[2]}\t#{words[0]}"
	end
end

input = File.new(ARGV[0], "r")
while(line = input.gets)
	words = line.strip().split("\t")
	if words.length == 2 then
		# Use word[0] twice for both <Word> and <Reading>
		words = [words[0],words[0],words[1]]
	end
	format words
end

input.close