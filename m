Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B534ACCFA13
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 17:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8CE10E0B6;
	Wed, 29 Apr 2026 17:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReJpzdNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042DE10E2E5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777484654; x=1809020654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PMcwAG0coVDk58G3J2329d4XbJh7kuIaKuMYMDDpW4w=;
 b=ReJpzdNn3lKxrB18LiaCQiAZUJQuJ9m+7UMfuXAq+n50nT667f74OEtP
 aDjgn2EQ4SYaYsyxKC2QhvaFZADyezyte//Q6jRd65iJCtuIAhhb6MXPa
 9juSY2kmcFZG5svm7HI5k47NLljW0DSOibGSGRMFE34ZLoaUbAIOD4o5p
 kfz3hT8HSFsJYQfPisSQ4V2zoRhXSz2CB4yNNETd6Jp9TdOnAeFFAW4mj
 9lf1xPqSES+3ZBvy2tPs+oAMv0G7An7X1HzQxC3jEEt6fRPpXAKOh5hcQ
 +iFZE+RUtYyjT9k0gZU15IvUskRPJH5PSpX8oI6vRVKPXHZcY4OwHuUOU g==;
X-CSE-ConnectionGUID: GB0INHbXQKKQVwZpqWdm/Q==
X-CSE-MsgGUID: Vrk7Q4I7SOyFhcfQISBcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65950875"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="65950875"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:44:14 -0700
X-CSE-ConnectionGUID: etpiXHMTSRimo0Q5pghvRQ==
X-CSE-MsgGUID: njqWIdprRsuP/y9rhvkI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233309084"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 10:44:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t,
 v5 3/4] tests/intel/kms_frontbuffer_tracking: Add HDR feature support
Date: Wed, 29 Apr 2026 23:22:04 +0530
Message-Id: <20260429175205.2327206-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429175205.2327206-1-swati2.sharma@intel.com>
References: <20260429175205.2327206-1-swati2.sharma@intel.com>
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

Add FEATURE_HDR and extend feature_str() to cover all feature mask
combinations.

v2: -add documentation

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 585 ++++++++++++++++++++++++-
 1 file changed, 580 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199..273f1f584 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -66,12 +66,30 @@
  * SUBTEST: psr-%dp-rte
  * Description: Sanity test to enable PSR with %arg[1] panels.
  *
+ * SUBTEST: hdr-%dp-rte
+ * Description: Sanity test to enable PSR with %arg[1] panels.
+ *
  * SUBTEST: fbcdrrs-%dp-rte
  * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
  *
  * SUBTEST: fbcpsr-%dp-rte
  * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
  *
+ * SUBTEST: fbchdr-%dp-rte
+ * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
+ *
+ * SUBTEST: drrshdr-%dp-rte
+ * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
+ *
+ * SUBTEST: psrhdr-%dp-rte
+ * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
+ *
+ * SUBTEST: fbcdrrshdr-%dp-rte
+ * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
+ *
+ * SUBTEST: fbcpsrhdr-%dp-rte
+ * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels.
+ *
  * arg[1].values:   1, 2
  */
 
@@ -85,12 +103,30 @@
  * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
  * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -116,6 +152,10 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
@@ -124,6 +164,21 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -149,6 +204,10 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
@@ -157,6 +216,26 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -182,12 +261,30 @@
  * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -213,12 +310,30 @@
  * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
  * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -241,6 +356,10 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
@@ -249,6 +368,26 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -268,12 +407,30 @@
  * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * arg[1]:
  *
  * @cur:            Cursor plane
@@ -300,6 +457,10 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
@@ -308,6 +469,26 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * arg[1]:
  *
  * @cur:            Cursor plane
@@ -331,12 +512,30 @@
  * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
  * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
+ * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
  * arg[1]:
  *
  * @blt:            Blitter
@@ -357,6 +556,10 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
@@ -365,6 +568,26 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
  * arg[1]:
  *
  * @mmap-cpu:       MMAP-CPU
@@ -382,12 +605,30 @@
  * SUBTEST: psr-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
  *
+ * SUBTEST: hdr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
  * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
  *
  * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
  *
+ * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
  * arg[1].values:   1, 2
  */
 
@@ -401,12 +642,30 @@
  * SUBTEST: psr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  *
+ * SUBTEST: hdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
  * SUBTEST: fbcdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  *
  * SUBTEST: fbcpsr-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  *
+ * SUBTEST: fbchdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: drrshdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: psrhdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: fbcdrrshdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: fbcpsrhdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
  * arg[1]:
  *
  * @rgb101010:      FORMAT_RGB101010
@@ -434,6 +693,10 @@
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-%s-draw-%s
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
@@ -442,6 +705,26 @@
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: drrshdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: psrhdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
  * arg[1]:
  *
  * @rgb101010:      FORMAT_RGB101010
@@ -468,6 +751,18 @@
  *
  * SUBTEST: fbcpsr-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & PSR
+ *
+ * SUBTEST: drrshdr-slowdraw
+ * Description: Sleep a little bit between drawing operations with DRRS & HDR
+ *
+ * SUBTEST: psrhdr-slowdraw
+ * Description: Sleep a little bit between drawing operations with PSR & HDR
+ *
+ * SUBTEST: fbcdrrshdr-slowdraw
+ * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
+ *
+ * SUBTEST: fbcpsrhdr-slowdraw
+ * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
  */
 
 /**
@@ -480,12 +775,30 @@
  * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
  *
+ * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
  *
+ * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -510,12 +823,30 @@
  * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
  *
+ * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
  * Description: Just exercise page flips with the patterns we have
  *
+ * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -541,6 +872,18 @@
  * Description: Check if the hardware tracking works after page flips
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -559,12 +902,30 @@
  * SUBTEST: psr-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
  *
+ * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
  * Description: Just move the %arg[2] around
  *
+ * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -583,12 +944,30 @@
  * SUBTEST: psr-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
  *
+ * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
  * Description: Just move the %arg[1] around
  *
+ * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
  * arg[1]:
  *
  * @spr:            Sprite plane
@@ -605,12 +984,30 @@
  * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
  *
+ * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
  *
  * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[2] a few times
  *
+ * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -629,12 +1026,30 @@
  * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
  *
+ * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
  *
  * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
  * Description: Just enable and disable the %arg[1] a few times
  *
+ * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
  * arg[1]:
  *
  * @spr:            Sprite plane
@@ -651,12 +1066,30 @@
  * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
+ * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
  * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
  * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
+ * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
@@ -666,12 +1099,30 @@
  * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
+ * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
  * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
  * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
+ * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
  * arg[1].values:   1, 2
  */
 
@@ -685,12 +1136,30 @@
  * SUBTEST: psr-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
  *
+ * SUBTEST: hdr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
  * SUBTEST: fbcdrrs-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
  *
  * SUBTEST: fbcpsr-%s-scaledprimary
  * Description: Try different primary plane scaling strategies
  *
+ * SUBTEST: fbchdr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: drrshdr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: psrhdr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: fbcdrrshdr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: fbcpsrhdr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -707,11 +1176,29 @@
  * SUBTEST: psr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with PSR
  *
+ * SUBTEST: hdr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with HDR
+ *
  * SUBTEST: fbcdrrs-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
  *
  * SUBTEST: fbcpsr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
+ *
+ * SUBTEST: fbchdr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with FBC & HDR
+ *
+ * SUBTEST: drrshdr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
+ *
+ * SUBTEST: psrhdr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
+ *
+ * SUBTEST: fbcdrrshdr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
+ *
+ * SUBTEST: fbcpsrhdr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
  */
 
 /**
@@ -724,11 +1211,29 @@
  * SUBTEST: psr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of PSR
  *
+ * SUBTEST: hdr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR
+ *
  * SUBTEST: fbcdrrs-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
  *
  * SUBTEST: fbcpsr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
+ *
+ * SUBTEST: fbchdr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR
+ *
+ * SUBTEST: drrshdr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
+ *
+ * SUBTEST: psrhdr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
+ *
+ * SUBTEST: fbcdrrshdr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
+ *
+ * SUBTEST: fbcpsrhdr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
  */
 
 /**
@@ -744,6 +1249,10 @@
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  *
+ * SUBTEST: hdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
  * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
@@ -751,6 +1260,26 @@
  * SUBTEST: fbcpsr-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
+ *
+ * SUBTEST: fbchdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: drrshdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: psrhdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
  */
 
 /**
@@ -762,6 +1291,15 @@
  *
  * SUBTEST: fbcpsr-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
+ *
+ * SUBTEST: fbchdr-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ *
+ * SUBTEST: fbcdrrshdr-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ *
+ * SUBTEST: fbcpsrhdr-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
  */
 
 /**
@@ -777,6 +1315,18 @@
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
  *
+ * SUBTEST: fbchdr-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ *
+ * SUBTEST: fbcdrrshdr-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ *
+ * SUBTEST: fbcpsrhdr-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ *
  * arg[1]:
  *
  * @4:              4 tiling
@@ -859,8 +1409,9 @@ struct test_mode {
 		FEATURE_FBC   = 1,
 		FEATURE_PSR   = 2,
 		FEATURE_DRRS  = 4,
-		FEATURE_COUNT = 8,
-		FEATURE_DEFAULT = 8,
+		FEATURE_HDR   = 8,
+		FEATURE_COUNT = 16,
+		FEATURE_DEFAULT = 16,
 	} feature;
 
 	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
@@ -4031,12 +4582,36 @@ static const char *feature_str(int feature)
 		return "fbc";
 	case FEATURE_PSR:
 		return "psr";
-	case FEATURE_FBC | FEATURE_PSR:
-		return "fbcpsr";
 	case FEATURE_DRRS:
 		return "drrs";
+	case FEATURE_HDR:
+		return "hdr";
+	case FEATURE_FBC | FEATURE_PSR:
+		return "fbcpsr";
 	case FEATURE_FBC | FEATURE_DRRS:
-		return "fbcdrrs";
+	        return "fbcdrrs";
+	case FEATURE_FBC | FEATURE_HDR:
+	        return "fbchdr";
+
+	case FEATURE_PSR | FEATURE_DRRS:
+		return "psrdrrs";
+	case FEATURE_PSR | FEATURE_HDR:
+	        return "psrhdr";
+	case FEATURE_DRRS | FEATURE_HDR:
+	        return "drrshdr";
+
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
+		return "fbcpsrdrrs";
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
+		return "fbcpsrhdr";
+	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
+		return "fbcdrrshdr";
+	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
+		return "psrdrrshdr";
+
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
+		return "fbcpsrdrrshdr";
+
 	default:
 		igt_assert(false);
 	}
-- 
2.25.1

