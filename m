Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901B6E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 13:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEC610EE65;
	Thu,  5 Dec 2024 13:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m85dlgid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BFA10EE65
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733405313; x=1764941313;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cPplWSFvSb0bSpDTgZhvsFieqr8/PWVqcOOrReDQu1c=;
 b=m85dlgidMWgdKC9Mk+uVvNKZmsHzIl9vZDV3Ly1Sn/q6gVU/7qcfCNXc
 hVq0yPNgOFYPwcjbrYPZIUeaGWCA6nnwqRIvHQAw9nRrMlFzFO3VZIdDO
 lE9YbZy8N2iI+2AxXb3bZUPVCgS63FbG3K6xXm6quqBfmX0ctkMVPLoK8
 pUpmKBhuw/XJk771pmwSBkkImTHMtCaNTtFqBPGqS3c8BMxPX1mqxYv3l
 dDA5Zre/zct7f/x9we4n+kNkHjJkZmTeHIblszNFd7fI0dS+Km4NlBk/J
 GbMQXv6gELwmRM0rwLbjKJIVxyIss29azoozHDizb69QyUogWjTk6YRRm A==;
X-CSE-ConnectionGUID: IJkPZ+JUQQaS3aOriG9m/g==
X-CSE-MsgGUID: st+zdbwATQGmzHHOapMtkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51257713"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51257713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 05:28:15 -0800
X-CSE-ConnectionGUID: uWKrst2YTUyUkNbPNjjdSw==
X-CSE-MsgGUID: 0qXQeS2GRmmANpAtRIS/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93925977"
Received: from dut7077atsm.jf.intel.com ([10.75.201.71])
 by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 05:28:14 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, dwarakanath.ramadeva@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t] GPGPU support for MTL platform
Date: Thu,  5 Dec 2024 13:28:14 +0000
Message-Id: <20241205132814.3440727-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

GPGPU shader and pipeline was missing for MTL platform
Added GPGPU Shader and Compute Pipeline for exercising
gpgpu in MTL for i915 and XE

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c                | 213 +++++++++++++++++++++++++++++
 lib/intel_compute_square_kernels.c |  49 +++++++
 2 files changed, 262 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 879928ab6..1c1323130 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1161,6 +1161,126 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_destroy(&execenv);
 }
 
+static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+					uint64_t addr_general_state_base,
+					uint64_t addr_surface_state_base,
+					uint64_t addr_dynamic_state_base,
+					uint64_t addr_instruction_state_base,
+					uint64_t offset_indirect_data_start,
+					uint64_t kernel_start_pointer)
+{
+	int b = 0;
+
+	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
+	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
+	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
+	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
+	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
+	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
+
+
+	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+				    PIPELINE_SELECT_GPGPU;
+
+	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
+	addr_bo_buffer_batch[b++] = 0x80000000;
+
+	addr_bo_buffer_batch[b++] = XEHP_CFE_STATE | 0x4;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x03808800;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
+	addr_bo_buffer_batch[b++] = 0x00002580;
+	addr_bo_buffer_batch[b++] = 0x00060002;
+
+
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
+	addr_bo_buffer_batch[b++] = (addr_general_state_base & 0xffffffff) | 0x21;
+	addr_bo_buffer_batch[b++] = addr_general_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x00028000;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x21;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x21;
+	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = (addr_instruction_state_base & 0xffffffff) | 0x21;
+	addr_bo_buffer_batch[b++] = addr_instruction_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0xfffff001;
+	addr_bo_buffer_batch[b++] = 0x00010001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0xfffff001;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x21;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x00007fbf;
+	addr_bo_buffer_batch[b++] = 0x5E70F021;
+	addr_bo_buffer_batch[b++] = 0x00007F6A;
+	addr_bo_buffer_batch[b++] = 0x00010000;
+
+
+	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 0x2;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x2;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x001ff000;
+
+	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x25;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000040;
+	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
+	addr_bo_buffer_batch[b++] = 0xbe040000;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+	addr_bo_buffer_batch[b++] = 0x000003ff;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+
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
+
+	addr_bo_buffer_batch[b++] = kernel_start_pointer;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00001080;
+	addr_bo_buffer_batch[b++] = 0x0c000020;
+
+	addr_bo_buffer_batch[b++] = 0x00000008;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00001087;
+	addr_bo_buffer_batch[b++] = ADDR_BATCH;
+	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
+	addr_bo_buffer_batch[b++] = 0x00100000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
+}
+
+
 static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 					uint64_t addr_general_state_base,
 					uint64_t addr_surface_state_base,
@@ -1321,6 +1441,94 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 }
 
+/**
+ * xelpg_compute_exec - run a pipeline compatible with MTL
+ *
+ * @fd: file descriptor of the opened DRM device
+ * @kernel: GPU Kernel binary to be executed
+ * @size: size of @kernel.
+ * @eci: xelpg engine class instance if device is MTL
+ */
+static void xelpg_compute_exec(int fd, const unsigned char *kernel,
+				unsigned int size,
+				struct drm_xe_engine_class_instance *eci)
+{
+#define XELPG_BO_DICT_ENTRIES 9
+	struct bo_dict_entry bo_dict[XELPG_BO_DICT_ENTRIES] = {
+		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
+		  .name = "instr state base"},
+		{ .addr = ADDR_DYNAMIC_STATE_BASE,
+		  .size = 0x100000,
+		  .name = "dynamic state base"},
+		{ .addr = ADDR_SURFACE_STATE_BASE,
+		  .size = 0x1000,
+		  .name = "surface state base"},
+		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
+		  .size =  0x1000,
+		  .name = "indirect object base"},
+		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		  .name = "addr input"},
+		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		  .name = "addr output" },
+		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		  .name = "general state base" },
+		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
+		  .size = 0x1000,
+		  .name = "binding table" },
+		{ .addr = ADDR_BATCH,
+		  .size = SIZE_BATCH,
+		  .name = "batch" },
+	};
+
+	struct bo_execenv execenv;
+	float *dinput;
+
+	bo_execenv_create(fd, &execenv, eci);
+
+	/* Sets Kernel size */
+	bo_dict[0].size = ALIGN(size, 0x1000);
+
+	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
+
+	memcpy(bo_dict[0].data, kernel, size);
+
+	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
+	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+
+	dinput = (float *)bo_dict[4].data;
+	srand(time(NULL));
+
+	for (int i = 0; i < SIZE_DATA; i++)
+		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+
+	xelpg_compute_exec_compute(bo_dict[8].data,
+				   ADDR_GENERAL_STATE_BASE,
+				   ADDR_SURFACE_STATE_BASE,
+				   ADDR_DYNAMIC_STATE_BASE,
+				   ADDR_INSTRUCTION_STATE_BASE,
+				   OFFSET_INDIRECT_DATA_START,
+				   OFFSET_KERNEL);
+
+	bo_execenv_exec(&execenv, ADDR_BATCH);
+
+	for (int i = 0; i < SIZE_DATA; i++) {
+		float f1, f2;
+
+		f1 = ((float *) bo_dict[5].data)[i];
+		f2 = ((float *) bo_dict[4].data)[i];
+
+		if (f1 != f2 * f2)
+			igt_debug("[%4d] f1: %f != %f %f\n", i, f1, f2 * f2, f2);
+
+		igt_assert(f1 == f2 * f2);
+	}
+
+	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
+	bo_execenv_destroy(&execenv);
+}
+
 /**
  * xe2lpg_compute_exec - run a pipeline compatible with XE2
  *
@@ -1449,6 +1657,11 @@ static const struct {
 		.compute_exec = xehpc_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(12, 70),
+		.compute_exec = xelpg_compute_exec,
+		.compat = COMPAT_DRIVER_I915 | COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(20, 01),
 		.compute_exec = xe2lpg_compute_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index a1f3b46da..b0912e7e4 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -3844,6 +3844,50 @@ static const unsigned char xe2lpg_kernel_inc_bin[] = {
 	0x00, 0x00, 0x00, 0x00
 };
 
+unsigned char xelpg_kernel_square_bin[] = {
+	0x61, 0x00, 0x03, 0x80, 0x20, 0x42, 0x05, 0x7f, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x80, 0x20, 0x82, 0x45, 0x7f,
+	0x04, 0x00, 0x00, 0x02, 0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80,
+	0x20, 0x82, 0x45, 0x7f, 0x44, 0x7f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x19, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x31, 0x40, 0x03, 0x80, 0x00, 0x00, 0x14, 0x08,
+	0x0c, 0x7f, 0xfa, 0xa7, 0x00, 0x00, 0x10, 0x02, 0x61, 0x00, 0x03, 0x80,
+	0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20,
+	0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x66, 0x09, 0x00, 0x80,
+	0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04,
+	0x01, 0x09, 0x00, 0xe8, 0x01, 0x00, 0x11, 0x00, 0x41, 0x1a, 0x20, 0x22,
+	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
+	0x52, 0x19, 0x04, 0x00, 0x60, 0x06, 0x04, 0x05, 0x04, 0x04, 0x0e, 0x01,
+	0x04, 0x01, 0x04, 0x07, 0x52, 0x00, 0x24, 0x00, 0x60, 0x06, 0x04, 0x0a,
+	0x04, 0x04, 0x0e, 0x01, 0x04, 0x02, 0x04, 0x07, 0x70, 0x1a, 0x04, 0x00,
+	0x60, 0x02, 0x01, 0x00, 0x04, 0x05, 0x10, 0x52, 0x84, 0x08, 0x00, 0x00,
+	0x70, 0x1a, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00, 0x04, 0x0a, 0x10, 0x52,
+	0x84, 0x08, 0x00, 0x00, 0x2e, 0x00, 0x05, 0x11, 0x00, 0xc0, 0x00, 0x00,
+	0xd0, 0x00, 0x00, 0x00, 0xd0, 0x00, 0x00, 0x00, 0x69, 0x00, 0x0c, 0x60,
+	0x02, 0x05, 0x20, 0x00, 0x69, 0x00, 0x0e, 0x66, 0x02, 0x0a, 0x20, 0x00,
+	0x40, 0x1a, 0x10, 0xa0, 0x32, 0x0c, 0x10, 0x08, 0x40, 0x1a, 0x12, 0xa6,
+	0x32, 0x0e, 0x10, 0x08, 0x01, 0x1a, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x40, 0x04, 0x00,
+	0x00, 0x00, 0x14, 0x14, 0x94, 0x10, 0x00, 0xfa, 0x00, 0x00, 0x00, 0x04,
+	0x01, 0x19, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x31, 0x41, 0x24, 0x00, 0x00, 0x00, 0x14, 0x16,
+	0x94, 0x12, 0x00, 0xfa, 0x00, 0x00, 0x00, 0x04, 0x40, 0x00, 0x0c, 0xa0,
+	0x4a, 0x0c, 0x10, 0x08, 0x40, 0x00, 0x0e, 0xa6, 0x4a, 0x0e, 0x10, 0x08,
+	0x41, 0x20, 0x14, 0x20, 0x00, 0x14, 0x00, 0x14, 0x41, 0x21, 0x16, 0x26,
+	0x00, 0x16, 0x00, 0x16, 0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x95, 0x0c, 0x08, 0xfa, 0x14, 0x14, 0x00, 0x04, 0x31, 0x91, 0x24, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x95, 0x0e, 0x08, 0xfa, 0x14, 0x16, 0x00, 0x04,
+	0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20,
+	0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x00, 0x00, 0x01, 0x00,
+	0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x2f, 0x00, 0x05, 0x00,
+	0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
+	0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00, 0x01, 0x11, 0x00, 0x80,
+	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x31, 0x40, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x30,
+	0x00, 0x00, 0x00, 0x00
+};
 
 const struct intel_compute_kernels intel_compute_square_kernels[] = {
 	{
@@ -3866,6 +3910,11 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.size = sizeof(xehpc_kernel_square_bin),
 		.kernel = xehpc_kernel_square_bin,
 	},
+	{
+		.ip_ver = IP_VER(12, 70),
+		.size = sizeof(xelpg_kernel_square_bin),
+		.kernel = xelpg_kernel_square_bin,
+	},
 	{
 		.ip_ver = IP_VER(20, 01),
 		.size = sizeof(xe2lpg_kernel_square_bin),
-- 
2.34.1

