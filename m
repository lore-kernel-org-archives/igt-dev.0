Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B6A10E12C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 13:09:37 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Nov 2022 15:09:25 +0200
Message-Id: <20221102130925.2282216-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] gitlab-CI: Temporarily disable mips
 selfchecks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Like with arm, gitlab runners have sporadic trouble executing the mips
binaries through binfmt_misc + qemu.

Compilation for mips is kept so that at least doesn't regress.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 55559303..0263dab3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -228,22 +228,23 @@ test:ninja-test-minimal:
 #       - build
 #     when: on_failure
 
-test:ninja-test-mips:
-  tags:
-    - gstreamer
-  retry: 2
-  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
-  dependencies:
-    - build:tests-debian-meson-mips
-  stage: test
-  script:
-    - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
-    - env > build/envdump.txt
-    - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
-  artifacts:
-    paths:
-      - build
-    when: on_failure
+# mips testing temporarily disabled
+# test:ninja-test-mips:
+#   tags:
+#     - gstreamer
+#   retry: 2
+#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
+#   dependencies:
+#     - build:tests-debian-meson-mips
+#   stage: test
+#   script:
+#     - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
+#     - env > build/envdump.txt
+#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
+#   artifacts:
+#     paths:
+#       - build
+#     when: on_failure
 
 test:list-undocumented-tests:
   dependencies:
-- 
2.30.2
