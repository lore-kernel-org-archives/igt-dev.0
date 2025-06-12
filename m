Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5306BC71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0611C10E830;
	Thu, 12 Jun 2025 12:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anmyfize";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC1210E82A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731484; x=1781267484;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=07eQo8/NZ6yd1mqjuNz4LipXbdWY389Rwzl1zJeAk7A=;
 b=anmyfizepj8tHk86ijurUw2amm91UrLIt/dVMShjAYQxjUw8nRHHq8dE
 qtREBlkGJykHzfGqxDthNZF6GukPuJAwWN9EJjc/OAfdK/c7IAd1b7MVX
 91LTsbG9qUdfoJ+KEEsv/uEhxYlAcSAZu0IRQ7IHKp2d6uohUwtrG6mK3
 iQ50dJjzqQ/uzNSr0pDZjwTtDDbf9nqE+sNFhQK9iFAIX4fXK2pFuyOwT
 gzV5qqTDwp8RDEa33ju8StLz34tApHckWx/m+C4LG2hiNiienLockHtaO
 DRva5tww6CXiGdi+aChdLOHqPz760x0SsP94+hHuN3MfTCm0Nlf9ucsfS w==;
X-CSE-ConnectionGUID: M+YCKrf7Tn2xFgoKurpewg==
X-CSE-MsgGUID: bAJrV7j/TxmFNVt9pW3Qeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51777771"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51777771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:23 -0700
X-CSE-ConnectionGUID: 1OjgoQK8RH+Qkc8AceIZrw==
X-CSE-MsgGUID: yI2qzuE1Q5GVD2JEzpDytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148061581"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:16 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 14:30:12 +0200
Subject: [PATCH v4 1/6] gitlab-ci: create own base buildah image instead of
 wayland's
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v4-1-10d18745c7d4@intel.com>
References: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4240;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=07eQo8/NZ6yd1mqjuNz4LipXbdWY389Rwzl1zJeAk7A=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSshh8av8OPWIU+WZlUrps0STUYPUQFpNuWPr1
 haSjDgSBt2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErIYQAKCRAjYrKT3hD9
 1x5SDACTBIy/Lj93bnRXb4cjfTp0wMOOH1XspdgRZMHGINZTh4xnmhgKzAh1pFB5ePOsp2my4me
 EeG0sUuG68Y7e7S/h8LZh5nQkxwwy7ZHy1kK2U2dxsW0VDhbLAGvr/uosHzMhMrRRLRmtCMlyfz
 qnA6ttM0o//mUOJeIeG7nI1sbIZmIH/rzfqu4p8KtJVQSKe0bogjEx44phtj79D8HkCXbFhsg8k
 hqezaNi8KPjGBtAvcxtpn//iR2TApxdz4GiGxmSIV5MmABUFFKhSqC6umOglCIsLdBDPStN9prw
 3LTVGFK3aJPRcgXe29rbdgXSYNeSepHzdLtHX248OACWQne4tYMZPwiEQjfgmSxr9wF93OpYzu/
 MPiCOKK2/IpR+api99SCYF9uzv+1CCT7qELVkQeQ5p6+0K+vBOOfcXS70JJPpN6MC4CSFv6vshT
 kO6IqF6ee1fE6xkwhh57AZxFP04a58t1anSHURwPAyP3+7HBf86nTgKdE4K7RLYpAxb7c=
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
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
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

