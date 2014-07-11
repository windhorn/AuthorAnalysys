### 演算子の行あたりの出現回数
require File.dirname(__FILE__) + "/AnalysisOp"

resultHash = {}   # 行数とその行で出現した演算子の数を格納するハッシュ
lineNum = 0        # ソースコードの全行数
filePath = "/Users/fukumotodai/Desktop/Turtle01_846255.java"
#filePath = ARGV[0]

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
    ### import文の部分は飛ばす．
    ### ただし，全行数にはカウントする．
    if line =~ /^import/
      lineNum += 1
      next
    end
    lineNum += 1  # 
    operand = 0   # 演算子の数を格納する変数
    parseLine(line).each do |item|    # 英数字とか削除した後の各要素
      obj = AnalysisOp.new(item)
      if obj.is_op?
        operand += 1
      end
    end
    if operand > 0
      resultHash[index+1] = operand
    end
  end
end

### ソースコード中に存在する全演算子をカウントする
opNum = 0
resultHash.each do |key, value|
  opNum += value
end

p "演算子が出現した行数に対する演算子数の平均: #{opNum.to_f / resultHash.length.to_f}"
p "全行数に対する演算子が出現した行数の割合: #{resultHash.length.to_f / lineNum.to_f * 100} %"
p "演算子が出現した行数: #{resultHash.length}"
p "全行数: #{lineNum}"
