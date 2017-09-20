cd /home/kristo4/Documents/
find * -mtime +7 -exec zip deflate.zip * {} \;
echo Done
