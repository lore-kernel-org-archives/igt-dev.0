Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B06606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTeDd+xB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEF7112D14;
	Fri,  6 Nov 2026 11:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C68112D14
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793963394; x=1825499394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/D1S0wQ3r7k7tyM7Fk1/q/hli/EYi4NjRIIpX8AZo0=;
 b=NTeDd+xBC0/h1EJ62av6sf1oUwt3KDjh2F+nXm5L00YPBiOUJJlOKSa+
 yxWN+OJUiRl/PA+NDaS6hwrOjX2B/NGbHBq9q3pYMKdd8gyRoEafjdKEh
 Mrvmxw4INJt8P3iWvnUNPnthASf92UV6bks12ncbtzJ85G0xgMtI0FTmD
 c/I0eIEMa8pnWcqTYV/DeHys8tIsuLKhbTNXrsg7sambZlNaDRzpwMMS9
 JVif7PRCmHSoAWAlbwd2betF+n80b7ytetgUittoVsbvaP4QRzaFNuDS0
 KkEGYmR9S/SpI+dOsRepr2G08beJ78AQ9KkljErjVbFFqOMlWlEnlYh2m Q==;
X-CSE-ConnectionGUID: mTI8Ps1zRg+qVO1tBcvKWg==
X-CSE-MsgGUID: c+rY7VU5QK+afX/XwR6E8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2778428"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2778428"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:09:54 -0800
X-CSE-ConnectionGUID: cqbqsORzTYaqtRxp+M9wEA==
X-CSE-MsgGUID: B76VXC/GQdCehmNddPoijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7303162"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:09:52 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Maslak <jan.maslak@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v3 1/2] Dockerfile: Add libzstd build dependency
Date: Fri,  6 Nov 2026 12:09:38 +0100
Message-ID: <20261106110939.2697038-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106110939.2697038-1-jan.maslak@intel.com>
References: <20261106110939.2697038-1-jan.maslak@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Install the libzstd development packages in the Debian and Fedora build
images for the upcoming xe_exec_capture coredump decode validation tests.
Those tests need libzstd to decode compressed devcoredump blobs.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Dockerfile.build-debian-arm64   | 1 +
 Dockerfile.build-debian-armhf   | 1 +
 Dockerfile.build-debian-minimal | 1 +
 Dockerfile.build-fedora         | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index d46bdb150b..114b9760d1 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -20,6 +20,7 @@ RUN apt-get install -y \
 			libunwind-dev:arm64 \
 			libdw-dev:arm64 \
 			zlib1g-dev:arm64 \
+			libzstd-dev:arm64 \
 			liblzma-dev:arm64 \
 			libcairo-dev:arm64 \
 			libpci-dev:arm64 \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 847cc74240..c6527ea1eb 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -20,6 +20,7 @@ RUN apt-get install -y \
 			libunwind-dev:armhf \
 			libdw-dev:armhf \
 			zlib1g-dev:armhf \
+			libzstd-dev:armhf \
 			liblzma-dev:armhf \
 			libcairo-dev:armhf \
 			libpci-dev:armhf \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index ad58aa70ea..573bb5139c 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -11,6 +11,7 @@ RUN apt-get install -y \
 			libkmod-dev \
 			libdw-dev \
 			zlib1g-dev \
+			libzstd-dev \
 			liblzma-dev \
 			libcairo-dev \
 			libpci-dev \
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index a65f1030d1..aacc6a87c8 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -8,6 +8,7 @@ RUN dnf install -y \
 	'pkgconfig(libkmod)' \
 	'pkgconfig(libunwind)' \
 	'pkgconfig(libdw)' \
+	'pkgconfig(libzstd)' \
 	'pkgconfig(pixman-1)' \
 	'pkgconfig(valgrind)' \
 	'pkgconfig(cairo)' \
-- 
2.43.0

