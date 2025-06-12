Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4402C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAFB10E7E7;
	Thu, 12 Jun 2025 11:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBMCn2JC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9D010E7E5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729458; x=1781265458;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=07eQo8/NZ6yd1mqjuNz4LipXbdWY389Rwzl1zJeAk7A=;
 b=LBMCn2JCG3NlFhj7mSliv/7GIbE6M3R/CHYS9G1IGbh/5LUutW3y63Ol
 ZlUze/gzoxnvKkbmNelI+y+Y5cH7A8vNgkq9afDYBX7OrccCgkzyDjGMF
 kEFRmh5vhyurXKS3L4zw+yyjH2m5+oOam6ZBbeTUVfCQWwePpphHvY81l
 q1rJ1TqrSr5GzEvPaEpTmzm8/N7XWJZbTDRLhPP0vrYztVuQE13RQ2C8q
 qivmWaS4EtGH2anas3TJDy3QoQHyadBr5qQikrDF+AGG5hdwxrqR2SwuB
 HZKsalEKqdofEL/BDizMTuSKQxyZFJn6urvnjbdqW++2aiHSK/3srlZ/J g==;
X-CSE-ConnectionGUID: iZPwXUVZRxu3sLovTDfRFA==
X-CSE-MsgGUID: 8REAg9k7SN6YKOTtTn+uiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343051"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:38 -0700
X-CSE-ConnectionGUID: 7o4gyu3YSrOqruQTKknaOw==
X-CSE-MsgGUID: fFBn4qVuSU2mejGemg4l4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644806"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:36 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 13:56:26 +0200
Subject: [PATCH v3 1/6] gitlab-ci: create own base buildah image instead of
 wayland's
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v3-1-78ceb39a71b1@intel.com>
References: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4240;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=07eQo8/NZ6yd1mqjuNz4LipXbdWY389Rwzl1zJeAk7A=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSsB9PDQwVZJ6ES5xMVBP5tIVb/3s21wi4lZ+t
 2GsVCMP8TSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErAfQAKCRAjYrKT3hD9
 102MDACnn5i6gSQ+e8AekflAc9v82E+rgVgdsQwfMP4q87m4tVUr1JgTKvMjyc/AP3+yVSRx463
 9UjnGVj/91mAUJk/0HFpVjxZooCxQB4HHeIoM19BxMwO0u10mSretZlhT6j7xxLC53yJ9C/usJL
 ynSQxSEcO8g4ZcuhTU/Sn02AcBwcwt0RR5xuGfRGBPAkkUtZkk/B3XiFHhh022c7cTM6XFAUzSN
 0ux4qhAhMKWZLtH7EzA7JAbZ5MKsqoBnA2LhDqCG7zpT4wph9c7uw2qKfRG2rbqxkYV4UGcdnb/
 i8LXiBHbsxo52ZmkGHZitTMN+1GBwKEO1D8xhaITx5EfGWdhj8qoe5cikTyhpAYTmBhbia6wbCm
 5DnYh4pqbr4txsDBsPHxG7FigFwF1jzvKQaUdeffmrLl2WvSs35PFeQ2DnVQBVCVoY/Ql397nx0
 ruU0IWOi98+hHvw/8IX59KKKwNJULYxYjzWARBI/tMojBTu38250MzzFpQFLWGK/r9Kho=
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

