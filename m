Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC78310E5BF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 11:46:56 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu, 21 Sep 2023 13:46:47 +0200
Message-ID: <20230921114648.42278-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t] scripts/example-debug-error: added
 script for debugging compilation errors on gitlab
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

v2: added if block for better arch separatation x86/arm64 (Mauro)
    changed temporary source folder into var (Kamil)

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/example-debug-error.sh | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100755 scripts/example-debug-error.sh

diff --git a/scripts/example-debug-error.sh b/scripts/example-debug-error.sh
new file mode 100755
index 000000000..5cd19d3a3
--- /dev/null
+++ b/scripts/example-debug-error.sh
@@ -0,0 +1,59 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2023 Intel Corporation
+#
+# When you see compilation error in fdo GitLab follow link with
+# error to find out used registry, it should be at top of log,
+# starting with "registry.freedesktop.org/", for example:
+# Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-1af4386ff3086df670e10af3a2bfd89993af3b0a
+#
+# Take registry and put it into POD_IGT var below (default will use debian build for amd64/x64):
+#
+# uncomment if you want cross-compile for arm64
+# ARCH=arm64
+
+TMP_BUILD="/tmp/build"
+
+if [ "x${ARCH}" == "x" ]; then
+  echo "default arch x86_64"
+  ARCH="x86_64"
+  POD_IGT=registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-1af4386ff3086df670e10af3a2bfd89993af3b0a
+
+  echo "Arch: ${ARCH} with registry: ${POD_IGT}"
+
+  mkdir -p ${TMP_BUILD}
+  cp -R * ${TMP_BUILD}
+  echo "Arch: ${ARCH} with registry: ${POD_IGT}"
+  sudo podman run -i -t -v ${TMP_BUILD}:/opt/builds --privileged ${POD_IGT}
+fi
+
+# you can debug now with:
+#
+# cd /opt/builds
+# meson build
+# ninja -C build
+#
+# After you are done just exit shell.
+#
+# or for cross-compilation for arm64 (notice change in registry):
+#
+if [ "x${ARCH}" == "xarm64" ]; then
+
+  echo "cross-compile image for arm64"
+  POD_IGT=registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-4f83c63e41ba8da2c4bc0a5438b86a2311da153d
+  mkdir -p ${TMP_BUILD}
+  cp -R * ${TMP_BUILD}
+  sudo podman run -i -t -v ${TMP_BUILD}:/opt/builds --privileged ${POD_IGT}
+# you can debug now with:
+#
+# export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
+# meson --cross-file meson-cross-arm64.txt build
+# ninja -C build
+#
+# After you are done just exit shell.
+
+fi
+
+#
+## end of script
-- 
2.42.0


