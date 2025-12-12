Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4550D49208
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580B510E573;
	Fri, 12 Dec 2025 11:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwF8wITe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B88910E573
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765540348; x=1797076348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4yFW8Rkgn9wnI0lwDjlCoh4+AAxbxR/u4/7Eh4A5K3g=;
 b=EwF8wITem3m+MlsDx2dFrHM8x18Flush7sDchxXKdsM4htvG7LlOQKQg
 tuqx0amJ5RIAHm+A/QV4jY4OHt6e5NN5e+ASOp24P7mUVY2Tumo811qE8
 Yzh1zP+UQWeWPcQADb3xNgtAlW6QvKwzdd4/yHu5t22eu2kbWyXzaSmm6
 Sia6ExUmLaH1K7HqKQgNt4bavSplht0WJYBnwN3OevQfTO4PzMZmV/rbz
 MXoVTDAkFOebaaZU5511MZWtqx9s9r+GXimn9TJpO1iOAy4q4ClZsyZGt
 i8FjqZv5eFT0GAmOZdqvs3KbdkZs/UoF8LJX4UsKoZGIvGma9GIvGqFjF w==;
X-CSE-ConnectionGUID: c+HXxWUaTVyYNbOz8a1r2A==
X-CSE-MsgGUID: Xi2r4SEBS7OfaOzxE7kgmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67615561"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67615561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:27 -0800
X-CSE-ConnectionGUID: i2fC6ZrUTfSu8IJRcNfa3g==
X-CSE-MsgGUID: erxqJLDaRUKS3PUVg55yhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="234473116"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:52:26 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v2 1/3] lib/intel_compute: Differentiate array_size and loop_count
Date: Fri, 12 Dec 2025 12:51:09 +0100
Message-ID: <20251212115208.179655-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115208.179655-1-francois.dugast@intel.com>
References: <20251212115208.179655-1-francois.dugast@intel.com>
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

Use of execenv.array_size was ambiguous. Split into separate variables
to make it clear and to prepare to let user control those variables
independently when executing compute kernels.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c                    | 26 ++++++++++++++++----------
 lib/intel_compute.h                    |  2 ++
 tests/intel/xe_exec_system_allocator.c | 11 ++++++-----
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index e112e57b5..154318bb5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -94,6 +94,7 @@ struct bo_execenv {
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t array_size;
+	unsigned int loop_count;
 
 	/* Xe user-fence */
 	uint32_t bo;
@@ -181,6 +182,11 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 		else
 			execenv->array_size = SIZE_DATA;
 
+		if (user && user->loop_count)
+			execenv->loop_count = user->loop_count;
+		else
+			execenv->loop_count = execenv->array_size / sizeof(float);
+
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
 								   eci, 0);
@@ -864,7 +870,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
+			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
 	output_data = get_output_data(&execenv, user, bo_dict[5].data);
@@ -885,7 +891,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1152,7 +1158,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-				  execenv.array_size);
+				  execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
@@ -1170,7 +1176,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1365,7 +1371,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
-				   execenv.array_size);
+				   execenv.loop_count);
 
 	input_data = get_input_data(&execenv, user, bo_dict[2].data);
 	output_data = get_output_data(&execenv, user, bo_dict[3].data);
@@ -1382,7 +1388,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1762,7 +1768,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-				   execenv.array_size);
+				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
@@ -1780,7 +1786,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1850,7 +1856,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-				   execenv.array_size);
+				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
@@ -1881,7 +1887,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	}
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 8a3d7b450..28c1efd55 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -63,6 +63,8 @@ struct user_execenv {
 	uint64_t input_addr;
 	/** @output_addr: override default address of the output array if provided */
 	uint64_t output_addr;
+	/** @loop_count: override default loop count if provided */
+	unsigned int loop_count;
 	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
 	uint64_t loop_kernel_duration;
 };
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index ffa4ec3f5..07ac6b66c 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2190,9 +2190,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	} *bo_sync;
 	uint32_t vm;
 	struct user_execenv env = {
-		.array_size = size / sizeof(float),
+		.array_size = size,
 	};
 	float *compute_input, *compute_output;
+	unsigned int loop_count = env.array_size / sizeof(float);
 	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -2201,12 +2202,12 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(SZ_2M, size);
+	compute_input = aligned_alloc(SZ_2M, env.array_size);
 	igt_assert(compute_input);
-	compute_output = aligned_alloc(SZ_2M, size);
+	compute_output = aligned_alloc(SZ_2M, env.array_size);
 	igt_assert(compute_output);
 
-	for (i = 0; i < env.array_size; i++)
+	for (i = 0; i < loop_count; i++)
 		compute_input[i] = rand() / (float)RAND_MAX;
 
 	env.input_addr = to_user_pointer(compute_input);
@@ -2214,7 +2215,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 	env.vm = vm;
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
-	for (i = 0; i < env.array_size; i++)
+	for (i = 0; i < loop_count; i++)
 		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
 
 	free(compute_output);
-- 
2.43.0

