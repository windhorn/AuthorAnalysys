### 演算子の行あたりの出現回数
require File.dirname(__FILE__) + "/AnalysisOp"

resultHash = {}   # 行数とその行で出現した演算子の数を格納するハッシュ
lineNum = 0       # ソースコードの全行数
opNum = 0         # ソースコード中の全演算子数を格納する変数
binaryOp = 0      # 二項代入演算子数を格納する変数

#filePath = "/Users/fukumotodai/Desktop/Turtle01_846255.java"
filePath = ARGV[0]

### 受け取った行の英数字,{},(),
def parseLine(line)
  line = line.gsub(/[0-9]/," ").gsub(/[a-zA-Z]/, " ").gsub(";", " ").gsub(/\{|\}/, " ").gsub(/\(|\)/," ").gsub(".", " ")
  line = line.split(" ")
  return line
end

### ファイルを一行ずつ読み込む
open(filePath) do |f|
  ### 行数が必要なためwith_indexを使う
  f.each_with_index do |line, index|
    ### import文の部分は飛ばす．
    ### ただし，全行数にはカウントする．
    if line =~ /^import/
      lineNum += 1
      next
    end
    
    lineNum += 1  # 
    operand = 0   # 演算子数を格納する変数を0に初期化する．
    parseLine(line).each do |item|    # 英数字とか削除した後の各要素に対して，演算子なのか二項代入演算子なのかをチェックする．
      obj = AnalysisOp.new(item)
      if obj.is_binaryOp?
        binaryOp += 1
        operand += 1
      elsif obj.is_op?
        operand += 1
      end
    end
    if operand > 0
      resultHash[index+1] = operand
      opNum += operand
    end
  end
end

### 結果出力 ###
p "演算子が出現した行数に対する演算子数の平均: #{opNum.to_f / resultHash.length.to_f}"
p "全行数に対する演算子が出現した行数の割合: #{resultHash.length.to_f / lineNum.to_f * 100} %"
p "全演算子数: #{opNum}"
p "二項代入演算子の数: #{binaryOp}"
p "演算子が出現した行数: #{resultHash.length}"
p "全行数: #{lineNum}"
