require "commander"
require "./constants"
require "./commands/*"

module Gpm
class Cli

  def self.run(args)
    cli = Commander::Command.new do |command|
      command.use = "gpm"
      command.long = "The Linux package manager build on GitHub\n\n  gpm v#{Gpm::VERSION} - cbrnrd@github"

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

        cmd.flags.add do |flag|
          flag.name = "no-cleanup"
          flag.long = "--no-cleanup"
          flag.short = "-c"
          flag.description = "Do not clean up the cloned repo."
          flag.default = false
        end

        cmd.run do |opts, args|
          Gpm::Commands::Install.install(args.last(1)[-1], !opts.bool["no-cleanup"])
        end
      end


    end
    Commander.run(cli, args)
  end

end
end
