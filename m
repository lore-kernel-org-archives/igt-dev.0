Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD2C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 12:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC6910E7CF;
	Thu,  5 Jun 2025 12:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fT9/wYpt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895A510E7CF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749126981; x=1780662981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S7UFsdPoQwAYhZcacOWvXlUdHJD3QNcGW0rJPU1x+po=;
 b=fT9/wYptkAYlQV025pFy9w8+SC3Ux0QAUBXF8MFOP+oPbq+yegK1SO3v
 FhUqAj/QxNkLi89UYVGNU57ORoVPWimmjcb3q/KWH3AfEzo1Qdv7R7CKL
 iqlywDEqyXhBmi5fN9MyZR7CjbKaMBKuZhqQG4U4iCydHOyDvN+0wKkBO
 puAv6hzuuFo4DsxXyr9QU3uFylcQ4VhGwYHOr3g9b1JcZLUl5UwIOgKju
 FOprAo4WfCxPIxHpcWe5wk0ZXONX3xP6dc4lI22qbb/nmeSJOAggziXqU
 xMKql9ka4zH6MPQQ+p1vvMdMzmc5EUWdIapPL0Pz11T4/YVSBYSloq4AE Q==;
X-CSE-ConnectionGUID: 3V+lV5z+Qcy/FRxMuuEnVg==
X-CSE-MsgGUID: fzSOSKoKQPmuDJeuA9nNbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="76641782"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="76641782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:36:21 -0700
X-CSE-ConnectionGUID: OJlhxEWASOKnB7r/N9TXZA==
X-CSE-MsgGUID: Evd4r3vkSa+vnqCpAQW9cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176454899"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:36:19 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <dragoon@dragonic.eu>, Petri Latvala <adrinael@adrinael.net>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] gitlab-ci: Remove MIPS
Date: Thu,  5 Jun 2025 14:36:10 +0200
Message-ID: <20250605123610.55595-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

MIPS testing was commented out years ago and it does not look
like it is coming back, so just nuke it.

Also Debian dropped mipsel (MIPS little-endian) port few years
ago so remove it completely from pipeline.

v2: removed also building and compilation (Kamil)

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Ryszard Knop <dragoon@dragonic.eu>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Ryszard Knop <dragoon@dragonic.eu>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci.yml | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6c076dba..1aff5cb00 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -44,13 +44,6 @@ build-containers:build-debian-arm64:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
 
-build-containers:build-debian-mips:
-  stage: build-containers
-  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
-  script:
-    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
-    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
-
 build-containers:build-fedora:
   stage: build-containers
   image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
@@ -150,17 +143,6 @@ build:tests-debian-meson-arm64:
     paths:
       - build
 
-build:tests-debian-meson-mips:
-  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
-  stage: build
-  script:
-    - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
-    - meson --cross-file meson-cross-mips.txt build
-    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
-  artifacts:
-    paths:
-      - build
-
 #################### TEST ##########################
 
 test:ninja-test:
@@ -218,22 +200,6 @@ test:ninja-test-minimal:
 #       - build
 #     when: on_failure
 
-# mips testing temporarily disabled
-# test:ninja-test-mips:
-#   retry: 2
-#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
-#   dependencies:
-#     - build:tests-debian-meson-mips
-#   stage: test
-#   script:
-#     - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
-#     - env > build/envdump.txt
-#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
-#   artifacts:
-#     paths:
-#       - build
-#     when: on_failure
-
 test:list-undocumented-tests:
   dependencies:
     - build:tests-fedora
-- 
2.49.0

