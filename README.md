# Inspector Gadgit

[![Code Climate](https://codeclimate.com/github/mguterl/inspector_gadgit.png)](https://codeclimate.com/github/mguterl/inspector_gadgit)

This is a gem for inspecting git commits messages and ensuring that they are well formed.

## Installation

Add this line to your application's Gemfile:

    gem 'inspector_gadgit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inspector_gadgit

## Usage

### Outside of a repository

    inspector_gadgit /path/to/repo

    inspector_gadgit /path/to/repo a1s2d3f4

### Within a repository

    inspector_gadgit a1s2d3f4 # => report on a single commit

## Smells detected

* Summary longer than 50 characters
* Any lines longer than 72 characters
* Period at the end of the summary
* Non-imperative "Fixes bug" or "Fixed bug" rather than "Fix bug"
* Summary not started with a capital letter
* No blank line after summary
* Pivotal issue number in summary

## References

* http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

## TODO

* You should be able to clone the project and run the specs, currently the repository inside of spec/fixtures/repository is causing problems.
* Add bin/ files so that you can actually run this stuff.
* Figure out what the output should look like
