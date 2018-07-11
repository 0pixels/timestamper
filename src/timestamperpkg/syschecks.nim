import
    os, ospaths, strutils, times

const homeDir = getHomeDir()
const storageDir* = "$1timestamper/" % [homeDir]
var dayFile* = "$1$2.csv" % [storageDir, getDateStr()]

proc storageDirExists*(): bool = 
    if dirExists(storageDir):
        return true
    else:
        createDir(storageDir)
    
proc dayFileExists*(): bool =
    if fileExists(dayFile):
        return true
    else:
        return false