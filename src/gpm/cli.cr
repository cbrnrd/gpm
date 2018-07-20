require "commander"
require "./constants"
require "./commands/*"

module Gpm
class Cli

  def self.run(args)
    cli = Commander::Command.new do |command|
      command.use = "gpm"

      command.commands.add do |cmd|
        cmd.use = "version"
        cmd.short = "Shows the version."
        cmd.long = cmd.short

        cmd.run do
          puts "gpm v\u001b[37;1m#{Gpm::VERSION}\u001b[0m"
        end
      end

      command.commands.add do |cmd|
        cmd.use = "install"
        cmd.short = "Install a package."
        cmd.long = cmd.short

        cmd.run do |opts, args|
          Gpm::Commands::Install.install(args.last(1)[-1])
        end
      end


    end
    Commander.run(cli, args)
  end

end
end
