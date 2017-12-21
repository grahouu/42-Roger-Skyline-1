cat /etc/passwd | sed 's/:/ /g' | awk '{print Login= , UID= , Path= }'
