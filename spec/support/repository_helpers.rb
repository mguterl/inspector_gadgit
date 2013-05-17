TEST_REPOSITORY_PATH = File.join(File.dirname(__FILE__), '..', 'fixtures', 'repository')
CLEAN_REPOSITORY_SHA = '890c8096e387801a2d9b9bfdbb1ce50c29f7549e'

module RepositoryHelpers
  def create_commit(message)
    extract_sha repository_command("git commit --allow-empty -m \"#{message}\"")
  end

  def extract_sha(shell_output)
    if shell_output =~ /\[\w+ (.*)\]/
      $1
    else
      raise RuntimeError, "could not extract SHA from #{shell_output}"
    end
  end

  def reset_repository
    repository_command "git reset --hard #{CLEAN_REPOSITORY_SHA}"
  end

  def repository_command(command)
    within_repository do
      `#{command}`
    end
  end

  def within_repository
    Dir.chdir(TEST_REPOSITORY_PATH) do
      yield
    end
  end
end
