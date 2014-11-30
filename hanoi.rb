=begin
Составить алгоритм для решения задачи о ханойских башнях.
Для 3-х дисков
=end

#a,b,c - массивы башни, числа в массивых - кольца, 
#значение соответсвует размеру кольца
#n - размер

def hanoi(n, han=nil, from=nil, to=nil)
  p han ||= [[*1..n].reverse,[],[]] if han == nil
  from ||= 0
  to ||= 2
  buf = [0,1,2].index {|i| i != to && i != from }

  if n == 1
    han[to] << han[from].pop
    p han
  else
    to, buf = buf, to
    hanoi(n-1, han, from, to)
    to, buf = buf, to
    han[to] << han[from].pop
    from,buf = buf, from
    hanoi(n-1, han, from, to)
  end
end