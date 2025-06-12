Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53310C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0F910E82A;
	Thu, 12 Jun 2025 12:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmqAja38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C95810E82A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731563; x=1781267563;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=U5qEZWirPwohNg9HUdlQtgE6U0gClTCREJcZViNTb98=;
 b=XmqAja38DQ3pxM8e70v+fNMh3DSF2exkXFLbzL1h5mO8GrtymYyYcd5i
 VrbCprpxpFzpVsK9UHQC+faDtpjL4Cq2/c9MYb7DWWtjgUTJpwIuvHj8g
 Mv/GrF452pdaqsE3pLJM1b6FNQFp6NJfUTllc9pAI8ozYcnHfl5D9nzlO
 5D8u6m18m6Pqu44IS+htw12cj53SrenocO4XD6O6MEtxkfzkLalNorgPr
 3uANob9Hcabi3ll+riGiGN7OVoXaCEOqMDuW+xX7pralFvecjYUO/chSX
 VRNE+csskJfpPF4tf5b4ySJn+XQ2nkaJLtmt6tOfE4CyXslE3WrXx9VJA g==;
X-CSE-ConnectionGUID: uwDVDS9JTaWi5WP+U3lI3w==
X-CSE-MsgGUID: i3vCGO1bR4WVJiLrHgzb9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51777820"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51777820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:39 -0700
X-CSE-ConnectionGUID: nxvI8BJsR8CX/NsAzYFrOw==
X-CSE-MsgGUID: Y2xN1uv/Rhi7d4kzMPRwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148061607"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:25 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 14:30:17 +0200
Subject: [PATCH v4 6/6] gitlab-ci: remove podman login
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v4-6-10d18745c7d4@intel.com>
References: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=U5qEZWirPwohNg9HUdlQtgE6U0gClTCREJcZViNTb98=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSshjkSrWzZXgk0jXUYqNCUVlcpIMr9dDO67X5
 B8AcXVZcu2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErIYwAKCRAjYrKT3hD9
 12ssC/40JbKAMvc/WQFsXZmFEepL01z6LYATVDUDEYbc+u4gRU1deFtepPFHvX08a6tDec2wnbd
 08iWXBiNZnz2g9tGq9A6jNEWAm9HO8/QInXc7qrlLY2Z2t+HNDO3JXfdbBlsx9fn9mQ2cjKdmsF
 7wdUx7G/dooUWezglQ4zm3p7sAHed4vGad+yjKD/blB6LZiPGGebpVyS8Imd/tHB1laIYUV2qSZ
 0dbhB7WKghWpQf/Ls0nSbqpZbW6xqIjnY3IqkTtFmqQcixkTrsy4dg3HlbK2v+RVbM7QCFUGQNc
 2zabfiim4a0nB/xAAQcoWrJLk2GTKt5vKMvZhSUM8zQueW9IP1r06HpfjT08DDtseDENeCeh+FS
 1XSIVAMknmk0tDiSJTyfbO+iVc604/S3xsFVTT0josBYPavj+zpUpFWYk1YGfO6+xNiclJCglAv
 CtzHnIkA9Q6IcAjLSwLmha3oyVJODUtuzFKmiwbtqjQOAO5mNLKW2CrUZNsEIXgKKDS7M=
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
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
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

