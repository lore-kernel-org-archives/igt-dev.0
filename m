Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11514CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 12:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD66010E638;
	Wed, 20 May 2026 12:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCuzn6Ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AED10E40A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779279682; x=1810815682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FSiRkfH4F68lRRt/wPtkDCYXTR5Nq9i8ew/mxIdCv1o=;
 b=oCuzn6Ap8H+89JyLrRqA3kLMffY8u0i+5L5JoRdCtVc/BxBSZq87XLF9
 fO5UlZMivs4YQCaCnhWXz3QEmSY1mUgXHniiOGQfgzWf6yxyOVvW54Y+M
 /zXwsSFMF6NfM/BLsR1QWfZBs47D+3mQVkI7Nd0HVDEWdpTN5J7AzPc+d
 dxcixBQB2sXQ63e4bmdA7uDwL3Ekc40eTVcbOLc8ZQ2dxttbWbW5QY2k8
 2/QCeMAzyNuDoca0/vt+cqcUQLXlNvY6/ntgIke5DDE/Y+o3f+Q7Ft+mr
 O4bge8zCRcwMLHi4sKwUnf+b5qouTuVjIqPj3JzF4dYW/D8waJRJIM5/d A==;
X-CSE-ConnectionGUID: rVTvnT7/SCmy0b/+L6Y9Jg==
X-CSE-MsgGUID: Vk90SwYFR8qUWIjUxOT0kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80156614"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80156614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 05:21:22 -0700
X-CSE-ConnectionGUID: 2JETFtGESRGNdEgb1AQWSg==
X-CSE-MsgGUID: bKg/PfIaQoKrHCR3PP9fOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="240221672"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:21:20 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix duplicate
 documentation descriptions
Date: Wed, 20 May 2026 18:00:10 +0530
Message-Id: <20260520123010.2482801-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Multiple SUBTEST entries shared identical descriptions across different
test scenarios (offscreen, primary screen, secondary screen).

Fix by consolidating feature variants into arg[] parameters and
updating descriptions to include scenario context (screen, plane,
fb type, panel count, draw method).

This reduces documentation SUBTEST entries from 315 to 33.

v2: Addressed review comments - made descriptions shorter (Kamil)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 1432 ++++++++----------------
 1 file changed, 468 insertions(+), 964 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e7bb3fa18..37706cab5 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -27,7 +27,7 @@
 /**
  * TEST: kms frontbuffer tracking
  * Category: Display
- * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
+ * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR, HDR and DRRS
  * Driver requirement: i915, xe
  * Mega feature: General Display Features
  */
@@ -59,82 +59,51 @@
  * SUBTEST: pipe-fbc-rte
  * Description: Sanity test to enable FBC on each pipe.
  *
- * SUBTEST: drrs-%dp-rte
- * Description: Sanity test to enable DRRS with %arg[1] panels.
+ * SUBTEST: %s-%dp-rte
+ * Description: Sanity test to enable %arg[1] with %arg[2] panels.
  *
- * SUBTEST: fbc-%dp-rte
- * Description: Sanity test to enable FBC with %arg[1] panels.
- *
- * SUBTEST: psr-%dp-rte
- * Description: Sanity test to enable PSR with %arg[1] panels.
- *
- * SUBTEST: hdr-%dp-rte
- * Description: Sanity test to enable PSR with %arg[1] panels.
- *
- * SUBTEST: fbcdrrs-%dp-rte
- * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
- *
- * SUBTEST: fbcpsr-%dp-rte
- * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
- *
- * SUBTEST: fbchdr-%dp-rte
- * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
- *
- * SUBTEST: drrshdr-%dp-rte
- * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
- *
- * SUBTEST: psrhdr-%dp-rte
- * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
- *
- * SUBTEST: fbcdrrshdr-%dp-rte
- * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
- *
- * SUBTEST: fbcpsrhdr-%dp-rte
- * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels.
+ * arg[1]:
  *
- * arg[1].values:   1, 2
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
+ *
+ * arg[2].values:   1, 2
  */
 
 /**
- * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
+ * 		with %arg[1], using %arg[2]
  *
- * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * arg[1]:
  *
- * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @indfb:          Individual fb
  * @shrfb:          Shared fb
  *
- * arg[2]:
+ * arg[3]:
  *
  * @blt:            Blitter
  * @mmap-wc:        MMAP-WC
@@ -142,51 +111,31 @@
  */
 
 /**
- * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
+ * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
+ * 		with %arg[1], using %arg[2]
  * Driver requirement: i915
  *
- * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @indfb:          Individual fb
  * @shrfb:          Shared fb
  *
- * arg[2]:
+ * arg[3]:
  *
  * @mmap-cpu:       MMAP-CPU
  * @mmap-gtt:       MMAP-GTT
@@ -194,59 +143,34 @@
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on primary screen using %arg[4] method on %arg[3]
+ * 		with %arg[1], %arg[2] panel(s) and individual fb
  * Driver requirement: i915
  *
- * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @cur:            Cursor plane
  * @pri:            Primary plane
  * @spr:            Sprite plane
  *
- * arg[3]:
+ * arg[4]:
  *
  * @mmap-cpu:       MMAP-CPU
  * @mmap-gtt:       MMAP-GTT
@@ -254,48 +178,33 @@
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-%dp-primscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on primary screen using %arg[4] method on %arg[3]
+ * 		with %arg[1], %arg[2] panel(s) and individual fb
  *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @cur:            Cursor plane
  * @pri:            Primary plane
  * @spr:            Sprite plane
  *
- * arg[3]:
+ * arg[4]:
  *
  * @blt:            Blitter
  * @mmap-wc:        MMAP-WC
@@ -303,42 +212,27 @@
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on primary screen on primary plane using %arg[3] method
+ * 		with %arg[1], %arg[2] panel(s) and shared fb
  *
- * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @blt:            Blitter
  * @mmap-wc:        MMAP-WC
@@ -346,53 +240,28 @@
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-%dp-primscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on primary screen on primary plane using %arg[3] method
+ * 		with %arg[1], %arg[2] panel(s) and shared fb
  * Driver requirement: i915
  *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @mmap-cpu:       MMAP-CPU
  * @mmap-gtt:       MMAP-GTT
@@ -400,46 +269,31 @@
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on secondary screen using %arg[3] method on %arg[2]
+ * 		with %arg[1] and individual fb
  *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @cur:            Cursor plane
  * @pri:            Primary plane
  * @spr:            Sprite plane
  *
- * arg[2]:
+ * arg[3]:
  *
  * @blt:            Blitter
  * @mmap-wc:        MMAP-WC
@@ -447,57 +301,32 @@
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-2p-scndscrn-%s-indfb-draw-%s
+ * Description: Draw a set of rectangles on secondary screen using %arg[3] method on %arg[2]
+ * 		with %arg[1] and individual fb
  * Driver requirement: i915
  *
- * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @cur:            Cursor plane
  * @pri:            Primary plane
  * @spr:            Sprite plane
  *
- * arg[2]:
+ * arg[3]:
  *
  * @mmap-cpu:       MMAP-CPU
  * @mmap-gtt:       MMAP-GTT
@@ -505,40 +334,25 @@
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on secondary screen on primary plane using %arg[2] method
+ * 		with %arg[1] and shared fb
  *
- * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @blt:            Blitter
  * @mmap-wc:        MMAP-WC
@@ -546,51 +360,26 @@
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
+ * SUBTEST: %s-2p-scndscrn-pri-shrfb-draw-%s
+ * Description: Draw a set of rectangles on secondary screen on primary plane using %arg[2] method
+ * 		with %arg[1] and shared fb
  * Driver requirement: i915
  *
- * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @mmap-cpu:       MMAP-CPU
  * @mmap-gtt:       MMAP-GTT
@@ -598,84 +387,53 @@
  */
 
 /**
- * SUBTEST: drrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: fbc-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: psr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: hdr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * SUBTEST: %s-%dp-pri-indfb-multidraw
+ * Description: Draw a set of rectangles on primary plane using alternated drawing methods
+ * 		with %arg[1], %arg[2] panel(s) and individual fb
  *
- * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- *
- * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
+ * arg[1]:
  *
- * arg[1].values:   1, 2
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
+ *
+ * arg[2].values:   1, 2
  */
 
 /**
- * SUBTEST: drrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: fbc-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: psr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: hdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: fbcdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: fbcpsr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * SUBTEST: %s-%s-draw-%s
+ * Description: Test pixel formats (%arg[2]) that are not FORMAT_DEFAULT using %arg[3] method with %arg[1]
  *
- * SUBTEST: fbchdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: drrshdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: psrhdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- *
- * SUBTEST: fbcdrrshdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @rgb101010:      FORMAT_RGB101010
  * @rgb565:         FORMAT_RGB565
  * @argb161616f:    FORMAT_ARGB161616F
  * @abgr161616f:    FORMAT_ABGR161616F
  *
- * arg[2]:
+ * arg[3]:
  *
  * @blt:            Blitter
  * @mmap-wc:        MMAP-WC
@@ -683,58 +441,32 @@
  */
 
 /**
- * SUBTEST: drrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: fbc-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: psr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: hdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: fbchdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: drrshdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- *
- * SUBTEST: psrhdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
+ * SUBTEST: %s-%s-draw-%s
+ * Description: Test pixel formats (%arg[2]) that are not FORMAT_DEFAULT using %arg[3] method with %arg[1]
  * Driver requirement: i915
  *
- * SUBTEST: fbcdrrshdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @rgb101010:      FORMAT_RGB101010
  * @rgb565:         FORMAT_RGB565
  * @argb161616f:    FORMAT_ARGB161616F
  * @abgr161616f:    FORMAT_ABGR161616F
  *
- * arg[2]:
+ * arg[3]:
  *
  * @mmap-cpu:       MMAP-CPU
  * @mmap-gtt:       MMAP-GTT
@@ -742,73 +474,49 @@
  */
 
 /**
- * SUBTEST: drrs-slowdraw
- * Description: Sleep a little bit between drawing operations with DRRS
- *
- * SUBTEST: psr-slowdraw
- * Description: Sleep a little bit between drawing operations with PSR
- *
- * SUBTEST: fbcdrrs-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC & DRRS
+ * SUBTEST: %s-slowdraw
+ * Description: Sleep a little bit between drawing operations with %arg[1]
  *
- * SUBTEST: fbcpsr-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC & PSR
- *
- * SUBTEST: drrshdr-slowdraw
- * Description: Sleep a little bit between drawing operations with DRRS & HDR
- *
- * SUBTEST: psrhdr-slowdraw
- * Description: Sleep a little bit between drawing operations with PSR & HDR
+ * arg[1]:
  *
- * SUBTEST: fbcdrrshdr-slowdraw
- * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
+ * @drrs:       DRRS
+ * @psr:        PSR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * SUBTEST: fbcpsrhdr-slowdraw
- * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
+ * SUBTEST: %s-%dp-primscrn-%s-%sflip-blt
+ * Description: Exercise %arg[4] page flips on primary screen with %arg[1],
+ * 		%arg[2] panel(s) and %arg[3] fb
  *
- * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @indfb:          Individual fb
  * @shrfb:          Shared fb
  *
- * arg[3]:
+ * arg[4]:
  *
  * @ms:             Modeset
  * @pg:             Page flip
@@ -816,45 +524,30 @@
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
+ * SUBTEST: %s-2p-scndscrn-%s-%sflip-blt
+ * Description: Exercise %arg[3] page flips on secondary screen with %arg[1]
+ * 		and %arg[2] fb
  *
- * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @indfb:          Individual fb
  * @shrfb:          Shared fb
  *
- * arg[2]:
+ * arg[3]:
  *
  * @ms:             Modeset
  * @pg:             Page flip
@@ -862,474 +555,285 @@
  */
 
 /**
- * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915
- *
- * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
+ * SUBTEST: %s-%dp-%s-fliptrack-mmap-gtt
+ * Description: Check if the hardware tracking works after page flips with %arg[1],
+ * 		%arg[2] panel(s) and %arg[3] fb
  * Driver requirement: i915
  *
- * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915
+ * @fbc:        FBC
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @indfb:          Individual fb
  * @shrfb:          Shared fb
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
+ * SUBTEST: %s-%dp-primscrn-%s-indfb-move
+ * Description: Move %arg[3] around on primary screen with %arg[1],
+ * 		%arg[2] panel(s) and individual fb
  *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @spr:            Sprite plane
  * @cur:            Cursor plane
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
+ * SUBTEST: %s-2p-scndscrn-%s-indfb-move
+ * Description: Move %arg[2] around on secondary screen with %arg[1] and individual fb
  *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @spr:            Sprite plane
  * @cur:            Cursor plane
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
+ * SUBTEST: %s-%dp-primscrn-%s-indfb-onoff
+ * Description: Enable and disable %arg[3] a few times on primary screen with %arg[1],
+ * 		%arg[2] panel(s) and individual fb
  *
- * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1].values:   1, 2
+ * arg[2].values:   1, 2
  *
- * arg[2]:
+ * arg[3]:
  *
  * @spr:            Sprite plane
  * @cur:            Cursor plane
  */
 
 /**
- * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
+ * SUBTEST: %s-2p-scndscrn-%s-indfb-onoff
+ * Description: Enable and disable %arg[2] a few times on secondary screen with %arg[1] and individual fb
  *
- * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @spr:            Sprite plane
  * @cur:            Cursor plane
  */
 
 /**
- * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
+ * SUBTEST: %s-%dp-primscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen sprite plane covering the primary screen with %arg[1],
+ * 		%arg[2] panel(s) and individual fb
  *
- * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- *
- * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
+ * arg[1]:
  *
- * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
+ *
+ * arg[2].values:   1, 2
+ * SUBTEST: %s-2p-scndscrn-spr-indfb-fullscreen
+ * Description: Put a fullscreen sprite plane covering the secondary screen with %arg[1] and individual fb
  *
- * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
+ * arg[1]:
  *
- * arg[1].values:   1, 2
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
+ *
+ * arg[2].values:   1, 2
  */
 
 /**
- * SUBTEST: drrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: fbc-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: psr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: hdr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: fbcdrrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: fbcpsr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: fbchdr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: drrshdr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
+ * SUBTEST: %s-%s-scaledprimary
+ * Description: Try different primary plane scaling strategies with %arg[1] and %arg[2] fb
  *
- * SUBTEST: psrhdr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- *
- * SUBTEST: fbcdrrshdr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @indfb:          Individual fb
  * @shrfb:          Shared fb
  */
 
 /**
- * SUBTEST: drrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
- *
- * SUBTEST: fbc-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC
- *
- * SUBTEST: psr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with PSR
+ * SUBTEST: %s-modesetfrombusy
+ * Description: Modeset from a busy buffer to a non-busy buffer with %arg[1]
  *
- * SUBTEST: hdr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with HDR
- *
- * SUBTEST: fbcdrrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
- *
- * SUBTEST: fbcpsr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
- *
- * SUBTEST: fbchdr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC & HDR
- *
- * SUBTEST: drrshdr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
- *
- * SUBTEST: psrhdr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
+ * arg[1]:
  *
- * SUBTEST: fbcdrrshdr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * SUBTEST: fbcpsrhdr-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
  */
 
 /**
- * SUBTEST: drrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of DRRS
+ * SUBTEST: %s-suspend
+ * Description: Make sure suspend/resume keeps us on the same state of %arg[1]
  *
- * SUBTEST: fbc-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC
- *
- * SUBTEST: psr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of PSR
- *
- * SUBTEST: hdr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of HDR
- *
- * SUBTEST: fbcdrrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
- *
- * SUBTEST: fbcpsr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
- *
- * SUBTEST: fbchdr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR
- *
- * SUBTEST: drrshdr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
- *
- * SUBTEST: psrhdr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
+ * arg[1]:
  *
- * SUBTEST: fbcdrrshdr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * SUBTEST: fbcpsrhdr-suspend
- * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
  */
 
 /**
- * SUBTEST: drrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: fbc-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: psr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
+ * SUBTEST: %s-farfromfence-mmap-gtt
+ * Description: Test drawing as far from the fence start as possible with %arg[1]
  * Driver requirement: i915
  *
- * SUBTEST: hdr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: fbchdr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: drrshdr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
+ * arg[1]:
  *
- * SUBTEST: psrhdr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
+ * @drrs:       DRRS
+ * @fbc:        FBC
+ * @psr:        PSR
+ * @hdr:        HDR
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @drrshdr:    DRRS & HDR
+ * @psrhdr:     PSR & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- *
- * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
  */
 
 /**
- * SUBTEST: fbc-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- *
- * SUBTEST: fbcdrrs-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
+ * SUBTEST: %s-stridechange
+ * Description: Change the frontbuffer stride by doing a modeset with %arg[1]
  *
- * SUBTEST: fbcpsr-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- *
- * SUBTEST: fbchdr-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
+ * arg[1]:
  *
- * SUBTEST: fbcdrrshdr-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
+ * @fbc:        FBC
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * SUBTEST: fbcpsrhdr-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
  */
 
 /**
- * SUBTEST: fbc-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- *
- * SUBTEST: fbcdrrs-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
+ * SUBTEST: %s-tiling-%s
+ * Description: Test %arg[2] formats with %arg[1], if the tiling format supports
+ * 		FBC do the basic drawing test, else set the mode & test if FBC is disabled
  *
- * SUBTEST: fbcpsr-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- *
- * SUBTEST: fbchdr-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- *
- * SUBTEST: fbcdrrshdr-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
+ * arg[1]:
  *
- * SUBTEST: fbcpsrhdr-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
+ * @fbc:        FBC
+ * @fbcdrrs:    FBC & DRRS
+ * @fbcpsr:     FBC & PSR
+ * @fbchdr:     FBC & HDR
+ * @fbcdrrshdr: FBC, DRRS & HDR
+ * @fbcpsrhdr:  FBC, PSR & HDR
  *
- * arg[1]:
+ * arg[2]:
  *
  * @4:              4 tiling
  * @linear:         Linear tiling
-- 
2.25.1

