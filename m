Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF7AC61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1068510E620;
	Wed, 11 Jun 2025 11:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5coH6za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D1B10E618
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640048; x=1781176048;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Df/14viIYUezxTh1auatXPRoKozYnjrtP/DZzB/7fLQ=;
 b=i5coH6zaT3OSDdE8XvriLTNfxWZZ0BO/uPIr/zrV9pi87nGFgm6GNdTh
 HZC+pMKAtdWg0hPvLtO/Zj3WwFfH6lNzBLQMViMxWJMJgI95w7HantHR7
 Jw3Wjyrdch7r7SW+c5r3yDNT7oZi42omeDuEmE8T0Je/bS9CAo06PjDvg
 JaZThBN1JDwqPahILQiFwiX/IoSyF/r48EUKotqAYnYROhX+kGiL7lFCJ
 UxlIKEWXTCPLg6JkP6m8mZMr6ow+P0heL1KRo6hKG2Z3D4+wtCDNDf8jb
 DUNhCvB8E7O/Dlol24BpO+lx3k4gWnQKQizaie+KR4l0fxa0cN5ffnao1 Q==;
X-CSE-ConnectionGUID: wHmZJSvXTqG1nYUuBtIPlA==
X-CSE-MsgGUID: wHf/gLysQAyj9UJXSTxNkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62057471"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62057471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:28 -0700
X-CSE-ConnectionGUID: ydzpa0J1Q9CHD4yLzRqK5g==
X-CSE-MsgGUID: lLha8oT9S8elFTDo5JG8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147015015"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:26 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 11 Jun 2025 13:06:40 +0200
Subject: [PATCH v2 5/5] CI: remove podman login
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-bump_docker_distros-v2-5-90791ecb953d@intel.com>
References: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Df/14viIYUezxTh1auatXPRoKozYnjrtP/DZzB/7fLQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSWNEEHCyFqVsZlijvCAtqCRMqhja4Sp3hYTUR
 /e/JDl+FKGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEljRAAKCRAjYrKT3hD9
 10T7C/wLpcGg5RaYHypUlOJ9H2ChCpKRmcLCcKUtvNhGfnckW9FTz6lqGWVvf6/VIUMOXzZcGo2
 yRXTXqQE/IQ2Gcc6RR2N9YKLn616xTY680Q28PCN432vsEFkORuYWwpArMMI6nky03EIVRBE4MN
 gfHSaG5JRS5qFHzRxR5LPmTycZnP/5ZfsreZpqPO7ZQ4LdCX+ruz4U+XZZEx57ru+5hg7S3JiER
 9Rg5z3VXB6SzVUDkoa9ZkB7r5o+4FoJVs4joEa5Jniyex93BySiUJ/NRoabkySGVAhiMTMbMxjj
 uc0htwp9fvQXloKOo3Q/Mf/LmMI3MJ2spHlJvSROZaHWvewq7QD4gB79YAfSLPfOO5L511SO1kv
 6HSs+g6eYe4l3/pIIvUFHZBiMVNDrMUIzIqzmKmDBekRMvb5rkT9Ri7sL+JdBt/m+wbdW3xPobf
 YHgIbJE183DdvfNRZzK3B7ulwu3n9xfJLM/gCmCJ5nGGXuYNRH804Tmd0OfoSjGLR6xR8=
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

"podman login" is issued for every container job even if it is usually
not required. Let's drop it in favor of credentials provided
to commands requiring it.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .gitlab-ci.yml                | 5 -----
 .gitlab-ci/pull-or-rebuild.sh | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ab6968b549d0026869fe38f063f60f57b5e9d75c..519edab5ff9c79eae0de71e71e3f3645431a1459 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -48,7 +48,6 @@ build-containers:build-debian:
   stage: build-containers
   image: $BUILD_CONTAINERS_IMAGE
   script:
-    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-minimal build-debian-minimal
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian build-debian
 
@@ -56,21 +55,18 @@ build-containers:build-debian-armhf:
   stage: build-containers
   image: $BUILD_CONTAINERS_IMAGE
   script:
-    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-armhf build-debian-armhf
 
 build-containers:build-debian-arm64:
   stage: build-containers
   image: $BUILD_CONTAINERS_IMAGE
   script:
-    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
 
 build-containers:build-fedora:
   stage: build-containers
   image: $BUILD_CONTAINERS_IMAGE
   script:
-    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-fedora build-fedora
 
 #################### BUILD #########################
@@ -263,5 +259,4 @@ containers:igt:
   variables:
     FORCE_REBUILD: 1
   script:
-    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh igt Dockerfile igt
diff --git a/.gitlab-ci/pull-or-rebuild.sh b/.gitlab-ci/pull-or-rebuild.sh
index 4f77431b52b06fd5971b47ea1aadcf0e85e4edad..aa1bddcde88d927a892501071dc848a36b2f2f85 100755
--- a/.gitlab-ci/pull-or-rebuild.sh
+++ b/.gitlab-ci/pull-or-rebuild.sh
@@ -47,7 +47,7 @@ if [ "$TYPE" = "base" ]; then
 	else
 		echo "Building!"
 		$PODMAN_BUILD --squash -t $DOCKERNAME -f $DOCKERFILE .
-		podman push $DOCKERNAME
+		podman push --creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD $DOCKERNAME
 	fi
 
 	skopeo copy --dest-creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD \
@@ -57,7 +57,7 @@ elif [ "$TYPE" = "igt" ]; then
 	# we always rebuild
 	set -e
 	$PODMAN_BUILD -t $COMMITNAME -f $DOCKERFILE .
-	podman push $COMMITNAME
+	podman push --creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD $COMMITNAME
 	skopeo copy --dest-creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD \
                docker://$COMMITNAME docker://$REFNAME
 else

-- 
2.43.0

