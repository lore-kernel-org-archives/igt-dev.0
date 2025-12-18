Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DCED6ACFF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B09510E41F;
	Thu, 18 Dec 2025 12:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxOzUKff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95610E41D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766062759; x=1797598759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GKpLvi8RntJdbz8Es6qXMYnAMjwXHzmKPD3mpamVRqY=;
 b=OxOzUKffp0FmpUMKS54vimhXptmKxhZNgnIBYGjOXb1jgN/EpBDT19l0
 zh8qhm6uXRxOPa/cCeuJirrMYrM4rifIc2I816HLiYbKZrLau6QL95iR+
 4La4nWP0+u+oDQBW0R9cEKsKDmOQIjlfctgiULIIW0EGXgCMBctpLp7DC
 CSYy9jJv5Kpq1/RAGntr6TdFPu3VgAa9w6ztOf3WPcr+5XP+DXplZSbUV
 x64NHodaP8+zteSRcya/WJfK3cDVN+1663AcvQBtkSIIlWu31zWJ8mxFB
 JsHO5ne112jkjerW7t80iWq1XVpkVx2fkiMySkhQWiW6RBjvk8L73nDNg w==;
X-CSE-ConnectionGUID: KY6YuIlHRBO7fZMkmW11Tw==
X-CSE-MsgGUID: YjseY0+nRdKeVF64SVz5jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90672319"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90672319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:18 -0800
X-CSE-ConnectionGUID: t5AEclT8R1K/SwmT1T9XYw==
X-CSE-MsgGUID: 07eax3mSS8O35QA0o6aQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198637733"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.48])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:59:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v4 2/3] lib/intel_compute: Allow user to override compute kernel
 loop_count
Date: Thu, 18 Dec 2025 13:56:06 +0100
Message-ID: <20251218125906.124925-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218125906.124925-1-francois.dugast@intel.com>
References: <20251218125906.124925-1-francois.dugast@intel.com>
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

array_size and loop_count continue to have the same value by default but
by differentiating those two variables, the user has more control over
the execution of the compute kernel: the loop count can now be different
from the array size.

Also, add a comment in xe_exec_system_allocator to clarify semantics of
size and env.array_size.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c                    | 36 +++++++++++++++-----------
 lib/intel_compute.h                    |  2 ++
 tests/intel/xe_exec_system_allocator.c |  3 +++
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index e112e57b5..20ee44521 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -94,6 +94,7 @@ struct bo_execenv {
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t array_size;
+	unsigned int loop_count;
 
 	/* Xe user-fence */
 	uint32_t bo;
@@ -137,7 +138,7 @@ static float *get_input_data(const struct bo_execenv *execenv,
 		input_data = from_user_pointer(user->input_addr);
 	} else {
 		input_data = (float *) data;
-		bo_randomize(input_data, execenv->array_size);
+		bo_randomize(input_data, execenv->loop_count);
 	}
 
 	return input_data;
@@ -181,6 +182,11 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 		else
 			execenv->array_size = SIZE_DATA;
 
+		if (user && user->loop_count)
+			execenv->loop_count = user->loop_count;
+		else
+			execenv->loop_count = execenv->array_size;
+
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
 								   eci, 0);
@@ -864,7 +870,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
+			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
 	output_data = get_output_data(&execenv, user, bo_dict[5].data);
@@ -885,7 +891,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1152,7 +1158,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-				  execenv.array_size);
+				  execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
@@ -1170,7 +1176,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1365,7 +1371,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
-				   execenv.array_size);
+				   execenv.loop_count);
 
 	input_data = get_input_data(&execenv, user, bo_dict[2].data);
 	output_data = get_output_data(&execenv, user, bo_dict[3].data);
@@ -1382,7 +1388,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1762,7 +1768,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-				   execenv.array_size);
+				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
@@ -1780,7 +1786,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1850,7 +1856,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
 	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
-				   execenv.array_size);
+				   execenv.loop_count);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
 	input_data = get_input_data(&execenv, user, bo_dict[4].data);
@@ -1881,7 +1887,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	}
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -2205,21 +2211,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	output_short = (float *) bo_dict_short[5].data;
 	post_data = (uint64_t *) bo_dict_long[8].data;
 
-	bo_randomize(input_short, SIZE_DATA);
+	bo_randomize(input_short, execenv_short.loop_count);
 
 	xe2lpg_compute_exec_compute(fd,
 				    bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
-				    threadgroup_preemption, SIZE_DATA);
+				    threadgroup_preemption, execenv_long.array_size);
 
 	xe2lpg_compute_exec_compute(fd,
 				    bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
-				    false, SIZE_DATA);
+				    false, execenv_short.array_size);
 
 	bo_execenv_exec_async(&execenv_long, ADDR_BATCH);
 
@@ -2232,7 +2238,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	 * square) must complete first and long job must be still active.
 	 */
 	bo_execenv_exec(&execenv_short, ADDR_BATCH);
-	bo_check_square(input_short, output_short, SIZE_DATA);
+	bo_check_square(input_short, output_short, execenv_short.loop_count);
 
 	/*
 	 * Catch command level preemption instead TG preemption. For TG and WMTP
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 8a3d7b450..28c1efd55 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -63,6 +63,8 @@ struct user_execenv {
 	uint64_t input_addr;
 	/** @output_addr: override default address of the output array if provided */
 	uint64_t output_addr;
+	/** @loop_count: override default loop count if provided */
+	unsigned int loop_count;
 	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
 	uint64_t loop_kernel_duration;
 };
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 2ca85c95c..b1555afbe 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2190,6 +2190,9 @@ test_compute(int fd, size_t size)
 	} *bo_sync;
 	uint32_t vm;
 	struct user_execenv env = {
+		/*
+		 * size is the number of bytes of the array, array_size is its number of elements.
+		 */
 		.array_size = size / sizeof(float),
 	};
 	float *compute_input;
-- 
2.43.0

