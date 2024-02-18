Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544B1C48BF6
	for <igt-dev@archiver.kernel.org>; Sun, 18 Feb 2024 13:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB33D10E0C1;
	Sun, 18 Feb 2024 13:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3OYZDR9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7334B10E0C1
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Feb 2024 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708262025; x=1739798025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=daWe3gDrVZDaHBLaOcyiqvMss+KBtFW5djReF7b+8vE=;
 b=B3OYZDR94u/ln9OrJWRWoN16JDepkQwfuLQlatjXbiwqj6f9RdZBK89f
 KeCsG3qnMRgDfKm1eR8teof50iusmOb/rxgSgyJ8z6VoQD+m9k7MVbvLP
 1NaO0uOjhYbDMSuu+ZDZpg6wLQd0ANl3qLzihviLqW+K/f7RFeJaN1bVD
 BuV2HplUwbucTIiD09RFkweyze+mRtYWdh5+TtszuNTJq+kzGVNLcH3Vv
 7byPD7oD9X8XyZX0tbql/zarV5Vo1qWst6EhP1g7/b2kS8sA+NTjllztE
 R90J8NVBa8OoSh7v3VgnX0HS+pQl8f5zQY1ukRfAhTsbPOLFNVJ2wWeyB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="19870548"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; d="scan'208";a="19870548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 05:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4294836"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2024 05:13:42 -0800
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: nirmoy.das@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Add mtp disabled
 preempt test
Date: Sun, 18 Feb 2024 18:48:47 +0530
Message-Id: <20240218131847.836161-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Check preemption scenario with Mid thread preemption disabled.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/intel_compute.c              | 148 ++++++++++++++++++++-----------
 lib/intel_compute.h              |   2 +-
 tests/intel/xe_compute_preempt.c |  16 +++-
 3 files changed, 111 insertions(+), 55 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index eab407a0d..753add674 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1162,7 +1162,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_state_contect_data_base,
 					uint64_t offset_indirect_data_start,
 					uint64_t kernel_start_pointer,
-					uint64_t sip_start_pointer)
+					uint64_t sip_start_pointer,
+					bool	 thread_preemption)
 {
 	int b = 0;
 
@@ -1195,6 +1196,13 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x03808800;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	if (!thread_preemption) {
+		addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
+		addr_bo_buffer_batch[b++] = 0x0001a580;
+		addr_bo_buffer_batch[b++] = 0x0000d401;
+	}
+
 	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
 	addr_bo_buffer_batch[b++] = (addr_general_state_base & 0xffffffff) | 0x21;
 	addr_bo_buffer_batch[b++] = addr_general_state_base >> 32;
@@ -1251,7 +1259,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = kernel_start_pointer;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
+
+	if (thread_preemption)
+		addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
+	else
+		addr_bo_buffer_batch[b++] = 0x00000000; // Disable Thread Preemption BitField:20
+
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x0c000020;
@@ -1369,7 +1382,9 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				  ADDR_INSTRUCTION_STATE_BASE,
 				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				  OFFSET_INDIRECT_DATA_START,
-				  OFFSET_KERNEL, 0);
+				  OFFSET_KERNEL,
+				  0,
+				  false);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
@@ -1520,13 +1535,17 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
  * @short_kernel_size: size of @short_kernel
  * @sip_kernel: WMTP sip kernel which does save restore during preemption
  * @sip_kernel_size: size of @sip_kernel
+ * @thread_preemption: flag to enable/disable thread level preemption
+ * @multi_short: submit multiple short kernels
  */
 static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel,
 					unsigned int long_kernel_size,
 					const unsigned char *short_kernel,
 					unsigned int short_kernel_size,
 					const unsigned char *sip_kernel,
-					unsigned int sip_kernel_size)
+					unsigned int sip_kernel_size,
+					bool thread_preemption,
+					bool multi_short)
 {
 #define XE2_BO_PREEMPT_DICT_ENTRIES 11
 	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
@@ -1560,41 +1579,67 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .name = "sip kernel"},
 	};
 
-	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
-	struct bo_execenv execenv_short, execenv_long;
+	int n_short = (multi_short) ? 3 : 1;
+	struct bo_dict_entry bo_dict_short[n_short][XE2_BO_PREEMPT_DICT_ENTRIES];
+	struct bo_execenv execenv_short[n_short], execenv_long;
+	struct drm_xe_sync sync_short[n_short];
 	float *dinput;
+	memset(sync_short, 0, sizeof(sync_short));
+
 	struct drm_xe_sync sync_long = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
-	struct drm_xe_sync sync_short = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
-		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.handle = syncobj_create(fd, 0),
-	};
+
 	unsigned int long_kernel_loop_count = 1000000;
 
-	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
-		bo_dict_short[i] = bo_dict_long[i];
+	for (int j = 0; j < n_short; j++) {
+		for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
+			bo_dict_short[j][i] = bo_dict_long[i];
+
+		bo_execenv_create(fd, &execenv_short[j], NULL);
+
+		bo_dict_short[j][0].size = ALIGN(short_kernel_size, 0x1000);
+		bo_dict_short[j][10].size = ALIGN(sip_kernel_size, 0x1000);
+
+		bo_execenv_bind(&execenv_short[j], bo_dict_short[j], XE2_BO_PREEMPT_DICT_ENTRIES);
+
+		memcpy(bo_dict_short[j][0].data, short_kernel, short_kernel_size);
+		memcpy(bo_dict_short[j][10].data, sip_kernel, sip_kernel_size);
+
+		create_dynamic_state(bo_dict_short[j][1].data, OFFSET_KERNEL);
+		xehp_create_surface_state(bo_dict_short[j][2].data, ADDR_INPUT, ADDR_OUTPUT);
+		xehp_create_indirect_data(bo_dict_short[j][3].data, ADDR_INPUT, ADDR_OUTPUT);
+		xehp_create_surface_state(bo_dict_short[j][7].data, ADDR_INPUT, ADDR_OUTPUT);
+
+		dinput = (float *)bo_dict_short[j][4].data;
+
+		for (int i = 0; i < SIZE_DATA; i++)
+			((float *)dinput)[i] = rand() / (float)RAND_MAX;
+
+		xe2lpg_compute_exec_compute(bo_dict_short[j][8].data, ADDR_GENERAL_STATE_BASE,
+						ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
+						ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
+						OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
+						thread_preemption);
+
+		sync_short[j].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync_short[j].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync_short[j].handle = syncobj_create(fd, 0);
+	}
 
-	bo_execenv_create(fd, &execenv_short, NULL);
 	bo_execenv_create(fd, &execenv_long, NULL);
 
 	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
-	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
 	bo_dict_long[10].size = ALIGN(sip_kernel_size, 0x1000);
-	bo_dict_short[10].size = ALIGN(sip_kernel_size, 0x1000);
 
 	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
-	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
 
 	memcpy(bo_dict_long[0].data, long_kernel, long_kernel_size);
-	memcpy(bo_dict_short[0].data, short_kernel, short_kernel_size);
 
 	memcpy(bo_dict_long[10].data, sip_kernel, sip_kernel_size);
-	memcpy(bo_dict_short[10].data, sip_kernel, sip_kernel_size);
 
 	create_dynamic_state(bo_dict_long[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict_long[2].data, ADDR_INPUT, ADDR_OUTPUT);
@@ -1602,10 +1647,6 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					    long_kernel_loop_count);
 	xehp_create_surface_state(bo_dict_long[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	dinput = (float *)bo_dict_long[4].data;
 	srand(time(NULL));
@@ -1613,40 +1654,37 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	for (int i = 0; i < SIZE_DATA; i++)
 		((float *)dinput)[i] = rand() / (float)RAND_MAX;
 
-	dinput = (float *)bo_dict_short[4].data;
-
-	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
 
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
-
-	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
-				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
-				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
+				    thread_preemption);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
 
-	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
+	for (int j = 0; j < n_short; j++) {
+		xe_exec_sync(fd, execenv_short[j].exec_queue, ADDR_BATCH, &sync_short[j], 1);
+
+		igt_assert(syncobj_wait(fd, &sync_short[j].handle, 1, INT64_MAX, 0, NULL));
+		syncobj_destroy(fd, sync_short[j].handle);
+	}
 
-	igt_assert(syncobj_wait(fd, &sync_short.handle, 1, INT64_MAX, 0, NULL));
-	syncobj_destroy(fd, sync_short.handle);
 
 	igt_assert(syncobj_wait(fd, &sync_long.handle, 1, INT64_MAX, 0, NULL));
 	syncobj_destroy(fd, sync_long.handle);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
+	for (int j = 0; j < n_short; j++) {
+		for (int i = 0; i < SIZE_DATA; i++) {
+			float f1, f2;
 
-		f1 = ((float *) bo_dict_short[5].data)[i];
-		f2 = ((float *) bo_dict_short[4].data)[i];
+			f1 = ((float *) bo_dict_short[j][5].data)[i];
+			f2 = ((float *) bo_dict_short[j][4].data)[i];
 
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
-		igt_assert(f1 == f2 * f2);
+			if (f1 != f2 * f2)
+				igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
+			igt_assert(f1 == f2 * f2);
+		}
 	}
 
 	for (int i = 0; i < SIZE_DATA; i++) {
@@ -1659,10 +1697,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		igt_assert(f1 == long_kernel_loop_count);
 	}
 
-	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
-	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
+	for (int j = 0; j < n_short; j++) {
+		bo_execenv_unbind(&execenv_short[j], bo_dict_short[j], XE2_BO_PREEMPT_DICT_ENTRIES);
+		bo_execenv_destroy(&execenv_short[j]);
+	}
 
-	bo_execenv_destroy(&execenv_short);
+	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
 	bo_execenv_destroy(&execenv_long);
 }
 
@@ -1673,7 +1713,9 @@ static const struct {
 			     const unsigned char *short_kernel,
 			     unsigned int short_kernel_size,
 			     const unsigned char *sip_kernel,
-			     unsigned int sip_kernel_size);
+			     unsigned int sip_kernel_size,
+			     bool thread_preemption,
+			     bool multi_short);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
 	{
@@ -1683,7 +1725,7 @@ static const struct {
 	},
 };
 
-static bool __run_intel_compute_kernel_preempt(int fd)
+static bool __run_intel_compute_kernel_preempt(int fd, bool thread_preemption, bool multi_short)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1720,7 +1762,9 @@ static bool __run_intel_compute_kernel_preempt(int fd)
 							  kernels->long_kernel_size,
 							  kernels->kernel, kernels->size,
 							  kernels->sip_kernel,
-							  kernels->sip_kernel_size);
+							  kernels->sip_kernel_size,
+							  thread_preemption,
+							  multi_short);
 
 	return true;
 }
@@ -1729,10 +1773,12 @@ static bool __run_intel_compute_kernel_preempt(int fd)
  * exercise preemption scenario.
  *
  * @fd: file descriptor of the opened DRM Xe device
+ * @thread_preemption: flag to enable/disable thread level preemption
+ * @multi_short: submit multiple short kernels
  *
  * Returns true on success, false otherwise.
  */
-bool run_intel_compute_kernel_preempt(int fd)
+bool run_intel_compute_kernel_preempt(int fd, bool thread_preemption, bool multi_short)
 {
-	return __run_intel_compute_kernel_preempt(fd);
+	return __run_intel_compute_kernel_preempt(fd, thread_preemption, multi_short);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index a02688ad4..b5932ac2b 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,5 +37,5 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd);
+bool run_intel_compute_kernel_preempt(int fd, bool thread_preemption, bool multi_short);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 31703638e..4d0feb22b 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -22,11 +22,18 @@
  * Description:
  *      Exercise compute walker mid thread preemption scenario
  * Functionality: compute openCL kernel
+ *
+ * SUBTEST: compute-preempt-mtp-disabled
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise compute preemption with Mid thread preemption disabled
+ * Functionality: compute openCL kernel
  */
+
 static void
-test_compute_preempt(int fd)
+test_compute_preempt(int fd, bool thread_preemption, bool multi_short)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel_preempt(fd, thread_preemption, multi_short), "GPU not supported\n");
 }
 
 igt_main
@@ -37,7 +44,10 @@ igt_main
 		xe = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("compute-preempt")
-		test_compute_preempt(xe);
+		test_compute_preempt(xe, true, 0);
+
+	igt_subtest("compute-preempt-mtp-disabled")
+		test_compute_preempt(xe, false, 1);
 
 	igt_fixture
 		drm_close_driver(xe);
-- 
2.25.1

