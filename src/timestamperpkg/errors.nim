type
    ParseError* = object of Exception
    LoadError* =  object of Exception

proc printError*(error: string) =
    echo "Error: ", error
    quit(-1)