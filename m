Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF02C71143
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A016710E7EA;
	Thu, 12 Jun 2025 11:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIa7XXRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3B210E7E9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729459; x=1781265459;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bi2aSV2VaQeov9J97EuexquhJC+oJ97eqzilq5ZoRoA=;
 b=kIa7XXRm8Z62EzNsiTeAmILXwFBm20hOqO6lWhk1t1HcX1iyioZ/Fnmc
 x9zk7eNuRERqPflrwsz3bHlsYzl2tuDJ/ledHh5p01z6qf1NRj1vxuwsg
 +L6OXdQrWdr8wD9Sc3Zj8XMXtGnhy3VIidaetP1+vB5EPUqs8C4HsShKw
 wDiz7eD3LKUbEmo1snKRsamakGEkL5p29PUgj7mllWzAvsp2Bb/wzgQ0W
 rqJbGuSCJB+JTl2SLpv0a+vZUrMi2dq4Qf1lPKKnTMMf7gzAei173Tndg
 5grbTkfQpm3eR5xhAQekiaHLCrmVC0vMOLOZYLXleXhdhHtJg6GAOEj58 A==;
X-CSE-ConnectionGUID: yGIqQ+GBSae9s10aia/Fvg==
X-CSE-MsgGUID: VWjhXKJcSEmg1KecTGfusg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343054"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:39 -0700
X-CSE-ConnectionGUID: 7NuZjEmhQiOmpP/rI3ZhPw==
X-CSE-MsgGUID: O0Gg/lqNTJ2iLu1VfvZqiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644820"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:37 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 13:56:27 +0200
Subject: [PATCH v3 2/6] Dockerfile: remove MIPS architecture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v3-2-78ceb39a71b1@intel.com>
References: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=bi2aSV2VaQeov9J97EuexquhJC+oJ97eqzilq5ZoRoA=;
 b=kA0DAAoBI2Kyk94Q/dcByyZiAGhKwH2hgRW3zqTAO6rVvix7EY4+MjjUfdoI0Z1Gy7Ot1To/7
 YkBswQAAQoAHRYhBPyoRDE03b9d4X8DTSNispPeEP3XBQJoSsB9AAoJECNispPeEP3Xb9AL/iRz
 HAno09GHkefBhAR0KeK1NefrzxXozwwnqXZkI4NEtj5NootgvaOknEt594D5/Ahvj+9/TLN4iEV
 IL+1WJnhuKZSniZtP7+DaWjiXvTehpzGuUpm3ydiKn7b6X1J1/aHHr0F/gYss5BPNAGauBNqRyl
 S85kRSzNU+0/a076unwMzH2Z91qt9xPIhBBBCU9PZpYPW7AL3gBLxsUNa4Pq5cmB0lXYqGQM24r
 ULbc4ijE9hDnWz24Rfu2Ys3VPleziMtNGuUl3h88CoQvGP03qshYOXGfupb08HUWhGzSVM1j+sP
 BEU+BiYVRZxEc4S5mqFJdfsyMvYcxosMG8MLRGlSjZeKFRSlMOkyFYB71LyonNoDsLOtR0hzb2H
 WtfkwBHLO2L1Vw0TyL6tQbFZXWz14J8nUfWISWQ2R06bgVQF3FaUfLwm04U6xzS8yBwOr1bf9O1
 f+454lLGW4F2QeK4ByYV6C4u4G/eyDayuUhIIRktVuI0pKwNTBLH9Zv7HgUw==
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

MIPS is no longer supported by gitlab-ci.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 Dockerfile.build-debian-mips | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
deleted file mode 100644
index 9b7c0a5b4703e8dd9461406731af248b050a0a2b..0000000000000000000000000000000000000000
--- a/Dockerfile.build-debian-mips
+++ /dev/null
@@ -1,39 +0,0 @@
-FROM debian:buster
-
-RUN apt-get update
-RUN apt-get install -y \
-			flex \
-			bison \
-			pkg-config \
-			x11proto-dri2-dev \
-			python-docutils \
-			valgrind \
-			peg
-
-RUN dpkg --add-architecture mips
-RUN apt-get update
-RUN apt-get install -y \
-			gcc-mips-linux-gnu \
-			libatomic1:mips \
-			libpciaccess-dev:mips \
-			libkmod-dev:mips \
-			libprocps-dev:mips \
-			libunwind-dev:mips \
-			libdw-dev:mips \
-			zlib1g-dev:mips \
-			liblzma-dev:mips \
-			libcairo-dev:mips \
-			libpixman-1-dev:mips \
-			libudev-dev:mips \
-			libgsl-dev:mips \
-			libasound2-dev:mips \
-			libjson-c-dev:mips \
-			libcurl4-openssl-dev:mips \
-			libxrandr-dev:mips \
-			libxv-dev:mips \
-			meson \
-			libdrm-dev:mips \
-			qemu-user \
-			qemu-user-static
-
-RUN apt-get clean

-- 
2.43.0

