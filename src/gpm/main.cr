require "./cli"

#lib LibC
#  fun setuid(uid_t : Int)
#  fun getuid : Int
#end

#if LibC.getuid != 0
#  "Run gpm as the super user for it to function properly."
#  exit 0
#end

Gpm::Cli.run(ARGV)
