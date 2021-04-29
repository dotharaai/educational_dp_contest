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
残り要素の左index,右indexを保持してメモ化再帰を行う
ターンは交互に回ってくるので再帰関数の締めくくりを引き算にすればいい
"""

proc solve():int=
  var
    n = scan()
    a = newseqwith(n,scan())
    memo = initTable[(int,int),int]()
  
  proc dfs(l,r:int):int=
    if memo.haskey((l,r)):
      return memo[(l,r)]
    if l==r:
      return a[l]
    else:
      result = max(a[l]-dfs(l+1,r),a[r]-dfs(l,r-1))
      memo[(l,r)]=result
      return result
  return dfs(0,n-1)


  

  
echo solve()