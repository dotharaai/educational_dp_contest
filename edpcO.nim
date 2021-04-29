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
https://scrapbox.io/esaka-sandbox/Educational_DP_Contest_%2F_DP_%E3%81%BE%E3%81%A8%E3%82%81%E3%82%B3%E3%83%B3%E3%83%86%E3%82%B9%E3%83%88_-_O_-_Matching
"""



proc solve():int{.discardable.}=
  var
    n = scan()
    a = newseqwith(n,newseqwith(n,scan()))
    md = 10^9+7
    dp = newseqwith(n+1,newseqwith(2^n,0))
    female:string
  dp[0][0]=1
  
  for i in 1..n:
    female = "0".repeat(n)
    for f in 0..<i:
      female[n-f-1]='1'
    var
      fb = female.parseBinInt()

    for f in 0..<n:
      if (fb and 2^f)>0:
        if a[i-1][f]==1:
          dp[i][fb]+=dp[i-1][fb-2^f]
          dp[i][fb].mod=md
        

    while female.nextPermutation:
      fb = female.parseBinInt()
      for f in 0..<n:
        if (fb and 2^f)>0:
          if a[i-1][f]==1:
            dp[i][fb]+=dp[i-1][fb-2^f]
            dp[i][fb].mod=md
  return dp[n][^1]
      




          




  

  
echo solve()