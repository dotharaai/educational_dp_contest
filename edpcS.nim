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


const ans = """
dp[i][0][j] := i桁目まで見て、まだk以下であることが確定しておらず、mod dの値がjである値の個数
dp[i][1][j] := i桁目まで見て、k以下であることが確定していて、mod dの値がjである値の個数
"""

proc solve():int{.discardable.}=
  var
    k = read()
    n = k.len 
    d = scan()
    md = 10^9+7
    dp = newseqwith(n+1,newseqwith(2,newseqwith(d,0)))
  k = "0" & k
  dp[0][0][0] = 1
  for i in 1..n:
    for v in 0..<d:
      for j in 0..9:
        dp[i][1][v] += dp[i-1][1][((v-j).mod(d)+d).mod(d)]
        if j < k[i].toInt:
          dp[i][1][v] += dp[i-1][0][((v-j).mod(d)+d).mod(d)]
        if j == k[i].toInt:
          dp[i][0][v] += dp[i-1][0][((v-j).mod(d)+d).mod(d)]
      dp[i][1][v].mod=md
      dp[i][0][v].mod=md
  return ((dp[n][0][0] + dp[n][1][0] - 1).mod(md)+md).mod(md)



  

  
echo solve()