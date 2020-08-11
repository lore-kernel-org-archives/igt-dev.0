Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F436E4D0
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2020 09:32:49 +0000 (UTC)
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Date: Tue, 11 Aug 2020 10:32:41 +0100
Message-Id: <20200811093241.19910-1-guillaume.tucker@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Dockerfile.build-debian-mips: use buster
 with libunwind fix
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We can now use libunwind 1.2.1-10~deb10u1 from Debian Buster as per
this bug report which has now been resolved:

  https://bugs.debian.org/932725

Drop stretch-backports for MIPS and use Buster like the other
architectures.

Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 Dockerfile.build-debian-mips | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
index 7e4bacdf8ded..9b7c0a5b4703 100644
--- a/Dockerfile.build-debian-mips
+++ b/Dockerfile.build-debian-mips
@@ -1,6 +1,4 @@
-# we are stuck on stretch for mips:
-# https://bugs.debian.org/932725
-FROM debian:stretch-backports
+FROM debian:buster
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -32,9 +30,7 @@ RUN apt-get install -y \
 			libjson-c-dev:mips \
 			libcurl4-openssl-dev:mips \
 			libxrandr-dev:mips \
-			libxv-dev:mips
-
-RUN apt-get install -t stretch-backports -y \
+			libxv-dev:mips \
 			meson \
 			libdrm-dev:mips \
 			qemu-user \
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
