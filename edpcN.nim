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
[left,right)の区間を合成するとき、[left,mid), [mid,right)の二つの区間を先に合成して、最後にこの二つの区間を合成する操作になる。
ので、midとしてleft+1..right-1をすべて試してコストが最小になる分け方をする。
"""

proc solve():int{.discardable.}=
  var
    n = scan()
    a = newseqwith(n,scan())
    ca = newseqwith(n+1,0)
    memo = newseqwith(n+1,newseqwith(n+1,-1))
  for i in 0..<n:
    ca[i+1]=ca[i]+a[i]
  
  proc dfs(left,right:int):int=
    if memo[left][right]>=0:
      return memo[left][right]
    if left+1==right:
      return 0
    
    result = int.high.div(2) 
    for mid in left+1..<right:
      result.min=dfs(left,mid)+dfs(mid,right) + ca[right] - ca[left]
    memo[left][right]=result
  return dfs(0,n)


  

  
echo solve()