
import strscans

proc calc(l,w,h:int) : int =
  let side1 = l*w
  let side2 = w*h
  let side3 = h*l
  var smallest = side1
  if side2<smallest:
    smallest=side2
  if side3<smallest:
    smallest = side3
  result = (2*l*w + 2*w*h + 2*h*l) + smallest

proc readfile(f:string) :seq[string] =
  let inf = open(f)
  defer: inf.close()
  var line : string
  while readline(inf,line):
    result.add(line)

proc test() =
  echo(calc(2,3,4))
  echo(calc(1,1,10))


proc part1() =
  let data = readfile("input.txt")
  var a,b,c : int
  var sum = 0
  for line in data:
    if scanf(line,"$ix$ix$i",a,b,c):
      sum = sum + calc(a,b,c)
  echo(sum)
  
part1()