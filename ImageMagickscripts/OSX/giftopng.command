chmod +x giftopng.command
mkdir gifoutput
chmod +w ./gifoutput
convert *.gif -coalesce ./gifoutput/gifoutput.png
