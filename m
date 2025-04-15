Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32A9C369B5
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A52310E706;
	Tue, 15 Apr 2025 10:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQpZIgyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E5310E705
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712122; x=1776248122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/OW9cVrrgF+0kLWuVrCNjanVKl7Mhiywq3hiE7gPtY4=;
 b=KQpZIgyn5F0x9UPj80apAeA4Rn6S63TX4De+K7Cms5bcCDvB4d/MxN1m
 vW+awqeInJGjJv2dVB+QQMbtxUXFgYvc95Gia3jSJy3AGCAQ/haDwUns7
 Kw0OE7lEolBexTCbyP73wPA9qJr6cuAWmBHYSJEEcVfI5YuuD5TnZW+gV
 kqSa9aP4gvk5g3brI9jxuTiqaXEpwGGKI4umh5oVXMCEGdpY8TlsrGwts
 EtDlkfjVct9GfLByw/G3IR91Y3W7KlIah5/FAsi/bZ/um3cbg8bxf8/GQ
 +eUNxMOEggHNWyyq47AHLllROgK16J9cdw+L0mS088+JlwtT+T4Aw8VPr w==;
X-CSE-ConnectionGUID: AOW+NyhkTACqxgcLDfuU1A==
X-CSE-MsgGUID: RYvI85juQ9uTFix9AuIqVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927065"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:22 -0700
X-CSE-ConnectionGUID: igmKd1ZLSCOY17OckJscuQ==
X-CSE-MsgGUID: eHMCuHsIRyivMIxKf+CcKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131059963"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 05/11] lib/intel_compute: Use common constant for general state
 size
Date: Tue, 15 Apr 2025 12:13:21 +0200
Message-ID: <20250415101457.141107-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415101457.141107-1-francois.dugast@intel.com>
References: <20250415101457.141107-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reduce magic values in the code, homogenize the size which has no
reason to be different among pipelines, define this value close to
the addresses to make it easier to spot potential overlaps in the
future.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4cea5388f..d64ac72ec 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -32,6 +32,7 @@
 #define SIZE_DYNAMIC_STATE		0x100000
 #define SIZE_INDIRECT_OBJECT		0x10000
 #define SIZE_BINDING_TABLE		0x10000
+#define SIZE_GENERAL_STATE		0x100000
 
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
@@ -991,7 +992,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
@@ -1208,7 +1210,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x10000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -1566,7 +1569,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
@@ -1656,7 +1660,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
@@ -1911,7 +1916,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
-- 
2.43.0

