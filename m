Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BA2C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461410E467;
	Wed, 16 Sep 2026 11:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSQJ9ydo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8F410E69C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557552; x=1821093552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7CbVCd49bEhk77srCl6ixDr93KFPhT9Fuboq5dfrtE=;
 b=mSQJ9ydolzq/g9A/Spsjxe0PapxjCgmKDBtVmkVmu9+j7Vh/QgN8/kP7
 j1IBv9Shh9NNBI8npJmRYtuyFKQJkl4nhhoFtUk6YNfKSp9q13pvjOY8u
 EDWC7vTI6OtL/qkR+dOr0HQFqkWBzSizSPbfod/iq63zdSg238YcGL2zx
 SVTDgs+DjpkZqOARpChcEhSS8TIYnvT7RDAZB1Al4WRRfPIkKnIZusNoQ
 ankt40AcEbLxNJWDblLKnmyAQh+3Obyopdu/2Pufe0mQG1wXXBEJ0I/et
 8EuuGugSRBmFJ9o3ae5d6mn4HpgpNCx7G1XbYEMiCXFpfqs8fEWA5LGRW Q==;
X-CSE-ConnectionGUID: zpCdhZwVQ0i7ikx5iAFGdQ==
X-CSE-MsgGUID: qin5NRpFRfKlL+9jO54oow==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="441056"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="441056"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:12 -0700
X-CSE-ConnectionGUID: RxRlUZgoT0my3mQdV9mcLQ==
X-CSE-MsgGUID: DtBQJWHNRtaNwDFhTX+dcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296802279"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] Dockerfile: remove libproc packages
Date: Wed, 16 Sep 2026 13:19:00 +0200
Message-ID: <20260916111902.73626-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
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

Since commit 88bd72575499 ("lib: replace libprocps/libproc2
with /proc-based process enumeration") there is no need for
linking these libs, so remove them from dockerfiles.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-debian-arm64   | 1 -
 Dockerfile.build-debian-armhf   | 1 -
 Dockerfile.build-debian-minimal | 1 -
 Dockerfile.build-fedora         | 1 -
 4 files changed, 4 deletions(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index e51ddca20..11f584793 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -17,7 +17,6 @@ RUN apt-get install -y \
 			libatomic1:arm64 \
 			libpciaccess-dev:arm64 \
 			libkmod-dev:arm64 \
-			libprocps-dev:arm64 \
 			libunwind-dev:arm64 \
 			libdw-dev:arm64 \
 			zlib1g-dev:arm64 \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index a7ad7aaa5..9d624d3da 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -17,7 +17,6 @@ RUN apt-get install -y \
 			libatomic1:armhf \
 			libpciaccess-dev:armhf \
 			libkmod-dev:armhf \
-			libprocps-dev:armhf \
 			libunwind-dev:armhf \
 			libdw-dev:armhf \
 			zlib1g-dev:armhf \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 808d2e32e..d8ceb1a26 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -9,7 +9,6 @@ RUN apt-get install -y \
 			libatomic1 \
 			libpciaccess-dev \
 			libkmod-dev \
-			libprocps-dev \
 			libdw-dev \
 			zlib1g-dev \
 			liblzma-dev \
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index bae85a584..30791faef 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -6,7 +6,6 @@ RUN dnf install -y \
 	'pkgconfig(libdrm)' \
 	'pkgconfig(pciaccess)' \
 	'pkgconfig(libkmod)' \
-	'pkgconfig(libproc2)' \
 	'pkgconfig(libunwind)' \
 	'pkgconfig(libdw)' \
 	'pkgconfig(pixman-1)' \
-- 
2.55.0

