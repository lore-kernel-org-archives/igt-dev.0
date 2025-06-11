Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80937C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227F010E61D;
	Wed, 11 Jun 2025 11:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKR41Drw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7B910E61C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640042; x=1781176042;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=lzZ4kfx5mY46KwEan85eLggCm0eteWO4FXXPBIhxtfs=;
 b=DKR41DrwCuiX0IRWdTQKyI1ryfWWn6u1rSA85yvUsHWvuHfbKt5Wizjl
 cVD8ju90uto5HggMYHn8nXllvKvbNx9Hqz+YDQDI4+Im45A8SEjTYhc7A
 aGpQf+hp2zKslVboUN6zEpZ2p0snxiHHGOdeOllbhRfdSaX89IQP+v/oJ
 zvKx7QMMI7yTylLByHiC+43kYh/OAVbszDjYkmcYx+gHyVSzEXeKSk8Tl
 ca7ehYwTjFEb08MWdOV+7mszyJW+3QLNxTVgl19mFDIW2gQ8SrjYnS4Jc
 7rpsv5W7381OnFmeHTQnzuBa7If6nz5sgUbCB1HzkEetgbK8UznzJtSOI Q==;
X-CSE-ConnectionGUID: +KGEsUsFTjOtwwvekFCBig==
X-CSE-MsgGUID: fJw0pWO0QV2e8u4GlssugA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62057454"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62057454"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:21 -0700
X-CSE-ConnectionGUID: A6V6/XfIQ2+bUgg/S9N0IA==
X-CSE-MsgGUID: Rn3q1/uSTeqNcxM0Y/gGjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147014989"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:20 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 11 Jun 2025 13:06:36 +0200
Subject: [PATCH v2 1/5] CI: create own base buildah image instead of wayland's
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-bump_docker_distros-v2-1-90791ecb953d@intel.com>
References: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4188;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=lzZ4kfx5mY46KwEan85eLggCm0eteWO4FXXPBIhxtfs=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSWNCFNR+yDxo9O/G2UTCoKWHR+xJ5Fjh9Ar4S
 kl6c11NelOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEljQgAKCRAjYrKT3hD9
 1zfuC/4osTgcVdKReJwZxS4E/JBzRL4T4soswoe7zo/xxn6Thy6l942mLRTfkmmZ85yRF5Dby8p
 YPI0fiENGITkchh6h5z9C5KO0so6qgm8FxzazPGL+iQIp+of8vV0ag8yEsCIdfVvYlr35IjMOyw
 tINUoiw/yg2+Ns2TmzzGpp4vLimXRan2b2l7KrGP2J1BrXKw48fz3JHtIHk+MqY87iWJO95sVO5
 6PvhmperArss2Ig/63pDBjT+cHVUeLRL2F2KZWa2TJcY0kEgH05iVunW5GmyueDW1byjuxzFGlm
 0RsX0ky/C1N8BN9DdTG9dBRBT48K0J32qT7N4fIaQ2sT9SDSWeRQgkdHnG/QD8snoGvRRBni+hb
 btRzEUl7r2aXcxHgebXIEbSUASpFRZceQLPUR+UUMnlp85LKUE1hxavDm/YCkzKYVkfFur/BzSk
 TeadfG6GXzMDGjHUkCaxczGhIUAfJyBHs7O6SBmbfC0DoxBFr4ZJXJKdDnl/GGE+gwI4Y=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

To allow to bump debian and fedora versions for build testing we need
reliable base container. Containers provided by
registry.freedesktop.org/wayland/ci-templates/buildah are quite old and
have multiple issues when used with newer OS versions.
Instead of relying on them or some other random registry let's take
bare buildah from reliable source and add required tools to it.
Base image will be built only if Dockerfile.build-buildah
is changed. Alternatively building can be enforced from gitlab:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .gitlab-ci.yml           | 32 +++++++++++++++++++++++++++-----
 Dockerfile.build-buildah |  3 +++
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1aff5cb000555bb3995634d814c7074488e2567e..ab6968b549d0026869fe38f063f60f57b5e9d75c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -2,6 +2,7 @@ image: $CI_REGISTRY/$CI_PROJECT_PATH/build-fedora:commit-$CI_COMMIT_SHA
 variables:
   BUILDAH_FORMAT: docker
   BUILDAH_ISOLATION: chroot
+  BUILD_CONTAINERS_IMAGE: $CI_REGISTRY/$CI_PROJECT_PATH/build-buildah:latest
   MESON_OPTIONS: >
     -Dlibdrm_drivers=intel,nouveau,amdgpu
     -Doverlay=enabled
@@ -14,17 +15,38 @@ variables:
   LANG: "C.UTF-8"
 
 stages:
+  - build-base
   - build-containers
   - build
   - test
   - containers
   - deploy
 
+############### BUILD BASE CONTAINER #####################
+
+build-base:build-buildah:
+  stage: build-base
+  image: quay.io/buildah/stable
+  rules:
+    - if: $CI_PIPELINE_SOURCE == "push"
+      changes:
+        - Dockerfile.build-buildah
+  script:
+    - buildah bud --squash -t $BUILD_CONTAINERS_IMAGE -f Dockerfile.build-buildah .
+    - buildah push --creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD $BUILD_CONTAINERS_IMAGE docker://$BUILD_CONTAINERS_IMAGE
+
+build-base:build-buildah-manual:
+  extends: build-base:build-buildah
+  when: manual
+  rules:
+    - when: manual
+    - allow_failure: true
+
 ################# BUILD CONTAINERS #######################
 
 build-containers:build-debian:
   stage: build-containers
-  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  image: $BUILD_CONTAINERS_IMAGE
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-minimal build-debian-minimal
@@ -32,21 +54,21 @@ build-containers:build-debian:
 
 build-containers:build-debian-armhf:
   stage: build-containers
-  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  image: $BUILD_CONTAINERS_IMAGE
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-armhf build-debian-armhf
 
 build-containers:build-debian-arm64:
   stage: build-containers
-  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  image: $BUILD_CONTAINERS_IMAGE
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
 
 build-containers:build-fedora:
   stage: build-containers
-  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  image: $BUILD_CONTAINERS_IMAGE
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-fedora build-fedora
@@ -235,7 +257,7 @@ pages:
 
 containers:igt:
   stage: containers
-  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
+  image: $BUILD_CONTAINERS_IMAGE
   dependencies:
     - build:tests-fedora
   variables:
diff --git a/Dockerfile.build-buildah b/Dockerfile.build-buildah
new file mode 100644
index 0000000000000000000000000000000000000000..94623c2ef50aca330decddf75a1104c539904610
--- /dev/null
+++ b/Dockerfile.build-buildah
@@ -0,0 +1,3 @@
+FROM quay.io/buildah/stable
+
+RUN dnf install -y podman skopeo

-- 
2.43.0

