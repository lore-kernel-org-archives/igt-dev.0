Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB6C36017
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365E910E812;
	Wed,  2 Apr 2025 15:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9oevMYh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197CA10E81F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607415; x=1775143415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=68+yyv8/Zb1jv7UTZBJgHCBs8qL9Nvz/2W5C9c4ejXw=;
 b=Q9oevMYhsIoy/dYjKH7fJ2GedfZaMOf2sjVjWX2zBO3peeoz+nGHCmNA
 p1+BgO6oq9AIzMdova18q/ODktjbBcP4sfudGNlGsI1nzbdQg8aLineEQ
 Ucue891AH29OSgaCbyK6MFg5fubngu0gGwOW8yTumjuxHzAFYCiWZ3SfM
 5DXDXX2MIlij+/AvZCIVH3gu1u5Ku0DuFtrcRsfoQxKXHxwdGFWgirdGh
 YDTtaYC6RWEA+pyq/jAu6kmOlZ/RFnRfvUwiL73ARZpTNwK5HKb5gmyTw
 XaochB75SrWGprOcgDCnrA5DqZrmtzZzQLWMzDLp+5oaJ3riDwCjLJiBy Q==;
X-CSE-ConnectionGUID: To7+epo2QLyYm4+8YpKVuQ==
X-CSE-MsgGUID: HPv4B9vqQ+u0eGPlDAaq7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885895"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:34 -0700
X-CSE-ConnectionGUID: w9wYS0O2QvCql6ufoMKO4g==
X-CSE-MsgGUID: MQBUozdFTGa4PAfKH1u7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717755"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:33 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 11/11] lib/intel_compute: Make array size a dynamic parameter
Date: Wed,  2 Apr 2025 17:20:09 +0200
Message-ID: <20250402152256.173562-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402152256.173562-1-francois.dugast@intel.com>
References: <20250402152256.173562-1-francois.dugast@intel.com>
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 144 +++++++++++++++++++++++++++-----------------
 lib/intel_compute.h |   2 +
 2 files changed, 90 insertions(+), 56 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 3aab83da6..d068b53b2 100644
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
@@ -1299,12 +1321,13 @@ static void xelpg_create_indirect_data(uint32_t *addr_bo_buffer_batch,
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
 
@@ -1367,7 +1390,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
 	addr_bo_buffer_batch[b++] = 0x000003ff;
-	addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
+	addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
 
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
@@ -1423,7 +1446,8 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t offset_indirect_data_start,
 					uint64_t kernel_start_pointer,
 					uint64_t sip_start_pointer,
-					bool	 threadgroup_preemption)
+					bool	 threadgroup_preemption,
+					uint32_t work_size)
 {
 	int b = 0;
 
@@ -1505,7 +1529,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 		 */
 		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
 	else
-		addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
+		addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
 
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
 	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
@@ -1601,9 +1625,9 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1621,8 +1645,10 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
-	/* Sets Kernel size */
+	/* Set dynamic sizes */
 	bo_dict[0].size = ALIGN(size, 0x10000);
+	bo_dict[4].size = size_input(execenv.array_size);
+	bo_dict[5].size = size_output(execenv.array_size);
 
 	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
 
@@ -1630,14 +1656,14 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
 
 	input_data = (float *) bo_dict[4].data;
 	output_data = (float *) bo_dict[5].data;
 	srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
+	for (int i = 0; i < execenv.array_size; i++)
 		input_data[i] = rand() / (float)RAND_MAX;
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
@@ -1646,11 +1672,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1692,9 +1719,9 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1715,36 +1742,39 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
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
-	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
+	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
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
@@ -1944,9 +1974,9 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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
@@ -2064,12 +2094,14 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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

