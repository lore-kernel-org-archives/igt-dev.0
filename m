Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0C4FD45E4
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7854910E376;
	Wed, 25 Feb 2026 19:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRDF2BPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3119710E81E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772048678; x=1803584678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1PXsbvsP9S6AUB99NLPwvGcKC8Qb+l5z6Bjw49pKMvo=;
 b=VRDF2BPAzYsMt4a3zrDI+n2hBk3TBw9BvEout1ihxhz+uKGaOKub+5rM
 4awYXDwab5MZLUxXaj/XSJq2xrKmk1QbMqB5nWwP7Jrc+V6rG54kxh7ij
 NnMHCDZ9FfX8BngWhvHJrtMgDFx3a72YAJhdtw+qVBDYnLPUqvAsAhrX0
 VxnzJpHII/6iEc+ZvNUs/uZEwxoSTizUNT1IFOMR1blwY9ftz+wJSs4rq
 krUMwXs3IBNoKjXnefkp2sK/5M1iz9beJd2ND7MyuL4/JRsvCmO3b5O+z
 C/Wcw/dgBzajkhfYJqw0kiR/Nhs842KMeMkLpEx2HlbmY4gC4pSO/+/43 Q==;
X-CSE-ConnectionGUID: YNgs0P4dQkyLP/R6VNRUtQ==
X-CSE-MsgGUID: 2oO6y3lQRtSp8VKs1zjU+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95713114"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95713114"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:37 -0800
X-CSE-ConnectionGUID: EfyToARgQgqTMVuVO9ks8g==
X-CSE-MsgGUID: WXD76I5ETim/Okmmpqfn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="215564426"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:36 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 "Cc : Francois Dugast" <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/4] tests/xe_compute: Exercise user passed buffers
Date: Wed, 25 Feb 2026 20:44:25 +0100
Message-ID: <20260225194421.2544088-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
References: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
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
Cc: Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_compute.c | 59 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc56..d7e3c59084 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -510,6 +510,62 @@ test_compute_square(int fd)
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
+ */
+static void
+test_compute_square_userenv(int fd)
+{
+	uint32_t size = SZ_4K;
+	struct user_execenv env = {
+		.array_size = size / sizeof(float),
+	};
+	uint32_t input_bo, output_bo;
+	float *input, *output;
+	int i;
+
+	env.vm = xe_vm_create(fd, 0, 0);
+	input_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	output_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	input = xe_bo_map(fd, input_bo, size);
+	output = xe_bo_map(fd, output_bo, size);
+
+	env.loop_count = env.array_size;
+	env.skip_results_check = false;
+	env.input_bo = input_bo;
+	env.output_bo = output_bo;
+	env.input_addr =  0x30000000;
+	env.output_addr = 0x31000000;
+
+	for (i = 0; i < env.array_size; i++)
+		input[i] = (float)i;
+
+	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+
+	for (i = 0; i < env.array_size; i++) {
+		float expected_output = input[i] * input[i];
+
+		if (output[i] != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input[i], output[i], expected_output);
+		igt_assert_eq_double(output[i], expected_output);
+	}
+
+	munmap(input, size);
+	munmap(output, size);
+	gem_close(fd, input_bo);
+	gem_close(fd, output_bo);
+	xe_vm_destroy(fd, env.vm);
+}
+
 int igt_main()
 {
 	int xe, ccs_mode[4];
@@ -525,6 +581,9 @@ int igt_main()
 	igt_subtest("compute-square")
 		test_compute_square(xe);
 
+	igt_subtest("compute-square-userenv")
+		test_compute_square_userenv(xe);
+
 	igt_fixture()
 		drm_close_driver(xe);
 
-- 
2.43.0

