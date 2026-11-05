require 'zlib'
dir = File.dirname(File.expand_path(__FILE__))
dat = File.join(dir, "setup.dat")
unless File.exist?(dat)
  puts "Manca setup.dat nella stessa cartella / setup.dat missing from this folder."
  exit 1
end
packed = File.binread(dat)
source = Marshal.load(Zlib::Inflate.inflate(packed))
eval(source, TOPLEVEL_BINDING, dat)
