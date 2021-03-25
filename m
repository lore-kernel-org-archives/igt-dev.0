Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF7F6EB23
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:54 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:40 -0700
Message-Id: <20210325054549.465386-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 06/15] Enable protected session cmd in
 gen12_render_copyfunc
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
   is marked with pxp enabled. If so, insert MI_SET_APPID
   along with PIPE_CONTROL instructions at the start and
   end of the rendering operation in the command buffer.

2. The two PIPE_CONTROLs will enable protected memory
   at the start of the batch and disabling protected
   memory at the end of it. These PIPE_CONTROLs require a
   Post-Sync operation with a write to memory for hardware
   to accept.

3. In order to satisfy #2, _gen9_render_op uses unused
   regions of the ibb buffer for the PIPE_CONTROL PostSync
   write to memory (no different from how other 3d states
   are being referenced).

4. _gen9_render_op shall check the incoming surface
   buffers for "is_protected" flag and if its set, it
   will mark the SURFACE_STATE's MOCS field accordingly.

NOTE: _gen9_render_op needs to program the HW to enable
the PXP session as part of the rendering batch buffer
because the HW requires that enabling/disabling protected
memory access must be programmed in pairs within the same
"dispatch of rendering commands" to HW.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/rendercopy_gen9.c | 73 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index eecf73d3..7255349f 100644
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
+	if (intel_buf_pxp(buf))
+		ss->ss1.memory_object_control |= 1;
 
 	if (buf->tiling == I915_TILING_Yf)
 		ss->ss5.trmode = 1;
@@ -873,6 +876,54 @@ static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
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
+#define PS_OP_TAG_START                     0x1234fed0
+#define PS_OP_TAG_END                       0x5678cbaf
+static void gen12_emit_pxp_state(struct intel_bb *ibb, bool enable,
+		 uint32_t pxp_write_op_offset)
+{
+	uint32_t pipe_ctl_flags;
+	uint32_t set_app_id, ps_op_id;
+
+	if (enable) {
+		pipe_ctl_flags = PIPE_CONTROL_FLUSH_ENABLE;
+		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
+		intel_bb_out(ibb, pipe_ctl_flags);
+
+		set_app_id =  MI_SET_APPID |
+				APPTYPE(intel_bb_pxp_apptype(ibb)) |
+				APPID(intel_bb_pxp_appid(ibb));
+		intel_bb_out(ibb, set_app_id);
+
+		pipe_ctl_flags = PIPE_CONTROL_PROTECTEDPATH_ENABLE;
+		ps_op_id = PS_OP_TAG_START;
+	} else {
+		pipe_ctl_flags = PIPE_CONTROL_PROTECTEDPATH_DISABLE;
+		ps_op_id = PS_OP_TAG_END;
+	}
+
+	pipe_ctl_flags |= (PIPE_CONTROL_CS_STALL |
+				PIPE_CONTROL_RENDER_TARGET_FLUSH |
+				PIPE_CONTROL_DATA_CACHE_INVALIDATE |
+				PIPE_CONTROL_POST_SYNC_OP);
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
+	intel_bb_out(ibb, pipe_ctl_flags);
+	intel_bb_emit_reloc(ibb, ibb->handle,
+		0, I915_GEM_DOMAIN_COMMAND,
+		(enable ? pxp_write_op_offset : (pxp_write_op_offset+8)),
+		ibb->batch_offset);
+	intel_bb_out(ibb, ps_op_id);
+	intel_bb_out(ibb, ps_op_id);
+}
+
 /* The general rule is if it's named gen6 it is directly copied from
  * gen6_render_copyfunc.
  *
@@ -922,6 +973,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 	uint32_t vertex_buffer;
 	uint32_t aux_pgtable_state;
 	bool fast_clear = !src;
+	uint32_t pxp_scratch_offset;
 
 	if (!fast_clear)
 		igt_assert(src->bpp == dst->bpp);
@@ -950,8 +1002,12 @@ void _gen9_render_op(struct intel_bb *ibb,
 	aux_pgtable_state = gen12_create_aux_pgtable_state(ibb, aux_pgtable_buf);
 
 	/* TODO: there is other state which isn't setup */
+	pxp_scratch_offset = intel_bb_offset(ibb);
 	intel_bb_ptr_set(ibb, 0);
 
+	if (intel_bb_pxp_enabled(ibb))
+		gen12_emit_pxp_state(ibb, true, pxp_scratch_offset);
+
 	/* Start emitting the commands. The order roughly follows the mesa blorp
 	 * order */
 	intel_bb_out(ibb, G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
@@ -963,13 +1019,12 @@ void _gen9_render_op(struct intel_bb *ibb,
 		for (int i = 0; i < 4; i++) {
 			intel_bb_out(ibb, MI_STORE_DWORD_IMM);
 			intel_bb_emit_reloc(ibb, dst->handle,
-					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
-                                            dst->cc.offset + i*sizeof(float),
-					    dst->addr.offset);
+					I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
+					dst->cc.offset + i*sizeof(float),
+					dst->addr.offset);
 			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
-               }
-       }
-
+		}
+	}
 
 	gen8_emit_sip(ibb);
 
@@ -1023,10 +1078,14 @@ void _gen9_render_op(struct intel_bb *ibb,
 	gen8_emit_vf_topology(ibb);
 	gen8_emit_primitive(ibb, vertex_buffer);
 
+	if (intel_bb_pxp_enabled(ibb))
+		gen12_emit_pxp_state(ibb, false, pxp_scratch_offset);
+
 	intel_bb_emit_bbe(ibb);
 	intel_bb_exec(ibb, intel_bb_offset(ibb),
 		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
 	dump_batch(ibb);
+
 	intel_bb_reset(ibb, false);
 }
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
