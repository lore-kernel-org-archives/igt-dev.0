Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6246E10E1BC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 12:24:16 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon,  4 Dec 2023 17:58:24 +0530
Message-Id: <20231204122825.3689117-4-janga.rahul.kumar@intel.com>
In-Reply-To: <20231204122825.3689117-1-janga.rahul.kumar@intel.com>
References: <20231204122825.3689117-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/4] lib/intel_compute: Add XE2 compute
 implementation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add compute pipeline and walker instructions for xe2lpg.

v2: Reuse address variables. (Zbigniew)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/intel_compute.c | 207 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c8dc42338..65a85d335 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -41,6 +41,8 @@
 #define ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
 #define OFFSET_BINDING_TABLE		0x1000
 
+#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
+
 struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
@@ -1137,6 +1139,206 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_destroy(&execenv);
 }
 
+static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+					uint64_t addr_general_state_base,
+					uint64_t addr_surface_state_base,
+					uint64_t addr_dynamic_state_base,
+					uint64_t addr_instruction_state_base,
+					uint64_t addr_state_contect_data_base,
+					uint64_t offset_indirect_data_start,
+					uint64_t kernel_start_pointer)
+{
+	int b = 0;
+
+	igt_debug("general   state base: %lx\n", addr_general_state_base);
+	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
+	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
+	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
+	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
+	igt_debug("state context data base addr: %lx\n", addr_state_contect_data_base);
+	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
+	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
+
+	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+				    PIPELINE_SELECT_GPGPU;
+
+	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 0x1;
+	addr_bo_buffer_batch[b++] = 0xE0004000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
+	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
+	// Split into low and high 32 bits
+	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
+	addr_bo_buffer_batch[b++] = (addr_state_contect_data_base >> 32) & 0xFFFFFFFF;
+
+	addr_bo_buffer_batch[b++] = XEHP_CFE_STATE | 0x4;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x03808800;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
+	addr_bo_buffer_batch[b++] = (addr_general_state_base & 0xffffffff) | 0x21;
+	addr_bo_buffer_batch[b++] = addr_general_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x0002C000;
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
+	addr_bo_buffer_batch[b++] = 0x00007fbe;
+	addr_bo_buffer_batch[b++] = 0x00000021;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x2;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x001ff000;
+
+	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x26;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000040;
+	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
+	addr_bo_buffer_batch[b++] = 0xbe040000;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+	addr_bo_buffer_batch[b++] = 0x000003ff;
+	addr_bo_buffer_batch[b++] = 0x00000002;
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
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = kernel_start_pointer;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00001047;
+	addr_bo_buffer_batch[b++] = ADDR_BATCH;
+	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * xe2lpg_compute_exec - run a pipeline compatible with XE2
+ *
+ * @fd: file descriptor of the opened DRM device
+ * @kernel: GPU Kernel binary to be executed
+ * @size: size of @kernel.
+ */
+static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
+				unsigned int size)
+{
+#define XE2_BO_DICT_ENTRIES 10
+	struct bo_dict_entry bo_dict[XE2_BO_DICT_ENTRIES] = {
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
+		{ .addr = XE2_ADDR_STATE_CONTEXT_DATA_BASE,
+		  .size = 0x10000,
+		  .name = "state context data base"},
+	};
+
+	struct bo_execenv execenv;
+	float *dinput;
+
+	bo_execenv_create(fd, &execenv);
+
+	/* Sets Kernel size */
+	bo_dict[0].size = ALIGN(size, 0x1000);
+
+	bo_execenv_bind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
+
+	memcpy(bo_dict[0].data, kernel, size);
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
+	xe2lpg_compute_exec_compute(bo_dict[8].data,
+				  ADDR_GENERAL_STATE_BASE,
+				  ADDR_SURFACE_STATE_BASE,
+				  ADDR_DYNAMIC_STATE_BASE,
+				  ADDR_INSTRUCTION_STATE_BASE,
+				  XE2_ADDR_STATE_CONTEXT_DATA_BASE,
+				  OFFSET_INDIRECT_DATA_START,
+				  OFFSET_KERNEL);
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
+			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
+		igt_assert(f1 == f2 * f2);
+	}
+
+	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
+	bo_execenv_destroy(&execenv);
+}
+
 /*
  * Compatibility flags.
  *
@@ -1175,6 +1377,11 @@ static const struct {
 		.compute_exec = xehpc_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(20, 04),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 };
 
 bool run_intel_compute_kernel(int fd)
-- 
2.25.1
