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
ある頂点が子を二つ以上持つとき、自分を白、黒で塗った場合に子孫が取りうるパターンの個数を掛けたものを足したものがパターン数になる
"""

proc solve():int{.discardable.}=
  var
    n = scan()
    edges = newseqwith(n,newseq[int]())
    t = newseqwith(n,true)
    memo = initTable[(int,int),int]()
    md = 10^9+7
  
  for i in 0..<n-1:
    var
      (a,b) = (scan()-1,scan()-1)
    edges[a].add(b)
    edges[b].add(a)


  proc dfs(parent:int,p:int,color:int):int=
    # 頂点
    # 親の色
    if memo.haskey((p,color)):
      return memo[(p,color)]
    if edges[p].len==0:
      if color==1:
        return 1
      else:
        return 2
    else:
      var
        res1 = 1
        res2 = 0
      
      for nxt in edges[p]:
        if nxt != parent:
          res1*=dfs(p,nxt,0)
          res1.mod=md
      if color != 1:
        res2 = 1
        for nxt in edges[p]:
          if nxt != parent:
            res2*=dfs(p,nxt,1)
            res2.mod=md
      result = res1+res2
      result.mod=md
      memo[(p,color)]=result
  
  return dfs(-1,0,-1)







  

  
echo solve()