### 演算子の行あたりの出現回数

resultHash = {}   # 行数とその行で出現した演算子の数を格納するハッシュ

#filePath = "/Users/fukumotodai/Desktop/Turtle01_846255.java"
filePath = ARGV[0]
def parseLine(line)
  
  line = line.gsub(/[0-9]/," ").gsub(/[a-zA-Z]/, " ").gsub(";", " ").gsub(/\{|\}/, " ").gsub(/\(|\)/," ").gsub(".", " ")
  line = line.split(" ")
#  p line

  return line
end

### ファイルを一行ずつ読み込む
open(filePath) do |f|

  f.each_with_index do |line, index|
    operand = 0
#    p index
    parseLine(line).each do |item|    # 英数字とか削除した後の各要素
      if item =~ /(\+\+)|(--)|(\+)|(-)|(\*)|(\/)|(%)|(\^)/ && !(item =~ /(\+=)|(-=)|(\*=)|(\/=)|(\^=)/)
        operand += 1
#        p "全演算子"
      elsif item =~ /(=)|(\+=)|(-=)|(\*=)|(\/=)|(%=)|(\^=)/ && !(item =~ /(==)/)
        operand += 1
#        p "二項代入演算子"
      end
    end
    if operand > 0
      resultHash[index+1] = operand
    end
#    p "---------------"    
  end
end

p resultHash
