# Formula/yarn-completion.rb
class YarnShellCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/v1.0.0.tar.gz"
  sha256 "0d13ceb6ebeb165032c930581261a07acf9ae368b0140cea5077e44ec54c5591"
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