

proc readfile(filename : string) : seq[string] =
    let inf = open(filename)
    defer: inf.close()
    var line : string
    while readline(inf,line):
        result.add(line)
    
proc cvt_seq_to_string(s : seq[string]) : string =
    for v in s:
        result = result & v

proc part1(s : string) : int =
    result = 0
    for c in s:
        if c == '(':
            result = result + 1
        elif c == ')':
            result = result - 1

proc dopart1() = 
    let s = readfile("day1_data.txt")
    let t = cvt_seq_to_string(s)
    echo(part1(t))

proc part2(s: string) : int =
    result = 0
    var pos = 1
    for c in s:
        if c == '(':
            result = result + 1
        elif c == ')':
            result = result - 1
        if result == -1:
            return pos
        pos = pos + 1

proc dopart2() =
    let s =readfile("day1_data.txt")
    let t = cvt_seq_to_string(s)
    echo(part2(t))

dopart1()
dopart2()