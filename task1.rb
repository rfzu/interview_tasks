=begin
факториал
=end
#плохо
def fact1(n)
  fact = 1
  (1..n).each {|i| fact = fact*i}
  fact
end

#плохо
def fact2(n)
  fact = 1
  while n > 1
    fact = fact*n
    n = n-1
  end
  fact
end

#хорошо
def fact3(n)
  n > 1 ? n * fact3(n-1) : 1
end

# написать генератор случайных чисел от 0 до 7 используя rand(4)
def rand2()
  r = rand(4)
  return 0 if (r == 0 || r == 1)
  1
end

def rand7
  r = rand2()
  r = rand(4) + r*4
  rand7() if r == 7
  r
end

=begin
Есть произвольный массив целых чисел и исходное число. 
Требуется найти в массиве число равное по модулю исходному числу, 
если его нет, то нужно написать то число, которое ближе всего по модулю к исходному. 
Если таких чисел несколько - взять то что ближе к началу
=end

# плохо
def foo(a, b)
  delta = (a[0].abs - b).abs + 1
  a.each do |i|
    if (delta>0 and (i.abs - b.abs).abs < delta)
      delta = (i.abs - b.abs).abs
      @c = i
    end
    return i if delta == 0
  end
  return @c
end

#хорошо
def foo2(ary, x)
  abs_x = x.abs
  deltas = ary.map do |y|
    abs_y = y.abs
    abs_x > abs_y ? abs_x - abs_y : abs_y - abs_x
  end
  deltas.zip(ary).sort[0][-1]
end

#хорошо
def foo3(ary, x)
  z = ary.find {|z| z.abs == x.abs}
  return z if z != nil

  abs_x = x.abs
  deltas = ary.map do |y|
    abs_y = y.abs
    abs_x > abs_y ? abs_x - abs_y : abs_y - abs_x
  end
  #puts deltas
  return deltas.zip(ary).sort[0][-1]
end