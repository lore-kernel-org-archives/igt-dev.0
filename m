Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071F0C18E7C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 11:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE5710E1E9;
	Wed, 26 Feb 2025 11:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2LloDFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F04910E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569197; x=1772105197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+YPmSuqD2KshkHwVv/V4SPriZNgRaiDd+mg5eBLGQXY=;
 b=c2LloDFpv+fqe1LkiZ07Ez/f5i4Ss3988A+kRlKLtyIlP7N620MbVpzi
 W7whTVGWmjIRAj8VT1DTTN2My5vLNdsr+fiqkzRvRhdXxkEx0KyoEI364
 6Rv4Aw5B9LgNRJFIVf8md4o+MzooVKJm4JmQaIq84neHJ2VTYEW8e8igl
 jHG7CF4PtyXAQLKkIA24XeiBfy3zIKfT6r8acBMXerP4P0S9zHjBes2jU
 2qohPqGlAM8QVdYtVxMmz/zeFmIwVgmVRDPdOhzmtyKAQYuaKf2Xusk2z
 BBVXKbuZXLqY9TbF1EtAm8RH8AkAX/YxdCqRvp4Km+UxDNBX8jpoh3CYQ w==;
X-CSE-ConnectionGUID: VEPnnMeCT7WJNJKGs4/OWQ==
X-CSE-MsgGUID: IatHvIBxSn2+z/f3bWrk4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66781262"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:37 -0800
X-CSE-ConnectionGUID: tKdg12tFTmuOQyXvZmMhgQ==
X-CSE-MsgGUID: dvXsC1H5Sr+xF/2/6I0KMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117166621"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:31 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 6/6] lib/intel_compute: Allow the user to override input and
 output addresses
Date: Wed, 26 Feb 2025 12:24:07 +0100
Message-ID: <20250226112532.1332367-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112532.1332367-1-francois.dugast@intel.com>
References: <20250226112532.1332367-1-francois.dugast@intel.com>
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

The user can specify custom GPU addresses to be used for the input and
output arrays, otherwise default values will be used. If a compatible
VM is also provided in user_execenv, the user can even create its own
arrays and pass their addresses in user_execenv, for example with SVM.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 124 +++++++++++++++++++++++++++++++-------------
 lib/intel_compute.h |   4 ++
 2 files changed, 91 insertions(+), 37 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4818c0ff7..a789755b7 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -708,6 +708,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	uint16_t devid = intel_get_drm_devid(fd);
 
 	bo_execenv_create(fd, &execenv, eci, user);
@@ -719,16 +721,24 @@ static void compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
+	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
+	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
 			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
 
-	input_data = (float *) bo_dict[4].data;
-	output_data = (float *) bo_dict[5].data;
-	srand(time(NULL));
+	if (user && user->input_addr) {
+		input_data = (float *) user->input_addr;
+	} else {
+		input_data = (float *) bo_dict[4].data;
+		srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+		for (int i = 0; i < SIZE_DATA; i++)
+			input_data[i] = rand() / (float)RAND_MAX;
+	}
+
+	if (user && user->output_addr)
+		output_data = (float *) user->output_addr;
+	else
+		output_data = (float *) bo_dict[5].data;
 
 	if (IS_DG1(devid))
 		dg1_compute_exec_compute(bo_dict[6].data,
@@ -995,6 +1005,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1005,16 +1017,24 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
+	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = (float *) bo_dict[4].data;
-	output_data = (float *) bo_dict[5].data;
-	srand(time(NULL));
+	if (user && user->input_addr) {
+		input_data = (float *) user->input_addr;
+	} else {
+		input_data = (float *) bo_dict[4].data;
+		srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+		for (int i = 0; i < SIZE_DATA; i++)
+			input_data[i] = rand() / (float)RAND_MAX;
+	}
+
+	if (user && user->output_addr)
+		output_data = (float *) user->output_addr;
+	else
+		output_data = (float *) bo_dict[5].data;
 
 	xehp_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
@@ -1209,6 +1229,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1218,14 +1240,22 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
 
 	memcpy(bo_dict[0].data, kernel, size);
-	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr, SIZE_DATA);
 
-	input_data = (float *) bo_dict[2].data;
-	output_data = (float *) bo_dict[3].data;
-	srand(time(NULL));
+	if (user && user->input_addr) {
+		input_data = (float *) user->input_addr;
+	} else {
+		input_data = (float *) bo_dict[2].data;
+		srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+		for (int i = 0; i < SIZE_DATA; i++)
+			input_data[i] = rand() / (float)RAND_MAX;
+	}
+
+	if (user && user->output_addr)
+		output_data = (float *) user->output_addr;
+	else
+		output_data = (float *) bo_dict[3].data;
 
 	xehpc_compute_exec_compute(bo_dict[5].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1572,6 +1602,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1583,16 +1615,24 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
+	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = (float *) bo_dict[4].data;
-	output_data = (float *) bo_dict[5].data;
-	srand(time(NULL));
+	if (user && user->input_addr) {
+		input_data = (float *) user->input_addr;
+	} else {
+		input_data = (float *) bo_dict[4].data;
+		srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+		for (int i = 0; i < SIZE_DATA; i++)
+			input_data[i] = rand() / (float)RAND_MAX;
+	}
+
+	if (user && user->output_addr)
+		output_data = (float *) user->output_addr;
+	else
+		output_data = (float *) bo_dict[5].data;
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1665,6 +1705,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1675,16 +1717,24 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
+	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = (float *) bo_dict[4].data;
-	output_data = (float *) bo_dict[5].data;
-	srand(time(NULL));
+	if (user && user->input_addr) {
+		input_data = (float *) user->input_addr;
+	} else {
+		input_data = (float *) bo_dict[4].data;
+		srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+		for (int i = 0; i < SIZE_DATA; i++)
+			input_data[i] = rand() / (float)RAND_MAX;
+	}
+
+	if (user && user->output_addr)
+		output_data = (float *) user->output_addr;
+	else
+		output_data = (float *) bo_dict[5].data;
 
 	xe2lpg_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index dc0fe2ec2..9abef3084 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -55,6 +55,10 @@ struct user_execenv {
 	unsigned int kernel_size;
 	/** @skip_results_check: do not verify correctness of the results if true */
 	bool skip_results_check;
+	/** @input_addr: override default address of the input array if provided */
+	uint64_t input_addr;
+	/** @output_addr: override default address of the output array if provided */
+	uint64_t output_addr;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

