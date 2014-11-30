=begin
Наименьшее общее кратное: На вход подаётся строка, содержащая натуральные числа. 
Вывести наименьшее общее кратное этих чисел.
=end

def minmult(ary)
  def maxdel(a, b)
    #Euclidean_algorithm, нахождение наибольшего общего делителя для 2-х чисел  
    while b != 0
      a, b = b, a % b
    end
    a
  end

  def minmult2(a,b)
    #наименьшее общее кратное для 2-х чисел
    a * b / maxdel(a, b)
  end

ary.inject(ary[0]) {|m, n| minmult2(m,n)}
end