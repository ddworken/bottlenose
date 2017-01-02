#!/usr/bin/env ruby

sub = ENV["BN_SUB"]
gra = ENV["BN_GRA"]
key = ENV["BN_KEY"]
ENV["BN_KEY"] = ""

def sub_dir
  Dir.chdir "/home/student"
  count = `find . -name "Makefile" | wc -l`.chomp.to_i
  if count != 1
    raise Exception.new("Too many Makefiles: #{count}")
  end

  `dirname $(find . -name "Makefile" | head -1)`.chomp
end

def run_in_sub(cmd)
  dir = sub_dir
  system(%Q{chown -R student:student "#{dir}"})
  Dir.chdir dir
  system(cmd)
end

def unpack_or_copy(file)
  case
  when (file.match(/\.tar\.gz$/i) or file.match(/\.tgz$/i))
    system(%Q{(cd /home/student && tar xzvf "#{file}")})
  when file.match(/\.zip$/i)
    system(%Q{(cd /home/student && unzip "#{file}")})
  else
    system(%Q{(cd /home/student && cp -f "#{file}" .)})
  end
end

puts "== Unpacking grading tarball first..."
unpack_or_copy(gra)

puts "== Unpacking student code..."
unpack_or_copy(sub)

puts "== Building code..."
run_in_sub("sudo -u student make")

puts "== Unpacking grading tarball over submission..."
unpack_or_copy(gra)

puts "== Running tests..."
puts key
run_in_sub("sudo -u student make test")
puts key
puts "Makefile driver, grading done."

