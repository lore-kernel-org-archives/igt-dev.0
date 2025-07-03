Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB66C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B6110E7C9;
	Thu,  3 Jul 2025 06:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEkxheyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56AF10E7C9
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751524244; x=1783060244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4+kRZUFda9vC8oyVc7xD/ucJRP6YVtEuxBwrfwvvWo=;
 b=jEkxheykk7icgfrJhzYDNGYNS/OAvvCnOBDpn+1PxVzfZKM9ptqXWgoq
 6VVHMoUefpO7jFPETY76FQi3Lb6A8K30aSupXDxARea1x3jE0ugzyYaD5
 pzwTB62H6b3K/aXDGI4OjGu5FznLsmILJKcN4AOfVTN0wwsGhh3W4fqxX
 pVInBVatrpH21wteoJ9Z90x9q9a/VMkwU/e+d99GISaFsPGbHoBe/a9KR
 Q12Z3BLFdN+PDWE6u/6D/0PlGcueFAmxx+jpn91TlQRt8zvfm+tan5M2y
 99+Vm8b1KZ+HAIOWZYvwrVZ7NdMJY6AGDsn26F+FlzlFkMNbsv/+l/95u A==;
X-CSE-ConnectionGUID: JCd2vKDGQn6Dul0ty8RIng==
X-CSE-MsgGUID: mKyJQ1+wSAqTen1T/10xMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64886379"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64886379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:43 -0700
X-CSE-ConnectionGUID: m65V6LY9S9O/vH9CYkGDwg==
X-CSE-MsgGUID: ajh06D8dTAuKen1mRHQIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154635800"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/3] lib/intel_compute: use macros instead of binary
 data in post-sync op
Date: Thu,  3 Jul 2025 08:30:35 +0200
Message-ID: <20250703063032.553963-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
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

Upcoming change in TG preemption detection requires modification in
compute-walker post-sync write. Replace binary post-sync to macros
which are easier to read and modify.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9f5fc1bc59..9549b58fdf 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -14,6 +14,7 @@
 #include "gen8_media.h"
 #include "gen9_media.h"
 #include "intel_compute.h"
+#include "intel_mocs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe/xe_ioctl.h"
@@ -60,6 +61,9 @@
 #define ENQUEUED_LOCAL_SIZE_X		1024
 #define ENQUEUED_LOCAL_SIZE_Y		1
 #define ENQUEUED_LOCAL_SIZE_Z		1
+#define DP_SS_CACHE_FLUSH		(1 << 12)
+#define DP_PIPELINE_FLUSH		(1 << 2)
+#define WRITE_TIMESTAMP		(3 << 0)
 
 /*
  * TGP  - ThreadGroup Preemption
@@ -975,7 +979,8 @@ static void xehp_create_surface_state(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 }
 
-static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+static void xehp_compute_exec_compute(int fd,
+				      uint32_t *addr_bo_buffer_batch,
 				      uint64_t addr_general_state_base,
 				      uint64_t addr_surface_state_base,
 				      uint64_t addr_dynamic_state_base,
@@ -983,6 +988,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 				      uint64_t offset_indirect_data_start,
 				      uint64_t kernel_start_pointer)
 {
+	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
 	int b = 0;
 
 	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
@@ -1067,7 +1073,8 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00001027;
+	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
+				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1150,7 +1157,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
 	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
-	xehp_compute_exec_compute(bo_dict[8].data,
+	xehp_compute_exec_compute(fd,
+				  bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
 				  ADDR_SURFACE_STATE_BASE,
 				  ADDR_DYNAMIC_STATE_BASE,
@@ -1201,7 +1209,8 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 }
 
-static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+static void xehpc_compute_exec_compute(int fd,
+				       uint32_t *addr_bo_buffer_batch,
 				       uint64_t addr_general_state_base,
 				       uint64_t addr_surface_state_base,
 				       uint64_t addr_dynamic_state_base,
@@ -1209,6 +1218,7 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 				       uint64_t offset_indirect_data_start,
 				       uint64_t kernel_start_pointer)
 {
+	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
 	int b = 0;
 
 	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
@@ -1293,7 +1303,8 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00001047;
+	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
+				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1364,7 +1375,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	input_data = get_input_data(&execenv, user, bo_dict[2].data);
 	output_data = get_output_data(&execenv, user, bo_dict[3].data);
 
-	xehpc_compute_exec_compute(bo_dict[5].data,
+	xehpc_compute_exec_compute(fd,
+				   bo_dict[5].data,
 				   ADDR_GENERAL_STATE_BASE,
 				   ADDR_SURFACE_STATE_BASE,
 				   ADDR_DYNAMIC_STATE_BASE,
@@ -1532,7 +1544,8 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
 }
 
-static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+static void xe2lpg_compute_exec_compute(int fd,
+					uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_general_state_base,
 					uint64_t addr_surface_state_base,
 					uint64_t addr_dynamic_state_base,
@@ -1544,6 +1557,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					bool	 threadgroup_preemption,
 					uint32_t work_size)
 {
+	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
 	int b = 0;
 
 	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
@@ -1651,7 +1665,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00001047;
+	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
+				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1857,7 +1872,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
 	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
-	xe2lpg_compute_exec_compute(bo_dict[8].data,
+	xe2lpg_compute_exec_compute(fd,
+				    bo_dict[8].data,
 				    ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE,
 				    ADDR_DYNAMIC_STATE_BASE,
@@ -2152,13 +2168,15 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	bo_randomize(input_short, SIZE_DATA);
 
-	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
+	xe2lpg_compute_exec_compute(fd,
+				    bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
 				    threadgroup_preemption, SIZE_DATA);
 
-	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
+	xe2lpg_compute_exec_compute(fd,
+				    bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
-- 
2.43.0

