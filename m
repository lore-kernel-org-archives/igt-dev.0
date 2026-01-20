Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C86BD2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 11:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471B110E5B8;
	Tue, 20 Jan 2026 11:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWDTySEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8030110E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768906885; x=1800442885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkb0X3NGh9IdhSjMMnWpkIqZXSqekFcgCuu8H4fLaQE=;
 b=VWDTySEAP+PNYpc0RHjaB/tcUdGwXF6cyW9zhFGJJSkFQl31CZPkGglS
 bQOFr/hEzkAH+mzjCAdPGowXSo4LrDdim3lI81zE8DM8zUCrqc6TKdjtm
 dRePztX2f8TGhzdZNhwu3IGzdWrHZuJcIww4+Sd/D7WK5Mn9eEOb43fVm
 lZpO4b63sd0oaox5RPxfnXWyp2B5Hp8Lgmkln09OoaQU1XtAFV/zg/bl0
 D5YWpLdJtfURB50ABun4kuTy0xwtC7GoTAv9ggfcqhrTKJS6XoGoBPiWf
 Bz9yLcOj1drvAvW6dyKsJ0s+JED810CehMMGyfhqhxEe7GW9mC1+ZEN1o w==;
X-CSE-ConnectionGUID: 2e4bVVHXSWutcXgzKMnm+Q==
X-CSE-MsgGUID: sn4vWDliQlu9UDEUGtSdfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81484003"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81484003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:01:25 -0800
X-CSE-ConnectionGUID: EnIFZHx+RXOxs/iTs8bkYQ==
X-CSE-MsgGUID: Ni2kmbxCTM6EFXfvYXFdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205246674"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:01:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v6 1/5] lib/intel_compute: Add compute-square for xe3p
Date: Tue, 20 Jan 2026 12:01:10 +0100
Message-ID: <20260120110108.84369-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120110108.84369-7-zbigniew.kempczynski@intel.com>
References: <20260120110108.84369-7-zbigniew.kempczynski@intel.com>
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

Extend support of compute-square calculation in IGT to xe3p platforms
like CrescentIsland.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
v3 - remove unnecessary kernel_addr variable and reuse
     XE2_ADDR_STATE_CONTEXT_DATA_BASE definition (Francois)
v4 - use work_size (Francois)
---
 lib/intel_compute.c                | 232 ++++++++++++++++++++++++++++-
 lib/intel_compute_krn_square.h     |  41 +++++
 lib/intel_compute_square_kernels.c |   5 +
 lib/xehp_media.h                   |   1 +
 4 files changed, 278 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index a555f908b1..05ea92c7db 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -50,6 +50,8 @@
 #define OFFSET_BINDING_TABLE		0x10000
 
 #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
+#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
+
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
@@ -66,6 +68,7 @@
 #define DP_PIPELINE_FLUSH		(1 << 2)
 #define WRITE_IMM_DATA			(1 << 0)
 #define WRITE_TIMESTAMP		(3 << 0)
+#define XE3P_WRITE_IMM_DATA		(1 << 16)
 
 /*
  * TGP  - ThreadGroup Preemption
@@ -109,6 +112,17 @@ struct bo_execenv {
 	struct user_execenv *user;
 };
 
+struct inline_data {
+	union {
+		uint32_t dw[16];
+
+		struct {
+			uint32_t indirect_addr_lo;
+			uint32_t indirect_addr_hi;
+		} xe3p;
+	};
+};
+
 static void bo_randomize(float *ptr, int size)
 {
 	srand(time(NULL));
@@ -1578,7 +1592,6 @@ static void xe2lpg_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = 0xE0004000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 
-#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
 	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
 	// Split into low and high 32 bits
 	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
@@ -1902,6 +1915,218 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_destroy(&execenv);
 }
 
+static void xe3p_compute_exec_compute(int fd,
+				      const struct inline_data *idata,
+				      uint32_t *addr_bo_buffer_batch,
+				      uint64_t kernel_start_pointer,
+				      uint64_t context_data_base_addr,
+				      bool threadgroup_preemption,
+				      uint32_t work_size)
+{
+	int b = 0;
+	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
+
+	igt_assert(idata);
+	igt_debug("kernel addr         : %"PRIx64"\n", kernel_start_pointer);
+
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS  | 0x14; /* dw0 */
+	addr_bo_buffer_batch[b++] = 0x00000040; /* dw1 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
+	addr_bo_buffer_batch[b++] = 0x40048000; /* dw3 */
+	addr_bo_buffer_batch[b++] = 0x00000040; /* dw4 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw5 */
+	addr_bo_buffer_batch[b++] = 0x00000040; /* dw6 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw7 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw8 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw9 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw13 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
+	addr_bo_buffer_batch[b++] = 0x00000040; /* dw16 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
+	addr_bo_buffer_batch[b++] = 0xFFFFFFFE; /* dw18 */
+	addr_bo_buffer_batch[b++] = 0x00000040; /* dw19 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw20 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw21 */
+
+	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 1;
+	addr_bo_buffer_batch[b++] = 0x14001400;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
+	addr_bo_buffer_batch[b++] = context_data_base_addr;
+	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
+
+	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
+	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
+	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
+	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
+	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
+
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
+	else
+		addr_bo_buffer_batch[b++] = size_thread_group_x(work_size);
+
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y; /* dw8 */
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z; /* dw9 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
+	addr_bo_buffer_batch[b++] = 0x00010000; /* dw13 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw16 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw18 */
+	addr_bo_buffer_batch[b++] = kernel_start_pointer; /* dw19 */
+	addr_bo_buffer_batch[b++] = kernel_start_pointer >> 32; /* dw20 */
+	if (threadgroup_preemption)
+		addr_bo_buffer_batch[b++] = 0x00000002;
+	else
+		addr_bo_buffer_batch[b++] = 0x00100002; // Enable Mid Thread Preemption BitField:20
+
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
+	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
+	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
+
+	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
+				    DP_PIPELINE_FLUSH | XE3P_WRITE_IMM_DATA; /* dw27 */
+	addr_bo_buffer_batch[b++] = ADDR_BATCH;		/* dw28 (postsync addr) */
+	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;	/* dw29 */
+	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;		/* dw30 */
+	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);	/* dw31 */
+
+	/* inline data 32 - 47 */
+	memcpy(&addr_bo_buffer_batch[b], idata, sizeof(*idata));
+	b += 16;
+
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw48 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw49 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw50 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw51 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw52 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw53 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw54 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw55 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw56 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw57 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw58 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw59 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw60 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw61 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
+	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
+
+	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
+}
+
+static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
+				      uint64_t addr_input,
+				      uint64_t addr_output,
+				      uint32_t loop_count)
+{
+	int b = 0;
+
+	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_input >> 32;
+	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_output >> 32;
+	addr_bo_buffer_batch[b++] = loop_count;
+	addr_bo_buffer_batch[b++] = 0x00000200;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+}
+
+/**
+ * xe3p_compute_exec - run a pipeline compatible with XE3P
+ *
+ * @fd: file descriptor of the opened DRM device
+ * @kernel: GPU Kernel binary to be executed
+ * @size: size of @kernel
+ * @eci: engine instance class
+ * @user: user defined exec environment
+ * @alloc_prefs: memory allocation preference
+ */
+static void xe3p_compute_exec(int fd, const unsigned char *kernel,
+			      unsigned int size,
+			      struct drm_xe_engine_class_instance *eci,
+			      struct user_execenv *user,
+			      enum execenv_alloc_prefs alloc_prefs)
+{
+	struct bo_dict_entry bo_dict[] = {
+		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
+		  .name = "instr state base"},
+		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
+		  .size =  0x1000,
+		  .name = "indirect object base"},
+		{ .addr = ADDR_INPUT,
+		  .name = "addr input"},
+		{ .addr = ADDR_OUTPUT,
+		  .name = "addr output" },
+		{ .addr = ADDR_BATCH,
+		  .size = SIZE_BATCH,
+		  .name = "batch" },
+		{ .addr = XE2_ADDR_STATE_CONTEXT_DATA_BASE,
+		  .size = 0x10000,
+		  .name = "state context data base"},
+	};
+	struct inline_data idata = {};
+	struct bo_execenv execenv;
+	float *input_data, *output_data;
+	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
+	int entries = ARRAY_SIZE(bo_dict);
+
+	bo_execenv_create(fd, &execenv, eci, user);
+
+	/* Sets Kernel size */
+	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[2].size = size_input(execenv.array_size);
+	bo_dict[3].size = size_output(execenv.array_size);
+
+	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
+
+	memcpy(bo_dict[0].data, kernel, size);
+	memset(bo_dict[1].data, 0, 4096);
+
+	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
+				  execenv.loop_count);
+	idata.xe3p.indirect_addr_lo = indirect_addr;
+	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
+
+	input_data = get_input_data(&execenv, user, bo_dict[2].data);
+	output_data = get_output_data(&execenv, user, bo_dict[3].data);
+
+	xe3p_compute_exec_compute(fd, &idata,
+				  bo_dict[4].data,
+				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
+				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false,
+				  execenv.array_size);
+
+	bo_execenv_exec(&execenv, ADDR_BATCH);
+
+	if (!user || (user && !user->skip_results_check))
+		bo_check_square(input_data, output_data, execenv.array_size);
+
+	bo_execenv_unbind(&execenv, bo_dict, entries);
+	bo_execenv_destroy(&execenv);
+}
+
 /*
  * Compatibility flags.
  *
@@ -1968,6 +2193,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(35, 11),
+		.compute_exec = xe3p_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 };
 
 static const struct intel_compute_kernels
diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
index 2b616f136b..0490a692ef 100644
--- a/lib/intel_compute_krn_square.h
+++ b/lib/intel_compute_krn_square.h
@@ -288,4 +288,45 @@ static const unsigned char xe3lpg_kernel_square_bin[] = {
 	0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
 };
 
+static const unsigned char xe3p_kernel_square_bin[] = {
+	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
+	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x80,
+	0x20, 0x02, 0x05, 0x02, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02,
+	0xc0, 0x04, 0x00, 0x40, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00,
+	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x41, 0x21, 0x03, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06,
+	0x14, 0x02, 0x10, 0x00, 0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x0d,
+	0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00,
+	0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x06, 0x01, 0x04, 0x0d, 0x84, 0x04,
+	0x70, 0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
+	0x44, 0x05, 0x10, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00,
+	0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x80,
+	0x70, 0x07, 0x41, 0x60, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x61, 0x00, 0x00, 0x80, 0x70, 0x07, 0x61, 0x60, 0x24, 0x05, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x33, 0x43, 0x17, 0x00, 0x06, 0x11, 0x00, 0x08,
+	0x14, 0x06, 0x00, 0xf0, 0x00, 0x00, 0x00, 0x50, 0x41, 0x83, 0x14, 0x00,
+	0xa0, 0x02, 0x05, 0x0a, 0x04, 0x08, 0x10, 0x0a, 0x04, 0x08, 0x00, 0x00,
+	0x33, 0x24, 0x15, 0x00, 0x04, 0x19, 0x00, 0x00, 0x14, 0x06, 0x00, 0xf0,
+	0x14, 0x0a, 0x04, 0x50, 0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x80,
+	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00
+};
+
 #endif /* __INTEL_COMPUTE_KRN_SQUARE_H__ */
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index 3c888ebd85..4d69f270e9 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -86,5 +86,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.loop_kernel = xe3lpg_kernel_loop_bin,
 		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
 	},
+	{
+		.ip_ver = IP_VER(35, 11),
+		.size = sizeof(xe3p_kernel_square_bin),
+		.kernel = xe3p_kernel_square_bin,
+	},
 	{}
 };
diff --git a/lib/xehp_media.h b/lib/xehp_media.h
index fb65b8f207..20227bd3a6 100644
--- a/lib/xehp_media.h
+++ b/lib/xehp_media.h
@@ -18,6 +18,7 @@
 #define XEHP_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
 #define XEHP_CFE_STATE			GFXPIPE_XEHP(2, 2, 0)
 #define XEHP_COMPUTE_WALKER		GFXPIPE_XEHP(2, 2, 2)
+#define XE3P_COMPUTE_WALKER2		GFXPIPE_XEHP(2, 2, 8)
 
 #define BITRANGE(start, end) (end - start + 1)
 
-- 
2.43.0

