Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425EF10E6A5
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 17:02:53 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu, 31 Aug 2023 19:02:45 +0200
Message-Id: <20230831170245.38089-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/example-debug-error: added script
 for debugging compilation errors on gitlab
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added example script to help quick start debugging compilation
errors seen on GitLab fdo when building new patch or patchset.

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/example-debug-error.sh | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100755 scripts/example-debug-error.sh

diff --git a/scripts/example-debug-error.sh b/scripts/example-debug-error.sh
new file mode 100755
index 000000000..755c90a25
--- /dev/null
+++ b/scripts/example-debug-error.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2023 Intel Corporation
+#
+# When you see compilation error in fdo GitLab follow link with
+# error to find out used registry, it should be at top of log,
+# for example:
+# Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-1af4386ff3086df670e10af3a2bfd89993af3b0a
+#
+# Take registry and put it into POD_IGT var below (default will use debian build for amd64/x64):
+#
+POD_IGT=registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-1af4386ff3086df670e10af3a2bfd89993af3b0a
+
+mkdir -p /tmp/igt-build
+cp -R * /tmp/igt-build/
+sudo podman run -i -t -v /tmp/igt-build/:/opt/builds --privileged ${POD_IGT}
+
+# you can debug now with:
+#
+# cd /opt/builds
+# meson build
+# ninja -C build
+#
+# or for cross-compilation for arm64 (for other arch remember to change registry):
+#
+# export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
+# meson --cross-file meson-cross-arm64.txt build
+# ninja -C build
+#
+# After you are done just exit shell.
+## end of script
-- 
2.39.2


