Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BB16E2C0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:56:49 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:29 -0800
Message-Id: <20210302225334.361966-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 06/11] Enable protected session and protected
 buffers in rendercopy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

1. In _gen9_render_op, check if the incoming batchbuffer
   was marked with pxp enabled. If so, insert MI_SET_APPID
   along with PIPE_CONTROL instructions at the start and
   end of the rendering operation in the command buffer.

2. The two PIPE_CONTROLs will enable protected memory
   at the start of the batch and disabling protected
   memory at the end of it. These PIPE_CONTROLs require a
   Post-Sync operation with a write to memory.

3. In order to satisfy #2, _gen9_render_op shall
   allocate and pin a bo that is referenced by the
   PIPE_CONTROL PostSync write to memory.

4. _gen9_render_op shall check the incoming surface
   buffers for "is_protected" flag and if its set, it
   will mark the SURFACE_STATE's MOCS field accordingly.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/rendercopy_gen9.c | 123 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 7 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index eecf73d3..705f26a2 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -19,7 +19,8 @@
 #include "intel_bufops.h"
 #include "intel_batchbuffer.h"
 #include "intel_io.h"
-#include "rendercopy.h"
+#include "igt.h"
+#include "i915/gem.h"
 #include "gen9_render.h"
 #include "intel_reg.h"
 #include "igt_aux.h"
@@ -152,6 +153,8 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 		ss->ss0.tiled_mode = 3;
 
 	ss->ss1.memory_object_control = I915_MOCS_PTE << 1;
+	if (buf->is_protected)
+		ss->ss1.memory_object_control |= 1;
 
 	if (buf->tiling == I915_TILING_Yf)
 		ss->ss5.trmode = 1;
@@ -873,6 +876,89 @@ static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
 	intel_bb_out(ibb, 0);	/* index buffer offset, ignored */
 }
 
+#define GFX_OP_PIPE_CONTROL    ((3 << 29) | (3 << 27) | (2 << 24))
+#define PIPE_CONTROL_CS_STALL	            (1 << 20)
+#define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
+#define PIPE_CONTROL_FLUSH_ENABLE           (1 << 7)
+#define PIPE_CONTROL_DATA_CACHE_INVALIDATE  (1 << 5)
+#define PIPE_CONTROL_PROTECTEDPATH_DISABLE  (1 << 27)
+#define PIPE_CONTROL_PROTECTEDPATH_ENABLE   (1 << 22)
+#define PIPE_CONTROL_POST_SYNC_OP           (1 << 14)
+#define PIPE_CONTROL_POST_SYNC_OP_STORE_DW_IDX (1 << 21)
+#define PS_OP_TAG_BEFORE                    0x1234fed0
+#define PS_OP_TAG_AFTER                     0x5678cbaf
+static void gen12_emit_pxp_state(struct intel_bb *ibb, bool enable,
+		 struct intel_buf *fenceb)
+{
+	uint32_t pipe_ctl_flags;
+	uint32_t set_app_id, ps_op_id;
+
+	if (ibb->pxp.enabled) {
+		if (enable) {
+			pipe_ctl_flags = PIPE_CONTROL_FLUSH_ENABLE;
+			intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
+			intel_bb_out(ibb, pipe_ctl_flags);
+
+			set_app_id =  MI_SET_APPID |
+				APPTYPE(ibb->pxp.apptype) |
+				APPID(ibb->pxp.appid);
+			intel_bb_out(ibb, set_app_id);
+
+			pipe_ctl_flags = PIPE_CONTROL_PROTECTEDPATH_ENABLE;
+			ps_op_id = PS_OP_TAG_BEFORE;
+		} else {
+			pipe_ctl_flags = PIPE_CONTROL_PROTECTEDPATH_DISABLE;
+			ps_op_id = PS_OP_TAG_AFTER;
+		}
+		pipe_ctl_flags |= (PIPE_CONTROL_CS_STALL |
+			PIPE_CONTROL_RENDER_TARGET_FLUSH |
+			PIPE_CONTROL_DATA_CACHE_INVALIDATE |
+			PIPE_CONTROL_POST_SYNC_OP);
+		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
+		intel_bb_out(ibb, pipe_ctl_flags);
+		intel_bb_emit_reloc(ibb, fenceb->handle,
+			0, I915_GEM_DOMAIN_COMMAND,
+			(enable?0:8), fenceb->addr.offset);
+		intel_bb_out(ibb, ps_op_id);
+		intel_bb_out(ibb, ps_op_id);
+	}
+}
+
+
+static void assert_pxp_ps_op_bo_completed(int i915, uint32_t bo,
+	uint32_t maptype)
+{
+	uint32_t *ptr;
+	uint32_t success_mask = 0x0;
+
+	switch (maptype) {
+	case I915_GEM_DOMAIN_CPU:
+		ptr = gem_mmap__cpu(i915, bo, 0, 4096, PROT_READ);
+		gem_set_domain(i915, bo, I915_GEM_DOMAIN_CPU,
+			I915_GEM_DOMAIN_CPU);
+		break;
+	case I915_GEM_DOMAIN_GTT:
+		ptr = gem_mmap__gtt(i915, bo, 4096, PROT_READ);
+		gem_set_domain(i915, bo, I915_GEM_DOMAIN_GTT,
+			I915_GEM_DOMAIN_GTT);
+		break;
+	default:
+	case I915_GEM_DOMAIN_WC:
+		ptr = gem_mmap__device_coherent(i915, bo, 0, 4096, PROT_READ);
+		gem_set_domain(i915, bo, I915_GEM_DOMAIN_WC,
+			I915_GEM_DOMAIN_WC);
+		break;
+	}
+	igt_assert(ptr);
+	if (ptr[0] == PS_OP_TAG_BEFORE && ptr[1] == PS_OP_TAG_BEFORE)
+		success_mask |= 0x1;
+	if (ptr[2] == PS_OP_TAG_AFTER && ptr[3] == PS_OP_TAG_AFTER)
+		success_mask |= 0x2;
+
+	igt_assert_eq(success_mask, 0x3);
+	igt_assert(gem_munmap(ptr, 4096) == 0);
+}
+
 /* The general rule is if it's named gen6 it is directly copied from
  * gen6_render_copyfunc.
  *
@@ -922,6 +1008,16 @@ void _gen9_render_op(struct intel_bb *ibb,
 	uint32_t vertex_buffer;
 	uint32_t aux_pgtable_state;
 	bool fast_clear = !src;
+	struct intel_buf fenceb;
+	struct buf_ops *fencebops;
+
+	if (ibb->pxp.enabled) {
+		fencebops = buf_ops_create(ibb->i915);
+		igt_assert(fencebops);
+		intel_buf_init(fencebops, &fenceb,
+			1024, 4, 32, 0, I915_TILING_NONE, 0);
+		intel_bb_add_intel_buf(ibb, &fenceb, true);
+	}
 
 	if (!fast_clear)
 		igt_assert(src->bpp == dst->bpp);
@@ -952,6 +1048,9 @@ void _gen9_render_op(struct intel_bb *ibb,
 	/* TODO: there is other state which isn't setup */
 	intel_bb_ptr_set(ibb, 0);
 
+	if (ibb->pxp.enabled)
+		gen12_emit_pxp_state(ibb, true, &fenceb);
+
 	/* Start emitting the commands. The order roughly follows the mesa blorp
 	 * order */
 	intel_bb_out(ibb, G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
@@ -963,13 +1062,12 @@ void _gen9_render_op(struct intel_bb *ibb,
 		for (int i = 0; i < 4; i++) {
 			intel_bb_out(ibb, MI_STORE_DWORD_IMM);
 			intel_bb_emit_reloc(ibb, dst->handle,
-					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
-                                            dst->cc.offset + i*sizeof(float),
-					    dst->addr.offset);
+				I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
+				dst->cc.offset + i*sizeof(float),
+				dst->addr.offset);
 			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
-               }
-       }
-
+		}
+	}
 
 	gen8_emit_sip(ibb);
 
@@ -1023,10 +1121,21 @@ void _gen9_render_op(struct intel_bb *ibb,
 	gen8_emit_vf_topology(ibb);
 	gen8_emit_primitive(ibb, vertex_buffer);
 
+	if (ibb->pxp.enabled)
+		gen12_emit_pxp_state(ibb, false, &fenceb);
+
 	intel_bb_emit_bbe(ibb);
 	intel_bb_exec(ibb, intel_bb_offset(ibb),
 		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
 	dump_batch(ibb);
+
+	if (ibb->pxp.enabled) {
+		gem_sync(ibb->i915, fenceb.handle);
+		assert_pxp_ps_op_bo_completed(ibb->i915,
+			fenceb.handle, I915_GEM_DOMAIN_WC);
+		buf_ops_destroy(fencebops);
+	}
+
 	intel_bb_reset(ibb, false);
 }
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
