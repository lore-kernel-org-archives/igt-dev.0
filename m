Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B5DC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 16:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCDF10E7F5;
	Wed, 30 Apr 2025 16:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nD5eb1kC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C532210E7F5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746030848; x=1777566848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFIDViLbO1jP0YCFSaac0VabyNoRqPeuoVOsgEhjgfE=;
 b=nD5eb1kC7fXpqf2zQoz/sAPx1t2XsjcLikK1tGOu+6lviVyStoqa4k5f
 y5tXLtAA8Y2mdBPkOkBe5J/v4w2EDS6sE+jnWUopz2mA3HVx7r9A3EJ3b
 rBcYFM4sCvijHkWdh3bjCjtralN58Wf2syMmtEDO9eH3KVY8UMf4xV6tG
 mIXU4Wiu3D5sKbBz7PbKiwAkF2P8pqmNGX0OJpt4zczpGsN7NcmYIBQTz
 8bB89trQPYuVb13yUYvG+1RlJPqsQMLA/nIzwvdgszjXrqqAg6vfQNeN3
 jkjkELifc/XB2knGmUKwtHs0q7G2LuLjaZFM/sq+FDhOe/Eehx5iZSOJJ Q==;
X-CSE-ConnectionGUID: 9RMLKbaeQFS/p7v4esvOpA==
X-CSE-MsgGUID: wQiGEF1sTtSILCD6PubqHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="46814639"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="46814639"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:07 -0700
X-CSE-ConnectionGUID: Ct55Zo+cR8KMNFi7/PJs2w==
X-CSE-MsgGUID: AJ26pddhS+KAkf26vUXpqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134471439"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <dragoon@dragonic.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] gitlab-ci: Enable gitlab-ci-local runs from the
 primary CI definition file
Date: Wed, 30 Apr 2025 18:33:53 +0200
Message-ID: <20250430163354.178254-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
References: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ryszard Knop <dragoon@dragonic.eu>

The gitlab-ci-local tool sets GITLAB_CI to "false", so we can pick which
jobs are to be executed locally without defining them again. We just
have to override the image to make it all work.

Signed-off-by: Ryszard Knop <dragoon@dragonic.eu>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci-local.yml |  2 ++
 .gitlab-ci.yml       | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 .gitlab-ci-local.yml

diff --git a/.gitlab-ci-local.yml b/.gitlab-ci-local.yml
new file mode 100644
index 000000000..65ccc1eec
--- /dev/null
+++ b/.gitlab-ci-local.yml
@@ -0,0 +1,2 @@
+include: .gitlab-ci.yml
+image: build-igt-fedora
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6c076dba..ec7ce7bae 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -25,6 +25,8 @@ stages:
 build-containers:build-debian:
   stage: build-containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-minimal build-debian-minimal
@@ -33,6 +35,8 @@ build-containers:build-debian:
 build-containers:build-debian-armhf:
   stage: build-containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-armhf build-debian-armhf
@@ -40,6 +44,8 @@ build-containers:build-debian-armhf:
 build-containers:build-debian-arm64:
   stage: build-containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
@@ -47,6 +53,8 @@ build-containers:build-debian-arm64:
 build-containers:build-debian-mips:
   stage: build-containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
@@ -54,6 +62,8 @@ build-containers:build-debian-mips:
 build-containers:build-fedora:
   stage: build-containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-fedora build-fedora
@@ -74,6 +84,8 @@ build:tests-fedora:
 
 build:tests-fedora-no-libunwind:
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - dnf remove -y libunwind-devel
     - meson -Dlibunwind=disabled build
@@ -82,6 +94,8 @@ build:tests-fedora-no-libunwind:
 # documentation building is different with meson<0.47
 build:tests-fedora-oldest-meson:
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - dnf remove -y meson
     - pip install /usr/src/meson-*.tar.gz
@@ -92,6 +106,8 @@ build:tests-fedora-oldest-meson:
 # ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
 build:tests-fedora-no-libdrm-nouveau:
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - meson -Dlibdrm_drivers= build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
@@ -110,6 +126,8 @@ build:tests-fedora-clang:
 build:tests-debian-meson:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - meson $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
@@ -121,6 +139,8 @@ build:tests-debian-meson:
 build:tests-debian-minimal:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - meson -Dtests=disabled -Dlibdrm_drivers="" build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
@@ -131,6 +151,8 @@ build:tests-debian-minimal:
 build:tests-debian-meson-armhf:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-armhf:commit-$CI_COMMIT_SHA
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
     - meson --cross-file meson-cross-armhf.txt build
@@ -142,6 +164,8 @@ build:tests-debian-meson-armhf:
 build:tests-debian-meson-arm64:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-arm64:commit-$CI_COMMIT_SHA
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
     - meson --cross-file meson-cross-arm64.txt build
@@ -153,6 +177,8 @@ build:tests-debian-meson-arm64:
 build:tests-debian-meson-mips:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
   stage: build
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   script:
     - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
     - meson --cross-file meson-cross-mips.txt build
@@ -180,6 +206,8 @@ test:ninja-test-clang:
   script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
 
 test:ninja-test-minimal:
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   retry: 2
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
   dependencies:
@@ -268,6 +296,8 @@ pages:
 ############## CONTAINERS ####################
 
 containers:igt:
+  rules:
+    - if: $GITLAB_CI == "true"  # Skip for gitlab-ci-local runs
   stage: containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
   dependencies:
-- 
2.49.0

