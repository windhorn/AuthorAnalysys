### ソースコード中の演算子を扱うクラス

class AnalysisOp
  def initialize(item)
    @binaryOp = false     # 二項代入演算子であるか．
    @op = false           # 演算子であるか．
    @item = item

    if @item =~ /(\+\+)|(--)|(\+)|(-)|(\*)|(\/)|(%)|(\^)/ && !(item =~ /(\+=)|(-=)|(\*=)|(\/=)|(\^=)|(%=)/)
      @op = true
    elsif item =~ /(=)|(\+=)|(-=)|(\*=)|(\/=)|(%=)|(\^=)/ && !(item =~ /(==)/)
      @op = true
      @binaryOp = true
    end
  end
  
  def is_binaryOp?
    return @binaryOp && @op ? true : false
  end
  
  def is_op?
    return @op ? true : false
  end
    
end
