require "pp"

class HashTable
  attr_accessor :size

  def initialize(size)
    @key_map = Array.new(size)
  end

  def hash(key)
    total = 0
    weird_prime = 31

    i = 0
    while i < [key.length, 100].min
      char = key[i]
      value = char.ord - 96
      total = (total * weird_prime + value) % @key_map.length

      i += 1
    end

    total
  end

  def hash_set(key, value)
    index = hash(key)

    if !@key_map[index]
      @key_map[index] = []
    end

    @key_map[index] << [key, value]
  end

  def hash_get(key)
    index = hash(key)

    if @key_map[index]
      i = 0
      while i < @key_map[index].length
        if @key_map[index][i][0] == key
          return @key_map[index][i][1]
        end
        i += 1
      end
    end

    nil
  end

  def values
    values_arr = []
    i = 0
    while i < @key_map.length
      if @key_map[i]
        j = 0
        while j < @key_map[i].length
          if !values_arr.include?(@key_map[i][j][1])
            values_arr << @key_map[i][j][1]
          end

          j += 1
        end
      end

      i += 1
    end

    values_arr
  end

  def keys
    keys_arr = []
    i = 0
    while i < @key_map.length
      if @key_map[i]
        j = 0
        while j < @key_map[i].length
          if !keys_arr.include?(@key_map[i][j][0])
            keys_arr << @key_map[i][j][0]
          end

          j += 1
        end
      end

      i += 1
    end

    keys_arr
  end
end

hash_table = HashTable.new(4)

hash_table.hash_set("hello world", "goodbye!!")
hash_table.hash_set("dogs", "are cool")
hash_table.hash_set("cats", "are fine")
hash_table.hash_set("i love", "pizza")

pp hash_table.keys
