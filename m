Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A263C02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18FC10E0E0;
	Wed,  5 Feb 2025 10:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQH8xq1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C99310E1A2
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738750711; x=1770286711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dTt9K44+7VxCmFtyoPVPVahznGt7vJjQtlRGgn+vzE=;
 b=XQH8xq1jzTmufDV0DFTHIZpCbJdiL5xPJUZ4hmT2Ha52jKR7slO/OnR/
 DKkHEHQdY0TVkNhtkq9hgyIlnMUxCgBBixV+2vX6eM2cF4S8FYAOJnqOP
 gG91cFfhVKz/t2Q0mDNptr41wfXrDXmw/hl5DJqcn1L5VQ0Z8TCGzU+sl
 6iQcsk4Y16PpKQvVm8AAvFdYQHN8aX68tltG9u3D1eTgos4RFwfuMnfA5
 2oV8J2gLQXm6oEpfIvEyeSK0a70qIYS1SJznHp/f8oAaCoPcVt/8MPqsy
 cI5vrO1KuHV6ym3Ga/jXIaUzrGWIoOr0+zZrsw3iX/Y/i4j1tfJh8VFR9 A==;
X-CSE-ConnectionGUID: P32je5quQOqJlEZTukL7kA==
X-CSE-MsgGUID: BfIW8NyIQnSsm8KXSwc5VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700676"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50700676"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:21 -0800
X-CSE-ConnectionGUID: kPpkUZ5OSXaiXwOvjbYvHw==
X-CSE-MsgGUID: GohvXF5sRw6wJKble/+LJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111299191"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] lib/intel_compute: Rename variables for input and
 output data
Date: Wed,  5 Feb 2025 11:17:02 +0100
Message-ID: <20250205101748.1117809-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205101748.1117809-1-francois.dugast@intel.com>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
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

Use more explicit names to make development and debugging easier.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 143 ++++++++++++++++++++++++--------------------
 1 file changed, 77 insertions(+), 66 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 233835c6c..86eb48afc 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -694,7 +694,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 	uint16_t devid = intel_get_drm_devid(fd);
 
 	bo_execenv_create(fd, &execenv, eci);
@@ -710,10 +710,12 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
 			     IS_DG1(devid) ? 0x200 : 0x40);
 
-	dinput = (float *)bo_dict[4].data;
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
+
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	if (IS_DG1(devid))
 		dg1_compute_exec_compute(bo_dict[6].data,
@@ -731,13 +733,14 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
-
-		f1 = ((float *) bo_dict[5].data)[i];
-		f2 = ((float *) bo_dict[4].data)[i];
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
-		igt_assert(f1 == f2 * f2);
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input, output, expected_output);
+		igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
@@ -974,7 +977,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -989,10 +992,12 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	dinput = (float *)bo_dict[4].data;
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
+
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xehp_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
@@ -1005,13 +1010,14 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
-
-		f1 = ((float *) bo_dict[5].data)[i];
-		f2 = ((float *) bo_dict[4].data)[i];
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
-		igt_assert(f1 == f2 * f2);
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input, output, expected_output);
+		igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
@@ -1181,7 +1187,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -1193,10 +1199,12 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	dinput = (float *)bo_dict[2].data;
+	input_data = (float *) bo_dict[2].data;
+	output_data = (float *) bo_dict[3].data;
 	srand(time(NULL));
+
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xehpc_compute_exec_compute(bo_dict[5].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1209,13 +1217,14 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
-
-		f1 = ((float *) bo_dict[3].data)[i];
-		f2 = ((float *) bo_dict[2].data)[i];
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
-		igt_assert(f1 == f2 * f2);
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input, output, expected_output);
+		igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
@@ -1538,7 +1547,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	};
 
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -1554,11 +1563,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	dinput = (float *)bo_dict[4].data;
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1571,15 +1581,14 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
-
-		f1 = ((float *) bo_dict[5].data)[i];
-		f2 = ((float *) bo_dict[4].data)[i];
-
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f %f\n", i, f1, f2 * f2, f2);
-
-		igt_assert(f1 == f2 * f2);
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input, output, expected_output);
+		igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
@@ -1628,7 +1637,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	};
 
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -1643,11 +1652,12 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	dinput = (float *)bo_dict[4].data;
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xe2lpg_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
@@ -1661,14 +1671,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
-
-		f1 = ((float *) bo_dict[5].data)[i];
-		f2 = ((float *) bo_dict[4].data)[i];
-
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
-		igt_assert(f1 == f2 * f2);
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input, output, expected_output);
+		igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
@@ -1861,7 +1871,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
 	struct bo_execenv execenv_short, execenv_long;
-	float *dinput;
+	float *input_data, *output_data;
 	unsigned int long_kernel_loop_count;
 	struct drm_xe_sync sync_long = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -1944,16 +1954,17 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT);
 	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-	dinput = (float *)bo_dict_long[4].data;
+	input_data = (float *) bo_dict_long[4].data;
+	output_data = (float *) bo_dict_short[5].data;
 	srand(time(NULL));
 
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
-	dinput = (float *)bo_dict_short[4].data;
+	input_data = (float *) bo_dict_short[4].data;
 
 	for (int i = 0; i < SIZE_DATA; i++)
-		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
@@ -1983,14 +1994,14 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	gem_close(fd, bo_short);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-		float f1, f2;
-
-		f1 = ((float *) bo_dict_short[5].data)[i];
-		f2 = ((float *) bo_dict_short[4].data)[i];
-
-		if (f1 != f2 * f2)
-			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
-		igt_assert(f1 == f2 * f2);
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+				  i, input, output, expected_output);
+		igt_assert_eq(output, expected_output);
 	}
 
 	for (int i = 0; i < SIZE_DATA; i++) {
-- 
2.43.0

