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
https://algo-logic.info/tree-dp/#toc_id_2
https://qiita.com/keymoon/items/2a52f1b0fb7ef67fb89e
"""

proc solve():int{.discardable.}=
  var
    n = scan()
    m = scan()
    edges = newseqwith(n,newseq[int]())
    dp:seq[seq[int]] = newseq[seq[int]](n)
    cumL:seq[seq[int]] = newseq[seq[int]](n)
    cumR:seq[seq[int]] = newseq[seq[int]](n)
    # memo[(par,p)]:=pを頂点とする部分木にparから入射したときの値
    memo = initTable[(int,int),int]()
    

    
  for i in 0..<n-1:
    var
      (a,b)=(scan()-1,scan()-1)
      #(a,b)=(i,i+1)
    edges[a].add(b)
    edges[b].add(a)
  for i in 0..<n:
    dp[i] = (newseqwith(edges[i].len,0))
    cumL[i] = (newseqwith(edges[i].len+1,1))
    cumR[i] = (newseqwith(edges[i].len+1,1))


  
  proc dfs(par,p:int):int=
    result = 1
    for idx in 0..<edges[p].len:
      var nxt = edges[p][idx]
      if par!=nxt:
        dp[p][idx]=dfs(p,nxt)
    for idx in 0..<edges[p].len:
      cumL[p][idx+1] = (cumL[p][idx]*(dp[p][idx]+1)).mod(m)
    for idx in countdown(edges[p].len-1,0):
      cumR[p][idx] = (cumR[p][idx+1]*(dp[p][idx]+1)).mod(m)
    return cumR[p][0]
  
  var
    ans = newseqwith(n,0)
  proc bfs(par,parV,p:int)=
    #echo fmt"ans[{p}] = {cumR[p][0]} * {parV+1}"
    # 親を頂点とする部分木*自分を頂点とする部分木
    ans[p]=(cumR[p][0]*(parV+1)).mod(m)
    for idx, nxt in edges[p]:
      if nxt==par:
        continue
      else:
        bfs(p,((cumL[p][idx]*cumR[p][idx+1]).mod(m)*(parV+1)).mod(m),nxt)
  discard dfs(-1,0)
  #echo "dfs fin"
  bfs(-1,0,0)
  echo ans.join("\n")

const test = """
7 100
1 2
1 3
1 4
3 5
3 6
3 7
"""

solve()

