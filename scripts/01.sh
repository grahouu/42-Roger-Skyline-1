cat /etc/passwd | sed 's/:/ /g' | awk '{print "Login=" $1, "UID=" $3, "Path=" $6}'
