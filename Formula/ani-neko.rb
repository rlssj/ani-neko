class AniNeko < Formula
  desc "Ver anime en español desde la terminal (AnimeAV1)"
  homepage "https://github.com/rlssj/ani-neko"
  url "https://github.com/rlssj/ani-neko.git", tag: "v4.0.0"
  license "MIT"
  head "https://github.com/rlssj/ani-neko.git", branch: "main"

  depends_on "fzf"
  depends_on "jq"

  uses_from_macos "curl"
  uses_from_macos "python"

  on_linux do
    depends_on "mpv"
  end

  def install
    bin.install "ani-neko"
  end

  def caveats
    <<~EOS
      En macOS ani-neko reproduce con IINA:
        brew install --cask iina
      (si no está IINA usa mpv; puedes forzarlo con ANI_NEKO_PLAYER=mpv)
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ani-neko --version")
  end
end
