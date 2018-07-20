require "file_utils"

def copy(f1 : String, f2 : String)
  FileUtils.cp_r(f1, f2)
end

def mkdir(dir : String)
  FileUtils.mkdir(dir)
end

def unzip(file : String)
  Process.run("unzip #{file}") # HACK: THIS NEEDS TO BE CHANGED, NOT SECURE!!!!
end

def arch

end
