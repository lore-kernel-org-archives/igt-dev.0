Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA9A10F533
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 07:38:29 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bi12so10196866ejb.3
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Mar 2022 23:38:29 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Mar 2022 08:37:52 +0100
Message-Id: <20220310073800.22067-5-tomeu.vizoso@collabora.com>
In-Reply-To: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 04/12] ci: Add dependencies between jobs
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

So a stage doesn't need to completely finish before jobs from the next
stages can start. This allows for pipelines to finish much sooner.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 10fd28291cc8..8c72e0494b67 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -81,6 +81,8 @@ build:tests-fedora:
     paths:
       - build
       - installdir
+  needs:
+    - build-containers:build-fedora
 
 build:tests-fedora-no-libunwind:
   stage: build
@@ -88,6 +90,8 @@ build:tests-fedora-no-libunwind:
     - dnf remove -y libunwind-devel
     - meson -Dlibunwind=disabled build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+  needs:
+    - build-containers:build-fedora
 
 # documentation building is different with meson<0.47
 build:tests-fedora-oldest-meson:
@@ -98,6 +102,8 @@ build:tests-fedora-oldest-meson:
     - meson $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
+  needs:
+    - build-containers:build-fedora
 
 # ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
 build:tests-fedora-no-libdrm-nouveau:
@@ -105,6 +111,8 @@ build:tests-fedora-no-libdrm-nouveau:
   script:
     - meson -Dlibdrm_drivers= build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+  needs:
+    - build-containers:build-fedora
 
 build:tests-fedora-clang:
   stage: build
@@ -116,6 +124,8 @@ build:tests-fedora-clang:
   artifacts:
     paths:
       - build
+  needs:
+    - build-containers:build-fedora
 
 build:tests-debian-meson:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
@@ -127,6 +137,8 @@ build:tests-debian-meson:
   artifacts:
     paths:
       - meson-test-list.txt
+  needs:
+    - build-containers:build-debian
 
 build:tests-debian-minimal:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
@@ -137,6 +149,8 @@ build:tests-debian-minimal:
   artifacts:
     paths:
       - build
+  needs:
+    - build-containers:build-debian
 
 build:tests-debian-meson-armhf:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
@@ -148,6 +162,8 @@ build:tests-debian-meson-armhf:
   artifacts:
     paths:
       - build
+  needs:
+    - build-containers:build-debian-armhf
 
 build:tests-debian-meson-arm64:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
@@ -159,6 +175,8 @@ build:tests-debian-meson-arm64:
   artifacts:
     paths:
       - build
+  needs:
+    - build-containers:build-debian-arm64
 
 build:tests-debian-meson-mips:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
@@ -170,6 +188,8 @@ build:tests-debian-meson-mips:
   artifacts:
     paths:
       - build
+  needs:
+    - build-containers:build-debian-mips
 
 #################### TEST ##########################
 
@@ -181,6 +201,8 @@ test:ninja-test:
     - build:tests-fedora
   stage: test
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
+  needs:
+    - build:tests-fedora
 
 test:ninja-test-clang:
   tags:
@@ -192,6 +214,8 @@ test:ninja-test-clang:
     CC: clang
   stage: test
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
+  needs:
+    - build:tests-fedora-clang
 
 test:ninja-test-minimal:
   tags:
@@ -202,6 +226,8 @@ test:ninja-test-minimal:
     - build:tests-debian-minimal
   stage: test
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
+  needs:
+    - build:tests-debian-minimal
 
 test:ninja-test-arm64:
   tags:
@@ -219,6 +245,8 @@ test:ninja-test-arm64:
     paths:
       - build
     when: on_failure
+  needs:
+    - build:tests-debian-meson-arm64
 
 test:ninja-test-armhf:
   tags:
@@ -236,6 +264,8 @@ test:ninja-test-armhf:
     paths:
       - build
     when: on_failure
+  needs:
+    - build:tests-debian-meson-armhf
 
 test:ninja-test-mips:
   tags:
@@ -253,6 +283,8 @@ test:ninja-test-mips:
     paths:
       - build
     when: on_failure
+  needs:
+    - build:tests-debian-meson-mips
 
 test:list-undocumented-tests:
   dependencies:
@@ -262,12 +294,16 @@ test:list-undocumented-tests:
   artifacts:
     paths:
       - undocumented_tests.txt
+  needs:
+    - build:tests-fedora
 
 test:verify-blacklists:
   dependencies:
     - build:tests-fedora
   stage: test
   script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
+  needs:
+    - build:tests-fedora
 
 ################### DEPLOY #########################
 
-- 
2.31.1
