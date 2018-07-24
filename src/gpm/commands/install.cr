require "spinner"
require "http/client"
require "../system"
require "../text"
require "../repotools"

module Gpm
module Commands
  class Install

    def self.install(repo, cleanup=true)

      unless Dir.exists?("#{ENV["HOME"]}/.gpm")
        mkdir("#{ENV["HOME"]}/.gpm")
      end

      unless Gpm::Text.valid_repo_layout(repo)
        # Invalid repo layout
        error "#{repo} is not a valid repo (Invalid format)"
        return
      end

      # If we get here, the repo lauyout is valid
      # Make the request to download
      print "Cloning repo zip... "
      # Download the zip
      HTTP::Client.get(Gpm::Text.zip_url(repo)) do |res|
        if res.status_code >= 400
          fail_msg
          error "#{repo} is not a valid repo (#{res.status_code})"
          return false
        end
        outzip = res.body_io
        File.write("#{Gpm::Text.tmp_repo_path(repo)}.zip", outzip)
      end
      done_msg
      print "Checking for bins..."
      unzip(Gpm::Text.tmp_repo_path(repo) + ".zip")

      unless File.directory?(Gpm::Text.tmp_repo_unzipped(repo) + "/gpmbins")
        fail_msg
        error "#{repo} is not a valid repo (No binaries available)"
        clean_up_repo(repo) if cleanup
        return false
      end

      unless check_for_arch_bins(repo)
        clean_up_repo(repo) if cleanup
        exit 0
      end

      d = Dir.new(Gpm::Text.tmp_repo_unzipped(repo) + "/gpmbins/#{arch}")
      puts "Moving bins to /usr/local/bin..."
      FileUtils.cd(Gpm::Text.tmp_repo_unzipped(repo) + "/gpmbins/#{arch}") {
        d.each_child { |x|
          chmod(x, 0o755)
          print "  Moving `" + x + "`..."
          copy(x, "/usr/local/bin")
          done_msg
        }
      }

      clean_up_repo(repo) if cleanup

    end
  end
end
end
