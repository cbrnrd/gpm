require "file_utils"
require "zip"

def copy(f1 : String, f2 : String)
  FileUtils.cp_r(f1, f2)
end

def mkdir(dir : String)
  FileUtils.mkdir(dir)
end

def unzip(file)
  unzipped = file.gsub(".zip", "")
  Process.run("unzip -o #{file} -d #{unzipped}", shell: true)
end

def uid
  io = IO::Memory.new
  Process.run("id -u", shell: true, output: io)
  return io.to_s.to_i
end

def arch
  os_io = IO::Memory.new
  Process.run("uname", shell: true, output: os_io)
  arch_io = IO::Memory.new
  Process.run("uname -m", shell: true, output: arch_io)
  if os_io.to_s.strip == "Darwin"
    return "x86_64-apple-darwin" if arch_io.to_s.strip == "x86_64"
    return "i686-apple-darwin" if arch_io.to_s.strip == "i686"
  elsif os_io.to_s.strip == "Linux"
    return "x86_64-linux-gnu" if arch_io.to_s.strip == "x86_64"
    return "i686-linux-gnu" if arch_io.to_s.strip == "i686"
  end
  # TODO Add Windoze
end

def rm_rf(path : String)
  FileUtils.rm_rf(path)
end

def chmod(file, perms)
  File.chmod(file, perms)
end
