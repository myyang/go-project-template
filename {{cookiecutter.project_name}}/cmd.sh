#!/bin/sh

__ScriptVersion="1"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
usage ()
{
    echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hv" opt
do
  case $opt in

    h|help     )  usage; exit 0   ;;

    v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

    * )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done

if [[ "$1" == "" ]]; then
    echo "Missing position parameter: COMMAND" 
    usage
    exit 1
fi

PROJ="{{cookiecutter.project_name}}"
case $1 in
    help )
        usage; exit 0 ;;
    build )
        go build -o $PROJ.out .
        exit 0;;
    debug )
        go test -c -gcflags "-N -l"
        exit 0;;
    test )
        make debug && ./$PROJ.test -test.v
        exit 0;;
    bench )
        make debug && ./$PROJ.test -test.bench .
        exit 0;;
    benchalloc )
        make debug && GODEBUG=allocfreetrace=1 ./$PROJ.test -test.run=None -test.bench . 2>trace.log
        exit 0;;
    coverage )
        go test -coverprofile cover.out && go tool cover -html cover.out
        exit 0;;
    * )
        echo "Unknow command: $1" 
        usage
        exit 1;;
esac
