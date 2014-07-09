### 演算子の行あたりの出現回数

resultHash = {}   # 行数とその行で出現した演算子の数を格納するハッシュ
lineNum = 0        # ソースコードの全行数
#filePath = "/Users/fukumotodai/Desktop/Turtle01_846255.java"
filePath = ARGV[0]

### 受け取った行の英数字,{},(),
def parseLine(line)
  line = line.gsub(/[0-9]/," ").gsub(/[a-zA-Z]/, " ").gsub(";", " ").gsub(/\{|\}/, " ").gsub(/\(|\)/," ").gsub(".", " ")
  line = line.split(" ")
#  p line

  return line
end

### ファイルを一行ずつ読み込む
open(filePath) do |f|

  f.each_with_index do |line, index|
    lineNum += 1
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

### 各行に含まれる演算子の平均を計算する
opNum = 0
resultHash.each do |key, value|
  opNum += value
end

average = opNum.to_f / resultHash.length.to_f
p "演算子が出現した行数に対する演算子数の平均: #{average}"
proportion = resultHash.length.to_f / lineNum.to_f * 100
p "全行数に対する演算子が出現した行数の割合: #{proportion} %"
p "演算子が出現した行数: #{resultHash.length}"



p "全行数: #{lineNum}"
p resultHash
