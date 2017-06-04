require 'csv'

#decrypts all the passwords
def unrotate(string, positions = 12)
  alphabet = Array('A'..'Z')
  decrypted = ''
  string.split('').each do |char|
    i = alphabet.find_index(char)
    decrypted += alphabet[(i-positions)%alphabet.size]
  end
  return decrypted
end

#função para ler o arquivo CSV e passar cada senha
#para a função de decriptação
def fileReader(filename)
  csv_text = File.read(filename)
  csv = CSV.parse(csv_text, :col_sep => "|")
  csv.each do |row|
    row[1] = unrotate(row[1])
  end
  return csv
end



