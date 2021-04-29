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





proc solve():int{.discardable.}=
  var
    n = scan()
    a = newseqwith(n,newseqwith(n,scan()))
    point = newseqwith(2^n+1,0)
    dp = newseqwith(2^n+1,0)
    pc = newseqwith(n+1,newseq[int]())
  for v in 1..2^n:
    var b = v.toBin(n)
    for i in 0..<n-1:
      for j in i+1..<n:
        if b[i]=='1' and b[j]=='1':
          point[v]+=a[i][j]
  for v in 1..<2^n:
    pc[v.toBin(n).count('1')].add(v)
  for oneC in 1..n:
    for s in pc[oneC]:
      var
        b = s
      while b>0:
        b = (b-1) and s
        dp[s].max=dp[b] + point[b xor s]
  return dp[2^n - 1]

      
  

  
echo solve()