#!/bin/bash

# Avoid “Another git process seems to be running in this repository” error
rm -f /root/git-wordpress/.git/index.lock
rm -f /root/git-dollyskettle.com/.git/index.lock

if [ "$WORDPRESS_ENVIRONMENT" = "publish" ]; then

  # Run a script, without waiting for it to finish
  # https://unix.stackexchange.com/questions/86247/what-does-ampersand-mean-at-the-end-of-a-shell-script-line#answer-86253
  bash /usr/local/bin/update-content.sh &

fi

# Hand off to the CMD
exec "$@"