function posix-source -d "Source env files"
  set -l options \
    (fish_opt --short=h --long=help) \
    (fish_opt --short=p --long=print) \
    (fish_opt --short=n --long=no-interpret)
  argparse $options -- $argv

  if set -q _flag_help
    set fn (status function)
    echo \
      "USAGE:

      	$fn ( --help | -h )
      		This help message

      	$fn [OPTIONS] FILE ...
      		Source one or more env files


      OPTIONS

      	-p, --print
      		Print the commands to STDOUT

      	-n, --no-interpret
      		By default, variables in env files will be interpreted. Pass
      		this argument to interpret dollar signs as literal characters." \
    | string replace --all --regex '(^ +)' ''
    return 0
  end


  for i in (cat $argv)
    set arr (string split -m1 = $i)

    set -q _flag_print
    and echo set -gx $arr[1] $arr[2]\;
    and continue

    set -q _flag_no_interpret
    and set -gx $arr[1] $arr[2]
    or eval "set -gx $arr[1] $arr[2]"
  end
end
