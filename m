Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2692C36017
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585C310E80B;
	Wed,  2 Apr 2025 15:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmxQJ+QO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD2E10E80B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607399; x=1775143399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xM2X4oUXWDEFaiEamfVOWuJael64eFEhRidzOdQ1L8s=;
 b=nmxQJ+QOE5JmMXJlJKWog2gnhDiny44009nu3OqL8iRYPpNrGZK3sICW
 kjNDScdz/VFollOep/8o1Im8BGNAtrREbpwELRVori1P/VbAZKPc/Tl9g
 txs42AO/GrXETpEAsP+aIvBVgabi4H2G5SXhrVEVnf193tsLGCMHcTSos
 1gYHBSEFXr9ROWOnfjnDLkd2u2oaFXpmI5807InBraR4s7SCQ4rOB3voT
 pj2+T2ETlcYCvHiOQu/eOsp4dFHt0laTOb4muC2lRrZ2+NJ3S9tf1w3j3
 lGhwavfpbNarKpBGjbitZZ+VarBX6v0BVsNpqQwyWOrvCsljbKa/omJrA A==;
X-CSE-ConnectionGUID: 7SCCKXklRUGp5oN14+xseg==
X-CSE-MsgGUID: 9LD7QTXaQJiviYpE4liilQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885859"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885859"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:18 -0700
X-CSE-ConnectionGUID: /ff5BflpTZGLjFYi1NePbg==
X-CSE-MsgGUID: S/lX1vQUQQOkfxHtJNF0eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717717"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 01/11] lib/intel_compute: Use common constant for surface state
 size
Date: Wed,  2 Apr 2025 17:19:59 +0200
Message-ID: <20250402152256.173562-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402152256.173562-1-francois.dugast@intel.com>
References: <20250402152256.173562-1-francois.dugast@intel.com>
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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 28149db53..824f73dbd 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -23,10 +23,13 @@
 #define PIPE_CONTROL			0x7a000004
 #define MEDIA_STATE_FLUSH		0x0
 #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
+
 #define SIZE_DATA			64
 #define SIZE_BATCH			0x10000
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
+#define SIZE_SURFACE_STATE		0x10000
+
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
 #define ADDR_BATCH			0x100000ULL
@@ -691,7 +694,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		  .size =  0x1000,
 		  .name = "dynamic state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size =  0x1000,
+		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base" },
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x10000,
@@ -976,7 +979,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .size = 0x100000,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size = 0x10000,
+		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x10000,
@@ -1551,7 +1554,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = 0x100000,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size = 0x10000,
+		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x10000,
@@ -1641,7 +1644,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = 0x100000,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size = 0x1000,
+		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x1000,
@@ -1892,7 +1895,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .size = 0x100000,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size = 0x1000,
+		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x1000,
-- 
2.43.0

