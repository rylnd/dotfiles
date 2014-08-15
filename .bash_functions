turnips() {
  args=(${@:-'*'})
  args=("${args[@]/#/-o -iname }")
  args="${args[@]/%/.feature}"
  args=${args/#-o /}

  eval "find ./spec/acceptance $args"
}

turnip() {
  files=$(turnips $@ | tr '\n' ' ')
  echo "rspec $files"
  rspec $files
}

jsm() {
  args=${@:-'.'}
  command="$(find . -type f -name jasmine-node) --coffee --verbose"

  $command $args
}

md() {
  cd ~/ry/md/ > /dev/null
  ./markdown.sh $1
  cd - > /dev/null
}

newer_sha() {
  alias log_list='git log --format=%H'
  local branch="$(git rev-parse --abbrev-ref HEAD)"

  if [[ "$(log_list | grep -e "^$1" -e "^$2" | wc -l)" -eq 2 ]]; then
    echo "$(log_list | grep -m1 "^$1\|^$2")"
    return 0
  else
    echo "couldn't find both $1 and $2 on branch $branch"
    return 1
  fi
}

older_sha() {
  local parent="$(git merge-base $1 $2)"

  if echo "$parent" | grep -q "^$1\|^$2"; then
    echo $parent
    return 0
  else
    echo "could not compare $1 and $2"
    return 1
  fi
}
