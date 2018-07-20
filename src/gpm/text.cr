module Gpm
class Text

  def self.purple
    "\u001b[35m"
  end

  def self.red
    "\u001b[31m"
  end

  def self.reset
    "\u001b[0m"
  end

  def self.bright
    "\u001b[37;1m"
  end

  def self.zip_url(repo : String)
    return "https://github.com/#{repo}/archive/master.zip"
  end

  def self.tmp_repo_path(repo : String)
    return "#{ENV["HOME"]}/.gpm/#{repo.split("/")[1]}"
  end

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
