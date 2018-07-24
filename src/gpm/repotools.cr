require "./system"
require "./text"


# If any part of installation fails, clean up the zip and unzipped versions of
# the repo in its temporary location
def clean_up_repo(repo : String)
  print "Cleaning up..."
  rm_rf(Gpm::Text.tmp_repo_unzipped(repo))
  rm_rf(Gpm::Text.tmp_repo_path(repo) + ".zip")
  done_msg
end

# Checks for a folder that contains arch-specific binaries
# Currently supported arch's are: i*86 & x86_64
def check_for_arch_bins(repo)
  path = Gpm::Text.tmp_repo_unzipped(repo) + "/gpmbins/#{arch}"
  unless File.directory?(path)
    fail_msg
    error "No binaries available for arch #{arch}"
    return false
  end

  d = Dir.new(path)
  if d.children.size == 0  # Should probably add a regex her to prevent .keep files and other stuff from going through
    fail_msg
    error "Binary folder exists but is empty"
    return false
  end
  done_msg
  return true
end
