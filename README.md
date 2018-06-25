# posix-source

Source POSIX-style env files in fish

## Install

With [fisherman]

```
fisher TSFoster/posix-source
```

## Usage

```fish
posix-source ( -h | --help ) # Print help to STDOUT
posix-source FILE ... # Read file(s) and set exported variables
posix-source (-n | --no-interpret) FILE ... # Read file(s) and set exported variables, treating variables as literal strings
posix-source (-p | --print) FILE ... # Read file(s) and print fish commands to STDOUT
```

[fisherman]: https://github.com/fisherman/fisherman
