#!/usr/bin/env ruby

def fact(n, bottom=1)
  product = 1
  n.downto(bottom) { |i| product *= i }
  product
end

def choose(from, chuz)
  if chuz <= from / 2
    fact(from, from - chuz + 1) / fact(chuz)
  else
    choose(from, from - chuz)
  end
end

def full_houses(suits)
  choose(13, 2) * 2 * choose(suits, 3) * choose(suits, 2)
end

def straights(suits)
  10 * suits**5 - 10 * suits
end

suits = 3     # of suits; needs to be at least 3 for a full house
found = false # whether the point at which full house is more likely than straight is found

which = rand(2) == 0

while !found || suits <= 20
  f = full_houses(suits)
  s = straights(suits)
  found = f > s ? "* " : ""
  if which
    puts found + "with " + suits.to_s + " suits there are " + f.to_s + " full houses and " + s.to_s + " straights"
  else
    puts suits.to_s + "," + f.to_s + "," + s.to_s
  end
  found = f > s
  suits += 1
end
