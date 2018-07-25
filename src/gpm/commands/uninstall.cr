require "../repotools"
module Gpm
module Commands
class Uninstall

  def self.uninstall(repo : String)
    print "Removing all bins for repo: #{repo}..."
    bins = get_repo_bins(repo) # If this fails, it'll exit, so no check here
    bins.as_a.each do |b|
      print "  Removing #{b}..."
      rm_rf(b.as_s)
      done_msg
    end
  end

end # Uninstall
end # Commands
end # Gpm
