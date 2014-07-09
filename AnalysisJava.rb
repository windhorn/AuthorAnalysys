### Javaソースコードの静的解析を行うプログラム
### 全演算子に対する二項代入演算子の出現割合を抽出するプログラム
###
### 全演算子: +, -, *, /, %, ^, ++, --, =, +=, -=, *=, /=, %=
### 二項代入演算子: =, +=, -=, *=, /=, %=

allOp = 0 # 全演算子の出現数
binOp = 0 # 二項代入演算子の出現数
#filePath = "/Users/fukumotodai/Desktop/Turtle01_846255.java"
filePath = ARGV[0]

### ファイルを一度読み込む
f = open(filePath)
file = f.read
f.close

### 空白で区切る
file = file.split(" ")

file.each_with_index do |item, index|
  ### 全演算子を検索する
  if item =~ /(\+\+)|(--)|(\+)|(-)|(\*)|(\/)|(%)|(\^)/ && !(item =~ /(\+=)|(-=)|(\*=)|(\/=)|(\^=)/)
    allOp += 1
=begin
    p "#{index} : #{item}"
    p "全演算子"
    p $1
    p $2
    p $3
    p $4
    p $5
    p $6
    p $7
    p $8
    p $9
    p $10
    p $11
=end
  elsif item =~ /(=)|(\+=)|(-=)|(\*=)|(\/=)|(%=)|(\^=)/ && !(item =~ /(==)/)
    allOp += 1
    binOp += 1
=begin
    p "#{index} : #{item}"
    p "二項代入"      
    p $1
    p $2
    p $3
    p $4
    p $5
    p $6
    p $7
=end
  end
end
  proportion = binOp.to_f / allOp.to_f * 100    # 全演算子に対する二項代入演算子の割合
  p "二項代入演算子 / 全演算子 : #{binOp} / #{allOp}"
  p "全演算子に対する二項代入演算子の割合: #{proportion}%"
