# Get the current git branch, if there is one
parse_git_branch() {
  \git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) of"
  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "nothing to commit" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}

prompt_func() {
  previous_return_value=$?;
  prompt="${TITLEBAR}${LIGHT_GRAY}${MYPS}${YELLOW}$(parse_git_branch)${COLOR_NONE}"
  if [[ $previous_return_value -eq 0 ]]; then
    PS1="${GREEN}➜ ${COLOR_NONE}${prompt}${GREEN} \$${COLOR_NONE} "
  else
    PS1="${RED}➜ ${COLOR_NONE}${prompt}${RED} \$${COLOR_NONE} "
  fi
}

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

dcsh() {
  local container_id="$(docker ps | grep "$1_web" | cut -d\  -f1)"
  if [[ -z "$container_id" ]]; then
    container_id="$(docker ps | grep "$1" | cut -d\  -f1)"
  fi

  docker exec -it $container_id bash
}

dreddd() {
  local port="${1:-3030}"

  dredd ./apiary.apib "http://localhost:${port}"
}

gh() {
  local remote="${1:-origin}"
  open "$(
    git config --get remote.${remote}.url |
    sed 's|:|/|g' |
    sed 's|git@|https://|g' |
    sed 's|\.git||g'
  )"
}

setup_pr_fetching() {
  local remote="${1:-origin}"
  git config --add remote.${remote}.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*'
}

multifile () {
  local filename=$(basename "$1")
  local ext="${filename##*.}"
  filename="${filename%.*}"

  for((i=0;i<201;i++)); do
    echo "Copying $1 to $filename$i.$ext"
    cp "$1" "$filename$i.$ext"
  done
}

mopen() {
  local url="$1"
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="$url"
}

jdiff() {
  local branch="${1:-develop}"
  local common_parent="$(git merge-base ${branch} HEAD)"
  git diff-tree --no-commit-id --name-only -r "${common_parent}" HEAD
}

gdiff() {
  local branch="${1:-develop}"
  local common_parent="$(git merge-base ${branch} HEAD)"
  git diff "${common_parent}" HEAD
}

comicize() {
  local series_name="$1"
  [ -z "$series_name" ] && echo "error: please provide the series name" && return 1

  for folder in */; do
    local comic_number="$(echo "$folder" | tr -dc '0-9')"
    local comic_name="${series_name} #${comic_number}"

    echo "processing $folder..."
    (
      cd "$folder"
      for image in *.jpg; do
        local image_number="${image%.*}"
        cwebp "$image" -o "${image_number}.webp" -quiet
      done

      zip "${comic_name}.cbz" *.webp -q \
      && rm *.webp \
      && echo "generated ${comic_name}.cbz"
    )
  done
}
