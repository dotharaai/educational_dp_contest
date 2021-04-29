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
1..kまでのGrundy数を求める。
pのgrundy数dp[p]は、p-a_i>=0を満たす全てのdp[p-a_i]のmexである。
これを更新していく。
10^5 * 100 = O(10^7)なので解ける
"""

proc solve():string{.discardable.}=
  var
    n = scan()
    k = scan()
    a = newseqwith(n,scan())
    dp = newseqwith(k+1,0)
    mexmax = 101
    mexes = newseqwith(k+1,newseqwith(mexmax+1,false))
  for i in 1..k:
    var j = 0
    while j<n and i-a[j]>=0:
      mexes[i][dp[i-a[j]]]=true
      j+=1
    for kk in 0..mexmax:
      if not mexes[i][kk]:
        dp[i]=kk
        break
  if dp[k]==0:
    return "Second"
  else:
    return "First"
  
  

  

  
echo solve()