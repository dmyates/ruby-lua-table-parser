Gem::Specification.new do |s|
  s.name        = 'lua-table-parser'
  s.version     = '0.0.1'
  s.date        = '2018-04-14'
  s.summary     = "Parse Lua tables into Ruby hashes."
  s.description = "A gem for parsing Lua tables and converting them into Ruby data structures without executing Lua code."
  s.authors     = ["David Yates", "Lars Christensen"]
  s.email       = 'd@vidyat.es'
  s.files       = ["lib/lua-table.treetop",
                   "lib/parser.rb",
                   "lib/main.rb"]
  s.homepage    = 'http://rubygems.org/gems/lua-table-parser'
  s.license     = 'MIT'
  s.add_runtime_dependency = 'treetop'
end
