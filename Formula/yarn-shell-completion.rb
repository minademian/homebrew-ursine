# Formula/yarn-completion.rb
class YarnShellCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "52c7fbcd4a43a3fd1da3734a31d6831ed5ff1fe469dd7ffc2c0b473f55c80883"
  license "MIT"
  
  def install
    bash_completion.install "completions/yarn" => "yarn"
    zsh_completion.install "completions/_yarn" => "_yarn"
  end
  
  test do
    assert_match "yarn", shell_output("bash -c 'source #{bash_completion}/yarn'")
    assert_match "_yarn", shell_output("zsh -c 'source #{zsh_completion}/_yarn'")
  end
end