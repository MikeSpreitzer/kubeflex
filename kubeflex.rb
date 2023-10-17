# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubeflex < Formula
  desc ""
  homepage "https://github.com/kubestellar/kubeflex"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.2.2/kubeflex_0.2.2_darwin_arm64.tar.gz"
      sha256 "22f07eb823ea0318f32538d92ffbdb3439c38d88be3a0d14c5b5f248085d32db"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.2.2/kubeflex_0.2.2_darwin_amd64.tar.gz"
      sha256 "097dde0a509997d525ce0483ba63270e044bcc66699a1b3113dccbcd37e72705"

      def install
        bin.install "bin/kflex"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.2.2/kubeflex_0.2.2_linux_arm64.tar.gz"
      sha256 "5ed970c04b98030d1e6aa161f27592ec00232cfb0046cf61e9ac277d01f1747e"

      def install
        bin.install "bin/kflex"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kubestellar/kubeflex/releases/download/v0.2.2/kubeflex_0.2.2_linux_amd64.tar.gz"
      sha256 "afcb7eb6cda8f10725a30883d67fd1d637f4c56574ef4fb099c232be128502d2"

      def install
        bin.install "bin/kflex"
      end
    end
  end
end