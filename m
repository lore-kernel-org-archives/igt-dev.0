Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD5BC28B30
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9334110E5B8;
	Tue, 11 Mar 2025 15:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3QGpL/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E13910E5B8
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706617; x=1773242617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kOVlDnqTBwH3Q1yo+SqFT2YsL5wxc/nDzs3ItwaGVqc=;
 b=W3QGpL/NFCUlFA3tWKKjba8+rGUTnufS2UEpbo1zU5Xkj3L8qCg83KLf
 zpw6FTqXx0h1tky/NsMq/ETRt9fzxbbqHVak4ouU7O1Go7jcrOiaA/8pv
 NO1l2ObJT5Fr42TB4bKKMxpP8dOwBVujgo0CclLN0oMgtUp5XIXlw/tLL
 GD1hz47a1zdYacHjfIk1VRkE1FYwSyr7IbZJNZtb68BK8kF/WsxAzQar/
 R1HEPDv0/RD4fwLIozAdK83qmtlNam33jpv8i5PndUe1IXuwcfTm2x3AA
 cyFrShXCtHyoyNt5/vZdWl4fNtI04s/up7lWkI+3r6Uf2V1PDEzfuzFM4 A==;
X-CSE-ConnectionGUID: uZyOJl/ST76eu2q8v6zT4A==
X-CSE-MsgGUID: YOjAynM8Q4anNLEH+Dx9HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377115"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:37 -0700
X-CSE-ConnectionGUID: 2d0YYwdgSQG1eAoaJ5pFKg==
X-CSE-MsgGUID: bYF5JFkNQ22D76CqaOogIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066280"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 01/11] lib/intel_compute: Use common constant for
 surface state size
Date: Tue, 11 Mar 2025 16:21:21 +0100
Message-ID: <20250311152321.16497-2-francois.dugast@intel.com>
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
 lib/intel_compute.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index dd9c83c9c..7d3380186 100644
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
-		  .size = 0x1000,
+		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x1000,
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

