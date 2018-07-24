require "./cli"
require "./system"

if uid != 0
  puts "Run gpm as the super user for it to function properly."
  exit 0
end

Gpm::Cli.run(ARGV)
