#! /.bin/bash
LOGFILE="system-report.txt"
{
echo ""
echo "Hostname:"
hostname
echo ""
echo "Operating System:"
cat /etc/os-release
echo ""
echo "Kernel Version:"
uname -r
echo ""
echo "CPU Information:"
lscpu
echo ""
echo "Memory Information:"
free -h
echo ""
echo "Network Interfaces (IP and MAC):"
ip addr show
echo ""
echo "Filesystem Usage and Types:"
df -hT
echo ""
echo "Last Five Log Entries Containing Error:"
if [ -r /var/log/syslog ]; then
  grep -i "error" /var/log/syslog | tail -n 5
elif command -v journalctl1 >/dev/null 2>&1; then
  journalctl --no-pager 2>/dev/null |grep -i "error" | tail -n 5
else
  echo "System logs unavailable."
  fi
  echo ""
  echo "===== EXTRA CREDIT INFORMATION ====="
  echo ""
  echo "Current Date and Time;"
  date
  echo ""
  echo "Logged-in Users:"
  who
  echo ""
  echo "System Architecture:"
  uname -m
  echo ""
  echo "Default Gateway:"
  ip route show default
  echo ""
  echo "System Load Average:"
  cat /proc/loadavg
  echo ""
  echo "===== END REPORT ====="
  } | tee "$LOGFILE"
  echo "Report saved to $LOGFILE"
