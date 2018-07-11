# Timestamper

Timestamper is a lightweight CLI to store and keep track of recording sessions. Once stored, it converts the data to CSV format (chronologically), which can then be used in programs like Google Sheets, Microsoft Excel, Libre Office, and more.  

Timestamper has only been tested on a select few \*nix-based operating systems *(Manjaro, Arch, Ubuntu, Debian)*. It should work fine on Mac OS X, but it's not guaranteed. Windows compatibility is planned for the future.

## Instructions

If you do not have [Nim](https://nim-lang.org) installed, you can [download a compiled version of Timstamper](https://github.com/0pixels/timestamper/releases).

If you'd like to compile it yourself: Clone this repository, `cd` into its directory, and run `nimble build`.

## Usage

Timestamper creates a new directory inside your home directory called `timestamper`. This is where all of the .csv files will be stored.

* `help`: Displays a help screen with commands and example uses.
* `list|ls`: Lists all recording sessions for the current day.
* `new|add`: Creates a new recording session for the current day.

The command `new|add` takes the following fields:  

1. Name - The name of the current recording session  
2. File - The name of the file for the recording session  
3. Start - The start time of the session  
4. End - The end time of the session  
5. Notes - Notes of the recording session (optional)  

**Examples:**  

1. `timestamper new "Detroit: Become Human" detroit-rec1.wav 02:04 01:33:51 "Pause @ 32:10-38:09"`  
2. `timestamper add "Deadspace 2" ds2-20.wav - - -`

*Note: Any unused fields should be replaced with the '-' character* 