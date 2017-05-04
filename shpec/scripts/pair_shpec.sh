source $SHPEC_ROOT/../scripts/pair

describe "pair"
  describe "variable sanitation"
    it "doesn't leak variables outside the function"
      (set -o posix; set) > /tmp/vars.before
      pair rylnd &> /dev/null
      (set -o posix; set) > /tmp/vars.after
      extra_vars=$(diff /tmp/vars.{before,after} --ignore-matching-lines=GIT_AUTHOR)
      rm /tmp/vars.{before,after}
      assert blank "$extra_vars"
    end
  end

  describe "exit codes"
    it "returns 0 when unsetting"
      pair -u &> /dev/null
      assert equal "$?" "0"
    end

    it "returns 0 when printing help"
      pair -h &> /dev/null
      assert equal "$?" "0"
    end

    it "returns 0 when printing config"
      pair &> /dev/null
      assert equal "$?" "0"
    end

    it "returns 0 when all authors are found"
      pair rylnd &> /dev/null
      assert equal "$?" "0"
    end

    it "returns nonzero if not all authors are found"
      pair rylnd _bad_user_ &> /dev/null
      assert equal "$?" "1"
    end
  end

  describe "setting of git environment variables"
    it "sets \$GIT_AUTHOR_NAME"
      pair rylnd &> /dev/null
      assert equal "$GIT_AUTHOR_NAME" "Ryland Herrick"
    end

    it "sets \$GIT_AUTHOR_EMAIL"
      pair rylnd &> /dev/null
      assert grep "$GIT_AUTHOR_EMAIL" "rylnd"
    end

    it "unsets \$GIT_AUTHOR_NAME"
      pair -u &> /dev/null
      assert blank "$GIT_AUTHOR_NAME"
    end

    it "unsets \$GIT_AUTHOR_EMAIL"
      pair -u &> /dev/null
      assert blank "$GIT_AUTHOR_EMAIL"
    end

    it "uses pair@adorable.io in the email"
      pair rylnd &> /dev/null
      assert grep "$GIT_AUTHOR_EMAIL" "pair.*adorable\.io"
    end

    it "sets multiple usernames in the email"
      pair rylnd bendycode &> /dev/null
      assert grep "$GIT_AUTHOR_EMAIL" "rylnd"
      assert grep "$GIT_AUTHOR_EMAIL" "bendycode"
    end

    it "sorts multiple usernames in the email alphabetically"
      pair rylnd bendycode &> /dev/null
      assert grep "$GIT_AUTHOR_EMAIL" "bendycode.rylnd@"
    end

    it "sets multiple names for the author"
      pair rylnd bendycode &> /dev/null
      assert grep "$GIT_AUTHOR_NAME" "Ryland Herrick"
      assert grep "$GIT_AUTHOR_NAME" "Stephen Anderson"
    end

    it "sorts author names alphabetically by username"
      pair rylnd bendycode &> /dev/null
      assert equal "$GIT_AUTHOR_NAME" "Stephen Anderson and Ryland Herrick"
    end

    it "correctly lists more than two authors WITH AN OXFORD COMMA"
      pair rylnd bendycode bigtiger &> /dev/null
      assert equal "$GIT_AUTHOR_NAME" "Stephen Anderson, Jim Remsik, and Ryland Herrick"
    end

  describe "hybrid mode"
    it "finds unknown users from github"
      pair rylnd tenderlove &> /dev/null
      assert equal "$?" "0"
      assert equal "$GIT_AUTHOR_NAME" "Ryland Herrick and Aaron Patterson"
    end

    describe "when offline"
      stub_command "curl"

      it "still works with local authors"
        pair rylnd &> /dev/null
        assert equal "$GIT_AUTHOR_NAME" "Ryland Herrick"
      end

      it "fails if offline and the user is unknown"
        pair rylnd tenderlove &> /dev/null
        assert equal "$?" "1"
      end

      unstub_command "curl"
    end
  end

  describe ".pairrc"
    it "doesn't rely on variables defined in the function"
      pair rylnd &> /dev/null
      source $HOME/.pairrc
      assert equal "$GIT_AUTHOR_NAME" "Ryland Herrick"
      assert grep "$GIT_AUTHOR_EMAIL" "rylnd"
    end
  end

  describe "option handling"
    describe "unknown options"
      it "fails"
        pair -g 2>&1 > /dev/null
        assert equal "$?" "1"
      end

      it "prints a helpful message"
        message=$(pair -g)
        assert equal "$message" "Unknown option: '-g'"
      end
    end

    describe "help message"
      it "prints usage and examples"
        message=$(pair -h)
        assert grep "$message" "Usage"
        assert grep "$message" "Examples"
      end
    end
  end

  it "alerts if not all authors are found"
    stub_command "curl" "cat shpec/fixtures/_bad_user_.json"

    message=$(pair rylnd _bad_user_)
    assert grep "$message" "No user found for GitHub username: _bad_user_"

    unstub_command "curl"
  end

  it "does nothing if it can't find all authors"
    stub_command "curl" "cat shpec/fixtures/_bad_user_.json"

    pair -u &> /dev/null
    pair rylnd _bad_user_ &> /dev/null
    assert blank "$GIT_AUTHOR_NAME"
    assert blank "$GIT_AUTHOR_EMAIL"

    unstub_command "curl"
  end

  it "falls back to username for nonlocal usernames that don't have a full name set on Github"
    stub_command "curl" "cat shpec/fixtures/github_user_no_full_name.json"

    message=$(pair rylnd no_full_name)
    assert grep "$message" "No author name found for GitHub username: no_full_name"

    unstub_command "curl"
  end

  ## TEARDOWN
  pair -u &> /dev/null
end
