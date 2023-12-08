# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubeflex < Formula
  desc ""
  homepage "https://github.com/kubestellar/kubeflex"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.3.3/kubeflex_0.3.3_darwin_arm64.tar.gz"
      sha256 "866ac8d3b8038edec88391e75cd12f7906f39230b412d61073f01deabb8e9db4"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.3.3/kubeflex_0.3.3_darwin_amd64.tar.gz"
      sha256 "1830cbed9f7c3756a14ec7ae854038998c5bddf7dad1e57cf9f8fbc64091b7a6"

      def install
        bin.install "bin/kflex"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.3.3/kubeflex_0.3.3_linux_arm64.tar.gz"
      sha256 "1443fa6722a7a38beb7c9e945198dcc842b88927c8e731907530c2b1f1d3976d"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.3.3/kubeflex_0.3.3_linux_amd64.tar.gz"
      sha256 "c5a1b45192c81301dae3d33b94664f3a3ea315c53f8e122231ce3fb25e6a752a"

      def install
        bin.install "bin/kflex"
      end
    end
  end
end
