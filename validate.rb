require 'digest'
require 'csv'


def validateMD5 (user, pass)
  csv = CSV.read('md5.txt', :headers=>true)
  csv.each do |row|
    if row["user"] == user
      if row["pass"] == Digest::MD5.hexdigest(pass)
        return true
      end
    end
  end
  return false
end

def validateSHA1 (user, pass)
  csv = CSV.read('sha1.txt', :headers=>true)
  csv.each do |row|
    if row["user"] == user
      if row["pass"] == Digest::SHA1.hexdigest(pass)
        return true
      end
    end
  end
  return false

end

def validateSHA256 (user, pass)
  csv = CSV.read('sha256.txt', :headers=>true)
  csv.each do |row|
    if row["user"] == user
      if row["pass"] == Digest::SHA256.hexdigest(pass)
        return true
      end
    end
  end
  return false

end

def validateCC (user, pass)

end


start = DateTime.now.strftime('%Q').to_i
puts validateMD5 "Guilherme.Lopes.Meireles","CGWHUFIE"
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - start)/1000.0).to_s + " MD5"
start = DateTime.now.strftime('%Q').to_i
puts validateSHA1 "Guilherme.Lopes.Meireles","CGWHUFIE"
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - start)/1000.0).to_s + " SHA1"
start = DateTime.now.strftime('%Q').to_i
puts validateSHA256 "Guilherme.Lopes.Meireles","CGWHUFIE"
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - start)/1000.0).to_s + " SHA256"
