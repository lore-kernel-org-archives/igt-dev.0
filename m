Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C2310E9B5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so5419028wmq.2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:20 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:50 +0100
Message-Id: <20220311141300.60629-3-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 02/12] ci: Move containers from Buster to
 Bullseye
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Eric Anholt <eric@anholt.net>,
 Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Except for MIPS, which isn't support since Bullseye.

Currently, we hit this error:

STEP 2: RUN apt-get update
Get:1 http://security.debian.org/debian-security buster/updates InRelease [65.4 kB]
Get:2 http://deb.debian.org/debian buster InRelease [122 kB]
Get:3 http://deb.debian.org/debian buster-updates InRelease [51.9 kB]
Reading package lists...
E: Repository 'http://security.debian.org/debian-security buster/updates InRelease' changed its 'Suite' value from 'stable' to 'oldstable'
E: Repository 'http://deb.debian.org/debian buster InRelease' changed its 'Suite' value from 'stable' to 'oldstable'
E: Repository 'http://deb.debian.org/debian buster-updates InRelease' changed its 'Suite' value from 'stable-updates' to 'oldstable-updates'
Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 100

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Dockerfile.build-debian         | 2 +-
 Dockerfile.build-debian-arm64   | 4 ++--
 Dockerfile.build-debian-armhf   | 2 +-
 Dockerfile.build-debian-minimal | 2 +-
 Dockerfile.build-debian-mips    | 4 +++-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index 454f4bce5e77..52d7c42d1325 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -15,7 +15,7 @@ RUN apt-get install -y \
 			libxmlrpc-core-c3-dev \
 			libjson-c-dev \
 			libcurl4-openssl-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg \
 			libdrm-intel1
diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 573c7096feb8..cf0625ac725a 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 737ca3645f1b..dd43fcd6f18e 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 64edf4b4313e..3850fb43e5cc 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
index 9b7c0a5b4703..e9cdaab9d640 100644
--- a/Dockerfile.build-debian-mips
+++ b/Dockerfile.build-debian-mips
@@ -1,3 +1,5 @@
+# we are stuck on buster for mips:
+# https://lists.debian.org/debian-mips/2019/07/msg00010.html
 FROM debian:buster
 
 RUN apt-get update
@@ -6,7 +8,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
-- 
2.31.1
