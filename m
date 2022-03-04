Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039C310F8E6
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Mar 2022 09:02:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Mar 2022 10:02:01 +0100
Message-Id: <20220304090202.32164-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220304090202.32164-1-zbigniew.kempczynski@intel.com>
References: <20220304090202.32164-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/rendercopy/dg2: Add rendercopy
 support for dg2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

The present gen12 rendercopy is not compatible with gen21p71(dg2).

Add rendercopy support for dg2 and introduce gen12p71_render_copyfunc
function to use it.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gen4_render.h                            |  2 +
 lib/i915/shaders/ps/gen12p71_render_copy.asm | 16 +++++++
 lib/intel_batchbuffer.c                      |  2 +
 lib/rendercopy.h                             |  4 ++
 lib/rendercopy_gen9.c                        | 47 ++++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 lib/i915/shaders/ps/gen12p71_render_copy.asm

diff --git a/lib/gen4_render.h b/lib/gen4_render.h
index ab6b9c9f8e..7d8bc659a7 100644
--- a/lib/gen4_render.h
+++ b/lib/gen4_render.h
@@ -42,6 +42,8 @@
 
 #define GEN4_3DSTATE_BINDING_TABLE_POINTERS	GEN4_3D(3, 0, 1)
 
+#define GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC  GEN4_3D(3, 1, 0x19)
+
 #define GEN4_3DSTATE_VERTEX_BUFFERS		GEN4_3D(3, 0, 8)
 # define GEN4_VB0_BUFFER_INDEX_SHIFT			27
 # define GEN4_VB0_VERTEXDATA				(0 << 26)
diff --git a/lib/i915/shaders/ps/gen12p71_render_copy.asm b/lib/i915/shaders/ps/gen12p71_render_copy.asm
new file mode 100644
index 0000000000..e407a425fb
--- /dev/null
+++ b/lib/i915/shaders/ps/gen12p71_render_copy.asm
@@ -0,0 +1,16 @@
+L0:
+(W)      mad (8|M0)               acc0.0<1>:f  r6.3<0;0>:f       r2.0<8;1>:f       r6.0<0>:f
+(W)      mad (8|M0)               r113.0<1>:f   acc0.0<8;1>:f    r3.0<8;1>:f       r6.1<0>:f
+(W)      mad (8|M0)               acc0.0<1>:f  r6.3<0;0>:f       r4.0<8;1>:f       r6.0<0>:f
+(W)      mad (8|M0)               r114.0<1>:f   acc0.0<8;1>:f    r5.0<8;1>:f       r6.1<0>:f
+(W)      mad (8|M0)               acc0.0<1>:f  r6.7<0;0>:f       r2.0<8;1>:f       r6.4<0>:f
+(W)      mad (8|M0)               r115.0<1>:f   acc0.0<8;1>:f    r3.0<8;1>:f       r6.5<0>:f
+(W)      mad (8|M0)               acc0.0<1>:f  r6.7<0;0>:f       r4.0<8;1>:f       r6.4<0>:f
+(W)      mad (8|M0)               r116.0<1>:f   acc0.0<8;1>:f    r5.0<8;1>:f       r6.5<0>:f
+(W)      send.smpl (16|M0)        r12      r113    null    0x0         0x8840001   //    wr:4+0, rd:8, fc: 0x40001
+         mov (16|M0)              r113.0<1>:f   r12.0<8;8,1>:f                   {$0.dst}
+         mov (16|M0)              r115.0<1>:f   r14.0<8;8,1>:f
+         mov (16|M0)              r117.0<1>:f   r16.0<8;8,1>:f
+         mov (16|M0)              r119.0<1>:f   r18.0<8;8,1>:f
+(W)      send.rc (16|M0)          null     r113    null    0x0         0x10031000 {EOT, @1} //    wr:8+0, rd:0, Render Target Write msc:16, to #0
+L224:
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 460f5f2bb3..24b1678dda 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1142,6 +1142,8 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
 		copy = gen9_render_copyfunc;
 	else if (IS_GEN11(devid))
 		copy = gen11_render_copyfunc;
+	else if (IS_DG2(devid))
+		copy = gen12p71_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
 
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index d2d9c586f8..3e984a1415 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -27,6 +27,10 @@ void gen12_render_clearfunc(struct intel_bb *ibb,
 			    struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
 			    unsigned int width, unsigned int height,
 			    const float clear_color[4]);
+void gen12p71_render_copyfunc(struct intel_bb *ibb,
+			      struct intel_buf *src, uint32_t src_x, uint32_t src_y,
+			      uint32_t width, uint32_t height,
+			      struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
 void gen12_render_copyfunc(struct intel_bb *ibb,
 			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			   uint32_t width, uint32_t height,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index f021f4cb35..6c45efb4ac 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -116,6 +116,24 @@ static const uint32_t gen12_render_copy[][4] = {
 	{ 0x80040131, 0x00000004, 0x50007144, 0x00c40000 },
 };
 
+/* see lib/i915/shaders/ps/gen12p71_render_copy.asm */
+static const uint32_t gen12p71_render_copy[][4] = {
+	{ 0x8003005b, 0x200002a0, 0x0a0a0664, 0x06040205 },
+	{ 0x8003005b, 0x71040aa8, 0x0a0a2001, 0x06240305 },
+	{ 0x8003005b, 0x200002a0, 0x0a0a0664, 0x06040405 },
+	{ 0x8003005b, 0x72040aa8, 0x0a0a2001, 0x06240505 },
+	{ 0x8003005b, 0x200002a0, 0x0a0a06e4, 0x06840205 },
+	{ 0x8003005b, 0x73040aa8, 0x0a0a2001, 0x06a40305 },
+	{ 0x8003005b, 0x200002a0, 0x0a0a06e4, 0x06840405 },
+	{ 0x8003005b, 0x74040aa8, 0x0a0a2001, 0x06a40505 },
+	{ 0x80031101, 0x00010000, 0x00000000, 0x00000000 },
+	{ 0x80044031, 0x0c440000, 0x20027124, 0x01000000 },
+	{ 0x00042061, 0x71050aa0, 0x00460c05, 0x00000000 },
+	{ 0x00040061, 0x73050aa0, 0x00460e05, 0x00000000 },
+	{ 0x00040061, 0x75050aa0, 0x00461005, 0x00000000 },
+	{ 0x00040061, 0x77050aa0, 0x00461205, 0x00000000 },
+	{ 0x80041131, 0x00000004, 0x50007144, 0x00c40000 },
+};
 
 /*
  * Gen >= 12 onwards don't have a setting for PTE,
@@ -1062,6 +1080,14 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen9_emit_state_base_address(ibb);
 
+	if (IS_DG2(ibb->devid) || intel_gen(ibb->devid) > 12) {
+		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
+		intel_bb_emit_reloc(ibb, ibb->handle,
+				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
+				    0, ibb->batch_offset);
+		intel_bb_out(ibb, 1 << 12);
+	}
+
 	intel_bb_out(ibb, GEN7_3DSTATE_VIEWPORT_STATE_POINTERS_CC);
 	intel_bb_out(ibb, viewport.cc_state);
 	intel_bb_out(ibb, GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
@@ -1164,6 +1190,27 @@ void gen12_render_copyfunc(struct intel_bb *ibb,
 	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
 }
 
+void gen12p71_render_copyfunc(struct intel_bb *ibb,
+			      struct intel_buf *src,
+			      unsigned int src_x, unsigned int src_y,
+			      unsigned int width, unsigned int height,
+			      struct intel_buf *dst,
+			      unsigned int dst_x, unsigned int dst_y)
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, ibb, src, dst);
+
+	_gen9_render_op(ibb, src, src_x, src_y,
+			width, height, dst, dst_x, dst_y,
+			pgtable_info.pgtable_buf,
+			NULL,
+			gen12p71_render_copy,
+			sizeof(gen12p71_render_copy));
+
+	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+}
+
 void gen12_render_clearfunc(struct intel_bb *ibb,
 			    struct intel_buf *dst,
 			    unsigned int dst_x, unsigned int dst_y,
-- 
2.32.0
