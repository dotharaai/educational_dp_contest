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
解法：
入射辺のない頂点から深さ優先探索を行う。
そのとき、各頂点について、自身を根としたときの最長辺の長さをメモしておく。
"""


proc solve():int{.discardable.}=
  var
    n = scan()
    m = scan()
    es = newseqwith(n,newseq[int]())
    bc = newseqwith(n,newseq[int]())
    memo = newseqwith(n,-1)
  for i in 0..<m:
    var
      (s,t)=(scan()-1,scan()-1)
    es[s].add(t)
    bc[t].add(s)

  

  proc dfs(p:int):int=
    if es[p].len==0:
      return 0
    else:
      if memo[p] != -1:
        return memo[p]
      else:
        for nxt in es[p]:
          result.max=dfs(nxt)+1
        memo[p]=result
        return result

  
  for r in 0..<n:
    if bc[r].len==0:
      result.max=dfs(r)
  



  
  

  

  
echo solve()