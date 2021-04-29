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
dp[表の枚数][i枚目のコインを振った直後] = 
dp[表の出た枚数-1][i-1枚目のコインを振った直後]*(i枚目のコインで表が出る確率) + 
dp[表の出た枚数][i-1枚目のコインを振った直後]*(i枚目のコインで裏が出る確率) 
として埋める。
"""


proc solve():float{.discardable.}=
  var
    n = scan()
    p = @[0.0] & newseqwith(n,scanf())
    dp = newseqwith(n+1,newseqwith(n+1,0.0))

  dp[0][0]=1.0
  for coin in 1..n:
    dp[0][coin] = dp[0][coin-1]*(1-p[coin])
  for coin in 1..n:
    for face in 1..coin:
      dp[face][coin] = dp[face-1][coin-1]*p[coin]+dp[face][coin-1]*(1-p[coin])
  for face in 1..n:
    if face>n-face:
      result+=dp[face][n]


      
  

  

  
echo solve()