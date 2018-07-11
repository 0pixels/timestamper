iterator numOf*(n: int): int =
    var i = 0
    while i <= n: yield i; inc i