Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FDD10E39E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 11:39:14 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.33.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 16DCE580DA9
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 03:39:14 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rCecy-000bbG-0t
 for igt-dev@lists.freedesktop.org; Mon, 11 Dec 2023 12:39:12 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] meson.sh: allow making it less verbose
Date: Mon, 11 Dec 2023 12:39:10 +0100
Message-ID: <20231211113910.144523-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Add support for not output each build step and run ninja
with --quiet option.

This is interesting specially when executed inside some
script.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 meson.sh | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/meson.sh b/meson.sh
index e112a93cf1a2..2ea33d69139e 100755
--- a/meson.sh
+++ b/meson.sh
@@ -2,36 +2,50 @@
 
 cat > Makefile <<EOF
 
+quiet_build =
+quiet_reconfigure =
+Q =
+VERBOSE =
+
+ifeq ("\$(origin V)", "command line")
+  VERBOSE = \$(V)
+endif
+
+ifneq (\$(findstring 0, \$(VERBOSE)),)
+  quiet_build = --quiet
+  Q = @
+endif
+
 .PHONY: default docs
 default: all
 
 build/build.ninja:
-	mkdir -p build
-	meson build
+	\$(Q)mkdir -p build
+	\$(Q)meson build \$(quiet_build)
 
 all: build/build.ninja
-	ninja -C build
+	\$(Q)ninja -C build \$(quiet_build)
 
 clean: build/build.ninja
-	ninja -C build clean
+	\$(Q)ninja -C build clean \$(quiet_build)
 
 test: build/build.ninja
-	ninja -C build test
+	\$(Q)ninja -C build test \$(quiet_build)
 
 reconfigure: build/build.ninja
-	ninja -C build reconfigure
+	\$(Q)ninja -C build reconfigure
 
 check distcheck dist distclean:
-	echo "This is the meson wrapper, not automake" && false
+	@echo "This is the meson wrapper, not automake" && false
 
 install: build/build.ninja
-	ninja -C build install
+	\$(Q)ninja -C build install \$(quiet_build)
 
 uninstall: build/build.ninja
-	ninja -C build uninstall
+	\$(Q)ninja -C build uninstall \$(quiet_build)
 
 docs:
-	ninja -C build igt-gpu-tools-doc
+	\$(Q)ninja -C build igt-gpu-tools-doc \$(quiet_build)
 
 EOF
 
-- 
2.43.0
