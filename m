Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE3F01804
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58C010E3A1;
	Fri,  6 Mar 2026 07:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiT5GK+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CBE10E3A1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783888; x=1804319888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CkJWqI/qOZwiDnq2oofLjCYsJe+EUFne8JaZODkW3aI=;
 b=JiT5GK+eYe41fJeBy8lBvED7eTY21HEUqVBN15OFUUfpm8wpH+Xvi+Rv
 ZAUl5gksqAzMwjlk3dG6AK803dqDBV9YVL6+W4OQF/MXExro8vqiYg33E
 oWyt55nC9XsZ37TzoWIgmfp/QmNQhWakIS7KBPjqNEYp31WzgJv8ELtAE
 HxDmnthe0T3jFAzzNXWK1gUQ1z8alIiwd4Py9i1NEBGk633PBI9BTqI3K
 NhEH34WR1UjrhgGI20VkvvuETJ0PzvQJRzNsrCYBEb9zQQAyOltOIuvQL
 /+JKxgOYS2z08SdCH6jqkK+7/5/b6oeAas/ZLt4cfozlA7MY8uSnC/wLp g==;
X-CSE-ConnectionGUID: opVTViqZTFSGnP0rq/e8sQ==
X-CSE-MsgGUID: yEPYkFlNRNiBLaMxqvzZ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73588257"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73588257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:08 -0800
X-CSE-ConnectionGUID: 0LvmrAsARCSjBHKyyqhvfw==
X-CSE-MsgGUID: iYANt4KcSC2u0WY8g6ZHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="215652156"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:06 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 1/6] lib/intel_compute: Add types for input and
 output buffers
Date: Fri,  6 Mar 2026 08:58:01 +0100
Message-ID: <20260306075759.1153032-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
References: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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
of hardcoding indices.

Cc: Francois Dugast <francois.dugast@intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_compute.c | 117 +++++++++++++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 35 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index eab6accfbc..8425e9dbd5 100644
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
@@ -142,16 +148,36 @@ static void bo_check_square(float *input, float *output, int size)
 	}
 }
 
+static struct bo_dict_entry *bo_dict_find_by_type(struct bo_dict_entry *bo_dict,
+						  int entries,
+						  enum bo_dict_type bo_type)
+{
+	struct bo_dict_entry *entry = NULL;
+
+	for (int i = 0; i < entries; i++)
+		if (bo_dict[i].bo_type == bo_type) {
+			entry = &bo_dict[i];
+			break;
+		}
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
 
@@ -159,15 +185,20 @@ static float *get_input_data(const struct bo_execenv *execenv,
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
@@ -863,9 +894,11 @@ static void compute_exec(int fd, const unsigned char *kernel,
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
@@ -895,8 +928,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
 			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	if (IS_DG1(devid))
 		dg1_compute_exec_compute(bo_dict[6].data,
@@ -1144,9 +1177,11 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1184,8 +1219,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 				  execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xehp_compute_exec_compute(fd,
 				  bo_dict[8].data,
@@ -1365,9 +1400,11 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1396,8 +1433,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
 				   execenv.loop_count);
 
-	input_data = get_input_data(&execenv, user, bo_dict[2].data);
-	output_data = get_output_data(&execenv, user, bo_dict[3].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xehpc_compute_exec_compute(fd,
 				   bo_dict[5].data,
@@ -1757,9 +1794,11 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1800,8 +1839,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1848,9 +1887,11 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1888,8 +1929,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = get_input_data(&execenv, user, bo_dict[4].data);
-	output_data = get_output_data(&execenv, user, bo_dict[5].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xe2lpg_compute_exec_compute(fd,
 				    bo_dict[8].data,
@@ -2097,9 +2138,11 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
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
@@ -2131,8 +2174,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	idata.xe3p.indirect_addr_lo = indirect_addr;
 	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
 
-	input_data = get_input_data(&execenv, user, bo_dict[2].data);
-	output_data = get_output_data(&execenv, user, bo_dict[3].data);
+	input_data = get_input_data(&execenv, bo_dict, entries);
+	output_data = get_output_data(&execenv, bo_dict, entries);
 
 	xe3p_compute_exec_compute(fd, &idata,
 				  bo_dict[4].data,
@@ -2421,9 +2464,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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
@@ -2566,9 +2611,11 @@ static void xe3p_compute_preempt_exec(int fd, const unsigned char *long_kernel,
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

