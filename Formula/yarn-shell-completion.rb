# Formula/yarn-completion.rb
class YarnShellCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "f8f18c6b704bdf8be744cf11e02e264b5484c81c9dd3da423345748cfe54fd6b"
  license "MIT"
  
  def install
    bash_completion.install "completions/yarn" => "yarn"
    zsh_completion.install "completions/_yarn" => "_yarn"
  end
  
  test do
    system "bash", "-c", "source #{bash_completion}/yarn"
    system "zsh", "-c", "autoload -U +X bashcompinit && bashcompinit && source #{zsh_completion}/_yarn"
  end
end