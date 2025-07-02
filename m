Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970F4C83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 07:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BE10E30C;
	Wed,  2 Jul 2025 07:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHnBSB8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D610E30C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751441573; x=1782977573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CzPFz9rmeY4kpWxWcG4RAvTCqD8BmdZskf+J6hY1wFU=;
 b=IHnBSB8SWpyp9S0yK8lXItuZs0qoe4tmgJYG0iw2CaZ3l0GF3BoKn6rg
 wdQbVCRJRoOPft02q7M/ovopZZZG7xK20lQr+m5t2KEnFSWARN13UZ6O4
 9IINQOrdEyr2ooTXgF9A90+dL2XArVymwVRky3RpfGQIWPWthPY0ZK93z
 LNoy6pJ3COsWgAuvVj2K3w+qXYKZgOa8TyD9bp7kGCU6jYRSeC+cVASay
 7Wtw9w0YQZFyeRHAlB6RkFQhGaLIcluejZz7HBu1NTT4JDJB8K3hgd27+
 XkryqKysZsqV33D1H2JJV+4zjjb9dmw/7MUl8+eb2+/QavmnkIeHNbf0Y A==;
X-CSE-ConnectionGUID: sywTpHbqRAWHev70y2EJkg==
X-CSE-MsgGUID: t+jkH5yvTW+gt4ZiR3lnkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79165909"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="79165909"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:32:52 -0700
X-CSE-ConnectionGUID: 0T6408sKTIWZVTw+Yq+KjA==
X-CSE-MsgGUID: mGHvC1XGRXSnyO/nbM+1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154549279"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 00:32:51 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: use post-sync write to detect
 command level preemption
Date: Wed,  2 Jul 2025 09:32:43 +0200
Message-ID: <20250702073242.365099-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

At command level when long job compute walker is finished we might
be immediately switched to short job. This defers signalling of long
job user-fence giving false impression this job is still ongoing.

Add post-sync write to compute walker to allow detect this situation
and fail if command level preemption occurred instead TG preemption.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9f5fc1bc59..829d3a35f9 100644
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
@@ -52,6 +53,7 @@
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
+#define POST_SYNC_VALUE			0xabcdabcdcdefcdefull
 #define MAGIC_LOOP_STOP			0x12341234
 
 #define THREADS_PER_GROUP		32
@@ -60,6 +62,9 @@
 #define ENQUEUED_LOCAL_SIZE_X		1024
 #define ENQUEUED_LOCAL_SIZE_Y		1
 #define ENQUEUED_LOCAL_SIZE_Z		1
+#define DP_SS_CACHE_FLUSH		(1 << 12)
+#define DP_PIPELINE_FLUSH		(1 << 2)
+#define WRITE_IMM_DATA			(1 << 0)
 
 /*
  * TGP  - ThreadGroup Preemption
@@ -1532,7 +1537,8 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
 }
 
-static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+static void xe2lpg_compute_exec_compute(int fd,
+					uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_general_state_base,
 					uint64_t addr_surface_state_base,
 					uint64_t addr_dynamic_state_base,
@@ -1544,6 +1550,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					bool	 threadgroup_preemption,
 					uint32_t work_size)
 {
+	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
 	int b = 0;
 
 	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
@@ -1603,7 +1610,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
 	addr_bo_buffer_batch[b++] = 0x001ff000;
 
-	if (sip_start_pointer) {
+	if (sip_start_pointer && !threadgroup_preemption) {
 		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
 		addr_bo_buffer_batch[b++] = sip_start_pointer;
 		addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1651,11 +1658,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00001047;
+	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
+				    DP_PIPELINE_FLUSH | WRITE_IMM_DATA;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
-	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;
+	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1857,7 +1865,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
 	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
-	xe2lpg_compute_exec_compute(bo_dict[8].data,
+	xe2lpg_compute_exec_compute(fd,
+				    bo_dict[8].data,
 				    ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE,
 				    ADDR_DYNAMIC_STATE_BASE,
@@ -2101,6 +2110,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
 	struct bo_execenv execenv_short, execenv_long;
 	float *input_short, *output_short, *input_long;
+	uint64_t *post_data;
 	unsigned int long_kernel_loop_count = 0;
 	int64_t timeout_one_ns = 1;
 	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
@@ -2149,16 +2159,19 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	input_long = (float *) bo_dict_long[4].data;
 	input_short = (float *) bo_dict_short[4].data;
 	output_short = (float *) bo_dict_short[5].data;
+	post_data = (uint64_t *) bo_dict_long[8].data;
 
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
@@ -2177,6 +2190,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	bo_execenv_exec(&execenv_short, ADDR_BATCH);
 	bo_check_square(input_short, output_short, SIZE_DATA);
 
+	/*
+	 * Catch command level preemption instead TG preemption. For TG and WMTP
+	 * post sync can't be visible at this point yet.
+	 */
+	igt_assert_neq_u64(POST_SYNC_VALUE, *post_data);
+
 	/* Check that the long kernel has not completed yet */
 	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
 					   execenv_long.exec_queue, &timeout_one_ns));
@@ -2187,6 +2206,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	((int *)input_long)[0] = MAGIC_LOOP_STOP;
 
 	bo_execenv_sync(&execenv_long);
+	igt_assert_eq_u64(POST_SYNC_VALUE, *post_data);
 
 	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
 	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
-- 
2.43.0

