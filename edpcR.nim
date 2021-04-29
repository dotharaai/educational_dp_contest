import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



const md = 10^9+7

proc `*`(x,y:seq[seq[int]]):seq[seq[int]]=
  var
    xh = x.len
    xw = x[0].len
    yh = y.len
    yw = y[0].len
  if xw != yh:
    raise
  result = newseqwith(xh,newseqwith(yw,0))
  for i in 0..<xh:
    for j in 0..<yw:
      for p in 0..<xw:
        result[i][j]+=x[i][p]*y[p][j]
        result[i][j].mod=md
      #result[i][j].mod=md
  return

proc modPow(x:seq[seq[int]],n:int):seq[seq[int]]=
  var
    x = x
    n = n
    h = x.len
    w = x[0].len
  result = newseqwith(h,newseqwith(w,0))
  for i in 0..<h:
    result[i][i]=1
  while n>0:
    if (n and 1)>0:
      result = result*x
    x = x*x
    n = n shr 1
  return

proc solve():int{.discardable.}=
  var
    n = scan()
    k = scan()
    a = newseqwith(n,newseqwith(n,scan()))
  return modPow(a,k).mapIt(it.sum().mod(md)).sum().mod(md)


  

  
echo solve()