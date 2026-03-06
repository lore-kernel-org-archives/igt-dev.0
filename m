Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D3DF0180E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 09:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F4010E20D;
	Fri,  6 Mar 2026 09:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfL9D3jY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AE810E20D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772788493; x=1804324493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oGpZpszlYXQj27lcDACPzjz8G6y0qvvlKqfjgb6Vguw=;
 b=UfL9D3jYXI76lpNjQY9ckHfHdZEg6i2YGdkXR2Li0/FE6VgBYM42NrXz
 NjC6FEZSTqqfoORH1cj72ASH9Z/3K/pGQBf9xbnzbK8TiQS8EQiHbmQqc
 6aQWAw9vXHMql6YNw5QFMKgw4OxNAHMcgObJ4vudcxdW/FjLXfMnIXgFI
 fk0zIs9jlTyyCYmYYue0/7rca8srUhhhfP10IdzzeXGK3BROW5ySAX4VI
 nMP5ZfAvC5CQkmq4Rbj/NRUtZuAtYq0vhfjf6bUcgkypAoRKyune7Ydno
 UTHCkMMBELnA4mX0ayhEt7dm90vK+rrU6XnC1v7O0Km80mK8UjjcKefz+ g==;
X-CSE-ConnectionGUID: N5Omopz1Rumj/DRYBHi8OA==
X-CSE-MsgGUID: HEGuggHQRRijTJi5tc6bog==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96508786"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="96508786"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:14:52 -0800
X-CSE-ConnectionGUID: 7FzgPvOXQCGrOjM4QzcQkw==
X-CSE-MsgGUID: qGWe3WktShKlsPEiAnwSQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218198631"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:14:51 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v7 4/6] tests/xe_compute: Extend compute test to cover
 user passed buffers
Date: Fri,  6 Mar 2026 10:14:35 +0100
Message-ID: <20260306091430.1234990-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
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

Compute library allows user to pass its own buffers. They may be
normal buffer objects or system allocated buffers (SVM).

Verify input and output buffers added to user_execenv are properly
handled and data within are fully on user control. Execute compute
square on these buffers and check data are correct regardless
allocation strategy.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_compute.c | 150 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc56..e5367b4c10 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -510,6 +510,144 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
+/**
+ * SUBTEST: compute-square-userenv
+ * Mega feature: Compute
+ * Sub-category: compute tests
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	taking buffers from userenv.
+ *
+ * SUBTEST: compute-square-userenv-isvm
+ * Mega feature: Compute
+ * Sub-category: compute tests
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	taking buffers from userenv where input is svm buffer.
+ *
+ * SUBTEST: compute-square-userenv-osvm
+ * Mega feature: Compute
+ * Sub-category: compute tests
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	taking buffers from userenv where output buffer is svm buffer.
+ *
+ * SUBTEST: compute-square-userenv-iosvm
+ * Mega feature: Compute
+ * Sub-category: compute tests
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	taking buffers from userenv where input and output buffers are svm buffer.
+ */
+
+#define INPUT_IN_SVM		(1 << 0)
+#define OUTPUT_IN_SVM		(1 << 1)
+#define INPUT_BO_ADDR		0x30000000
+#define OUTPUT_BO_ADDR		0x31000000
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define FIVE_SEC		(5LL * NSEC_PER_SEC)
+
+#define bind_system_allocator(__sync, __num_sync)			\
+	__xe_vm_bind_assert(fd, vm, 0,					\
+			    0, 0, 0, 0x1ull << va_bits,			\
+			    DRM_XE_VM_BIND_OP_MAP,			\
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
+			    (__sync), (__num_sync), 0, 0)
+
+static void
+test_compute_square_userenv(int fd, uint32_t flags)
+{
+	struct user_execenv env = {};
+	uint32_t input_bo, output_bo, vm, size = SZ_4K;
+	int va_bits = xe_va_bits(fd);
+	float *input, *output;
+	int i;
+
+	size = ALIGN(size, xe_get_default_alignment(fd));
+	env.array_size = size / sizeof(float);
+
+	vm = env.vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	if ((flags & INPUT_IN_SVM) || (flags & OUTPUT_IN_SVM)) {
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+		};
+		struct bo_sync {
+			uint64_t sync;
+		} *bo_sync;
+
+		bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
+		igt_assert(bo_sync);
+		sync.addr = to_user_pointer(&bo_sync->sync);
+		bind_system_allocator(&sync, 1);
+		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+		free(bo_sync);
+	}
+
+	if (flags & INPUT_IN_SVM) {
+		input = aligned_alloc(xe_get_default_alignment(fd), size);
+		env.input_addr = to_user_pointer(input);
+
+	} else {
+		input_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		input = xe_bo_map(fd, input_bo, size);
+		env.input_bo = input_bo;
+		env.input_addr = INPUT_BO_ADDR;
+	}
+
+	if (flags & OUTPUT_IN_SVM) {
+		output = aligned_alloc(xe_get_default_alignment(fd), size);
+		env.output_addr = to_user_pointer(output);
+	} else {
+		output_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
+					 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		output = xe_bo_map(fd, output_bo, size);
+		env.output_bo = output_bo;
+		env.output_addr = OUTPUT_BO_ADDR;
+	}
+
+	env.loop_count = env.array_size / 2;
+	env.skip_results_check = true;
+
+	for (i = 0; i < env.array_size; i++)
+		input[i] = (float)i + 2.0f;
+
+	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+
+	for (i = 0; i < env.loop_count; i++) {
+		float expected_output = input[i] * input[i];
+
+		if (output[i] != expected_output || output[i] == 0.0f)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input[i], output[i], expected_output);
+		igt_assert_eq_double(output[i], expected_output);
+	}
+
+	if (flags & INPUT_IN_SVM) {
+		free(input);
+	} else {
+		munmap(input, size);
+		gem_close(fd, input_bo);
+	}
+
+	if (flags & OUTPUT_IN_SVM) {
+		free(output);
+	} else {
+		munmap(output, size);
+		gem_close(fd, output_bo);
+	}
+
+	xe_vm_destroy(fd, env.vm);
+}
+
 int igt_main()
 {
 	int xe, ccs_mode[4];
@@ -525,6 +663,18 @@ int igt_main()
 	igt_subtest("compute-square")
 		test_compute_square(xe);
 
+	igt_subtest("compute-square-userenv")
+		test_compute_square_userenv(xe, 0);
+
+	igt_subtest("compute-square-userenv-isvm")
+		test_compute_square_userenv(xe, INPUT_IN_SVM);
+
+	igt_subtest("compute-square-userenv-osvm")
+		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
+
+	igt_subtest("compute-square-userenv-iosvm")
+		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
+
 	igt_fixture()
 		drm_close_driver(xe);
 
-- 
2.43.0

