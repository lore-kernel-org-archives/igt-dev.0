Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6B3C02196
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 13:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA710E06F;
	Mon,  3 Feb 2025 13:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyhRGlem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645BC10E06F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738589984; x=1770125984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdQz/lT9vSiZd/UiVLpWtCv+722QaAO/0AgJcPhra4I=;
 b=KyhRGlemKn4CzOdrhySQe2DVO0n85J5Q6HZcaSFcMP8x7yavEQiFn04e
 IIuldQpoXZxYujgNxUZqfwzFUp+2C7iZedEWf8RZaWtbfMTuBWzbcun6t
 +e8JE4msst6C9YTiQP8gy7WaMz3ImgnGbY6GM1kzpQdwTwCvZuty6OslM
 K188HGiMrDl5iunIYxL6Zk2Im6cQcqzxko6j8JHHhy6/7Ds9/gGSV47E/
 aZgB/BvWQYRY1pDIx5vVJKxITD6d4cyVjLl84xgnhYgFdPtrzOtRDk43p
 2AW9uNt1oBjSv7B3TuZYfYc0Wim5pay7h8mve1S0OTnUzW0KL+xMFQHKU g==;
X-CSE-ConnectionGUID: 9ncWg/knSiCxKM/dPZwPIQ==
X-CSE-MsgGUID: 7U4aeU3mRVO5ZWW6MUZxmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26682916"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="26682916"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:39:44 -0800
X-CSE-ConnectionGUID: 8Or+va3rTVePcbe3E9H5Fg==
X-CSE-MsgGUID: kD0N1+UDSzWxZmVHIGHctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110242858"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:39:42 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/3] lib/intel_compute: Align objects on 64K for xehp
Date: Mon,  3 Feb 2025 14:38:46 +0100
Message-ID: <20250203133916.843931-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203133916.843931-1-francois.dugast@intel.com>
References: <20250203133916.843931-1-francois.dugast@intel.com>
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

Some of the buffers are aligned on 4K. Ensure 64K alignment
in preparation for a switch to using xe_bo_create() during
buffers creation.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index f1520aad4..983b2e2c3 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -24,9 +24,9 @@
 #define MEDIA_STATE_FLUSH		0x0
 #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
 #define SIZE_DATA			64
-#define SIZE_BATCH			0x1000
-#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
-#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
+#define SIZE_BATCH			0x10000
+#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
+#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define ADDR_BATCH			0x100000ULL
 #define ADDR_INPUT			0x200000ULL
 #define ADDR_OUTPUT			0x300000ULL
@@ -38,7 +38,7 @@
 
 #define ADDR_GENERAL_STATE_BASE		0x80000000ULL
 #define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
-#define OFFSET_BINDING_TABLE		0x1000
+#define OFFSET_BINDING_TABLE		0x10000
 
 #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
 #define OFFSET_STATE_SIP			0xFFFF0000
@@ -746,8 +746,8 @@ static void xehp_create_surface_state(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 
-	addr_bo_buffer_batch[b++] = 0x00001000;
-	addr_bo_buffer_batch[b++] = 0x00001040;
+	addr_bo_buffer_batch[b++] = 0x00010000;
+	addr_bo_buffer_batch[b++] = 0x00010040;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -825,7 +825,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
 	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x6;
 	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
-	addr_bo_buffer_batch[b++] = 0x00002000;
+	addr_bo_buffer_batch[b++] = 0x00012000;
 	addr_bo_buffer_batch[b++] = 0x001ff000;
 
 	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x25;
@@ -852,7 +852,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00180000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00001080;
+	addr_bo_buffer_batch[b++] = 0x00010080;
 	addr_bo_buffer_batch[b++] = 0x0c000002;
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
@@ -895,10 +895,10 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .size = 0x100000,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size = 0x1000,
+		  .size = 0x10000,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x1000,
+		  .size =  0x10000,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
@@ -907,7 +907,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
-		  .size = 0x1000,
+		  .size = 0x10000,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -918,7 +918,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_create(fd, &execenv, eci);
 
 	/* Sets Kernel size */
-	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[0].size = ALIGN(size, 0x10000);
 
 	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
 
-- 
2.43.0

