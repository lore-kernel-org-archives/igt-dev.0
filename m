Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6591110E38B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 15:44:06 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 17:43:59 +0200
Message-Id: <20230327154359.91250-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/gpgpu_fill: Implement gpgpu_fillfunc
 for XEPH
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Adding xeph_gpgpu_fillfunc to have gpgpu_fill running on XEPH (DG2).
On XEPH there's no GPGPU_WALK command, it has COMPUTE_WALK what requires
pipeline creation change.

Shader used in the test was taken from previous generation with
adding SWSB dependency tracking. SWSB was added using iga64 automatic
dependency generating:

iga64 -p=12p5 -Xauto-deps shader.asm

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/gen8_media.h                             |   2 +
 lib/gpgpu_fill.c                             |  65 +++++
 lib/gpgpu_fill.h                             |   6 +
 lib/gpu_cmds.c                               | 251 +++++++++++++++++++
 lib/gpu_cmds.h                               |  35 +++
 lib/i915/shaders/gpgpu/xeph_gpgpu_kernel.asm |  12 +
 lib/intel_batchbuffer.c                      |  18 +-
 lib/xeph_media.h                             | 207 +++++++++++++++
 8 files changed, 588 insertions(+), 8 deletions(-)
 create mode 100644 lib/i915/shaders/gpgpu/xeph_gpgpu_kernel.asm
 create mode 100644 lib/xeph_media.h

diff --git a/lib/gen8_media.h b/lib/gen8_media.h
index d2a049a1ec..b5c19e503c 100644
--- a/lib/gen8_media.h
+++ b/lib/gen8_media.h
@@ -23,6 +23,8 @@
 #define GEN8_MEDIA_STATE_FLUSH			GFXPIPE(2, 0, 4)
 #define GEN8_MEDIA_OBJECT			GFXPIPE(2, 1, 0)
 
+#define GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC	GFXPIPE(3, 1, 25)
+
 struct gen8_interface_descriptor_data
 {
 	struct {
diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index 0f031a5248..5655ec9477 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -99,6 +99,19 @@ static const uint32_t gen12_gpgpu_kernel[][4] = {
 	{ 0x00040131, 0x00000004, 0x7020700c, 0x10000000 },
 };
 
+static const uint32_t xeph_gpgpu_kernel[][4] = {
+	{ 0x00020061, 0x01050000, 0x00000104, 0x00000000 },
+	{ 0x00000069, 0x02058220, 0x02000024, 0x00000004 },
+	{ 0x00000061, 0x02250220, 0x000000c4, 0x00000000 },
+	{ 0x00030061, 0x04050220, 0x00460005, 0x00000000 },
+	{ 0x00011a61, 0x04050220, 0x00220205, 0x00000000 },
+	{ 0x00000061, 0x04454220, 0x00000000, 0x0000000f },
+	{ 0x00041e61, 0x05050220, 0x00000104, 0x00000000 },
+	{ 0x80001901, 0x00010000, 0x00000000, 0x00000000 },
+	{ 0x00044031, 0x00000000, 0xc0000414, 0x02a00000 },
+	{ 0x00030031, 0x00000004, 0x3000500c, 0x00000000 },
+};
+
 /*
  * This sets up the gpgpu pipeline,
  *
@@ -280,6 +293,47 @@ __gen9_gpgpu_fillfunc(int i915,
 	intel_bb_destroy(ibb);
 }
 
+static void
+__xeph_gpgpu_fillfunc(int i915,
+		      struct intel_buf *buf,
+		      unsigned int x, unsigned int y,
+		      unsigned int width, unsigned int height,
+		      uint8_t color, const uint32_t kernel[][4],
+		      size_t kernel_size)
+{
+	struct intel_bb *ibb;
+	struct xeph_interface_descriptor_data idd;
+	(void) x;
+	(void) y;
+
+	ibb = intel_bb_create(i915, PAGE_SIZE);
+	intel_bb_add_intel_buf(ibb, buf, true);
+
+	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+
+	xeph_fill_interface_descriptor(ibb, buf,
+				       kernel, kernel_size, &idd);
+
+	intel_bb_ptr_set(ibb, 0);
+
+	/* GPGPU pipeline */
+	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		  PIPELINE_SELECT_GPGPU);
+	xeph_emit_state_base_address(ibb);
+	xeph_emit_state_compute_mode(ibb);
+	xeph_emit_state_binding_table_pool_alloc(ibb);
+	xeph_emit_cfe_state(ibb, THREADS);
+	xeph_emit_compute_walk(ibb, width, height, &idd, color);
+
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_ptr_align(ibb, 32);
+
+	intel_bb_exec(ibb, intel_bb_offset(ibb),
+		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
+
+	intel_bb_destroy(ibb);
+}
+
 void gen9_gpgpu_fillfunc(int i915,
 			 struct intel_buf *buf,
 			 unsigned x, unsigned y,
@@ -312,3 +366,14 @@ void gen12_gpgpu_fillfunc(int i915,
 			      gen12_gpgpu_kernel,
 			      sizeof(gen12_gpgpu_kernel));
 }
+
+void xeph_gpgpu_fillfunc(int i915,
+			 struct intel_buf *buf,
+			 unsigned int x, unsigned int y,
+			 unsigned int width, unsigned int height,
+			 uint8_t color)
+{
+	__xeph_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
+			      xeph_gpgpu_kernel,
+			      sizeof(xeph_gpgpu_kernel));
+}
diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
index 25abe1fa19..15ef147ce0 100644
--- a/lib/gpgpu_fill.h
+++ b/lib/gpgpu_fill.h
@@ -61,4 +61,10 @@ void gen12_gpgpu_fillfunc(int i915,
 			  unsigned width, unsigned height,
 			  uint8_t color);
 
+void
+xeph_gpgpu_fillfunc(int i915,
+		    struct intel_buf *dst,
+		    unsigned int x, unsigned int y,
+		    unsigned int width, unsigned int height,
+		    uint8_t color);
 #endif /* GPGPU_FILL_H */
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index c31b51f7b4..0abca0a007 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -262,6 +262,10 @@ gen7_fill_binding_table(struct intel_bb *ibb,
 		binding_table[0] = gen7_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
 
+	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+		binding_table[0] = xeph_fill_surface_state(ibb, buf,
+							   SURFACEFORMAT_R8_UNORM, 1);
+
 	else
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
@@ -773,3 +777,250 @@ gen7_emit_media_objects(struct intel_bb *ibb,
 		for (j = 0; j < height / 16; j++)
 			gen_emit_media_object(ibb, x + i * 16, y + j * 16);
 }
+
+/*
+ * XEPH
+ */
+void
+xeph_fill_interface_descriptor(struct intel_bb *ibb,
+			       struct intel_buf *dst,
+			       const uint32_t kernel[][4],
+			       size_t size,
+			       struct xeph_interface_descriptor_data *idd)
+{
+	uint32_t binding_table_offset, kernel_offset;
+
+	binding_table_offset = gen7_fill_binding_table(ibb, dst);
+	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
+
+	memset(idd, 0, sizeof(*idd));
+	idd->desc0.kernel_start_pointer = (kernel_offset >> 6);
+
+	idd->desc2.single_program_flow = 1;
+	idd->desc2.floating_point_mode = GEN8_FLOATING_POINT_IEEE_754;
+
+	idd->desc3.sampler_count = 0;      /* 0 samplers used */
+	idd->desc3.sampler_state_pointer = 0;
+
+	idd->desc4.binding_table_entry_count = 0;
+	idd->desc4.binding_table_pointer = (binding_table_offset >> 5);
+
+	idd->desc5.num_threads_in_tg = 1;
+}
+
+uint32_t
+xeph_fill_surface_state(struct intel_bb *ibb,
+			struct intel_buf *buf,
+			uint32_t format,
+			int is_dst)
+{
+	struct xeph_surface_state *ss;
+	uint32_t write_domain, read_domain, offset;
+	uint64_t address;
+
+	if (is_dst) {
+		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
+	} else {
+		write_domain = 0;
+		read_domain = I915_GEM_DOMAIN_SAMPLER;
+	}
+
+	intel_bb_ptr_align(ibb, 64);
+	offset = intel_bb_offset(ibb);
+	ss = intel_bb_ptr(ibb);
+	intel_bb_ptr_add(ibb, 64);
+
+	ss->ss0.surface_type = SURFACE_2D;
+	ss->ss0.surface_format = format;
+	ss->ss0.render_cache_read_write = 1;
+	ss->ss0.vertical_alignment = 1; /* align 4 */
+	ss->ss0.horizontal_alignment = 1; /* align 4 */
+
+	if (buf->tiling == I915_TILING_X)
+		ss->ss0.tiled_mode = 2;
+	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
+		ss->ss0.tiled_mode = 3;
+
+	address = intel_bb_offset_reloc(ibb, buf->handle,
+					read_domain, write_domain,
+					offset + 4 * 8, 0x0);
+
+	ss->ss8.base_addr_lo = (uint32_t) address;
+	ss->ss9.base_addr_hi = address >> 32;
+
+	ss->ss2.height = intel_buf_height(buf) - 1;
+	ss->ss2.width  = intel_buf_width(buf) - 1;
+	ss->ss3.pitch  = buf->surface[0].stride - 1;
+
+	ss->ss7.shader_channel_select_r = 4;
+	ss->ss7.shader_channel_select_g = 5;
+	ss->ss7.shader_channel_select_b = 6;
+	ss->ss7.shader_channel_select_a = 7;
+
+	return offset;
+}
+
+void
+xeph_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
+{
+	bool dfeud = CFE_CAN_DISABLE_FUSED_EU_DISPATCH(ibb->devid);
+
+	intel_bb_out(ibb, XEPH_CFE_STATE | (6 - 2));
+
+	/* scratch buffer */
+	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, 0);
+
+#define _LEGACY_MODE (1 << 6)
+	/* number of threads & urb entries */
+	intel_bb_out(ibb, (max_t(threads, threads, 64) - 1) << 16 | (dfeud ? _LEGACY_MODE : 0));
+
+	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, 0);
+}
+
+void
+xeph_emit_state_compute_mode(struct intel_bb *ibb)
+{
+	intel_bb_out(ibb, XEPH_STATE_COMPUTE_MODE);
+	intel_bb_out(ibb, 0);
+}
+
+void
+xeph_emit_state_binding_table_pool_alloc(struct intel_bb *ibb)
+{
+	intel_bb_out(ibb, GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
+	intel_bb_emit_reloc(ibb, ibb->handle,
+			    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION,
+			    0, 0, 0x0);
+	intel_bb_out(ibb, 1 << 12);
+}
+
+void
+xeph_emit_state_base_address(struct intel_bb *ibb)
+{
+	intel_bb_out(ibb, GEN8_STATE_BASE_ADDRESS | 0x14);            //dw0
+
+	/* general */
+	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw1-dw2
+	intel_bb_out(ibb, 0);
+
+	/* stateless data port */
+	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw3
+
+	/* surface */
+	intel_bb_emit_reloc(ibb, ibb->handle, I915_GEM_DOMAIN_SAMPLER, //dw4-dw5
+			    0, BASE_ADDRESS_MODIFY, 0x0);
+
+	/* dynamic */
+	intel_bb_emit_reloc(ibb, ibb->handle,                          //dw6-dw7
+			    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION,
+			    0, BASE_ADDRESS_MODIFY, 0x0);
+
+	/* indirect */
+	intel_bb_out(ibb, 0);                                       //dw8-dw9
+	intel_bb_out(ibb, 0);
+
+	/* instruction */
+	intel_bb_emit_reloc(ibb, ibb->handle,
+			    I915_GEM_DOMAIN_INSTRUCTION,            //dw10-dw11
+			    0, BASE_ADDRESS_MODIFY, 0x0);
+
+	/* general state buffer size */
+	intel_bb_out(ibb, 0xfffff000 | 1);                          //dw12
+	/* dynamic state buffer size */
+	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
+	/* indirect object buffer size */
+	intel_bb_out(ibb, 0xfffff000 | 1);                          //dw14
+	/* intruction buffer size */
+	intel_bb_out(ibb, 1 << 12 | 1);                             //dw15
+
+	/* Bindless surface state base address */
+	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                 //dw16
+	intel_bb_out(ibb, 0);                                       //dw17
+	intel_bb_out(ibb, 0xfffff000);                              //dw18
+
+	/* Bindless sampler state base address */
+	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                 //dw19
+	intel_bb_out(ibb, 0);                                       //dw20
+	intel_bb_out(ibb, 0);                                       //dw21
+}
+
+void
+xeph_emit_compute_walk(struct intel_bb *ibb,
+		       unsigned int width, unsigned int height,
+		       struct xeph_interface_descriptor_data *pidd,
+		       uint8_t color)
+{
+	uint32_t x_dim, y_dim;
+
+	/*
+	 * Simply do SIMD16 based dispatch, so every thread uses
+	 * SIMD16 channels.
+	 *
+	 * Define our own thread group size, e.g 16x1 for every group, then
+	 * will have 1 thread each group in SIMD16 dispatch. So thread
+	 * width/height/depth are all 1.
+	 *
+	 * Then thread group X = width / 16 (aligned to 16)
+	 * thread group Y = height;
+	 */
+	x_dim = (width + 15) / 16;
+	y_dim = height;
+
+	intel_bb_out(ibb, XEPH_COMPUTE_WALKER | 0x25);
+
+	intel_bb_out(ibb, 0); /* debug object */		//dw1
+	intel_bb_out(ibb, 0); /* indirect data length */	//dw2
+	intel_bb_out(ibb, 0); /* indirect data offset */	//dw3
+
+	/* SIMD size */
+	intel_bb_out(ibb, 1 << 30 | 1 << 25); /* SIMD16 | enable inline */ //dw4
+
+	/* Execution mask */
+	intel_bb_out(ibb, 0xffffffff);				//dw5
+
+	/* x/y/z max */
+	intel_bb_out(ibb, (x_dim << 20) | (y_dim << 10) | 1);	//dw6
+
+	/* x dim */
+	intel_bb_out(ibb, x_dim);				//dw7
+
+	/* y dim */
+	intel_bb_out(ibb, y_dim);				//dw8
+
+	/* z dim */
+	intel_bb_out(ibb, 1);					//dw9
+
+	/* group id x/y/z */
+	intel_bb_out(ibb, 0);					//dw10
+	intel_bb_out(ibb, 0);					//dw11
+	intel_bb_out(ibb, 0);					//dw12
+
+	/* partition id / partition size */
+	intel_bb_out(ibb, 0);					//dw13
+	intel_bb_out(ibb, 0);					//dw14
+
+	/* preempt x/y/z */
+	intel_bb_out(ibb, 0);					//dw15
+	intel_bb_out(ibb, 0);					//dw16
+	intel_bb_out(ibb, 0);					//dw17
+
+	/* Interface descriptor data */
+	for (int i = 0; i < 8; i++) {			       //dw18-25
+		intel_bb_out(ibb, ((uint32_t *) pidd)[i]);
+	}
+
+	/* Postsync data */
+	intel_bb_out(ibb, 0);					//dw26
+	intel_bb_out(ibb, 0);					//dw27
+	intel_bb_out(ibb, 0);					//dw28
+	intel_bb_out(ibb, 0);					//dw29
+	intel_bb_out(ibb, 0);					//dw30
+
+	/* Inline data */
+	intel_bb_out(ibb, (uint32_t) color);			//dw31
+	for (int i = 0; i < 7; i++) {			        //dw32-38
+		intel_bb_out(ibb, 0x0);
+	}
+}
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index 56f09b6e1e..ac9d4c07c8 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -30,6 +30,7 @@
 #include "media_fill.h"
 #include "gen7_media.h"
 #include "gen8_media.h"
+#include "xeph_media.h"
 #include "intel_reg.h"
 #include "drmtest.h"
 #include "intel_batchbuffer.h"
@@ -107,4 +108,38 @@ void
 gen7_emit_media_objects(struct intel_bb *ibb,
 			unsigned int x, unsigned int y,
 			unsigned int width, unsigned int height);
+
+void
+xeph_fill_interface_descriptor(struct intel_bb *ibb,
+			       struct intel_buf *dst,
+			       const uint32_t kernel[][4],
+			       size_t size,
+			       struct xeph_interface_descriptor_data *idd);
+
+uint32_t
+xeph_fill_surface_state(struct intel_bb *ibb,
+			struct intel_buf *buf,
+			uint32_t format,
+			int is_dst);
+
+void
+xeph_emit_state_compute_mode(struct intel_bb *ibb);
+
+void
+xeph_emit_state_binding_table_pool_alloc(struct intel_bb *ibb);
+
+void
+xeph_emit_cfe_state(struct intel_bb *ibb, uint32_t threads);
+
+#define CFE_CAN_DISABLE_FUSED_EU_DISPATCH(devid)	(IS_DG2(devid))
+
+void
+xeph_emit_state_base_address(struct intel_bb *ibb);
+
+void
+xeph_emit_compute_walk(struct intel_bb *ibb,
+		       unsigned int width, unsigned int height,
+		       struct xeph_interface_descriptor_data *pidd,
+		       uint8_t color);
+
 #endif /* GPU_CMDS_H */
diff --git a/lib/i915/shaders/gpgpu/xeph_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/xeph_gpgpu_kernel.asm
new file mode 100644
index 0000000000..7adfbd0f04
--- /dev/null
+++ b/lib/i915/shaders/gpgpu/xeph_gpgpu_kernel.asm
@@ -0,0 +1,12 @@
+L0:
+         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub
+         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud
+         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
+         mov (8|M0)               r4.0<1>:ud    r0.0<8;8,1>:ud
+         mov (2|M0)               r4.0<1>:ud    r2.0<2;2,1>:ud                   {I@2}
+         mov (1|M0)               r4.2<1>:ud    0xF:ud
+         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                   {I@6}
+(W)      sync.nop                             null                             {I@1}
+         send.dc1 (16|M0)         null     r4      null    0x0         0x40A8000  {$0} //    wr:2h+0, rd:0, Media Block Write msc:0, to #0
+         send.gtwy (8|M0)         null     r80     null    0x0         0x02000000 {EOT}
+L176:
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index da4c238cae..6850f3a864 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -747,16 +747,18 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (IS_GEN7(devid))
-		fill = gen7_gpgpu_fillfunc;
-	else if (IS_GEN8(devid))
-		fill = gen8_gpgpu_fillfunc;
-	else if (IS_GEN9(devid) || IS_GEN10(devid))
-		fill = gen9_gpgpu_fillfunc;
-	else if (IS_GEN11(devid))
-		fill = gen11_gpgpu_fillfunc;
+	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+		fill = xeph_gpgpu_fillfunc;
 	else if (IS_GEN12(devid))
 		fill = gen12_gpgpu_fillfunc;
+	else if (IS_GEN11(devid))
+		fill = gen11_gpgpu_fillfunc;
+	else if (IS_GEN9(devid) || IS_GEN10(devid))
+		fill = gen9_gpgpu_fillfunc;
+	else if (IS_GEN8(devid))
+		fill = gen8_gpgpu_fillfunc;
+	else if (IS_GEN7(devid))
+		fill = gen7_gpgpu_fillfunc;
 
 	return fill;
 }
diff --git a/lib/xeph_media.h b/lib/xeph_media.h
new file mode 100644
index 0000000000..0a93e649f0
--- /dev/null
+++ b/lib/xeph_media.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef XEPH_MEDIA_H
+#define XEPH_MEDIA_H
+
+#include <stdint.h>
+#include "surfaceformat.h"
+#include "gen7_media.h"
+
+#define GFXPIPE_XEPH(Pipeline, Opcode, Subopcode) ((3 << 29) |		\
+						  ((Pipeline) << 27) |	\
+						  ((Opcode) << 24) |	\
+						  ((Subopcode) << 18))
+
+#define XEPH_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
+#define XEPH_CFE_STATE			GFXPIPE_XEPH(2, 2, 0)
+#define XEPH_COMPUTE_WALKER		GFXPIPE_XEPH(2, 2, 2)
+
+#define BITRANGE(start, end) (end - start + 1)
+
+struct xeph_interface_descriptor_data {
+	struct {
+		uint32_t pad0: BITRANGE(0, 5);
+		uint32_t kernel_start_pointer: BITRANGE(6, 31);
+	} desc0;
+
+	struct {
+		uint32_t kernel_start_pointer_high: BITRANGE(0, 15);
+		uint32_t pad0: BITRANGE(16, 31);
+	} desc1;
+
+	struct {
+		uint32_t pad0: BITRANGE(0, 6);
+		uint32_t software_exception_enable: BITRANGE(7, 7);
+		uint32_t pad1: BITRANGE(8, 10);
+		uint32_t maskstack_exception_enable: BITRANGE(11, 11);
+		uint32_t pad2: BITRANGE(12, 12);
+		uint32_t illegal_opcode_exception_enable: BITRANGE(13, 13);
+		uint32_t pad3: BITRANGE(14, 15);
+		uint32_t floating_point_mode: BITRANGE(16, 16);
+		uint32_t pad4: BITRANGE(17, 17);
+		uint32_t single_program_flow: BITRANGE(18, 18);
+		uint32_t denorm_mode: BITRANGE(19, 19);
+		uint32_t thread_preemption_disable: BITRANGE(20, 20);
+		uint32_t pad5: BITRANGE(21, 31);
+	} desc2;
+
+	struct {
+		uint32_t pad0: BITRANGE(0, 1);
+		uint32_t sampler_count: BITRANGE(2, 4);
+		uint32_t sampler_state_pointer: BITRANGE(5, 31);
+	} desc3;
+
+	struct {
+		uint32_t binding_table_entry_count: BITRANGE(0, 4);
+		uint32_t binding_table_pointer: BITRANGE(5, 20);
+		uint32_t pad0: BITRANGE(21, 31);
+	} desc4;
+
+	struct {
+		uint32_t num_threads_in_tg: BITRANGE(0, 9);
+		uint32_t pad0: BITRANGE(10, 15);
+		uint32_t shared_local_memory_size: BITRANGE(16, 20);
+		uint32_t barrier_enable: BITRANGE(21, 21);
+		uint32_t rounding_mode: BITRANGE(22, 23);
+		uint32_t pad1: BITRANGE(24, 26);
+		uint32_t thread_group_dispatch_size: BITRANGE(27, 27);
+		uint32_t pad2: BITRANGE(28, 31);
+	} desc5;
+
+	struct {
+		uint32_t pad0;
+	} desc6;
+
+	struct {
+		uint32_t pad0;
+	} desc7;
+};
+
+struct xeph_surface_state {
+	struct {
+		uint32_t cube_pos_z: BITRANGE(0, 0);
+		uint32_t cube_neg_z: BITRANGE(1, 1);
+		uint32_t cube_pos_y: BITRANGE(2, 2);
+		uint32_t cube_neg_y: BITRANGE(3, 3);
+		uint32_t cube_pos_x: BITRANGE(4, 4);
+		uint32_t cube_neg_x: BITRANGE(5, 5);
+		uint32_t media_boundary_pixel_mode: BITRANGE(6, 7);
+		uint32_t render_cache_read_write: BITRANGE(8, 8);
+		uint32_t sampler_l2_bypass_disable: BITRANGE(9, 9);
+		uint32_t vert_line_stride_ofs: BITRANGE(10, 10);
+		uint32_t vert_line_stride: BITRANGE(11, 11);
+		uint32_t tiled_mode: BITRANGE(12, 13);
+		uint32_t horizontal_alignment: BITRANGE(14, 15);
+		uint32_t vertical_alignment: BITRANGE(16, 17);
+		uint32_t surface_format: BITRANGE(18, 26);     /**< BRW_SURFACEFORMAT_x */
+		uint32_t astc_enable: BITRANGE(27, 27);
+		uint32_t is_array: BITRANGE(28, 28);
+		uint32_t surface_type: BITRANGE(29, 31);       /**< BRW_SURFACE_1D/2D/3D/CUBE */
+	} ss0;
+
+	struct {
+		uint32_t qpitch: BITRANGE(0, 14);
+		uint32_t sample_tap_discard_disable: BITRANGE(15, 15);
+		uint32_t pad0: BITRANGE(16, 16);
+		uint32_t double_fetch_disable: BITRANGE(17, 17);
+		uint32_t corner_texel_mode: BITRANGE(18, 18);
+		uint32_t base_mip_level: BITRANGE(19, 23);
+		uint32_t memory_object_control: BITRANGE(24, 30);
+		uint32_t unorm_path_in_color_pipe: BITRANGE(31, 31);
+	} ss1;
+
+	struct {
+		uint32_t width: BITRANGE(0, 13);
+		uint32_t pad0: BITRANGE(14, 15);
+		uint32_t height: BITRANGE(16, 29);
+		uint32_t pad1: BITRANGE(30, 30);
+		uint32_t depth_stencil_resource: BITRANGE(31, 31);
+	} ss2;
+
+	struct {
+		uint32_t pitch: BITRANGE(0, 17);
+		uint32_t null_probing_enable: BITRANGE(18, 18);
+		uint32_t standard_tiling_mode_ext: BITRANGE(19, 19);
+		uint32_t pad0: BITRANGE(20, 20);
+		uint32_t depth: BITRANGE(21, 31);
+	} ss3;
+
+	struct {
+		uint32_t multisample_position_palette_index: BITRANGE(0, 2);
+		uint32_t num_multisamples: BITRANGE(3, 5);
+		uint32_t multisampled_surface_storage_format: BITRANGE(6, 6);
+		uint32_t render_target_view_extent: BITRANGE(7, 17);
+		uint32_t min_array_element: BITRANGE(18, 28);
+		uint32_t rotation: BITRANGE(29, 30);
+		uint32_t decompress_in_l3: BITRANGE(31, 31);
+	} ss4;
+
+	struct {
+		uint32_t mip_count: BITRANGE(0, 3);
+		uint32_t surface_min_lod: BITRANGE(4, 7);
+		uint32_t mip_tail_start_lod: BITRANGE(8, 11);
+		uint32_t yuv_bpt: BITRANGE(12, 13);
+		uint32_t coherency_type: BITRANGE(14, 15);
+		uint32_t pad0: BITRANGE(16, 17);
+		uint32_t tiled_resource_mode: BITRANGE(18, 19);
+		uint32_t ewa_disable_for_cube: BITRANGE(20, 20);
+		uint32_t y_offset: BITRANGE(21, 23);
+		uint32_t pad1: BITRANGE(24, 24);
+		uint32_t x_offset: BITRANGE(25, 31);
+	} ss5;
+
+	struct {
+		uint32_t pad; /* Multisample Control Surface stuff */
+	} ss6;
+
+	struct {
+		uint32_t resource_min_lod: BITRANGE(0, 11);
+		uint32_t pad0: BITRANGE(12, 13);
+		uint32_t disable_support_for_multigpu_atomics: BITRANGE(14, 14);
+		uint32_t disable_support_for_multigpu_partwrite: BITRANGE(15, 15);
+		uint32_t shader_channel_select_a: BITRANGE(16, 18);
+		uint32_t shader_channel_select_b: BITRANGE(19, 21);
+		uint32_t shader_channel_select_g: BITRANGE(22, 24);
+		uint32_t shader_channel_select_r: BITRANGE(25, 27);
+		uint32_t pad1: BITRANGE(28, 29);
+		uint32_t memory_compression_enable: BITRANGE(30, 30);
+		uint32_t memory_compression_mode: BITRANGE(31, 31);
+	} ss7;
+
+	struct {
+		uint32_t base_addr_lo;
+	} ss8;
+
+	struct {
+		uint32_t base_addr_hi;
+	} ss9;
+
+	struct {
+		uint32_t pad0: BITRANGE(0, 11);
+		uint32_t aux_base_addr_lo: BITRANGE(12, 31);
+	} ss10;
+
+	struct {
+		uint32_t aux_base_addr_hi;
+	} ss11;
+
+	struct {
+		uint32_t compression_format: BITRANGE(0, 4);
+		uint32_t clear_address_lo: BITRANGE(5, 31);
+	} ss12;
+
+	struct {
+		uint32_t clear_address_hi: BITRANGE(0, 15);
+		uint32_t pad0: BITRANGE(16, 31);
+	} ss13;
+
+	struct {
+		uint32_t reserved;
+	} ss14;
+
+	struct {
+		uint32_t reserved;
+	} ss15;
+};
+
+#endif /* XEPH_MEDIA_H */
-- 
2.34.1
