# Formula/yarn-completion.rb
class YarnShellCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "9e0e5422394071cec29ed257ce3da49f1f7028a6ed6f55f24a1aafd5b5784048"
  license "MIT"
  bottle :unneeded

  def install
    bash_completion.install "completions/yarn" => "yarn"
    zsh_completion.install "completions/_yarn" => "_yarn"
  end
  
  test do
    system "bash", "-c", "source #{bash_completion}/yarn"
    system "zsh", "-c", "autoload -U +X bashcompinit && bashcompinit && source #{zsh_completion}/_yarn"
  end
end