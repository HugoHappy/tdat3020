find ./ -name "*.jpg" ! -wholename "*/jpg/*" -exec sh flyttjpg.sh {} \;
