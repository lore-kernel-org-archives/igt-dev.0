Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C84AC54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 20:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3781210FD90;
	Thu, 14 Mar 2024 20:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/C/mVVW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1CF10FD99
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 20:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710449690; x=1741985690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DUJLgVMmezVoIN+pmGZjyGD/ovvHcdEB9tc1fJTrw0I=;
 b=f/C/mVVWiARq9UV5pr83t+blBCGdv2b74iCTxIIAHmh70GYm8fb3es6C
 TgfEypPC4Wmcs+FQbgO/ONpiLEvaO4pvq+pkD/pVlVXuNROf7lGClLFZm
 sDEGDcLZKh5mmkL77zCGw8jKyUYPqJk4ZGXMxgxOoQxVk+iBss9P0JhdI
 Ka6IzwixEBM3/dZduY2+IiW/fNtXRlHR4E1TvSkoosid2Fp0h9ED8Bfn/
 xVNkHSFwrStDPjpJ+u0bsqrwdNQyqnCQJy+y6C3rK297dkKproiclslIW
 23yV7wSJHZPGISfQrwFfTZVgpLvQ3PQYc4ds1ZCvxN8dgibTbQy55xD2T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9079476"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="9079476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12336779"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa007.fm.intel.com with ESMTP; 14 Mar 2024 13:54:48 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: nirmoy.das@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Add compute threadgroup
 preempt test
Date: Fri, 15 Mar 2024 02:30:26 +0530
Message-Id: <20240314210026.2463551-1-janga.rahul.kumar@intel.com>
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

Test submits long kernel with a higher threadgroup count, lower
iteration kernel and a short opencl kernel to exercise threadgroup
preemption scenario with WMTP disabled.

v2: Use macros instead of const values. Add documentation for
    validation check. (Nirmoy)

Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_compute.c              | 74 +++++++++++++++++++++++++-------
 lib/intel_compute.h              |  3 +-
 tests/intel/xe_compute_preempt.c | 24 +++++++++--
 3 files changed, 80 insertions(+), 21 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c5d253ebc..9d3b97efe 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -43,6 +43,13 @@
 #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
+/*
+ * TGP  - ThreadGroup Preemption
+ * WMTP - Walker Mid Thread Preemption
+ */
+#define TGP_long_kernel_loop_count		10
+#define WMTP_long_kernel_loop_count		1000000
+
 struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
@@ -1162,7 +1169,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_state_contect_data_base,
 					uint64_t offset_indirect_data_start,
 					uint64_t kernel_start_pointer,
-					uint64_t sip_start_pointer)
+					uint64_t sip_start_pointer,
+					bool	 threadgroup_preemption)
 {
 	int b = 0;
 
@@ -1236,7 +1244,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
 	addr_bo_buffer_batch[b++] = 0x000003ff;
-	addr_bo_buffer_batch[b++] = 0x00000002;
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size
+	else
+		addr_bo_buffer_batch[b++] = 0x00000002;
+
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1251,7 +1264,12 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = kernel_start_pointer;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00100000; // Enable Thread Preemption BitField:20
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00000000;
+	else
+		addr_bo_buffer_batch[b++] = 0x00100000; // Enable Mid Thread Preemption BitField:20
+
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x0c000020;
@@ -1369,7 +1387,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				  ADDR_INSTRUCTION_STATE_BASE,
 				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				  OFFSET_INDIRECT_DATA_START,
-				  OFFSET_KERNEL, 0);
+				  OFFSET_KERNEL, 0, false);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
@@ -1527,7 +1545,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					unsigned int short_kernel_size,
 					const unsigned char *sip_kernel,
 					unsigned int sip_kernel_size,
-					struct drm_xe_engine_class_instance *eci)
+					struct drm_xe_engine_class_instance *eci,
+					bool threadgroup_preemption)
 {
 #define XE2_BO_PREEMPT_DICT_ENTRIES 11
 	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
@@ -1564,6 +1583,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
 	struct bo_execenv execenv_short, execenv_long;
 	float *dinput;
+	unsigned int long_kernel_loop_count;
 	struct drm_xe_sync sync_long = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -1574,7 +1594,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
-	unsigned int long_kernel_loop_count = 1000000;
+
+	if (threadgroup_preemption)
+		long_kernel_loop_count = TGP_long_kernel_loop_count;
+	else
+		long_kernel_loop_count = WMTP_long_kernel_loop_count;
 
 	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
@@ -1622,12 +1646,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
 
 	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
 
@@ -1655,9 +1679,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 		f1 = ((float *) bo_dict_long[5].data)[i];
 
-		if (f1 != long_kernel_loop_count)
-			igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
-		igt_assert(f1 == long_kernel_loop_count);
+		if (threadgroup_preemption) {
+			if (f1 < long_kernel_loop_count)
+				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
+
+			/* Final incremented value should be greater than loop count
+			 * as the kernel is ran by multiple threads and output variable
+			 * is shared among all threads. This enusres multiple threadgroup
+			 * workload execution
+			 */
+			igt_assert(f1 > long_kernel_loop_count);
+		} else {
+			if (f1 != long_kernel_loop_count)
+				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
+			igt_assert(f1 == long_kernel_loop_count);
+		}
 	}
 
 	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
@@ -1675,7 +1711,8 @@ static const struct {
 			     unsigned int short_kernel_size,
 			     const unsigned char *sip_kernel,
 			     unsigned int sip_kernel_size,
-			     struct drm_xe_engine_class_instance *eci);
+			     struct drm_xe_engine_class_instance *eci,
+			     bool threadgroup_preemption);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
 	{
@@ -1686,7 +1723,8 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		bool threadgroup_preemption)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1724,7 +1762,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 							  kernels->kernel, kernels->size,
 							  kernels->sip_kernel,
 							  kernels->sip_kernel_size,
-							  eci);
+							  eci,
+							  threadgroup_preemption);
 
 	return true;
 }
@@ -1733,11 +1772,14 @@ static bool __run_intel_compute_kernel_preempt(int fd,
  * exercise preemption scenario.
  *
  * @fd: file descriptor of the opened DRM Xe device
+ * @eci: engine class instance
+ * @thread_preemption: enable/disable threadgroup preemption test
  *
  * Returns true on success, false otherwise.
  */
 bool run_intel_compute_kernel_preempt(int fd,
-		struct drm_xe_engine_class_instance *eci)
+		struct drm_xe_engine_class_instance *eci,
+		bool threadgroup_preemption)
 {
-	return __run_intel_compute_kernel_preempt(fd, eci);
+	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption);
 }
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index fe9637b91..3c2cd010c 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,5 +37,6 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
-bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
+bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
+				      bool threadgroup_preemption);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 0aeb10547..2bc27eff1 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -27,11 +27,16 @@
  * Description:
  *      Exercise multiple walker mid thread preemption scenario
  * Functionality: compute openCL kernel
+ * SUBTEST: compute-threadgroup-preempt
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise compute walker threadgroup preemption scenario
+ * Functionality: compute openCL kernel
  */
 static void
-test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
+test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool threadgroup_preemption)
 {
-	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), "GPU not supported\n");
 }
 
 igt_main
@@ -49,7 +54,7 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
-				test_compute_preempt(xe, hwe);
+				test_compute_preempt(xe, hwe, false);
 		}
 	}
 
@@ -61,12 +66,23 @@ igt_main
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
 				igt_fork(child, 100)
-					test_compute_preempt(xe, hwe);
+					test_compute_preempt(xe, hwe, false);
 				igt_waitchildren();
 			}
 		}
 	}
 
+	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
+		xe_for_each_engine(xe, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
+			    hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
+			test_compute_preempt(xe, hwe, true);
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 
-- 
2.25.1

