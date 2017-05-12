source $SHPEC_ROOT/../setup/pair

describe "setup_pair"
  ## SETUP
  backup_files() {
    [[ -e $HOME/.bash_profile ]] && back_bash=true
    [[ -e $HOME/.pair ]] && back_pair=true

    [[ -n "$back_bash" ]] && mv $HOME/.bash_profile{,.bak}
    [[ -n "$back_pair" ]] && mv $HOME/.pair{,.bak}
    touch $HOME/.bash_profile
  }
  backup_files
  pair_hook="$(pair_hook)"

  it "adds to .bash_profile"
    modify_dotfile &> /dev/null
    added_lines="$(cat $HOME/.bash_profile)"
    assert equal "$added_lines" "$pair_hook"
  end

  it "is idempotent"
    modify_dotfile &> /dev/null
    added_lines="$(cat $HOME/.bash_profile)"
    assert equal "$added_lines" "$pair_hook"
  end

  it "symlinks from the repo"
    symlink_pair
    assert test "[[ -L $HOME/.pair ]]"
  end

  it "symlinks to an absolute path"
    symlink_pair &> /dev/null

    # get absolute path to pair
    pushd $(dirname $SHPEC_ROOT) &> /dev/null
    expected_path="$(pwd -P)/scripts/pair"
    popd &> /dev/null

    assert symlink "$HOME/.pair" "$expected_path"
  end

  ## TEARDOWN
  [[ -n "$back_bash" ]] && mv $HOME/.bash_profile{.bak,} || rm $HOME/.bash_profile
  [[ -n "$back_pair" ]] && mv $HOME/.pair{.bak,} || rm $HOME/.pair
end
