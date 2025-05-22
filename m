Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDC1C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 07:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5910E12D;
	Thu, 22 May 2025 07:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ob6TWvYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA33113029
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747900535; x=1779436535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UZnWbHYvGH1DVhU1QibRgIGDCcyEO28nbGu3fRz8EA=;
 b=Ob6TWvYfNmAHQ4GOvKh5EAuhbP10iBLAkXHsCAlVeVN/nR98UjDQm905
 xOAN4GNoEwCMfTZUi1oo9BkmDrEyY9yWWeZoaw9CzvTZ8JzlQHRe/pgQv
 dPvHs38p+Q3g0qwYN0PFrfh/HFpmY9vFiePdW0fLaPAcWn8rHLuab8lVx
 geNxctXzEgMSMGPsBycf/bIlIoB/NwoO/mm/b2LaDVshcbSmxZFC5/KJQ
 yJV26uN4rZ2zYTcq/K0RU+0XRnUWqvHANmJ+n5Jplbx7CrcZetvwDTThl
 cTWrW5X0uQtB76MDnEL8CAll1MnEqP5BNwyfcX5qEKlAljX+kEy6w9iIL g==;
X-CSE-ConnectionGUID: kLDimUTPSPmza9gcx2rffQ==
X-CSE-MsgGUID: 9zSPObAJR6GSBtdpiIL1sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50051009"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50051009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:27 -0700
X-CSE-ConnectionGUID: vR3mjggRSyOBW5sJhrWTQA==
X-CSE-MsgGUID: +8GmvNZ8QtqDOc5/bUjNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140888583"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:26 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 2/4] lib/intel_compute: simplify compute-preempt
 subtests
Date: Thu, 22 May 2025 09:55:13 +0200
Message-ID: <20250522075515.168920-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
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

Code in compute-preempt-exec uses locally created user-fences what
takes a lot of lines. Introduced bo_execenv_exec_async() allows to
synchronize later with user-fence defined in execenv itself.

Moreover logic of wmtp and threadgroup preempt scenarios was simplified.
Now both cases assume compute-square (short running job) must complete
before long running job will end. For WMTP we have full control and
we're able to stop it via write MAGIC value to input buffer (shader
waits for it to break endless loop). For threadgroup this is harder
to achieve because preemption occurs on some point where threadgroup
ends its execution. Shader (increment loop) for threadgroup preemption
uses large x-dim what causes short job preempts it on some point of time.
This unfortunately requires some fine tweaking (setting x-dim) but
at the moment I haven't found better way to implement this case.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 152 ++++++++++++--------------------------------
 1 file changed, 41 insertions(+), 111 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 5579bec85b..d2629ed911 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -67,6 +67,7 @@
  */
 #define TGP_long_kernel_loop_count		10
 #define WMTP_long_kernel_loop_count		1000000
+#define XE2_THREADGROUP_PREEMPT_XDIM		0x200000
 
 struct bo_dict_entry {
 	uint64_t addr;
@@ -102,6 +103,25 @@ struct bo_execenv {
 	struct user_execenv *user;
 };
 
+static void bo_randomize(float *ptr, int size)
+{
+	srand(time(NULL));
+	for (int i = 0; i < size; i++)
+		ptr[i] = rand() / (float)RAND_MAX;
+}
+
+static void bo_check_square(float *input, float *output, int size)
+{
+	for (int i = 0; i < size; i++) {
+		float expected_output = input[i] * input[i];
+
+		if (output[i] != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input[i], output[i], expected_output);
+		igt_assert_eq_double(output[i], expected_output);
+	}
+}
+
 static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 			      struct drm_xe_engine_class_instance *eci,
 			      struct user_execenv *user)
@@ -1584,10 +1604,10 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	if (threadgroup_preemption)
 		/*
-		 * Create multiple threadgroups using higher gloabl workgroup size
+		 * Create multiple threadgroups using higher global workgroup size
 		 * Global Workgroup size = Local X * Thread Group X +  Local Y * Thread Group Y + Local Z * Thread Group Z
 		 */
-		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
+		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
 	else
 		addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
 
@@ -2077,30 +2097,15 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .size = 0x6400000,
 		  .name = "state context data base"},
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_STATE_SIP,
+		  .size = ALIGN(sip_kernel_size, 0x1000),
 		  .name = "sip kernel"},
 	};
 
 	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
 	struct bo_execenv execenv_short, execenv_long;
-	float *input_data, *output_data;
-	unsigned int long_kernel_loop_count;
-	struct drm_xe_sync sync_long = {
-		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
-		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.timeline_value = USER_FENCE_VALUE,
-	};
-	struct bo_sync *bo_sync_long;
-	size_t bo_size_long = sizeof(*bo_sync_long);
-	uint32_t bo_long = 0;
-	struct drm_xe_sync sync_short = {
-		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
-		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.timeline_value = USER_FENCE_VALUE,
-	};
-	struct bo_sync *bo_sync_short;
-	size_t bo_size_short = sizeof(*bo_sync_short);
-	uint32_t bo_short = 0;
-	int64_t timeout_short = 1;
+	float *input_short, *output_short, *input_long;
+	unsigned int long_kernel_loop_count = 0;
+	int64_t timeout_one_ns = 1;
 	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
 
 	if (threadgroup_preemption)
@@ -2114,41 +2119,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	bo_execenv_create(fd, &execenv_short, eci, NULL);
 	bo_execenv_create(fd, &execenv_long, eci, NULL);
 
-	/* Prepare sync object for long */
-	bo_size_long = xe_bb_size(fd, bo_size_long);
-	bo_long = xe_bo_create(fd, execenv_long.vm, bo_size_long, vram_if_possible(fd, 0),
-			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	bo_sync_long = xe_bo_map(fd, bo_long, bo_size_long);
-	sync_long.addr = to_user_pointer(&bo_sync_long->sync);
-	xe_vm_bind_async(fd, execenv_long.vm, 0, bo_long, 0, ADDR_SYNC, bo_size_long,
-			 &sync_long, 1);
-	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
-		       INT64_MAX);
-	bo_sync_long->sync = 0;
-	sync_long.addr = ADDR_SYNC;
-
-	/* Prepare sync object for short */
-	bo_size_short = xe_bb_size(fd, bo_size_short);
-	bo_short = xe_bo_create(fd, execenv_short.vm, bo_size_short, vram_if_possible(fd, 0),
-			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	bo_sync_short = xe_bo_map(fd, bo_short, bo_size_short);
-	sync_short.addr = to_user_pointer(&bo_sync_short->sync);
-	xe_vm_bind_async(fd, execenv_short.vm, 0, bo_short, 0, ADDR_SYNC2, bo_size_short,
-			 &sync_short, 1);
-	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
-		       INT64_MAX);
-	bo_sync_short->sync = 0;
-	sync_short.addr = ADDR_SYNC2;
-
 	if (use_loop_kernel)
 		bo_dict_long[0].size = ALIGN(loop_kernel_size, 0x1000);
 	else
 		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
-	bo_dict_long[10].size = ALIGN(sip_kernel_size, 0x1000);
-	bo_dict_short[10].size = ALIGN(sip_kernel_size, 0x1000);
-
 	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
 	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
 
@@ -2172,17 +2148,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xelpg_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	input_data = (float *) bo_dict_long[4].data;
-	output_data = (float *) bo_dict_short[5].data;
-	srand(time(NULL));
+	input_long = (float *) bo_dict_long[4].data;
+	input_short = (float *) bo_dict_short[4].data;
+	output_short = (float *) bo_dict_short[5].data;
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
-
-	input_data = (float *) bo_dict_short[4].data;
-
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+	bo_randomize(input_short, SIZE_DATA);
 
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
@@ -2196,66 +2166,26 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
 				    false, SIZE_DATA);
 
-	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
+	bo_execenv_exec_async(&execenv_long, ADDR_BATCH);
 
 	/* Wait until multiple LR jobs will start to occupy gpu */
 	if (use_loop_kernel)
 		sleep(1);
 
-	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
-
-	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
-		       INT64_MAX);
+	/*
+	 * Regardless scenario - wmtp or threadgroup short job (compute
+	 * square) must complete first and long job must be still active.
+	 */
+	bo_execenv_exec(&execenv_short, ADDR_BATCH);
+	bo_check_square(input_short, output_short, SIZE_DATA);
 
 	/* Check that the long kernel has not completed yet */
-	igt_assert_neq(0, __xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE,
-					   execenv_long.exec_queue, &timeout_short));
+	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
+					   execenv_long.exec_queue, &timeout_one_ns));
 	if (use_loop_kernel)
-		((int *)bo_dict_long[4].data)[0] = MAGIC_LOOP_STOP;
+		((int *)input_long)[0] = MAGIC_LOOP_STOP;
 
-	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
-		       INT64_MAX);
-
-	munmap(bo_sync_long, bo_size_long);
-	gem_close(fd, bo_long);
-
-	munmap(bo_sync_short, bo_size_short);
-	gem_close(fd, bo_short);
-
-	for (int i = use_loop_kernel ? 1 : 0; i < SIZE_DATA; i++) {
-		float input = input_data[i];
-		float output = output_data[i];
-		float expected_output = input * input;
-
-		if (output != expected_output)
-			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
-				  i, input, output, expected_output);
-		igt_assert_eq_double(output, expected_output);
-	}
-
-	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1;
-
-		f1 = ((float *) bo_dict_long[5].data)[i];
-
-		if (threadgroup_preemption) {
-			if (f1 < long_kernel_loop_count)
-				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
-
-			/* Final incremented value should be greater than loop count
-			 * as the kernel is ran by multiple threads and output variable
-			 * is shared among all threads. This enusres multiple threadgroup
-			 * workload execution
-			 */
-			igt_assert(f1 > long_kernel_loop_count);
-		} else {
-			if (!loop_kernel) {
-				if (f1 != long_kernel_loop_count)
-					igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
-				igt_assert(f1 == long_kernel_loop_count);
-			}
-		}
-	}
+	bo_execenv_sync(&execenv_long);
 
 	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
 	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
-- 
2.43.0

