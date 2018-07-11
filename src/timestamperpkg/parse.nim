import 
    os, strutils, 
    parsecsv,
    times,
    "./types", 
    "./errors",
    "./iterators",
    "./syschecks"

proc checkArguments*()
proc storeRecording(recording: tuple)
proc listToday*()

proc checkArguments*() =
    var largs: seq[string] = @[]

    for arg in numOf(paramCount()):
        if arg == 0 or arg == 1: 
            continue
        else: 
            add(largs, paramStr(arg))
    
    if largs.len() < 4:
        printError("Invalid number of arguments!")
    elif largs.len() == 4: 
        add(largs, "-")

    storeRecording((name: largs[0], file: largs[1], start: largs[2], finish: largs[3], notes: largs[4]))

proc storeRecording(recording: tuple) = 
    var headers = "Game,File,Start,End,Notes"
    var newRow = "\n$1,$2,$3,$4,$5" % [recording[0], recording[1], recording[2], recording[3], recording[4]]
    
    var parser: CsvParser
    
    if dayFileExists():
        try: 
            parser.open(dayFile)
            parser.readHeaderRow()

            # write new headers if old ones don't exist. very destructive
            if parser.headers.len() == 0: writeFile(dayFile, headers) 
            else: discard

            var writer = open(dayFile, fmAppend)
            writer.write(newRow)
            writer.close()
        except IOError:
            printError("Couldn't write to file '$1'! Do you have the correct permissions?" % [dayFile])
        except:
            echo "Unkown exception!"
            raise
        finally:
            parser.close()
    else:
        writeFile(dayFile, headers & newRow)

proc listToday*() =
    var parser: CsvParser

    if dayFileExists():
        try:
            parser.open(dayFile)
            parser.readHeaderRow()
            while parser.readRow():
                echo "$1, $2, $3, $4, $5" % 
                    [parser.rowEntry(parser.headers[0]), 
                    parser.rowEntry(parser.headers[1]), 
                    parser.rowEntry(parser.headers[2]), 
                    parser.rowEntry(parser.headers[3]),
                    parser.rowEntry(parser.headers[4])]
        except IOError:
            printError("Couldn't open file '$1'! Do you have the correct permissions?" % [dayFile])
        except:
            echo "Unknown exception!"
            raise
        finally:
            parser.close()
    else:
        printError("Couldn't open file '$1'! Does this file exist?" % [dayFile])
