# Use Treetop to parse some Lua tables

require 'treetop'

base_path = File.expand_path(File.dirname(__FILE__))
Treetop.load(File.join(base_path, 'lua-table.treetop'))

class LuaTableParser
  def self.splash_array(ary)
    # Converts an array to a hash or array depending on the
    # contents. The parser returns an array mixed of PODs and Hashes. If
    # there are hashes, convert everything to a hash and insert
    # unindexed types with index as key.
    if ary.find { |x| Hash === x and x.intermediate_hash? }
      idx = 1
      hsh = {}
      def hsh.intermediate_hash?; false; end
      ary.each { |x|
        if Hash === x and x.intermediate_hash?
          hsh[x.keys[0]] = x.values[0]
        else
          hsh[idx] = x
          idx += 1
        end
      }
      return hsh
    else
      return ary
    end
  end

  def parse_table(data)
    # remove comments and newlines
    data = data.gsub(/--.*$/,'').gsub('\n','')

    tree = parse(data)

    if tree.nil?
      raise Exception, "Parse error at offset: #{@@parser.index}\nThe parser says: #{@@parser.failure_reason}"
    end

    tree.to_ruby
  end
end

