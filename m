Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FBAC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 13:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333C10E2A7;
	Fri, 28 Feb 2025 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgvjWAyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5083C10E2A7
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740749408; x=1772285408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1F0gnVxBxhGq7aq6K/n2hVbBtww6kNlG//9Ooj+90ug=;
 b=MgvjWAyEATyBLORqNs38Urk7kz/86cPT9vGVRJ05yQPyJOmRBEjINFQy
 Pc5rho/rtd7ZI42hiP4MJdgCWDXW6RWWxPF/FfSKt/3vbOk5XKS9Qeoux
 l3ZiNPfBRYd9qyrjeLxXF3jfEMqYou/etXowD6+BVsAMR4zCv+g264REx
 fNAguYux+tJIX/TLrnu2VygDEejRpmpa0LuJHLA2gFRQG6rxmFylxssSd
 FLV5lRFkO/mJzaNB9j3KPGocd1P3c95Ni8JOEa4OiSQhJclXX0Y9yWPW9
 5d9kxieRRXPN1qFExshy4WBxf6n76i5NNmLJX4BvJTQ9Bq804QDHndqLb A==;
X-CSE-ConnectionGUID: 02HWu59RSuGYbvM9JJTm1Q==
X-CSE-MsgGUID: CkTR1p6GTrW3epg5dR19IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="53065370"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="53065370"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 05:30:08 -0800
X-CSE-ConnectionGUID: cTbGKiXHS5SgfJqdPYqo+w==
X-CSE-MsgGUID: UhSyTed7RwyN97ttmcMN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="140563344"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.254])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 05:30:06 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] Revert "lib/intel_compute: Allow the user to override
 input and output addresses"
Date: Fri, 28 Feb 2025 14:29:53 +0100
Message-ID: <20250228132953.73723-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

This causes build issues on mips and armhf:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/72030908

Besides, there are hidden dependencies to SVM so this patch will
be reworked.

This reverts commit b747eebcc6f4b6729ae171490e52725e9fb13b89.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 124 +++++++++++++-------------------------------
 lib/intel_compute.h |   4 --
 2 files changed, 37 insertions(+), 91 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index a789755b7..4818c0ff7 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -708,8 +708,6 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
-	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
-	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	uint16_t devid = intel_get_drm_devid(fd);
 
 	bo_execenv_create(fd, &execenv, eci, user);
@@ -721,24 +719,16 @@ static void compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
-	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
+	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
 			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
 
-	if (user && user->input_addr) {
-		input_data = (float *) user->input_addr;
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < SIZE_DATA; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
+	srand(time(NULL));
 
-	if (user && user->output_addr)
-		output_data = (float *) user->output_addr;
-	else
-		output_data = (float *) bo_dict[5].data;
+	for (int i = 0; i < SIZE_DATA; i++)
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	if (IS_DG1(devid))
 		dg1_compute_exec_compute(bo_dict[6].data,
@@ -1005,8 +995,6 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
-	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
-	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1017,24 +1005,16 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
-	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
-
-	if (user && user->input_addr) {
-		input_data = (float *) user->input_addr;
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
+	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-		for (int i = 0; i < SIZE_DATA; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
+	srand(time(NULL));
 
-	if (user && user->output_addr)
-		output_data = (float *) user->output_addr;
-	else
-		output_data = (float *) bo_dict[5].data;
+	for (int i = 0; i < SIZE_DATA; i++)
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xehp_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
@@ -1229,8 +1209,6 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
-	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
-	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1240,22 +1218,14 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
 
 	memcpy(bo_dict[0].data, kernel, size);
-	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr, SIZE_DATA);
+	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
 
-	if (user && user->input_addr) {
-		input_data = (float *) user->input_addr;
-	} else {
-		input_data = (float *) bo_dict[2].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < SIZE_DATA; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
+	input_data = (float *) bo_dict[2].data;
+	output_data = (float *) bo_dict[3].data;
+	srand(time(NULL));
 
-	if (user && user->output_addr)
-		output_data = (float *) user->output_addr;
-	else
-		output_data = (float *) bo_dict[3].data;
+	for (int i = 0; i < SIZE_DATA; i++)
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xehpc_compute_exec_compute(bo_dict[5].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1602,8 +1572,6 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
-	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
-	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1615,24 +1583,16 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
-	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
-
-	if (user && user->input_addr) {
-		input_data = (float *) user->input_addr;
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
+	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-		for (int i = 0; i < SIZE_DATA; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
+	srand(time(NULL));
 
-	if (user && user->output_addr)
-		output_data = (float *) user->output_addr;
-	else
-		output_data = (float *) bo_dict[5].data;
+	for (int i = 0; i < SIZE_DATA; i++)
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1705,8 +1665,6 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
-	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
-	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1717,24 +1675,16 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
-	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
-
-	if (user && user->input_addr) {
-		input_data = (float *) user->input_addr;
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
+	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
-		for (int i = 0; i < SIZE_DATA; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
+	input_data = (float *) bo_dict[4].data;
+	output_data = (float *) bo_dict[5].data;
+	srand(time(NULL));
 
-	if (user && user->output_addr)
-		output_data = (float *) user->output_addr;
-	else
-		output_data = (float *) bo_dict[5].data;
+	for (int i = 0; i < SIZE_DATA; i++)
+		input_data[i] = rand() / (float)RAND_MAX;
 
 	xe2lpg_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 9abef3084..dc0fe2ec2 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -55,10 +55,6 @@ struct user_execenv {
 	unsigned int kernel_size;
 	/** @skip_results_check: do not verify correctness of the results if true */
 	bool skip_results_check;
-	/** @input_addr: override default address of the input array if provided */
-	uint64_t input_addr;
-	/** @output_addr: override default address of the output array if provided */
-	uint64_t output_addr;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

