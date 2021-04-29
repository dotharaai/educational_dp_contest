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



const ans ="""

"""

proc solve():int{.discardable.}=
  var
    n = scan()
    k = scan()
    a = newseqwith(n,scan())
    md = 10^9+7
    dist = newseqwith(n,0)
    memo = newseqwith(n+1,newseqwith(k+1,-1))
  dist[n-1]=a[n-1]
  for i in countdown(n-2,0):
    dist[i]=dist[i+1]+a[i]
  dist.add(0)

  
  proc dfs(child:int,last:int):int=
    if memo[child][last]>=0:
      return memo[child][last]
    #echo child, ", ", last
    if child==n:
      return 1
    for i in 0..min(a[child],last):
      if (last-i)<=dist[child+1]:
        result+=dfs(child+1,last-i)
        result.mod=md
      memo[child][last]=result
  #return dfs(0,k)


  # 尺取り法解法

  var
    patterns = newseqwith(2,newseqwith(k+1,0))
  patterns[0][0]=1
  for child in 1..n:
    var
      cumsum = 0
      left = 0
      right = 0
    for candy in 0..k:
      right=candy
      cumsum+=patterns[(child+1).mod(2)][right]
      if right-left>a[child-1]:
        cumsum-=patterns[(child+1).mod(2)][left]
        left+=1
      cumsum=(cumsum.mod(md)+md).mod(md)
    
      patterns[child.mod(2)][candy] = cumsum
  return patterns[n.mod(2)][k]
    

discard
  """
  test
  4 1000
  1000 1000 1000 1000
  167668501

  """  

  
echo solve()