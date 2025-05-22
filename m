Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F690C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 07:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D8710ED1A;
	Thu, 22 May 2025 07:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXfZSZe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84B112FE2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747900535; x=1779436535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nw628o9wRaarlQZZI9J1ckvJ86kCQmSE3D7eMmt3sOY=;
 b=SXfZSZe+VjfRYhJXLspMOY76o5GkpEJV8WZRMFJwGyodjbHs4B7V0aIb
 8qKBY87WY/tzUvQ/6qzfFU+eseTE2Si49xzQzx37U2rwsm5nI7yfzOh39
 CkQNSmZmQpKvFfBxZBI2aqbr7IL2F7ANVg4LtGxvpWL4uvSojQELqhs4z
 fHJnbqBvjPNhbCFmlHX9gsPFEnLJm3za41ZwiF3RX41oGIRw1URDO0ZjV
 9RtvBVT8D8ZFMk1Na4Uzy4rQujfPRbSPDgEJBQL9KY8+j+OJqcddvXJ8Y
 3arCra1RxpFknHsyq1knncGr+pISsyxrRw+LL31p25gJ5FsXyTwja29Ls g==;
X-CSE-ConnectionGUID: HoXVJG9WRB+T8BeeNyRDdQ==
X-CSE-MsgGUID: Jvo8A7cyT8iOJVS+Xe0hPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50051014"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50051014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:31 -0700
X-CSE-ConnectionGUID: SDTDc9NHQ5OYHQefSoRBlw==
X-CSE-MsgGUID: SnMqIGrJRXaRuvlzG5bJYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140888587"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:30 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 3/4] lib/intel_compute: calculate array size at
 compile time
Date: Thu, 22 May 2025 09:55:14 +0200
Message-ID: <20250522075515.168920-4-zbigniew.kempczynski@intel.com>
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

Instead of predefining number of entries in bo array calculate this
on compile time. This prevents from use predefined number of entries
in other functions and encloses elements calculation to local function
only.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 56 ++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index d2629ed911..d47e2b08ef 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -767,8 +767,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 			 struct drm_xe_engine_class_instance *eci,
 			 struct user_execenv *user)
 {
-#define BO_DICT_ENTRIES 7
-	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
 		  .name = "kernel" },
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
@@ -793,6 +792,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	uint16_t devid = intel_get_drm_devid(fd);
+	int entries = ARRAY_SIZE(bo_dict);
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -801,7 +801,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, BO_DICT_ENTRIES);
+	bo_execenv_bind(&execenv, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
@@ -851,7 +851,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 			igt_assert_eq_double(output, expected_output);
 	}
 
-	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
 }
 
@@ -1062,8 +1062,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 			      struct drm_xe_engine_class_instance *eci,
 			      struct user_execenv *user)
 {
-#define XEHP_BO_DICT_ENTRIES 9
-	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
@@ -1092,6 +1091,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
+	int entries = ARRAY_SIZE(bo_dict);
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1100,7 +1100,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
+	bo_execenv_bind(&execenv, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
@@ -1146,7 +1146,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 			igt_assert_eq_double(output, expected_output);
 	}
 
-	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
 }
 
@@ -1299,8 +1299,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 			       struct drm_xe_engine_class_instance *eci,
 			       struct user_execenv *user)
 {
-#define XEHPC_BO_DICT_ENTRIES 6
-	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
@@ -1320,6 +1319,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
+	int entries = ARRAY_SIZE(bo_dict);
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1328,7 +1328,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[2].size = size_input(execenv.array_size);
 	bo_dict[3].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
+	bo_execenv_bind(&execenv, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
@@ -1371,7 +1371,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 			igt_assert_eq_double(output, expected_output);
 	}
 
-	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
 }
 
@@ -1692,8 +1692,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 			       struct drm_xe_engine_class_instance *eci,
 			       struct user_execenv *user)
 {
-#define XELPG_BO_DICT_ENTRIES 9
-	struct bo_dict_entry bo_dict[XELPG_BO_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
@@ -1724,6 +1723,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
+	int entries = ARRAY_SIZE(bo_dict);
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1732,7 +1732,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
+	bo_execenv_bind(&execenv, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 
@@ -1780,7 +1780,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 			igt_assert_eq_double(output, expected_output);
 	}
 
-	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
 }
 
@@ -1797,8 +1797,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				struct drm_xe_engine_class_instance *eci,
 				struct user_execenv *user)
 {
-#define XE2_BO_DICT_ENTRIES 10
-	struct bo_dict_entry bo_dict[XE2_BO_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
@@ -1832,6 +1831,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
+	int entries = ARRAY_SIZE(bo_dict);
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1840,7 +1840,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_dict[4].size = size_input(execenv.array_size);
 	bo_dict[5].size = size_output(execenv.array_size);
 
-	bo_execenv_bind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
+	bo_execenv_bind(&execenv, bo_dict, entries);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
@@ -1888,7 +1888,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 			igt_assert_eq_double(output, expected_output);
 	}
 
-	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
 }
 
@@ -2067,8 +2067,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					struct drm_xe_engine_class_instance *eci,
 					bool threadgroup_preemption)
 {
-#define XE2_BO_PREEMPT_DICT_ENTRIES 11
-	struct bo_dict_entry bo_dict_long[XE2_BO_PREEMPT_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict_long[] = {
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
@@ -2101,19 +2100,20 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .name = "sip kernel"},
 	};
 
-	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
+	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
 	struct bo_execenv execenv_short, execenv_long;
 	float *input_short, *output_short, *input_long;
 	unsigned int long_kernel_loop_count = 0;
 	int64_t timeout_one_ns = 1;
 	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
+	int entries = ARRAY_SIZE(bo_dict_long);
 
 	if (threadgroup_preemption)
 		long_kernel_loop_count = TGP_long_kernel_loop_count;
 	else
 		long_kernel_loop_count = WMTP_long_kernel_loop_count;
 
-	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
+	for (int i = 0; i < entries; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
 
 	bo_execenv_create(fd, &execenv_short, eci, NULL);
@@ -2125,8 +2125,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
-	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
-	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
+	bo_execenv_bind(&execenv_long, bo_dict_long, entries);
+	bo_execenv_bind(&execenv_short, bo_dict_short, entries);
 
 	if (use_loop_kernel)
 		memcpy(bo_dict_long[0].data, loop_kernel, loop_kernel_size);
@@ -2187,8 +2187,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	bo_execenv_sync(&execenv_long);
 
-	bo_execenv_unbind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
-	bo_execenv_unbind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
+	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
+	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
 
 	bo_execenv_destroy(&execenv_short);
 	bo_execenv_destroy(&execenv_long);
-- 
2.43.0

