cd `dirname $0`
mkdir gifoutput
convert *.gif -coalesce ./gifoutput/gifoutput.png
