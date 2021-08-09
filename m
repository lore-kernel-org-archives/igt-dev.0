Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A692C899B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 08:48:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  9 Aug 2021 11:50:40 +0300
Message-Id: <20210809085040.503-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] gitlab-ci: Try to avoid runners that jam
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
Cc: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
List-ID: <igt-dev@lists.freedesktop.org>

For a yet unknown reason, some gitlab runners leave qemu-user
processes in 'D' state. Try to avoid those by using runners that are
known to get through the testing fine. Currently that would be the
"gstreamer"-tagged runners.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 .gitlab-ci.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0de61828..fd0ca7cb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -164,6 +164,8 @@ build:tests-debian-meson-mips:
 #################### TEST ##########################
 
 test:ninja-test:
+  tags:
+    - gstreamer
   retry: 2
   dependencies:
     - build:tests-fedora
@@ -171,6 +173,8 @@ test:ninja-test:
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
 
 test:ninja-test-clang:
+  tags:
+    - gstreamer
   retry: 2
   dependencies:
     - build:tests-fedora-clang
@@ -180,6 +184,8 @@ test:ninja-test-clang:
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
 
 test:ninja-test-minimal:
+  tags:
+    - gstreamer
   retry: 2
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
   dependencies:
@@ -188,6 +194,8 @@ test:ninja-test-minimal:
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
 
 test:ninja-test-arm64:
+  tags:
+    - gstreamer
   retry: 2
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
   dependencies:
@@ -203,6 +211,8 @@ test:ninja-test-arm64:
     when: on_failure
 
 test:ninja-test-armhf:
+  tags:
+    - gstreamer
   retry: 2
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
   dependencies:
@@ -218,6 +228,8 @@ test:ninja-test-armhf:
     when: on_failure
 
 test:ninja-test-mips:
+  tags:
+    - gstreamer
   retry: 2
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
   dependencies:
-- 
2.29.2
