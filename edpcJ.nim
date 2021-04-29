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
メモ化再帰解：
寿司1つの皿、寿司2つの皿、寿司3つの皿の個数をそれぞれone,two,threeとする。
寿司1つの皿から寿司を食べる確率はone/nであり、寿司1つの皿から寿司を食べるまでの期待値はn/one
...
遷移するのに必要なダイスロールの回数の期待値が判ったので、遷移コストとして再帰を行う

"""


proc solve():float{.discardable.}=
  var
    n = scan()
    a = newseqwith(n,scan())
    three = a.count(3)
    two = a.count(2)
    one = a.count(1)
    memo = initTable[(int,int,int),float]()
  memo[(0,0,0)]=0
  #memo[(0,0,1)]=n.float
  #memo[(0,1,0)]=n.float
  #memo[(1,0,0)]=n.float
  proc dfs(three,two,one:int):float=
    echo fmt"{three}, {two}, {one}"
    if memo.hasKey((three,two,one)):
      return memo[(three,two,one)]
    if three!=0:
      result+=dfs(three-1,two+1,one)*three.float/n.float
    if two!=0:
      result+=dfs(three,two-1,one+1)*two.float/n.float
    if one!=0:
      result+=dfs(three,two,one-1)+one.float/n.float
    result+=n.float
    result = result/(three+two+one).float
    memo[(three,two,one)] = result
  return dfs(three,two,one)
  
  

  

  
echo solve()