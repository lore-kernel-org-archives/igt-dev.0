Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE8710E421
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:51 +0200
Message-Id: <20230817094652.40243-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] lib/intel_compute: Add XeHP
 implementation of compute pipeline
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

Add pipeline which runs square compute workload on DG2.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/intel_compute.c                | 286 ++++++++++++++++++++++++++++-
 lib/intel_compute_square_kernels.c |  56 ++++++
 2 files changed, 341 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4f3d686d74..a753d25422 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -14,9 +14,12 @@
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 
+#include "gen7_media.h"
+#include "gen8_media.h"
 #include "intel_compute.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xehp_media.h"
 
 #define PIPE_CONTROL			0x7a000004
 #define MEDIA_STATE_FLUSH		0x0
@@ -25,7 +28,7 @@
 #define SIZE_BATCH			0x1000
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
-#define ADDR_BATCH			0x100000
+#define ADDR_BATCH			0x100000UL
 #define ADDR_INPUT			0x200000UL
 #define ADDR_OUTPUT			0x300000UL
 #define ADDR_SURFACE_STATE_BASE		0x400000UL
@@ -34,6 +37,10 @@
 #define OFFSET_INDIRECT_DATA_START	0xFFFDF000
 #define OFFSET_KERNEL			0xFFFEF000
 
+#define XEHP_ADDR_GENERAL_STATE_BASE		0x80000000UL
+#define XEHP_ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
+#define XEHP_OFFSET_BINDING_TABLE		0x1000
+
 struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
@@ -597,6 +604,279 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_destroy(&execenv);
 }
 
+static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
+				      uint64_t addr_input,
+				      uint64_t addr_output)
+{
+	int b = 0;
+
+	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_input >> 32;
+	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_output >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000400;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+}
+
+static void xehp_create_surface_state(uint32_t *addr_bo_buffer_batch,
+				      uint64_t addr_input,
+				      uint64_t addr_output)
+{
+	int b = 0;
+
+	addr_bo_buffer_batch[b++] = 0x87FDC000;
+	addr_bo_buffer_batch[b++] = 0x06000000;
+	addr_bo_buffer_batch[b++] = 0x001F007F;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00002000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_input >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = 0x87FDC000;
+	addr_bo_buffer_batch[b++] = 0x06000000;
+	addr_bo_buffer_batch[b++] = 0x001F007F;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00002000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
+	addr_bo_buffer_batch[b++] = addr_output >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = 0x00001000;
+	addr_bo_buffer_batch[b++] = 0x00001040;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
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
+static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+				      uint64_t addr_general_state_base,
+				      uint64_t addr_surface_state_base,
+				      uint64_t addr_dynamic_state_base,
+				      uint64_t addr_instruction_state_base,
+				      uint64_t offset_indirect_data_start,
+				      uint64_t kernel_start_pointer)
+{
+	int b = 0;
+
+	igt_debug("general   state base: %lx\n", addr_general_state_base);
+	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
+	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
+	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
+	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
+	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
+	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
+
+	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+				    PIPELINE_SELECT_GPGPU;
+
+	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
+	addr_bo_buffer_batch[b++] = 0x80180010;
+
+	addr_bo_buffer_batch[b++] = XEHP_CFE_STATE;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x0c008800;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
+	addr_bo_buffer_batch[b++] = 0x00002580;
+	addr_bo_buffer_batch[b++] = 0x00060002;
+
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
+	addr_bo_buffer_batch[b++] = (addr_general_state_base & 0xffffffff) | 0x61;
+	addr_bo_buffer_batch[b++] = addr_general_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x0106c000;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x61;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x61;
+	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = (addr_instruction_state_base & 0xffffffff) | 0x61;
+	addr_bo_buffer_batch[b++] = addr_instruction_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0xfffff001;
+	addr_bo_buffer_batch[b++] = 0x00010001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0xfffff001;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x61;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x00007fbf;
+	addr_bo_buffer_batch[b++] = 0x00000061;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x6;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x00002000;
+	addr_bo_buffer_batch[b++] = 0x001ff000;
+
+	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x25;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000040;
+	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
+	addr_bo_buffer_batch[b++] = 0xbe040000;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+	addr_bo_buffer_batch[b++] = 0x0000003f;
+	addr_bo_buffer_batch[b++] = 0x00000010;
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
+	addr_bo_buffer_batch[b++] = 0x00180000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00001080;
+	addr_bo_buffer_batch[b++] = 0x0c000002;
+
+	addr_bo_buffer_batch[b++] = 0x00000008;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00001027;
+	addr_bo_buffer_batch[b++] = ADDR_BATCH;
+	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000040;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * xehp_compute_exec - run a pipeline compatible with XEHP
+ *
+ * @fd: file descriptor of the opened DRM device
+ * @kernel: GPU Kernel binary to be executed
+ * @size: size of @kernel.
+ */
+static void xehp_compute_exec(int fd, const unsigned char *kernel,
+			     unsigned int size)
+{
+#define XEHP_BO_DICT_ENTRIES 9
+	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
+		{ .addr = XEHP_ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
+		  .name = "instr state base"},
+		{ .addr = ADDR_DYNAMIC_STATE_BASE,
+		  .size = 0x100000,
+		  .name = "dynamic state base"},
+		{ .addr = ADDR_SURFACE_STATE_BASE,
+		  .size = 0x1000,
+		  .name = "surface state base"},
+		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
+		  .size =  0x1000,
+		  .name = "indirect object base"},
+		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
+		  .name = "addr input"},
+		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
+		  .name = "addr output" },
+		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		  .name = "general state base" },
+		{ .addr = ADDR_SURFACE_STATE_BASE + XEHP_OFFSET_BINDING_TABLE,
+		  .size = 0x1000,
+		  .name = "binding table" },
+		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
+		  .name = "batch" },
+	};
+	struct bo_execenv execenv;
+	float *dinput;
+
+	bo_execenv_create(fd, &execenv);
+
+	/* Sets Kernel size */
+	bo_dict[0].size = ALIGN(size, 0x1000);
+
+	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
+
+	memcpy(bo_dict[0].data, kernel, size);
+	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
+	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+
+	dinput = (float *)bo_dict[4].data;
+	srand(time(NULL));
+	for (int i = 0; i < SIZE_DATA; i++)
+		((float *)dinput)[i] = rand() / (float)RAND_MAX;
+
+	xehp_compute_exec_compute(bo_dict[8].data,
+				  XEHP_ADDR_GENERAL_STATE_BASE,
+				  ADDR_SURFACE_STATE_BASE,
+				  ADDR_DYNAMIC_STATE_BASE,
+				  XEHP_ADDR_INSTRUCTION_STATE_BASE,
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
+		if (f1 != f2 * f2)
+			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
+		igt_assert(f1 == f2 * f2);
+	}
+
+	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
+	bo_execenv_destroy(&execenv);
+}
+
 /*
  * Generic code
  */
@@ -610,6 +890,10 @@ static const struct {
 		.ip_ver = IP_VER(12, 0),
 		.compute_exec = tgl_compute_exec,
 	},
+	{
+		.ip_ver = IP_VER(12, 55),
+		.compute_exec = xehp_compute_exec,
+	},
 };
 
 bool run_compute_kernel(int fd)
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index b30d8a23dd..da73a3747c 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -61,11 +61,67 @@ static const unsigned char tgllp_kernel_square_bin[] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+static const unsigned char xehp_kernel_square_bin[] = {
+	0x61, 0x31, 0x03, 0x80, 0x20, 0x42, 0x05, 0x7f, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x80, 0x20, 0x82, 0x45, 0x7f,
+	0x04, 0x00, 0x00, 0x02, 0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80,
+	0x20, 0x82, 0x45, 0x7f, 0x44, 0x7f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
+	0x31, 0x92, 0x03, 0x80, 0x00, 0x00, 0x14, 0x08, 0x0c, 0x7f, 0xfa, 0xa7,
+	0x00, 0x00, 0x10, 0x02, 0x61, 0x20, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03,
+	0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x09, 0x00, 0x80,
+	0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04,
+	0x01, 0x09, 0x00, 0xe8, 0x01, 0x00, 0x11, 0x00, 0x01, 0x22, 0x00, 0xe8,
+	0x01, 0x00, 0x11, 0x00, 0x41, 0x09, 0x20, 0x22, 0x16, 0x09, 0x11, 0x03,
+	0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03, 0x01, 0x21, 0x00, 0xe8,
+	0x01, 0x00, 0x11, 0x00, 0x52, 0x19, 0x04, 0x00, 0x60, 0x06, 0x04, 0x05,
+	0x04, 0x04, 0x0e, 0x01, 0x04, 0x01, 0x04, 0x07, 0x52, 0x00, 0x24, 0x00,
+	0x60, 0x06, 0x04, 0x0a, 0x04, 0x04, 0x0e, 0x01, 0x04, 0x02, 0x04, 0x07,
+	0x70, 0x1a, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x04, 0x05, 0x10, 0x52,
+	0x84, 0x08, 0x00, 0x00, 0x70, 0x1a, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
+	0x04, 0x0a, 0x10, 0x52, 0x84, 0x08, 0x00, 0x00, 0x2e, 0x00, 0x05, 0x11,
+	0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
+	0x69, 0x00, 0x0c, 0x60, 0x02, 0x05, 0x20, 0x00, 0x69, 0x00, 0x0e, 0x66,
+	0x02, 0x0a, 0x20, 0x00, 0x40, 0x1a, 0x10, 0xa0, 0x32, 0x0c, 0x10, 0x08,
+	0x40, 0x1a, 0x12, 0xa6, 0x32, 0x0e, 0x10, 0x08, 0x31, 0xa3, 0x04, 0x00,
+	0x00, 0x00, 0x14, 0x14, 0x94, 0x10, 0x00, 0xfa, 0x00, 0x00, 0x00, 0x06,
+	0x31, 0x94, 0x24, 0x00, 0x00, 0x00, 0x14, 0x16, 0x94, 0x12, 0x00, 0xfa,
+	0x00, 0x00, 0x00, 0x06, 0x40, 0x00, 0x0c, 0xa0, 0x4a, 0x0c, 0x10, 0x08,
+	0x40, 0x00, 0x0e, 0xa6, 0x4a, 0x0e, 0x10, 0x08, 0x41, 0x23, 0x14, 0x20,
+	0x00, 0x14, 0x00, 0x14, 0x41, 0x24, 0x16, 0x26, 0x00, 0x16, 0x00, 0x16,
+	0x31, 0xa5, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x95, 0x0c, 0x08, 0xfa,
+	0x14, 0x14, 0x80, 0x07, 0x31, 0x96, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x95, 0x0e, 0x08, 0xfa, 0x14, 0x16, 0x80, 0x07, 0x2f, 0x00, 0x05, 0x00,
+	0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
+	0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00, 0x31, 0x09, 0x03, 0x80,
+	0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00,
+	0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
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
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
 const struct compute_kernels compute_square_kernels[] = {
 	{
 		.ip_ver = IP_VER(12, 0),
 		.size = sizeof(tgllp_kernel_square_bin),
 		.kernel = tgllp_kernel_square_bin,
 	},
+	{
+		.ip_ver = IP_VER(12, 55),
+		.size = sizeof(xehp_kernel_square_bin),
+		.kernel = xehp_kernel_square_bin,
+	},
 	{}
 };
-- 
2.34.1
