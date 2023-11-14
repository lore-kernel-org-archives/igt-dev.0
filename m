Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA82510E1F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 10:42:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 11:41:51 +0100
Message-Id: <20231114104151.67085-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231114104151.67085-1-zbigniew.kempczynski@intel.com>
References: <20231114104151.67085-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] lib/intel_compute: Add dg1 compute
 implementation for i915
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

Extend current testing for i915 and add dedicated to dg1 compute
pipeline. Due to ppgtt limitation to 47 bits on dg1 alter offsets
to use lower addresses.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c                | 123 ++++++++++++++++++++++++++---
 lib/intel_compute_square_kernels.c |  42 ++++++++++
 2 files changed, 153 insertions(+), 12 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 772c22fa37..248046895b 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -33,9 +33,9 @@
 #define ADDR_OUTPUT			0x300000UL
 #define ADDR_SURFACE_STATE_BASE		0x400000UL
 #define ADDR_DYNAMIC_STATE_BASE		0x500000UL
-#define ADDR_INDIRECT_OBJECT_BASE	0x800100000000
-#define OFFSET_INDIRECT_DATA_START	0xFFFDF000
-#define OFFSET_KERNEL			0xFFFEF000
+#define ADDR_INDIRECT_OBJECT_BASE	0x100000000
+#define OFFSET_INDIRECT_DATA_START	0xFFFD0000
+#define OFFSET_KERNEL			0xFFFE0000
 
 #define XEHP_ADDR_GENERAL_STATE_BASE		0x80000000UL
 #define XEHP_ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
@@ -494,13 +494,98 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 }
 
 /**
- * tgl_compute_exec - run a pipeline compatible with Tiger Lake
+ * dg1_compute_exec_compute:
+ * @addr_bo_buffer_batch: pointer to batch buffer
+ * @addr_surface_state_base: gpu offset of surface state data
+ * @addr_dynamic_state_base: gpu offset of dynamic state data
+ * @addr_indirect_object_base: gpu offset of indirect object data
+ * @offset_indirect_data_start: gpu offset of indirect data start
+ *
+ * Prepares compute pipeline.
+ */
+static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
+				     uint64_t addr_surface_state_base,
+				     uint64_t addr_dynamic_state_base,
+				     uint64_t addr_indirect_object_base,
+				     uint64_t offset_indirect_data_start)
+{
+	int b = 0;
+
+	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
+	addr_bo_buffer_batch[b++] = 0x00180010;
+
+	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE | (9 - 2);
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x02FF0100;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x04000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
+	addr_bo_buffer_batch[b++] = 0x00002580;
+	addr_bo_buffer_batch[b++] = 0x00060002;
+
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x000A0000;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
+	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x1;
+	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32) | 0xffff0000;
+	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0xA1;
+	addr_bo_buffer_batch[b++] = addr_indirect_object_base >> 32;
+	addr_bo_buffer_batch[b++] = 0xFFFFF001;
+	addr_bo_buffer_batch[b++] = 0x00010001;
+	addr_bo_buffer_batch[b++] = 0xFFFFF001;
+	addr_bo_buffer_batch[b++] = 0xFFFFF001;
+	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0xA1;
+	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
+	addr_bo_buffer_batch[b++] = 0x003BF000;
+	addr_bo_buffer_batch[b++] = 0x000000A1;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MEDIA_INTERFACE_DESCRIPTOR_LOAD | (4 - 2);
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000020;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = GPGPU_WALKER | 13;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000c80;
+	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
+	addr_bo_buffer_batch[b++] = 0x8000000f;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000002;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+	addr_bo_buffer_batch[b++] = 0xffffffff;
+
+	addr_bo_buffer_batch[b++] = MEDIA_STATE_FLUSH;
+	addr_bo_buffer_batch[b++] = 0x00000000;
+
+	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * xe_compute_exec - run a pipeline compatible with Tiger Lake and DG1
  *
  * @fd: file descriptor of the opened DRM device
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
  */
-static void tgl_compute_exec(int fd, const unsigned char *kernel,
+static void xe_compute_exec(int fd, const unsigned char *kernel,
 			     unsigned int size)
 {
 #define TGL_BO_DICT_ENTRIES 7
@@ -528,6 +613,7 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
 	};
 	struct bo_execenv execenv;
 	float *dinput;
+	uint16_t devid = intel_get_drm_devid(fd);
 
 	bo_execenv_create(fd, &execenv);
 
@@ -539,18 +625,26 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
 	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, 0x40);
+	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
+			     IS_DG1(devid) ? 0x200 : 0x40);
 
 	dinput = (float *)bo_dict[4].data;
 	srand(time(NULL));
 	for (int i = 0; i < SIZE_DATA; i++)
 		((float *)dinput)[i] = rand() / (float)RAND_MAX;
 
-	tgllp_compute_exec_compute(bo_dict[6].data,
-				   ADDR_SURFACE_STATE_BASE,
-				   ADDR_DYNAMIC_STATE_BASE,
-				   ADDR_INDIRECT_OBJECT_BASE,
-				   OFFSET_INDIRECT_DATA_START);
+	if (IS_DG1(devid))
+		dg1_compute_exec_compute(bo_dict[6].data,
+					 ADDR_SURFACE_STATE_BASE,
+					 ADDR_DYNAMIC_STATE_BASE,
+					 ADDR_INDIRECT_OBJECT_BASE,
+					 OFFSET_INDIRECT_DATA_START);
+	else
+		tgllp_compute_exec_compute(bo_dict[6].data,
+					   ADDR_SURFACE_STATE_BASE,
+					   ADDR_DYNAMIC_STATE_BASE,
+					   ADDR_INDIRECT_OBJECT_BASE,
+					   OFFSET_INDIRECT_DATA_START);
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
@@ -1063,9 +1157,14 @@ static const struct {
 } intel_compute_batches[] = {
 	{
 		.ip_ver = IP_VER(12, 0),
-		.compute_exec = tgl_compute_exec,
+		.compute_exec = xe_compute_exec,
 		.compat = COMPAT_DRIVER_I915 | COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(12, 10),
+		.compute_exec = xe_compute_exec,
+		.compat = COMPAT_DRIVER_I915,
+	},
 	{
 		.ip_ver = IP_VER(12, 55),
 		.compute_exec = xehp_compute_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index d094c23ccb..3d5b1ad475 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -61,6 +61,43 @@ static const unsigned char tgllp_kernel_square_bin[] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
+static const unsigned char dg1_kernel_square_bin[] = {
+	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
+	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
+	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
+	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
+	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
+	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
+	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
+	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
+	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
+	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
+	0x50, 0x0d, 0x04, 0x01, 0x05, 0x01, 0x05, 0x1d, 0x05, 0x01, 0x05, 0x01,
+	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
+	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
+	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
+	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
+	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
+	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
+	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
+	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
+	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
+	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x14, 0x12, 0x02, 0xcc, 0x14, 0x1a, 0x96, 0x00,
+	0x25, 0x00, 0x05, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00,
+	0x31, 0x44, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x1c, 0x0c, 0x03, 0x00, 0xa0,
+	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
+	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
+	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00
+};
+
 static const unsigned char xehp_kernel_square_bin[] = {
 	0x61, 0x31, 0x03, 0x80, 0x20, 0x42, 0x05, 0x7f, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x80, 0x20, 0x82, 0x45, 0x7f,
@@ -152,6 +189,11 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.size = sizeof(tgllp_kernel_square_bin),
 		.kernel = tgllp_kernel_square_bin,
 	},
+	{
+		.ip_ver = IP_VER(12, 10),
+		.size = sizeof(dg1_kernel_square_bin),
+		.kernel = dg1_kernel_square_bin,
+	},
 	{
 		.ip_ver = IP_VER(12, 55),
 		.size = sizeof(xehp_kernel_square_bin),
-- 
2.34.1
