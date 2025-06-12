Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF8CC71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ECE10E7EE;
	Thu, 12 Jun 2025 11:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtFm1krn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460EE10E7F0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729466; x=1781265466;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=U5qEZWirPwohNg9HUdlQtgE6U0gClTCREJcZViNTb98=;
 b=UtFm1krnCwJz8rYewZ5oHhy6EMdjAQmJ86Ob9KzszKa4BIokhsin0TfH
 QV+sFEi9jbG74OD2ue7lQB+5YOl/7XUGsvgzrvyMZ7DvgG47Ptwed26RT
 Kr59hmp9dCokOeEwX+X86LUhkfFJNT2pxs05ogYMrdqdYY5/ojsaURWwc
 rmweidD8cCHP5Wdq+4BgkiIgiYofJ7iB0gHYTzZ3PG2zNuhOsWVRRaaOu
 Ip+O3NP2DkdOUqYVeLmyETagEz10TlTjaFK5nkaTRUuqeroXXbAsRkjr4
 McKiVhY1MEjlIKU/KrzM7sm7URVRA+VNsav94N4Ft3XuGvR0/vZUluwzH Q==;
X-CSE-ConnectionGUID: g2LjmYmQQBSq3Zkih46Biw==
X-CSE-MsgGUID: HhecNPMJRYuZP1wK9uciWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343066"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:46 -0700
X-CSE-ConnectionGUID: 4o46rPtKSw6g+5eHu68Y+g==
X-CSE-MsgGUID: nxVhViXoS6+TZ697+Yr50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644894"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:44 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 13:56:31 +0200
Subject: [PATCH v3 6/6] gitlab-ci: remove podman login
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v3-6-78ceb39a71b1@intel.com>
References: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=U5qEZWirPwohNg9HUdlQtgE6U0gClTCREJcZViNTb98=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSsB/Hs5hobhsslsaLeI/lC1PH09sQPIQKCIDg
 AzJacJ1aaWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErAfwAKCRAjYrKT3hD9
 15OgDACVAOQaf0fKjOKfU8IZDlk0qPki01KkGJtcbD+HTuhxM3PQTnyfO+cxoS5ne9O6MClMbkI
 IfNZIAGa8PaoVDMI16rAeVvyPGT6fMuBKUdA1k1wUhLFVy+XZsTycCO3WwU4ZiY+NH6JeySpZ2t
 QPi7kn4CTNKqaI4Q+4Zq3FjR7HrbEwG08gQa44f6XumumZd3CcqPndweZV5MDIEgHleM5hPGI9a
 L6g44PtNHe1qUy5Y6OFpRhprD0/ep0pvk8TXcmQcAv5U2qkxejqPw8LrBDO7WDOUy+HANKDhFvN
 8sny6NfGjyolOqByKntCMCRKaS1bXkogOG2OQI0tt2xiJgDUS4qStiS1T4/OXxJCDAES3YCofyM
 fjkNnwbsouPEuanX8PcL5nKAN+pDAmyYSlIr394hBfJ6dmMrwx6NmkZIDBr7xGyqLIV06gBk8W6
 Rsn0FIpcbJIt1s6jYRhxpzyTzx4Ixhl/1BRHYobj3ftI8Do6KLOp7sSMwpHBobfC3d13M=
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

