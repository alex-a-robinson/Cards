#!usr/bin/env ruby

def horizontal_bar(size=80)
  puts "-" * size
end

def horizontal_bar_big(size=80)
  puts "=" * size
end

def padded_horizontal_bar(size=80)
  puts ''
  horizontal_bar(size)
  puts ''
end

def padded_horizontal_bar_big(size=80)
  puts ''
  horizontal_bar_big(size)
  puts ''
end