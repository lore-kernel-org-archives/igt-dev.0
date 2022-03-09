Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38E910E439
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 07:43:06 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id dr20so3000723ejc.6
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Mar 2022 23:43:06 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed,  9 Mar 2022 08:42:40 +0100
Message-Id: <20220309074242.65066-10-tomeu.vizoso@collabora.com>
In-Reply-To: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
References: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 09/11] ci: Upload build tarball to MinIO
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For use in test jobs in LAVA that need to download them into their
rootfs.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7476b3306845..04152103b923 100644
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
@@ -158,10 +160,17 @@ build:tests-debian-meson-armhf:
 build:tests-debian-meson-arm64:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
   stage: build
+  variables:
+    MINIO_ARTIFACT_NAME: igt-arm64
   script:
     - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
     - meson --cross-file ci/meson-cross-arm64.txt build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+    - cp -rf ci build/.
+    - MINIO_ARTIFACT_NAME="$MINIO_ARTIFACT_NAME.tar.gz" # Pass needed files to the test stage
+    - tar -czf $MINIO_ARTIFACT_NAME build
+    - ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
+    - ci-fairy minio cp ${MINIO_ARTIFACT_NAME} minio://${PIPELINE_ARTIFACTS_BASE}/${MINIO_ARTIFACT_NAME}
   artifacts:
     paths:
       - build
-- 
2.31.1
