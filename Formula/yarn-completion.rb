# Formula/yarn-completion.rb
class YarnCompletion < Formula
  desc "Bash and Zsh completion for Yarn 4+"
  homepage "https://github.com/ursine-code/yarn-shell-completion"
  url "https://github.com/ursine-code/yarn-shell-completion/archive/v1.0.0.tar.gz"
  sha256 "d725f54939e76bc8084425df1514a975bc5e981b84cf4c91df8f4234676b465"
  license "MIT"
  
  def install
    bash_completion.install "completions/yarn" => "yarn"
    zsh_completion.install "completions/_yarn" => "_yarn"
  end
  
  test do
    assert_match "yarn", shell_output("bash -c 'source #{bash_completion}/yarn'")
  end
end