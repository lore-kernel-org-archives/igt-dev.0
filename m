Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FE410F530
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 07:38:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qx21so10087808ejb.13
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Mar 2022 23:38:28 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Mar 2022 08:37:51 +0100
Message-Id: <20220310073800.22067-4-tomeu.vizoso@collabora.com>
In-Reply-To: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 03/12] ci: Move files to ci/ subdir
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

We will be adding a few more files soon.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml                                       | 12 ++++++------
 Dockerfile => ci/Dockerfile                          |  0
 .../Dockerfile.build-debian                          |  0
 .../Dockerfile.build-debian-arm64                    |  0
 .../Dockerfile.build-debian-armhf                    |  0
 .../Dockerfile.build-debian-minimal                  |  0
 .../Dockerfile.build-debian-mips                     |  0
 .../Dockerfile.build-fedora                          |  0
 meson-cross-arm64.txt => ci/meson-cross-arm64.txt    |  0
 meson-cross-armhf.txt => ci/meson-cross-armhf.txt    |  0
 meson-cross-mips.txt => ci/meson-cross-mips.txt      |  0
 11 files changed, 6 insertions(+), 6 deletions(-)
 rename Dockerfile => ci/Dockerfile (100%)
 rename Dockerfile.build-debian => ci/Dockerfile.build-debian (100%)
 rename Dockerfile.build-debian-arm64 => ci/Dockerfile.build-debian-arm64 (100%)
 rename Dockerfile.build-debian-armhf => ci/Dockerfile.build-debian-armhf (100%)
 rename Dockerfile.build-debian-minimal => ci/Dockerfile.build-debian-minimal (100%)
 rename Dockerfile.build-debian-mips => ci/Dockerfile.build-debian-mips (100%)
 rename Dockerfile.build-fedora => ci/Dockerfile.build-fedora (100%)
 rename meson-cross-arm64.txt => ci/meson-cross-arm64.txt (100%)
 rename meson-cross-armhf.txt => ci/meson-cross-armhf.txt (100%)
 rename meson-cross-mips.txt => ci/meson-cross-mips.txt (100%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9f252836c578..10fd28291cc8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -27,8 +27,8 @@ build-containers:build-debian:
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-minimal build-debian-minimal
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian build-debian
+    - .gitlab-ci/pull-or-rebuild.sh base ci/Dockerfile.build-debian-minimal build-debian-minimal
+    - .gitlab-ci/pull-or-rebuild.sh base ci/Dockerfile.build-debian build-debian
   tags:
     - packet.net
 
@@ -37,7 +37,7 @@ build-containers:build-debian-armhf:
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-armhf build-debian-armhf
+    - .gitlab-ci/pull-or-rebuild.sh base ci/Dockerfile.build-debian-armhf build-debian-armhf
   tags:
     - packet.net
 
@@ -46,7 +46,7 @@ build-containers:build-debian-arm64:
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
+    - .gitlab-ci/pull-or-rebuild.sh base ci/Dockerfile.build-debian-arm64 build-debian-arm64
   tags:
     - packet.net
 
@@ -55,7 +55,7 @@ build-containers:build-debian-mips:
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
+    - .gitlab-ci/pull-or-rebuild.sh base ci/Dockerfile.build-debian-mips build-debian-mips
   tags:
     - packet.net
 
@@ -64,7 +64,7 @@ build-containers:build-fedora:
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-fedora build-fedora
+    - .gitlab-ci/pull-or-rebuild.sh base ci/Dockerfile.build-fedora build-fedora
   tags:
     - packet.net
 
diff --git a/Dockerfile b/ci/Dockerfile
similarity index 100%
rename from Dockerfile
rename to ci/Dockerfile
diff --git a/Dockerfile.build-debian b/ci/Dockerfile.build-debian
similarity index 100%
rename from Dockerfile.build-debian
rename to ci/Dockerfile.build-debian
diff --git a/Dockerfile.build-debian-arm64 b/ci/Dockerfile.build-debian-arm64
similarity index 100%
rename from Dockerfile.build-debian-arm64
rename to ci/Dockerfile.build-debian-arm64
diff --git a/Dockerfile.build-debian-armhf b/ci/Dockerfile.build-debian-armhf
similarity index 100%
rename from Dockerfile.build-debian-armhf
rename to ci/Dockerfile.build-debian-armhf
diff --git a/Dockerfile.build-debian-minimal b/ci/Dockerfile.build-debian-minimal
similarity index 100%
rename from Dockerfile.build-debian-minimal
rename to ci/Dockerfile.build-debian-minimal
diff --git a/Dockerfile.build-debian-mips b/ci/Dockerfile.build-debian-mips
similarity index 100%
rename from Dockerfile.build-debian-mips
rename to ci/Dockerfile.build-debian-mips
diff --git a/Dockerfile.build-fedora b/ci/Dockerfile.build-fedora
similarity index 100%
rename from Dockerfile.build-fedora
rename to ci/Dockerfile.build-fedora
diff --git a/meson-cross-arm64.txt b/ci/meson-cross-arm64.txt
similarity index 100%
rename from meson-cross-arm64.txt
rename to ci/meson-cross-arm64.txt
diff --git a/meson-cross-armhf.txt b/ci/meson-cross-armhf.txt
similarity index 100%
rename from meson-cross-armhf.txt
rename to ci/meson-cross-armhf.txt
diff --git a/meson-cross-mips.txt b/ci/meson-cross-mips.txt
similarity index 100%
rename from meson-cross-mips.txt
rename to ci/meson-cross-mips.txt
-- 
2.31.1
