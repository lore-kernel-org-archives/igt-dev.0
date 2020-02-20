Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F966E215
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 14:32:51 +0000 (UTC)
From: "Ramotowski, Maciej" <maciej.ramotowski@intel.com>
Date: Thu, 20 Feb 2020 14:32:49 +0000
Message-ID: <20200220143237.18855-1-maciej.ramotowski@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] Reduce Docker images size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Ramotowski, Maciej" <maciej.ramotowski@intel.com>, Oleg Vasilev <oleg.vasilev@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Oleg Vasilev <oleg.vasilev@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Maciej Ramotowski <maciej.ramotowski@intel.com>
---
 Dockerfile.build-debian         | 39 ++++++++----------
 Dockerfile.build-debian-arm64   | 68 +++++++++++++++-----------------
 Dockerfile.build-debian-armhf   | 67 +++++++++++++++----------------
 Dockerfile.build-debian-minimal | 44 ++++++++++-----------
 Dockerfile.build-debian-mips    | 70 +++++++++++++++------------------
 5 files changed, 132 insertions(+), 156 deletions(-)

diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index b143a532..6cf7a1f0 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -7,25 +7,20 @@ FROM $CI_REGISTRY_IMAGE/build-debian-minimal:commit-$CI_COMMIT_SHA
 # just few extra dependencies for building IGT with all the optional components
 # enabled
 
-RUN apt-get update
-RUN apt-get install -y \
-			libunwind-dev \
-			libgsl-dev \
-			libasound2-dev \
-			libxmlrpc-core-c3-dev \
-			libjson-c-dev \
-			libcurl4-openssl-dev \
-			python-docutils \
-			valgrind \
-			peg \
-			libdrm-intel1
-
-# autotools build deps
-RUN apt-get install -y \
-			autoconf \
-			automake \
-			xutils-dev \
-			libtool \
-			make
-
-RUN apt-get clean
+RUN apt-get update && apt-get install -y \
+    autoconf \
+    automake \
+    libasound2-dev \
+    libcurl4-openssl-dev \
+    libdrm-intel1 \
+    libgsl-dev \
+    libjson-c-dev \
+    libtool \
+    libunwind-dev \
+    libxmlrpc-core-c3-dev \
+    make \
+    peg \
+    python-docutils \
+    valgrind \
+    xutils-dev \
+ && rm -rf /var/lib/apt/lists/*
diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 573c7096..924432bd 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,40 +1,34 @@
 FROM debian:buster
 
-RUN apt-get update
-RUN apt-get install -y \
-			flex \
-			bison \
-			pkg-config \
-			x11proto-dri2-dev \
-			python-docutils \
-			valgrind \
-			peg
-
 RUN dpkg --add-architecture arm64
-RUN apt-get update
-RUN apt-get install -y \
-			gcc-aarch64-linux-gnu \
-			libatomic1:arm64 \
-			libpciaccess-dev:arm64 \
-			libkmod-dev:arm64 \
-			libprocps-dev:arm64 \
-			libunwind-dev:arm64 \
-			libdw-dev:arm64 \
-			zlib1g-dev:arm64 \
-			liblzma-dev:arm64 \
-			libcairo-dev:arm64 \
-			libpixman-1-dev:arm64 \
-			libudev-dev:arm64 \
-			libgsl-dev:arm64 \
-			libasound2-dev:arm64 \
-			libjson-c-dev:arm64 \
-			libcurl4-openssl-dev:arm64 \
-			libxrandr-dev:arm64 \
-			libxv-dev:arm64 \
-			meson \
-			libdrm-dev:arm64 \
-			qemu-user \
-			qemu-user-static
-
-
-RUN apt-get clean
+RUN apt-get update && apt-get install -y \
+    bison \
+    flex \
+    gcc-aarch64-linux-gnu \
+    libasound2-dev:arm64 \
+    libatomic1:arm64 \
+    libcairo-dev:arm64 \
+    libcurl4-openssl-dev:arm64 \
+    libdrm-dev:arm64 \
+    libdw-dev:arm64 \
+    libgsl-dev:arm64 \
+    libjson-c-dev:arm64 \
+    libkmod-dev:arm64 \
+    liblzma-dev:arm64 \
+    libpciaccess-dev:arm64 \
+    libpixman-1-dev:arm64 \
+    libprocps-dev:arm64 \
+    libudev-dev:arm64 \
+    libunwind-dev:arm64 \
+    libxrandr-dev:arm64 \
+    libxv-dev:arm64 \
+    meson \
+    peg \
+    pkg-config \
+    python-docutils \
+    qemu-user \
+    qemu-user-static \
+    valgrind \
+    x11proto-dri2-dev \
+    zlib1g-dev:arm64 \
+ && rm -rf /var/lib/apt/lists/*
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 737ca364..3752dc91 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -1,39 +1,34 @@
 FROM debian:buster
 
-RUN apt-get update
-RUN apt-get install -y \
-			flex \
-			bison \
-			pkg-config \
-			x11proto-dri2-dev \
-			python-docutils \
-			valgrind \
-			peg
-
 RUN dpkg --add-architecture armhf
-RUN apt-get update
-RUN apt-get install -y \
-			gcc-arm-linux-gnueabihf \
-			libatomic1:armhf \
-			libpciaccess-dev:armhf \
-			libkmod-dev:armhf \
-			libprocps-dev:armhf \
-			libunwind-dev:armhf \
-			libdw-dev:armhf \
-			zlib1g-dev:armhf \
-			liblzma-dev:armhf \
-			libcairo-dev:armhf \
-			libpixman-1-dev:armhf \
-			libudev-dev:armhf \
-			libgsl-dev:armhf \
-			libasound2-dev:armhf \
-			libjson-c-dev:armhf \
-			libcurl4-openssl-dev:armhf \
-			libxrandr-dev:armhf \
-			libxv-dev:armhf \
-			meson \
-			libdrm-dev:armhf \
-			qemu-user \
-			qemu-user-static
-
-RUN apt-get clean
+RUN apt-get update && apt-get install -y \
+    bison \
+    flex \
+    gcc-arm-linux-gnueabihf \
+    libasound2-dev:armhf \
+    libatomic1:armhf \
+    libcairo-dev:armhf \
+    libcurl4-openssl-dev:armhf \
+    libdrm-dev:armhf \
+    libdw-dev:armhf \
+    libgsl-dev:armhf \
+    libjson-c-dev:armhf \
+    libkmod-dev:armhf \
+    liblzma-dev:armhf \
+    libpciaccess-dev:armhf \
+    libpixman-1-dev:armhf \
+    libprocps-dev:armhf \
+    libudev-dev:armhf \
+    libunwind-dev:armhf \
+    libxrandr-dev:armhf \
+    libxv-dev:armhf \
+    meson \
+    peg \
+    pkg-config \
+    python-docutils \
+    qemu-user \
+    qemu-user-static \
+    valgrind \
+    x11proto-dri2-dev \
+    zlib1g-dev:armhf \
+ && rm -rf /var/lib/apt/lists/*
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 64edf4b4..d0756be5 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,25 +1,23 @@
 FROM debian:buster
 
-RUN apt-get update
-RUN apt-get install -y \
-			gcc \
-			flex \
-			bison \
-			pkg-config \
-			libatomic1 \
-			libpciaccess-dev \
-			libkmod-dev \
-			libprocps-dev \
-			libdw-dev \
-			zlib1g-dev \
-			liblzma-dev \
-			libcairo-dev \
-			libpixman-1-dev \
-			libudev-dev \
-			libxrandr-dev \
-			libxv-dev \
-			x11proto-dri2-dev \
-			meson \
-			libdrm-dev
-
-RUN apt-get clean
+RUN apt-get update && apt-get install -y \
+    bison \
+    flex \
+    gcc \
+    libatomic1 \
+    libcairo-dev \
+    libdrm-dev \
+    libdw-dev \
+    libkmod-dev \
+    liblzma-dev \
+    libpciaccess-dev \
+    libpixman-1-dev \
+    libprocps-dev \
+    libudev-dev \
+    libxrandr-dev \
+    libxv-dev \
+    meson \
+    pkg-config \
+    x11proto-dri2-dev \
+    zlib1g-dev \
+ && rm -rf /var/lib/apt/lists/*
diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
index 7e4bacdf..e52d403b 100644
--- a/Dockerfile.build-debian-mips
+++ b/Dockerfile.build-debian-mips
@@ -2,42 +2,36 @@
 # https://bugs.debian.org/932725
 FROM debian:stretch-backports
 
-RUN apt-get update
-RUN apt-get install -y \
-			flex \
-			bison \
-			pkg-config \
-			x11proto-dri2-dev \
-			python-docutils \
-			valgrind \
-			peg
-
 RUN dpkg --add-architecture mips
-RUN apt-get update
-RUN apt-get install -y \
-			gcc-mips-linux-gnu \
-			libatomic1:mips \
-			libpciaccess-dev:mips \
-			libkmod-dev:mips \
-			libprocps-dev:mips \
-			libunwind-dev:mips \
-			libdw-dev:mips \
-			zlib1g-dev:mips \
-			liblzma-dev:mips \
-			libcairo-dev:mips \
-			libpixman-1-dev:mips \
-			libudev-dev:mips \
-			libgsl-dev:mips \
-			libasound2-dev:mips \
-			libjson-c-dev:mips \
-			libcurl4-openssl-dev:mips \
-			libxrandr-dev:mips \
-			libxv-dev:mips
-
-RUN apt-get install -t stretch-backports -y \
-			meson \
-			libdrm-dev:mips \
-			qemu-user \
-			qemu-user-static
-
-RUN apt-get clean
+RUN apt-get update && apt-get install -y \
+    bison \
+    flex \
+    gcc-mips-linux-gnu \
+    libasound2-dev:mips \
+    libatomic1:mips \
+    libcairo-dev:mips \
+    libcurl4-openssl-dev:mips \
+    libdw-dev:mips \
+    libgsl-dev:mips \
+    libjson-c-dev:mips \
+    libkmod-dev:mips \
+    liblzma-dev:mips \
+    libpciaccess-dev:mips \
+    libpixman-1-dev:mips \
+    libprocps-dev:mips \
+    libudev-dev:mips \
+    libunwind-dev:mips \
+    libxrandr-dev:mips \
+    libxv-dev:mips \
+    peg \
+    pkg-config \
+    python-docutils \
+    valgrind \
+    x11proto-dri2-dev \
+    zlib1g-dev:mips \
+ && apt-get install -t stretch-backports -y \
+    libdrm-dev:mips \
+    meson \
+    qemu-user \
+    qemu-user-static \
+ && rm -rf /var/lib/apt/lists/*
-- 
2.17.1
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
