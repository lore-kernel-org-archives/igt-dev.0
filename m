Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C707C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC2B10E5C0;
	Tue, 11 Mar 2025 15:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ln7ckeW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4E310E5C6
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706631; x=1773242631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fAtzaupMZk9V3xMN6aRYavoRT6R/njuRtktvELzQTIk=;
 b=ln7ckeW1eKovRQBKtQ1qnDTAhU/O2A0rebF1k/JHoUTdEONxIiM0aF5R
 Ux8J026DWwmGtnuJ1hvC8Ysu3cEYyMpOmgIBtIOsnXUN1LiqDZnq9emi9
 3ZJQ3Gv9EAoKTZPiNJdnIxaAxxfq5cHUYwBPSkY1I1igeXwJsDABmfChG
 EH89HksnvswCjEib8/7+NbDEHjM9iSyJZU367BPCkqlgkotSZzFwLbRgX
 DFO0ElQSywEci73jM9261oOoIqAl/680OqbhekiE0d+F26LSs2N6beKF0
 C7UNvvtDew+9aAYqJiPk3eQ7g9i2oTT6MK1D1FBmtsS5hoNvI4mShUJjH w==;
X-CSE-ConnectionGUID: By4Rp5oPRYGGgzj9JzDVcw==
X-CSE-MsgGUID: Uf3cH3zpTfCnJLkX4w7+SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377183"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377183"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:50 -0700
X-CSE-ConnectionGUID: Zo31kTA9R3OEu+TRMfUU8g==
X-CSE-MsgGUID: VpjMJH2QR9KBVMCowUDGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066324"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:50 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 11/11] lib/intel_compute: Make array size a dynamic
 parameter
Date: Tue, 11 Mar 2025 16:21:31 +0100
Message-ID: <20250311152321.16497-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311152321.16497-1-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
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

Give the users of run_intel_compute_kernel() the possibility to change
the default size of the input and output arrays by adding a custom
size in struct user_execenv::array_size.

If no value is provided, the existing default value of SIZE_DATA will
be used.

Example:

    struct user_execenv env = {};
    env.array_size = 1024 * 1024;
    run_intel_compute_kernel(fd, &env);

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 144 +++++++++++++++++++++++++++-----------------
 lib/intel_compute.h |   2 +
 2 files changed, 90 insertions(+), 56 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 068d64b24..b2cba0fe0 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -26,8 +26,6 @@
 
 #define SIZE_DATA			64
 #define SIZE_BATCH			0x10000
-#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
-#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_SURFACE_STATE		0x10000
 #define SIZE_DYNAMIC_STATE		0x100000
 #define SIZE_INDIRECT_OBJECT		0x10000
@@ -56,9 +54,6 @@
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
 
 #define THREADS_PER_GROUP		32
-#define THREAD_GROUP_X			MAX(1, SIZE_DATA / (ENQUEUED_LOCAL_SIZE_X * \
-							    ENQUEUED_LOCAL_SIZE_Y * \
-							    ENQUEUED_LOCAL_SIZE_Z))
 #define THREAD_GROUP_Y			1
 #define THREAD_GROUP_Z			1
 #define ENQUEUED_LOCAL_SIZE_X		1024
@@ -91,6 +86,7 @@ struct bo_execenv {
 	/* Xe part */
 	uint32_t vm;
 	uint32_t exec_queue;
+	uint32_t array_size;
 
 	/* i915 part */
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -118,6 +114,11 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 		else
 			execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
+		if (user && user->array_size)
+			execenv->array_size = user->array_size;
+		else
+			execenv->array_size = SIZE_DATA;
+
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
 								   eci, 0);
@@ -306,6 +307,23 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
 	}
 }
 
+static uint32_t size_thread_group_x(uint32_t work_size)
+{
+	return MAX(1, work_size / (ENQUEUED_LOCAL_SIZE_X *
+				   ENQUEUED_LOCAL_SIZE_Y *
+				   ENQUEUED_LOCAL_SIZE_Z));
+}
+
+static size_t size_input(uint32_t work_size)
+{
+	return MAX(sizeof(float) * work_size, 0x10000);
+}
+
+static size_t size_output(uint32_t work_size)
+{
+	return MAX(sizeof(float) * work_size, 0x10000);
+}
+
 /*
  * TGL compatible batch
  */
@@ -715,10 +733,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect data start" },
 		{ .addr = ADDR_INPUT,
-		  .size = SIZE_BUFFER_INPUT,
 		  .name = "input" },
 		{ .addr = ADDR_OUTPUT,
-		  .size = SIZE_BUFFER_OUTPUT,
 		  .name = "output" },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
@@ -730,8 +746,10 @@ static void compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Sets Kernel size */
+	/* Set dynamic sizes */
 	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[4].size = size_input(execenv.array_size);
+	bo_dict[5].size = size_output(execenv.array_size);
 
 	bo_execenv_bind(&execenv, bo_dict, BO_DICT_ENTRIES);
 
@@ -739,13 +757,13 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
 	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
-			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
+			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
 
 	input_data = (float *) bo_dict[4].data;
 	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
+	for (int i = 0; i < execenv.array_size; i++)
 		input_data[i] = rand() / (float)RAND_MAX;
 
 	if (IS_DG1(devid))
@@ -763,7 +781,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
+	for (int i = 0; i < execenv.array_size; i++) {
 		float input = input_data[i];
 		float output = output_data[i];
 		float expected_output = input * input;
@@ -999,9 +1017,9 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
-		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		{ .addr = ADDR_INPUT,
 		  .name = "addr input"},
-		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		{ .addr = ADDR_OUTPUT,
 		  .name = "addr output" },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
@@ -1017,22 +1035,24 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Sets Kernel size */
+	/* Set dynamic sizes */
 	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
+	bo_dict[4].size = size_input(execenv.array_size);
+	bo_dict[5].size = size_output(execenv.array_size);
 
 	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict[4].data;
 	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
+	for (int i = 0; i < execenv.array_size; i++)
 		input_data[i] = rand() / (float)RAND_MAX;
 
 	xehp_compute_exec_compute(bo_dict[8].data,
@@ -1045,7 +1065,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
+	for (int i = 0; i < execenv.array_size; i++) {
 		float input = input_data[i];
 		float output = output_data[i];
 		float expected_output = input * input;
@@ -1217,9 +1237,9 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
-		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		{ .addr = ADDR_INPUT,
 		  .name = "addr input"},
-		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		{ .addr = ADDR_OUTPUT,
 		  .name = "addr output" },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
@@ -1232,19 +1252,21 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Sets Kernel size */
+	/* Set dynamic sizes */
 	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
+	bo_dict[2].size = size_input(execenv.array_size);
+	bo_dict[3].size = size_output(execenv.array_size);
 
 	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
 
 	memcpy(bo_dict[0].data, kernel, size);
-	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
 
 	input_data = (float *) bo_dict[2].data;
 	output_data = (float *) bo_dict[3].data;
 	srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
+	for (int i = 0; i < execenv.array_size; i++)
 		input_data[i] = rand() / (float)RAND_MAX;
 
 	xehpc_compute_exec_compute(bo_dict[5].data,
@@ -1257,7 +1279,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
+	for (int i = 0; i < execenv.array_size; i++) {
 		float input = input_data[i];
 		float output = output_data[i];
 		float expected_output = input * input;
@@ -1274,12 +1296,13 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 }
 
 static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
-					uint64_t addr_general_state_base,
-					uint64_t addr_surface_state_base,
-					uint64_t addr_dynamic_state_base,
-					uint64_t addr_instruction_state_base,
-					uint64_t offset_indirect_data_start,
-					uint64_t kernel_start_pointer)
+				       uint64_t addr_general_state_base,
+				       uint64_t addr_surface_state_base,
+				       uint64_t addr_dynamic_state_base,
+				       uint64_t addr_instruction_state_base,
+				       uint64_t offset_indirect_data_start,
+				       uint64_t kernel_start_pointer,
+				       uint32_t work_size)
 {
 	int b = 0;
 
@@ -1342,7 +1365,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
 	addr_bo_buffer_batch[b++] = 0x000003ff;
-	addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
+	addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
 
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
@@ -1398,7 +1421,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t offset_indirect_data_start,
 					uint64_t kernel_start_pointer,
 					uint64_t sip_start_pointer,
-					bool	 threadgroup_preemption)
+					bool	 threadgroup_preemption,
+					uint32_t work_size)
 {
 	int b = 0;
 
@@ -1480,7 +1504,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 		 */
 		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
 	else
-		addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
+		addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
 
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
@@ -1576,9 +1600,9 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
-		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		{ .addr = ADDR_INPUT,
 		  .name = "addr input"},
-		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		{ .addr = ADDR_OUTPUT,
 		  .name = "addr output" },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
@@ -1596,8 +1620,10 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Sets Kernel size */
+	/* Set dynamic sizes */
 	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[4].size = size_input(execenv.array_size);
+	bo_dict[5].size = size_output(execenv.array_size);
 
 	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
 
@@ -1605,14 +1631,14 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict[4].data;
 	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
+	for (int i = 0; i < execenv.array_size; i++)
 		input_data[i] = rand() / (float)RAND_MAX;
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
@@ -1621,11 +1647,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 				   ADDR_DYNAMIC_STATE_BASE,
 				   ADDR_INSTRUCTION_STATE_BASE,
 				   OFFSET_INDIRECT_DATA_START,
-				   OFFSET_KERNEL);
+				   OFFSET_KERNEL,
+				   execenv.array_size);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
+	for (int i = 0; i < execenv.array_size; i++) {
 		float input = input_data[i];
 		float output = output_data[i];
 		float expected_output = input * input;
@@ -1667,9 +1694,9 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
-		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		{ .addr = ADDR_INPUT,
 		  .name = "addr input"},
-		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		{ .addr = ADDR_OUTPUT,
 		  .name = "addr output" },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
@@ -1690,36 +1717,39 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Sets Kernel size */
+	/* Set dynamic sizes */
 	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[4].size = size_input(execenv.array_size);
+	bo_dict[5].size = size_output(execenv.array_size);
 
 	bo_execenv_bind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict[4].data;
 	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
+	for (int i = 0; i < execenv.array_size; i++)
 		input_data[i] = rand() / (float)RAND_MAX;
 
 	xe2lpg_compute_exec_compute(bo_dict[8].data,
-				  ADDR_GENERAL_STATE_BASE,
-				  ADDR_SURFACE_STATE_BASE,
-				  ADDR_DYNAMIC_STATE_BASE,
-				  ADDR_INSTRUCTION_STATE_BASE,
-				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				  OFFSET_INDIRECT_DATA_START,
-				  OFFSET_KERNEL, 0, false);
+				    ADDR_GENERAL_STATE_BASE,
+				    ADDR_SURFACE_STATE_BASE,
+				    ADDR_DYNAMIC_STATE_BASE,
+				    ADDR_INSTRUCTION_STATE_BASE,
+				    XE2_ADDR_STATE_CONTEXT_DATA_BASE,
+				    OFFSET_INDIRECT_DATA_START,
+				    OFFSET_KERNEL, 0, false,
+				    execenv.array_size);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
+	for (int i = 0; i < execenv.array_size; i++) {
 		float input = input_data[i];
 		float output = output_data[i];
 		float expected_output = input * input;
@@ -1919,9 +1949,9 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
-		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		{ .addr = ADDR_INPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
 		  .name = "addr input"},
-		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		{ .addr = ADDR_OUTPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
 		  .name = "addr output" },
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
@@ -2039,12 +2069,14 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, threadgroup_preemption);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
+				    threadgroup_preemption, SIZE_DATA);
 
 	xe2lpg_compute_exec_compute(bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
 				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
 				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
-				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
+				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
+				    false, SIZE_DATA);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
 	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index dc0fe2ec2..9fdb7fc73 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -55,6 +55,8 @@ struct user_execenv {
 	unsigned int kernel_size;
 	/** @skip_results_check: do not verify correctness of the results if true */
 	bool skip_results_check;
+	/** @array_size: size of input and output arrays */
+	uint32_t array_size;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

