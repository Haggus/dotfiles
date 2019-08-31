#!/bin/bash

set -e

check_email() {
  personal=$(du -a ~/mail/personal/Inbox/new/* 2>/dev/null | wc -l)
  company=$(du -a ~/mail/company/Inbox/new/* 2>/dev/null | wc -l)
  work=$(du -a ~/mail/work/Inbox/new/* 2>/dev/null | wc -l)

  # Check email count. If it's 0, do not display anything
  if [ $(( personal + company + work)) != 0 ]; then
    echo "Mail: "$personal"|"$company"|"$work
  fi
}

check_email
