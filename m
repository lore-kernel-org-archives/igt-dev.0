Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D49E9B36D
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 12:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF8A10E132;
	Mon,  2 Mar 2026 12:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy93C5XO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EFF10E4B0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772454339; x=1803990339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rsnfq6gOkoOkX9DdZdxVFqAKamFNGZtydYQqs0Zpzxc=;
 b=Cy93C5XO4RYGn2BX33SZlNl7yWz6jEcQBEC2U3MG22czc7S3c1d+dRd3
 Js3f84svRrx8QEoS/07zjepU38PqdtAtYb3+nNttuEQUnzo2NuwAaZRRW
 58dyB6uR0sPwVah5SyY/dytMEr0dI9eteN6kGaR8y5h6ZLkxE3YG7/PIZ
 WAvqYisawgtdqPsqN2f3vZDMnKp8DqC5SCAFrkXfNa4+PzBAZm5BSBfEu
 G5MfcWXzxWNv2qHSU+7R8czjs/k8/QyhdarR9cqGcGP2Ah4n7TF+yW+V6
 exr29xe+Wj4mCDZkaYoaSwISI7okhV2+QLeFuuV3VvdZcbTZlo81lgDgA Q==;
X-CSE-ConnectionGUID: G4sH3NPDRpeOE5JYqmzFWA==
X-CSE-MsgGUID: gwyueelZR769TqXNVQVQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84098049"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84098049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:39 -0800
X-CSE-ConnectionGUID: wlgoREIGRNSPsltsjT+GpA==
X-CSE-MsgGUID: vvJZ4w5LRYG2TOpqxn+PsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="217663005"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:38 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/xe_compute: Exercise user passed buffers
Date: Mon,  2 Mar 2026 13:25:22 +0100
Message-ID: <20260302122517.4126472-11-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
References: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
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

Verify input and output buffers added to execenv are properly handled
and data within are fully on user control.

Do compute-square on input buffer and verify output contain computed
square root for floats of input buffer.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
v2: Adding SVM part by Nishit
---
 tests/intel/xe_compute.c | 106 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc56..ed652ffedf 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -510,6 +510,106 @@ test_compute_square(int fd)
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
+ * SUBTEST: compute-square-userenv-svm
+ * Mega feature: Compute
+ * Sub-category: compute tests
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
+ *	taking buffers from userenv where input is svm buffer.
+ */
+
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define FIVE_SEC		(5LL * NSEC_PER_SEC)
+#define bind_system_allocator(__sync, __num_sync)			\
+	__xe_vm_bind_assert(fd, vm, 0,					\
+			    0, 0, 0, 0x1ull << va_bits,			\
+			    DRM_XE_VM_BIND_OP_MAP,			\
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
+			    (__sync), (__num_sync), 0, 0)
+
+static void
+test_compute_square_userenv(int fd, bool input_in_svm)
+{
+	uint32_t size = SZ_4K, vm;
+	struct user_execenv env = {
+		.array_size = size / sizeof(float),
+	};
+	uint32_t input_bo, output_bo;
+	int va_bits = xe_va_bits(fd);
+	float *input, *output;
+	int i;
+
+	vm = env.vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	if (input_in_svm) {
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
+		input = aligned_alloc(xe_get_default_alignment(fd), size);
+		env.input_addr = to_user_pointer(input);
+		free(bo_sync);
+	} else {
+		input_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		input = xe_bo_map(fd, input_bo, size);
+		env.input_bo = input_bo;
+		env.input_addr = 0x30000000;
+	}
+	output_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	output = xe_bo_map(fd, output_bo, size);
+
+	env.loop_count = env.array_size / 2;
+	env.skip_results_check = true;
+	env.output_bo = output_bo;
+	env.output_addr = 0x31000000;
+
+	for (i = 0; i < env.array_size; i++)
+		input[i] = (float)i;
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
+	if (input_in_svm) {
+		free(input);
+	} else {
+		munmap(input, size);
+		gem_close(fd, input_bo);
+	}
+	munmap(output, size);
+	gem_close(fd, output_bo);
+	xe_vm_destroy(fd, env.vm);
+}
+
 int igt_main()
 {
 	int xe, ccs_mode[4];
@@ -525,6 +625,12 @@ int igt_main()
 	igt_subtest("compute-square")
 		test_compute_square(xe);
 
+	igt_subtest("compute-square-userenv")
+		test_compute_square_userenv(xe, false);
+
+	igt_subtest("compute-square-userenv-svm")
+		test_compute_square_userenv(xe, true);
+
 	igt_fixture()
 		drm_close_driver(xe);
 
-- 
2.43.0

