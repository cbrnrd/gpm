require "cossack"
require "../system"
require "../text"

module Gpm
module Commands
  class Install

    def self.install(repo)

      unless Dir.exists?("#{ENV["HOME"]}/.gpm")
        mkdir("#{ENV["HOME"]}/.gpm")
      end

      unless Gpm::Text.valid_repo_layout(repo)
        # Invalid repo layout
        puts "#{Gpm::Text.red}Error: #{repo} is not a valid repo (Invalid format)#{Gpm::Text.reset}"
        return
      end

      # If we get here, the repo lauyout is valid
      # Make the request to download
      res = Cossack.get(Gpm::Text.zip_url(repo))
      if res.status != 200
        puts "#{Gpm::Text.red}Error: #{repo} is not a valid repo (#{res.status})#{Gpm::Text.reset}"
        return false
      end
      filesize = res.headers["Content-Length"].to_i
      puts "Downloading #{filesize} bytes..."
      outzip = res.body
      File.write("#{Gpm::Text.tmp_repo_path(repo)}.zip", outzip)
      unzip(Gpm::Text.tmp_repo_path(repo))
      unless Dir.exists?(Gpm::Text.tmp_repo_path(repo) + "/gpmbins")
        puts "#{Gpm::Text.red}Error: #{repo} is not a valid repo (No binaries available)#{Gpm::Text.reset}"
        return false
      end

      unless Dir.exists?(Gpm::Text.tmp_repo_path(repo) + "/gpmbins/#{arch}")
        puts "#{Gpm::Text.red}Error: No binaries available for arch #{arch}#{Gpm::Text.reset}"
        return false
      end

      d = Dir.new(Gpm::Text.tmp_repo_path(repo) + "/gpmbins/#{arch}")
      d.each_child { |x| copy(x, "/usr/local/bin")}

    end
  end
end
end
