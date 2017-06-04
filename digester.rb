require_relative 'csvreader'
require 'digest'
require 'csv'

#leitura da base decriptada
startTime = DateTime.now.strftime('%Q').to_i
database = fileReader 'base.txt'
CSV.open('decripted.txt', 'w',
         :write_headers=> true,
         :headers => ["user","pass"]) do |csv|
  database.each do |row|
    csv << [row[0], row[1]]
  end
end
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - startTime)/1000.0).to_s() + " seconds to decrypt the base"

sha256 = 0
sha1 = 0
md5 = 0

#aplicaçaõ do SHA256 nas senhas
startTime = DateTime.now.strftime('%Q').to_i
CSV.open('sha256.txt', 'w',
         :write_headers=> true,
         :headers => ["user","pass"]) do |csv|
  database.each do |row|
    csv << [row[0], Digest::SHA256.hexdigest(row[1])]
  end
end
endTime = DateTime.now.strftime('%Q').to_i
sha256 += (endTime - startTime)/1000.0

#aplicaçaõ do SHA1 nas senhas
startTime = DateTime.now.strftime('%Q').to_i
CSV.open('sha1.txt', 'w',
         :write_headers=> true,
         :headers => ["user","pass"]) do |csv|
  database.each do |row|
    csv << [row[0], Digest::SHA1.hexdigest(row[1])]
  end
end
endTime = DateTime.now.strftime('%Q').to_i
sha1 += (endTime - startTime)/1000.0

#aplicaçaõ do MD5 nas senhas
startTime = DateTime.now.strftime('%Q').to_i
CSV.open('md5.txt', 'w',
         :write_headers=> true,
         :headers => ["user","pass"]) do |csv|
  database.each do |row|
    m = Digest::MD5.hexdigest(row[1])
    csv << [row[0], m]
  end
end
endTime = DateTime.now.strftime('%Q').to_i
md5 += (endTime - startTime)/1000.0

puts (sha256).to_s + " SHA256"
puts (sha1).to_s + " SHA1"
puts (md5).to_s + " MD5"
