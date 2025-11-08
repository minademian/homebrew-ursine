# Formula/yarn-completion.rb
class YarnShellCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "92a1e4f484ecbea1eceb2e0a6a9762aa6b0bba114694b1da0455f389dd9f189f"
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