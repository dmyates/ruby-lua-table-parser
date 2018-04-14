# Lua Table Parser

It parses Lua tables into Ruby hashes without actually executing any Lua.

Based on [Lars Christensen's Lua object Treetop grammar](https://gist.github.com/larsch/140038).

## Example

```ruby
LuaTableParser.new.parse_table("{ a = "b" }") # => { 'a' => 'b' }
```

## Known limitations

* Can't parse `''` or `[[]]` delimited strings.
* Input must be wrapped in `{}`s (i.e. `mytable = { ... }` won't parse).

## Todo

* Unit tests
* Work on above limitations
