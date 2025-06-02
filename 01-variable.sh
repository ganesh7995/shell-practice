echo "number of variables passed:$#"
echo "script name:$0"
echo "present working directory:$PWD"
echo "which user running the script:$USER"
echo "PID of the current script is :$$"

sleep 15 &

echo "PID of the last command running in background":$!