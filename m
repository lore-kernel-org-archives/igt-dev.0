Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7E6C021BF
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 11:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCB210E1E9;
	Wed, 26 Feb 2025 11:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWVq4jD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C7F10E1E9
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569182; x=1772105182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upsp1b005Qlp0M3dyulcE3ybMGAsgJ6SaKpdpySznxk=;
 b=mWVq4jD7MybgHYhFueN/O8tDw3d0Qs/Nu0Y847kNXnRmrRLUcpKNTsDI
 NA1eCpEC8cxKeoyD8yBXX1qf4L6SIVr93OUuy9Vu2L5UE8+X0pb7cM9H8
 BBJHYyk28NIf7IsgCmCGVaM+0kc4Px6Mza4yPd0Yu09GBc9BLymPdzCij
 vKA5+p/y49dfgwmo3/s8YaX4z1hoKqRvjG/7QsbJsW10Z4WmQh9i9XUDW
 tENSWn9QYWortioMJa86I0CoE4S3ZkRq2bqAGMJ8WuZDSEk0r5YeUoB1i
 01J6gBr0AJqC9a/pV3pUXTkglcmy23PAa5Wk1fQwn9mksZspHZHE9x8nj w==;
X-CSE-ConnectionGUID: 5mYqmHUYQWCK2PrzJduldw==
X-CSE-MsgGUID: 8p181JdNTE6SVCv0jhzf/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66781245"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781245"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:22 -0800
X-CSE-ConnectionGUID: Ffk0wjrxQxyH5WVDprGzGA==
X-CSE-MsgGUID: Qe/yoJ6yToyOqhwuxGY/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117166598"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 2/6] lib/intel_compute: Rename variables for input and output data
Date: Wed, 26 Feb 2025 12:24:03 +0100
Message-ID: <20250226112532.1332367-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112532.1332367-1-francois.dugast@intel.com>
References: <20250226112532.1332367-1-francois.dugast@intel.com>
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

Use more explicit names to make development and debugging easier.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 143 ++++++++++++++++++++++++--------------------
 1 file changed, 77 insertions(+), 66 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index b698bf77d..9cca4a629 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -695,7 +695,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 	uint16_t devid = intel_get_drm_devid(fd);
 
 	bo_execenv_create(fd, &execenv, eci);
@@ -711,10 +711,12 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
 			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
 
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
@@ -732,13 +734,14 @@ static void compute_exec(int fd, const unsigned char *kernel,
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
@@ -976,7 +979,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -991,10 +994,12 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
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
@@ -1007,13 +1012,14 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1184,7 +1190,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "batch" },
 	};
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -1196,10 +1202,12 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 
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
@@ -1212,13 +1220,14 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1541,7 +1550,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	};
 
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -1557,11 +1566,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
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
@@ -1574,15 +1584,14 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1631,7 +1640,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	};
 
 	struct bo_execenv execenv;
-	float *dinput;
+	float *input_data, *output_data;
 
 	bo_execenv_create(fd, &execenv, eci);
 
@@ -1646,11 +1655,12 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
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
@@ -1664,14 +1674,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1869,7 +1879,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
 	struct bo_execenv execenv_short, execenv_long;
-	float *dinput;
+	float *input_data, *output_data;
 	unsigned int long_kernel_loop_count;
 	struct drm_xe_sync sync_long = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -1952,16 +1962,17 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
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
@@ -1991,14 +2002,14 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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

