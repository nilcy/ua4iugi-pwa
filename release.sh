#!/bin/sh

GIT_PATH=/usr/bin/git

$GIT_PATH status
if [ $? != 0 ]; then
  exit 1
fi

tag=`date +%Y%m%d-%H%M%S`
$GIT_PATH flow release start $tag
$GIT_PATH log --oneline --decorate=short > CHANGELOG.md
$GIT_PATH add .; git commit -m "UP2DATE"; git push
$GIT_PATH flow release finish $tag

exit 0
