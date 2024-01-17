# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubeflex < Formula
  desc ""
  homepage "https://github.com/kubestellar/kubeflex"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.4.0/kubeflex_0.4.0_darwin_arm64.tar.gz"
      sha256 "52db50b989a680a40573226ac3bc2ac488306d3e57ff54fc5f8c705cdf7c0cb5"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.4.0/kubeflex_0.4.0_darwin_amd64.tar.gz"
      sha256 "fca1bc3c6ab9582cc8e7ed52fadbb69b34ba398a7e4371351aa4a6948940cdc9"

      def install
        bin.install "bin/kflex"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.4.0/kubeflex_0.4.0_linux_arm64.tar.gz"
      sha256 "3efa5e085fcac18a5cd59083bba6d882911d2a4d3ea8176f182de41d24854c65"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.4.0/kubeflex_0.4.0_linux_amd64.tar.gz"
      sha256 "2f0fae7df70d4535260ec5dce6e21874011d2047b664fbd814f0f08c545784a7"

      def install
        bin.install "bin/kflex"
      end
    end
  end
end
