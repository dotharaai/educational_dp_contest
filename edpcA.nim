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
    h = newseqwith(n,scan()) & @[0,0]
    dp = newseqwith(n+2,int.high.div(2))
  dp[0]=0
  for i in 0..<n:
    dp[i+2].min=abs(h[i+2]-h[i])+dp[i]
    dp[i+1].min=abs(h[i+1]-h[i])+dp[i]
  return dp[n-1]
  

  

  
echo solve()