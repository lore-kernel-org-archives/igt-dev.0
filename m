Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8388FD45E2
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23B10E376;
	Wed, 25 Feb 2026 19:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+rYv0ZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18E510E81E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772048672; x=1803584672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jaXhxdOXtCxCikEBwNbbryI/73Sz+nss51l12Kc7ruc=;
 b=K+rYv0ZCoNcpiILdwGuvn+QlkvJ+Iy64tIMkp986GX58v8eZYbe/gs/I
 mD+PllfKUmgVT2DcT84denmC91bSk6hg56LpaMoT/Ico9+sWtMen1fZ/Z
 LN1Ee6hX+F1p9JsAkRjnuRrCLcTzsLPCauX7sVQbja5jIt5jRp9Bzds3U
 B57rhsFZE/Mb5su5q6JcpeWRdeI1Nt4G5K/LGBebOWu05Gajw2pqsyF8x
 eHAoYUC3CF6VhbQs/80pukSTc8HTm2YTCggIl+TapPa+75KrUhARIDLa7
 exOv1rNhq2EDMl62ArrH4Um3NtyFlWaD+E0AjU2pL129XA5lOkH+hCiBp A==;
X-CSE-ConnectionGUID: FssWG8gWTayRWE5o+24rGA==
X-CSE-MsgGUID: ClpSSc8XRDS/DFwPRSWhww==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73277504"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73277504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:32 -0800
X-CSE-ConnectionGUID: fd+JwU5mTZS4V7m/ammzjA==
X-CSE-MsgGUID: F/FfOY5kR8mmRgtkgm/Hsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="215443718"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:29 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/4] lib/intel_compute: Add types for input and output
 buffers
Date: Wed, 25 Feb 2026 20:44:23 +0100
Message-ID: <20260225194421.2544088-7-zbigniew.kempczynski@intel.com>
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

Instead of selecting input and output buffers by direct indices mark
them in provided arrays as typed, allowing to search them instead
of hardcoded index.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 115 ++++++++++++++++++++++++++++++--------------
 1 file changed, 80 insertions(+), 35 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 375b36c16e..ddcb76d1a4 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -77,12 +77,18 @@
 #define TGP_long_kernel_loop_count		10
 #define XE2_THREADGROUP_PREEMPT_XDIM		0x4000
 
+enum bo_dict_type {
+	BO_TYPE_INPUT = 1,
+	BO_TYPE_OUTPUT
+};
+
 struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
 	void *data;
 	const char *name;
 	uint32_t handle;
+	enum bo_dict_type bo_type;
 };
 
 struct bo_sync {
@@ -142,16 +148,34 @@ static void bo_check_square(float *input, float *output, int size)
 	}
 }
 
+static struct bo_dict_entry *bo_dict_find_by_type(struct bo_dict_entry *bo_dict,
+						  int entries,
+						  enum bo_dict_type bo_type)
+{
+	struct bo_dict_entry *entry = NULL;
+
+	for (int i = 0; i < entries; i++)
+		if (bo_dict[i].bo_type == bo_type)
+			entry = &bo_dict[i];
+	igt_assert_f(entry, "bo_type %d not found in bo_dict\n", bo_type);
+
+	return entry;
+}
+
 static float *get_input_data(const struct bo_execenv *execenv,
-			     const struct user_execenv *user,
-			     void *data)
+			     struct bo_dict_entry *bo_dict,
+			     int entries)
 {
+	const struct user_execenv *user = execenv->user;
 	float *input_data;
 
 	if (user && user->input_addr) {
 		input_data = from_user_pointer(user->input_addr);
 	} else {
-		input_data = (float *) data;
+		struct bo_dict_entry *entry;
+
+		entry = bo_dict_find_by_type(bo_dict, entries, BO_TYPE_INPUT);
+		input_data = (float *) entry->data;
 		bo_randomize(input_data, execenv->loop_count);
 	}
 
@@ -159,15 +183,20 @@ static float *get_input_data(const struct bo_execenv *execenv,
 }
 
 static float *get_output_data(const struct bo_execenv *execenv,
-			      const struct user_execenv *user,
-			      void *data)
+			      struct bo_dict_entry *bo_dict,
+			      int entries)
 {
+	const struct user_execenv *user = execenv->user;
 	float *output_data;
 
 	if (user && user->output_addr)
 		output_data = from_user_pointer(user->output_addr);
-	else
-		output_data = (float *) data;
+	else {
+		struct bo_dict_entry *entry;
+
+		entry = bo_dict_find_by_type(bo_dict, entries, BO_TYPE_OUTPUT);
+		output_data = (float *) entry->data;
+	}
 
 	return output_data;
 }
@@ -863,9 +892,11 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect data start" },
 		{ .addr = ADDR_INPUT,
-		  .name = "input" },
+		  .name = "input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT,
-		  .name = "output" },
+		  .name = "output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -895,8 +926,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
 			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	if (IS_DG1(devid))
 		dg1_compute_exec_compute(bo_dict[6].data,
@@ -1144,9 +1175,11 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT,
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT,
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
@@ -1184,8 +1217,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 				  execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xehp_compute_exec_compute(fd,
 				  bo_dict[8].data,
@@ -1365,9 +1398,11 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT,
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT,
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
@@ -1396,8 +1431,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
 				   execenv.loop_count);
 
-	input_data = get_input_data(&execenv, user, bo_dict[2].data);
-	output_data = get_output_data(&execenv, user, bo_dict[3].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xehpc_compute_exec_compute(fd,
 				   bo_dict[5].data,
@@ -1750,9 +1785,11 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT,
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT,
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
@@ -1793,8 +1830,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1841,9 +1878,11 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT,
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT,
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
@@ -1881,8 +1920,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xe2lpg_compute_exec_compute(fd,
 				    bo_dict[8].data,
@@ -2083,9 +2122,11 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 		  .size =  0x1000,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT,
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT,
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -2117,8 +2158,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	idata.xe3p.indirect_addr_lo = indirect_addr;
 	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
 
-	input_data = get_input_data(&execenv, user, bo_dict[2].data);
-	output_data = get_output_data(&execenv, user, bo_dict[3].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xe3p_compute_exec_compute(fd, &idata,
 				  bo_dict[4].data,
@@ -2407,9 +2448,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
@@ -2552,9 +2595,11 @@ static void xe3p_compute_preempt_exec(int fd, const unsigned char *long_kernel,
 		  .size =  0x1000,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
-		  .name = "addr input"},
+		  .name = "addr input",
+		  .bo_type = BO_TYPE_INPUT },
 		{ .addr = ADDR_OUTPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
-		  .name = "addr output" },
+		  .name = "addr output",
+		  .bo_type = BO_TYPE_OUTPUT },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
 		  .name = "batch" },
-- 
2.43.0

