Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11842C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B793310E7EB;
	Thu, 12 Jun 2025 11:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHWym5+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4A310E7EB
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729461; x=1781265461;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=SgC2cX6ZuCMHtLAyItJ3HIuhZyNJXdR7DPAcQv0j7WA=;
 b=EHWym5+lTrbwbn9hXCFjH3xlNlHpxD9Yt+PoW88hqqnOtaYGlD6CvMAZ
 XmQqXSTGv/5Ri9Nwtoq3kqwnbS+DQ0Fq3XdpW6HfxktVz1Hrvmo8MpnrJ
 6Ef3qCQ5dK5nb/t06XykZhjOcCtDGlBmPSqUyZMUVXvWOCaS3f+Qj4qG+
 A3rlXjsuFGBQDV3l/5AQGnzR/OuFB+GWDUmykTlFLJCrd6K6f1+OFmn6b
 CMGQ/5Z3WAi2DOabFBqCP1LaGcudenzylAeEND4Z8EAG/4wzimJTzK6lp
 iOo2usm8O0EheLjRXhpE+mTJu/N9Zp/g5cWG5KujrtT73cKPKHeUJRoX4 Q==;
X-CSE-ConnectionGUID: ykU8oMFSSrSBuAxs/M30sw==
X-CSE-MsgGUID: xPFHOEDMRueW3TWY1DmE8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343057"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:41 -0700
X-CSE-ConnectionGUID: XwelKOpPT9OqlH/87Umu/g==
X-CSE-MsgGUID: jPWjhNaxTFSB1e2Eity1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644838"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:39 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 13:56:28 +0200
Subject: [PATCH v3 3/6] Dockerfile: bump debian version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v3-3-78ceb39a71b1@intel.com>
References: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2431;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=SgC2cX6ZuCMHtLAyItJ3HIuhZyNJXdR7DPAcQv0j7WA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSsB+9U0//pn2W6uqeyU4mL1uA37ChiWAmtvgR
 IhenedqcVSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErAfgAKCRAjYrKT3hD9
 196KDACXj4mOLV5ZmmSx+7MH/D0JEVG2GqMijT7RVWmtB40Qs/6prtT0Koz5hxGScGEcpM8t7Gf
 Xy9Bf18I60iSt95BXPT22Cu/xcr9Jo8prYzp5OJbtUZ3ELj3lK6mgpsxdwb2A8j6J4CFrR2Xekz
 gYJruOnmWKNrhySSJ5Ueh+LzUkM+u0nXM330edV3UjES8lg+A1QQwfqHUxiBkpVFEeh/c98IiZw
 9asdRebhmv+Bf1n0qrZDYqFp7z/mrxdSIeWEIs+vVPjI5GUK4jywCth+CprgLRRJafEbO9bJVKR
 xnDZzcTaOhZH74/Cqz9//b66Gc+LuU+VgFGcc7yUvCz0SVYXZUApnRD5XiX6cPCNT8ltB/mPblP
 q/HIfiKgx69KbiNtsxgbS7bXPrQ63axqlrH+pmi+LQYpA8K8Zmnrh/tgIyKRBt+EwTwWFHwps1q
 59/ysjUgLJKnb9DJUkzbNOx80Y7oJJ2NCC2ojLQFilhcoSF94QTHZguMVY7TcUuMG0sBE=
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

Debian buster is already old and EOL. Replace
it with oldest but still supported release - bullseye.
It will allow to use more recent build tools.

v2: python-docutils -> python3-docutils, description

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Petri Latvala <adrinael@adrinael.net> #irc
---
 Dockerfile.build-debian         | 2 +-
 Dockerfile.build-debian-arm64   | 4 ++--
 Dockerfile.build-debian-armhf   | 4 ++--
 Dockerfile.build-debian-minimal | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index 454f4bce5e77339ddcd7db2d90a7944ddfe1b266..52d7c42d132509e3c22fc4af01629482d7fa46cd 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -15,7 +15,7 @@ RUN apt-get install -y \
 			libxmlrpc-core-c3-dev \
 			libjson-c-dev \
 			libcurl4-openssl-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg \
 			libdrm-intel1
diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 573c7096feb8da1789f2520e556109e358a351fa..cf0625ac725aa009173b9afe072a646a13402cb5 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 737ca3645f1ba37bd694f7bdf19c2a4d7293be72..58b5be82a4da8a72bd52dcf719daa1a7c958a354 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
@@ -6,7 +6,7 @@ RUN apt-get install -y \
 			bison \
 			pkg-config \
 			x11proto-dri2-dev \
-			python-docutils \
+			python3-docutils \
 			valgrind \
 			peg
 
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 64edf4b4313ee482b7b2c5212fe31f1021c9cccf..3850fb43e5cc3bc958663ca225bb6130ae947b76 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \

-- 
2.43.0

