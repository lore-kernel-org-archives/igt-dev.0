Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0641910E9BF
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so5407625wmb.3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:27 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:58 +0100
Message-Id: <20220311141300.60629-11-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 10/12] ci: Upload build tarball to MinIO
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

For use in test jobs in LAVA that need to download them into their
rootfs.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml         | 5 +++++
 ci/upload-artifacts.sh | 7 +++++++
 2 files changed, 12 insertions(+)
 create mode 100644 ci/upload-artifacts.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2cf109728d54..f820661496c4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,8 @@ variables:
     -Drunner=enabled
     -Dlibunwind=enabled
   LANG: "C.UTF-8"
+  MINIO_HOST: minio-packet.freedesktop.org
+  PIPELINE_ARTIFACTS_BASE: ${MINIO_HOST}/artifacts/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
 
 stages:
   - build-containers
@@ -168,10 +170,13 @@ build:tests-debian-meson-armhf:
 build:tests-debian-meson-arm64:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
   stage: build
+  variables:
+    ARCH: arm64
   script:
     - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
     - meson --cross-file ci/meson-cross-arm64.txt build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+    - sh ci/upload-artifacts.sh
   artifacts:
     paths:
       - build
diff --git a/ci/upload-artifacts.sh b/ci/upload-artifacts.sh
new file mode 100644
index 000000000000..69a9397a902f
--- /dev/null
+++ b/ci/upload-artifacts.sh
@@ -0,0 +1,7 @@
+# Pass needed files to the test stage
+
+cp -rf ci tests/*_ci build/.
+MINIO_ARTIFACT_NAME="igt-$ARCH.tar.gz"
+tar -czf $MINIO_ARTIFACT_NAME build
+ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
+ci-fairy minio cp ${MINIO_ARTIFACT_NAME} minio://${PIPELINE_ARTIFACTS_BASE}/${MINIO_ARTIFACT_NAME}
-- 
2.31.1
