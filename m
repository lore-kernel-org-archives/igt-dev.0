Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA70C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6110E5BB;
	Tue, 11 Mar 2025 15:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7ap0goW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A480210E5BB
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706618; x=1773242618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yen0XSxitaFb6wZjq5Jp4R35BQYB/+cDxULbza7XbUE=;
 b=F7ap0goWk0ax4dJmpD3xjnjP6BjdkJPv/3dR4Hxz2+xjPHrOZAExZoE7
 6b0kZKvf54tTaFci9dSTz2Ur0DaDOCO/R84UD8Gc517OU+SLch7DMYgIX
 94dXxFzYg9iTaIoU+rRE4AyMg0b3witFuVbntaNfy2Wd5H8DF3aWzTCd2
 24rqFY2NNdUcYsrzCmU/0vlmDnKUY8uaQufqgdWwBU/PHGEaAlsW5D9q2
 2QsrzLPSpnb9xomKkJCbUGWhyqkV+pxriYIZKGIvJOlheMYEuE9osGnX7
 y3LNa5hOZNJiBMKFPA5mO6tODyTrt2G+W7AA945LYXMvF1X7FBmfkdjFm w==;
X-CSE-ConnectionGUID: IUDf4RkAR4eOSLNJJOKgHw==
X-CSE-MsgGUID: mSBybZ94TiaVAvblsPR2Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377117"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:38 -0700
X-CSE-ConnectionGUID: m0wHZqTYQgKorpfDYYPQng==
X-CSE-MsgGUID: F5v0jLzcQJa5xfpBXRvZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066283"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 02/11] lib/intel_compute: Use common constant for
 dynamic state size
Date: Tue, 11 Mar 2025 16:21:22 +0100
Message-ID: <20250311152321.16497-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311152321.16497-1-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
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

Reduce magic values in the code, homogenize the size which has no
reason to be different among pipelines, define this value close to
the addresses to make it easier to spot potential overlaps in the
future.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 7d3380186..b4b022ae7 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -29,6 +29,7 @@
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_SURFACE_STATE		0x10000
+#define SIZE_DYNAMIC_STATE		0x100000
 
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
@@ -691,7 +692,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
 		  .name = "kernel" },
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size =  0x1000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -976,7 +977,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -1551,7 +1552,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -1641,7 +1642,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -1892,7 +1893,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
-- 
2.43.0

