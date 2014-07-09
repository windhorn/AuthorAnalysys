### 演算子の行あたりの出現回数

resultHash = {}   # 行数とその行で出現した演算子の数を格納するハッシュ

filePath = "/Users/fukumotodai/Desktop/Turtle01_846255.java"

def parseLine(line)
  
  line = line.gsub(/[0-9]/," ").gsub(/[a-zA-Z]/, " ").gsub(";", " ").gsub(/\{|\}/, " ").gsub(/\(|\)/," ")
  line = line.split(" ")
  p line

  return line
end

### ファイルを一行ずつ読み込む
open(filePath) do |f|
  f.each do |line|
    parseLine(line).each do |item|    # 英数字とか削除した後の各要素
      if item =~ /(\+\+)|(--)|(\+)|(-)|(\*)|(\/)|(%)|(\^)/ && !(item =~ /(\+=)|(-=)|(\*=)|(\/=)|(\^=)/)
        allOp += 1
      elsif item =~ /(=)|(\+=)|(-=)|(\*=)|(\/=)|(%=)|(\^=)/ && !(item =~ /(==)/)
        allOp += 1
        binOp += 1
      end
    end
      p "---------------"    
  end
end

