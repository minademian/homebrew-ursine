# Formula/yarn-completion.rb
class YarnShellCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "17ed8c85c55fc362dbf5f0930347004f9a18645a9bdc342f1e4520855da6e858"
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