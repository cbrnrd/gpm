module Gpm
class Text

  def self.purple
    "\u001b[35m"
  end

  def self.red
    "\u001b[31m"
  end

  def self.bright_red
    "\u001b[31;1m"
  end

  def self.bright_green
    "\u001b[32;1m"
  end

  def self.bright_blue
    "\u001b[34;1m"
  end

  def self.reset
    "\u001b[0m"
  end

  def self.bright
    "\u001b[37;1m"
  end

  # The location of the zipped code of any github repo
  def self.zip_url(repo : String)
    "https://codeload.github.com/#{repo}/zip/master"
  end

  # The path on the local system where the repo is unzipped
  def self.tmp_repo_path(repo : String)
    return "#{ENV["HOME"]}/.gpm/#{repo.split("/")[1]}-master"
  end

  def self.tmp_repo_unzipped(repo : String)
    return "#{ENV["HOME"]}/.gpm/#{repo.split("/")[1]}-master/#{repo.split("/")[1]}-master"
  end

  # Checks if repo passed from CLI is valid (without sending http requests)
  # A valid repo looks like this: user/repo
  def self.valid_repo_layout(s)
    unless s.is_a?(String)
      return false
    end

    if s.split("/").size != 2
      return false
    end

    return true
  end

end
end

# Quick functions

def done_msg
  puts "  [  #{Gpm::Text.bright_green}done#{Gpm::Text.reset}  ]"
end

def fail_msg
  puts "  [  #{Gpm::Text.bright_red}fail#{Gpm::Text.reset}  ]"
end

def error(msg)
  puts "#{Gpm::Text.bright_red}Error: #{msg}#{Gpm::Text.reset}"
end
