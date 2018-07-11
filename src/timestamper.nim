import
  os, strutils,
  "timestamperpkg/errors",
  "timestamperpkg/parse"

const pkg* = (name: "Timestamper", version: "0.1.0", flavor: "Dio!")
const help = """
$1 $2 ($3)

$1 stores and keeps track of your recording sessions, then converts them to CSV.

Usage:
  $4 (command) [...]

Commands:
  (help): Shows this text!
  (list|ls): Lists the current day's recordings. 
  (new|add) [name] [start] [end] [notes]: Creates a new recording sheet.

Examples:
  $4 new "Fighting EX Layer" 02:21 35:49
  $4 new "Fallout 4" 03:15 45:01 "Paused from 15:30-17:00"
  $4 add "League of Legends" - - "Game 1: 24:30, Game 2: 58:21"
  $4 add "Voice over session" - 15:11 "Best take @ 08:21"
""" % [pkg.name, pkg.version, pkg.flavor, pkg.name.toLowerAscii()]

proc main() =
  if paramCount() <= 0:
    echo help; quit(-1)

  case normalize(paramStr(1)):
    of "help":
      echo help; quit(0)
    of "new", "add":
      checkArguments() 
    of "list", "ls":
      listToday()
    else:
      printError("Invalid argument '$1'" % [paramStr(1)])

main()
