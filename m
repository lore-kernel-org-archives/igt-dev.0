Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7EFFA3726
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 09:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3853210E0EF;
	Fri,  2 Jan 2026 09:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxubBAno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4AC10E0EF
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767347195; x=1798883195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwWtoJ3xx+yX8Xlh2YvzAnWWdmVGZa98TjoAkea4NCc=;
 b=YxubBAnohEkZF1J0x4QRMR51iUGGnrV5SOEFFd6xsl2+l+fUKNS5cS95
 Vvrg3nRNvSU/qG4fSxGevIjlyEOaZr/loY7mXtZTlu7+Sai+CLm82Hqib
 35datjoNiV1/A0HwV1CpKzh/UuCuUxdpddhfZ9dtQFu31yfoHL844oob7
 6l9gva8cpJeQOwohy7hmjIw3OOcaUwi32JPEizIk3bgNNCb3OzJmiwGzQ
 QyrIPcLUVcGHR/w4DqO+N38CK9/AapSZunjdX5aPTxfr/PdoBbT3+JA7S
 D2CxFN5N9temj+7Yv+eWzPXJybTLbJgzaLF0JAkJ/usLz7OjwJGaRWw4k g==;
X-CSE-ConnectionGUID: XGbKOPplTZOtyY3SaPbOeA==
X-CSE-MsgGUID: woE3LjbkSh6UIO6WkD94vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94313808"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="94313808"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 01:46:35 -0800
X-CSE-ConnectionGUID: DvZZEKpnQlWIX0RHHfR6Bw==
X-CSE-MsgGUID: mNe3+rRxSD+xzgWAUlM7+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="202746901"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 01:46:33 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [v2 2/4] tests/intel/kms_frontbuffer_tracking: Add HDR feature support
Date: Fri,  2 Jan 2026 15:24:49 +0530
Message-Id: <20260102095451.42401-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260102095451.42401-1-swati2.sharma@intel.com>
References: <20260102095451.42401-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 585 ++++++++++++++++++++++++-
 1 file changed, 580 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f2e7c72f6..3447ed298 100644
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
+ * SUBTEST: hdrdrrs-%dp-rte
+ * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
+ *
+ * SUBTEST: hdrpsr-%dp-rte
+ * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-rte
+ * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
+ *
+ * SUBTEST: hdrfbcpsr-%dp-rte
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
+ * SUBTEST: hdrdrrs-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrpsr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcpsr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcdrrs-1p-offscreen-pri-%s-draw-%s
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
+ * SUBTEST: hdrdrrs-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrpsr-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcdrrs-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcpsr-1p-offscreen-pri-%s-draw-%s
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-draw-%s
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-draw-%s
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-pri-shrfb-draw-%s
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-pri-shrfb-draw-%s
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-draw-%s
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-draw-%s
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-pri-shrfb-draw-%s
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on the screen using the provided method
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-pri-shrfb-draw-%s
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
+ * SUBTEST: hdrdrrs-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: hdrpsr-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ *
+ * SUBTEST: hdrfbcpsr-%dp-pri-indfb-multidraw
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
+ * SUBTEST: hdrdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: hdrpsr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: hdrfbcdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
+ * SUBTEST: hdrfbcpsr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ *
  * arg[1]:
  *
  * @rgb101010:      FORMAT_RGB101010
@@ -432,6 +691,10 @@
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
@@ -440,6 +703,26 @@
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrpsr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-%s-draw-%s
+ * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * Driver requirement: i915
+ *
  * arg[1]:
  *
  * @rgb101010:      FORMAT_RGB101010
@@ -464,6 +747,18 @@
  *
  * SUBTEST: fbcpsr-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & PSR
+ *
+ * SUBTEST: hdrdrrs-slowdraw
+ * Description: Sleep a little bit between drawing operations with DRRS & HDR
+ *
+ * SUBTEST: hdrpsr-slowdraw
+ * Description: Sleep a little bit between drawing operations with PSR & HDR
+ *
+ * SUBTEST: hdrfbcdrrs-slowdraw
+ * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
+ *
+ * SUBTEST: hdrfbcpsr-slowdraw
+ * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
  */
 
 /**
@@ -476,12 +771,30 @@
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -506,12 +819,30 @@
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-%sflip-blt
+ * Description: Just exercise page flips with the patterns we have
+ *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -537,6 +868,18 @@
  * Description: Check if the hardware tracking works after page flips
  * Driver requirement: i915
  *
+ * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips
+ * Driver requirement: i915
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -555,12 +898,30 @@
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-move
+ * Description: Just move the %arg[2] around
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -579,12 +940,30 @@
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-move
+ * Description: Just move the %arg[1] around
+ *
  * arg[1]:
  *
  * @spr:            Sprite plane
@@ -601,12 +980,30 @@
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[2] a few times
+ *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -625,12 +1022,30 @@
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-%s-indfb-onoff
+ * Description: Just enable and disable the %arg[1] a few times
+ *
  * arg[1]:
  *
  * @spr:            Sprite plane
@@ -647,12 +1062,30 @@
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
+ * SUBTEST: hdrdrrs-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: hdrpsr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: hdrfbcdrrs-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: hdrfbcpsr-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  *
@@ -662,12 +1095,30 @@
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
+ * SUBTEST: hdrdrrs-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: hdrpsr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: hdrfbcdrrs-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
+ * SUBTEST: hdrfbcpsr-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen plane covering the whole screen
+ *
  * arg[1].values:   1, 2
  */
 
@@ -681,12 +1132,30 @@
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
+ * SUBTEST: hdrdrrs-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: hdrpsr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: hdrfbcdrrs-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
+ * SUBTEST: hdrfbcpsr-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies
+ *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -703,11 +1172,29 @@
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
+ * SUBTEST: hdrdrrs-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
+ *
+ * SUBTEST: hdrpsr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
+ *
+ * SUBTEST: hdrfbcdrrs-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
+ *
+ * SUBTEST: hdrfbcpsr-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
  */
 
 /**
@@ -720,11 +1207,29 @@
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
+ * SUBTEST: hdrdrrs-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
+ *
+ * SUBTEST: hdrpsr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
+ *
+ * SUBTEST: hdrfbcdrrs-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
+ *
+ * SUBTEST: hdrfbcpsr-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
  */
 
 /**
@@ -740,6 +1245,10 @@
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
@@ -747,6 +1256,26 @@
  * SUBTEST: fbcpsr-farfromfence-mmap-gtt
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
+ *
+ * SUBTEST: fbchdr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrdrrs-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrpsr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcdrrs-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
+ *
+ * SUBTEST: hdrfbcpsr-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible
+ * Driver requirement: i915
  */
 
 /**
@@ -758,6 +1287,15 @@
  *
  * SUBTEST: fbcpsr-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
+ *
+ * SUBTEST: fbchdr-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ *
+ * SUBTEST: hdrfbcdrrs-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
+ *
+ * SUBTEST: hdrfbcpsr-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset
  */
 
 /**
@@ -773,6 +1311,18 @@
  * Description: Test %arg[1] formats, if the tiling format supports FBC do the
  *              basic drawing test, else set the mode & test if FBC is disabled
  *
+ * SUBTEST: fbchdr-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ *
+ * SUBTEST: hdrfbcdrrs-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ *
+ * SUBTEST: hdrfbcpsr-tiling-%s
+ * Description: Test %arg[1] formats, if the tiling format supports FBC do the
+ *              basic drawing test, else set the mode & test if FBC is disabled
+ *
  * arg[1]:
  *
  * @4:              4 tiling
@@ -855,8 +1405,9 @@ struct test_mode {
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
@@ -4001,12 +4552,36 @@ static const char *feature_str(int feature)
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
+	        return "hdrpsr";
+	case FEATURE_DRRS | FEATURE_HDR:
+	        return "hdrdrrs";
+
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
+		return "fbcpsrdrrs";
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
+		return "hdrfbcpsr";
+	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
+		return "hdrfbcdrrs";
+	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
+		return "hdrpsrdrrs";
+
+	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
+		return "hdrfbcpsrdrrs";
+
 	default:
 		igt_assert(false);
 	}
-- 
2.25.1

