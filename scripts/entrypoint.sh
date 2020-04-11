#!/bin/bash
set -e

if [[ -z "${SCHEDULE}" ]]; then
    organize run >> /var/log/organize/organize.log 2>&1
  else
    (crontab -l 2>/dev/null; echo "$SCHEDULE /usr/local/bin/organize run >> /var/log/organize/organize.log 2>&1") | crontab -
    service cron restart
    /bin/bash
fi