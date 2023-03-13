Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6232010E06A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 09:41:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s22so14848477lfi.9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 02:41:21 -0700 (PDT)
From: Petri Latvala <adrinael@adrinael.net>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Mar 2023 11:40:51 +0200
Message-Id: <20230313094051.2395229-1-adrinael@adrinael.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] gitlab-ci: Remove senseless runner restriction
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

With d4ff2b4ab88d62a1888cb0316e70a1729fe4a685 gitlab-ci was limited to
"gstreamer" runners, because they were the only ones able to get
through qemu-using tests without having the processes get stuck. Those
tests are now removed from execution (mips, arm) so we can remove the
now-senseless restriction of runners.

Signed-off-by: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0263dab3..a6c076db 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -164,8 +164,6 @@ build:tests-debian-meson-mips:
 #################### TEST ##########################
 
 test:ninja-test:
-  tags:
-    - gstreamer
   retry: 2
   dependencies:
     - build:tests-fedora
@@ -173,8 +171,6 @@ test:ninja-test:
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
 
 test:ninja-test-clang:
-  tags:
-    - gstreamer
   retry: 2
   dependencies:
     - build:tests-fedora-clang
@@ -184,8 +180,6 @@ test:ninja-test-clang:
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
 
 test:ninja-test-minimal:
-  tags:
-    - gstreamer
   retry: 2
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
   dependencies:
@@ -195,8 +189,6 @@ test:ninja-test-minimal:
 
 # arm testing temporarily disabled until converted to run on native arm HW
 # test:ninja-test-arm64:
-#   tags:
-#     - gstreamer
 #   retry: 2
 #   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
 #   dependencies:
@@ -212,8 +204,6 @@ test:ninja-test-minimal:
 #     when: on_failure
 #
 # test:ninja-test-armhf:
-#   tags:
-#     - gstreamer
 #   retry: 2
 #   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
 #   dependencies:
@@ -230,8 +220,6 @@ test:ninja-test-minimal:
 
 # mips testing temporarily disabled
 # test:ninja-test-mips:
-#   tags:
-#     - gstreamer
 #   retry: 2
 #   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
 #   dependencies:
-- 
2.30.2
