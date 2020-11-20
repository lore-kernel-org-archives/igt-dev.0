Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644F06E892
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 09:36:53 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Fri, 20 Nov 2020 11:36:44 +0200
Message-Id: <20201120093646.1340401-3-mika.kahola@intel.com>
In-Reply-To: <20201120093646.1340401-1-mika.kahola@intel.com>
References: <20201120093646.1340401-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v10 2/4] lib/rendercopy: Enable fast clear
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
List-ID: <igt-dev@lists.freedesktop.org>

Enable fast clear rendering on rendercopy function.

v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
    Enable fast clear bit on 3D sequence (Matt)
    Add helper function to figure out clear color modifier (Matt)
v3: Remove unrelated line additions/removes
v4: Fast clear with color (Imre)
v5: Write raw 32-bit color values to register (Imre)
    Require 32-bit color format
v6: Rebase to use batchbuffer without libdrm dependency
v7: Enable clear color (Nanley)
v8: Various cleanups (Imre)
    Modificate buffer creation (Imre)
v9: Renaming of render_copyfunc() to render_op() (Imre)
    Remove igt_render_clearfunc variable (Imre)
v10: Dst buffer width division by 64 pixels and height by 16 lines (Imre)
     Reorder ss10 bit fields (Imre)
     Relocate buffer with clear color value enabled (Imre)
     Set fast clear enable bit in correct dword (Imre)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/gen8_render.h       |   1 +
 lib/gen9_render.h       |   6 +-
 lib/igt_fb.c            |  20 +++--
 lib/igt_fb.h            |   3 +
 lib/intel_batchbuffer.c |   5 ++
 lib/intel_batchbuffer.h |   6 ++
 lib/rendercopy.h        |   4 +
 lib/rendercopy_gen9.c   | 167 ++++++++++++++++++++++++++++------------
 8 files changed, 156 insertions(+), 56 deletions(-)

diff --git a/lib/gen8_render.h b/lib/gen8_render.h
index 31dc01bc..1b0f527e 100644
--- a/lib/gen8_render.h
+++ b/lib/gen8_render.h
@@ -26,6 +26,7 @@
 
 # define GEN8_VS_FLOATING_POINT_MODE_ALTERNATE          (1 << 16)
 
+#define GEN8_3DSTATE_FAST_CLEAR_ENABLE		(1 << 8)
 #define GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP	\
 						GEN4_3D(3, 0, 0x21)
 #define GEN8_3DSTATE_PS_BLEND			GEN4_3D(3, 0, 0x4d)
diff --git a/lib/gen9_render.h b/lib/gen9_render.h
index 6274e902..0bd797f9 100644
--- a/lib/gen9_render.h
+++ b/lib/gen9_render.h
@@ -127,7 +127,11 @@ struct gen9_surface_state {
 	} ss9;
 
 	struct {
-		uint32_t aux_base_addr;
+		uint32_t quilt_width:5;
+		uint32_t quilt_height:5;
+		uint32_t clearvalue_addr_enable:1;
+		uint32_t procedual_texture:1;
+		uint32_t aux_base_addr:20;
 	} ss10;
 
 	struct {
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 43f8c475..422a9e06 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2141,9 +2141,10 @@ static int yuv_semiplanar_bpp(uint32_t drm_format)
 	}
 }
 
-static struct intel_buf *create_buf(struct fb_blit_upload *blit,
-				   const struct igt_fb *fb,
-				   const char *name)
+struct intel_buf *
+igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
+                        const struct igt_fb *fb,
+                        const char *name)
 {
 	struct intel_buf *buf;
 	uint32_t bo_name, handle, compression;
@@ -2169,10 +2170,10 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
 		compression = I915_COMPRESSION_NONE;
 	}
 
-	bo_name = gem_flink(blit->fd, fb->gem_handle);
-	handle = gem_open(blit->fd, bo_name);
+	bo_name = gem_flink(fd, fb->gem_handle);
+	handle = gem_open(fd, bo_name);
 
-	buf = intel_buf_create_using_handle(blit->bops, handle,
+	buf = intel_buf_create_using_handle(bops, handle,
 					    fb->width, fb->height,
 					    fb->plane_bpp[0], 0,
 					    igt_fb_mod_to_tiling(fb->modifier),
@@ -2213,6 +2214,13 @@ static struct intel_buf *create_buf(struct fb_blit_upload *blit,
 	return buf;
 }
 
+static struct intel_buf *create_buf(struct fb_blit_upload *blit,
+				   const struct igt_fb *fb,
+				   const char *name)
+{
+	return igt_fb_create_intel_buf(blit->fd, blit->bops, fb, name);
+}
+
 static void fini_buf(struct intel_buf *buf)
 {
 	intel_buf_destroy(buf);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index b36db965..bc5b8fa0 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -39,6 +39,7 @@
 
 #include "igt_color_encoding.h"
 #include "igt_debugfs.h"
+#include "intel_bufops.h"
 
 /*
  * Internal format to denote a buffer compatible with pixman's
@@ -129,6 +130,8 @@ igt_create_fb_with_bo_size(int fd, int width, int height,
 			   enum igt_color_range color_range,
 			   struct igt_fb *fb, uint64_t bo_size,
 			   unsigned bo_stride);
+struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
+					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 7b4cfb0d..faec8531 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1096,6 +1096,11 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 	return copy;
 }
 
+igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
+{
+	return IS_GEN12(devid) ? gen12_render_clearfunc : NULL;
+}
+
 /**
  * igt_get_media_fillfunc:
  * @devid: pci device id
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index ab1b0c28..250566da 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -374,6 +374,12 @@ typedef void (*igt_vebox_copyfunc_t)(struct intel_bb *ibb,
 
 igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid);
 
+typedef void (*igt_render_clearfunc_t)(struct intel_bb *ibb,
+				       struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
+				       unsigned int width, unsigned int height,
+				       const float cc_color[4]);
+igt_render_clearfunc_t igt_get_render_clearfunc(int devid);
+
 /**
  * igt_fillfunc_t:
  * @i915: drm fd
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index 7d5f0802..d2d9c586 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct intel_bb *ibb,
 	intel_bb_out(ibb, u.ui);
 }
 
+void gen12_render_clearfunc(struct intel_bb *ibb,
+			    struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
+			    unsigned int width, unsigned int height,
+			    const float clear_color[4]);
 void gen12_render_copyfunc(struct intel_bb *ibb,
 			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			   uint32_t width, uint32_t height,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index ef6855c9..95563066 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -185,23 +185,25 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 
 		address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
 							   read_domain, write_domain,
-							   buf->ccs[0].offset,
+							   (buf->cc.offset ? (1 << 10) : 0) | buf->ccs[0].offset,
 							   intel_bb_offset(ibb) + 4 * 10,
 							   buf->addr.offset);
-		ss->ss10.aux_base_addr = (address + buf->ccs[0].offset);
+		ss->ss10.aux_base_addr = (address + buf->ccs[0].offset) >> 12;
 		ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
-	}
 
-	if (buf->cc.offset) {
-		igt_assert(buf->compression == I915_COMPRESSION_RENDER);
+		if (buf->cc.offset) {
+			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
 
-		address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
-							   read_domain, write_domain,
-							   buf->cc.offset,
-							   intel_bb_offset(ibb) + 4 * 12,
-							   buf->addr.offset);
-		ss->ss12.clear_address = address + buf->cc.offset;
-		ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
+			ss->ss10.clearvalue_addr_enable = 1;
+
+			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+								   read_domain, write_domain,
+								   buf->cc.offset,
+								   intel_bb_offset(ibb) + 4 * 12,
+								   buf->addr.offset);
+			ss->ss12.clear_address = address + buf->cc.offset;
+			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
+		}
 	}
 
 	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*ss));
@@ -218,7 +220,9 @@ gen8_bind_surfaces(struct intel_bb *ibb,
 	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
 
 	binding_table[0] = gen8_bind_buf(ibb, dst, 1);
-	binding_table[1] = gen8_bind_buf(ibb, src, 0);
+
+	if (src != NULL)
+		binding_table[1] = gen8_bind_buf(ibb, src, 0);
 
 	return binding_table_offset;
 }
@@ -273,17 +277,37 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
 	intel_bb_ptr_align(ibb, 8);
 	offset = intel_bb_offset(ibb);
 
-	emit_vertex_2s(ibb, dst_x + width, dst_y + height);
-	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
-	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+	if (src != NULL) {
+		emit_vertex_2s(ibb, dst_x + width, dst_y + height);
+
+		emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
+		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
 
-	emit_vertex_2s(ibb, dst_x, dst_y + height);
-	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
-	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+		emit_vertex_2s(ibb, dst_x, dst_y + height);
 
-	emit_vertex_2s(ibb, dst_x, dst_y);
-	emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
-	emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
+		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
+		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
+
+		emit_vertex_2s(ibb, dst_x, dst_y);
+
+		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
+		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
+	} else {
+		emit_vertex_2s(ibb, (dst_x + width)/64, DIV_ROUND_UP(dst_y + height, 16));
+
+		emit_vertex_normalized(ibb, 0, 0);
+		emit_vertex_normalized(ibb, 0, 0);
+
+		emit_vertex_2s(ibb, dst_x/64, DIV_ROUND_UP(dst_y + height, 16));
+
+		emit_vertex_normalized(ibb, 0, 0);
+		emit_vertex_normalized(ibb, 0, 0);
+
+		emit_vertex_2s(ibb, dst_x/64, dst_y/16);
+
+		emit_vertex_normalized(ibb, 0, 0);
+		emit_vertex_normalized(ibb, 0, 0);
+	}
 
 	return offset;
 }
@@ -729,7 +753,7 @@ gen8_emit_sf(struct intel_bb *ibb)
 }
 
 static void
-gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
+gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	const int max_threads = 63;
 
 	intel_bb_out(ibb, GEN6_3DSTATE_WM | (2 - 2));
@@ -753,12 +777,19 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel) {
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
 	intel_bb_out(ibb, kernel);
 	intel_bb_out(ibb, 0); /* kernel hi */
-	intel_bb_out(ibb, 1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
-		     2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
+
+	if (fast_clear)
+		intel_bb_out(ibb, 1 <<  GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
+	else
+		intel_bb_out(ibb, 1 << GEN6_3DSTATE_WM_SAMPLER_COUNT_SHIFT |
+		             2 << GEN6_3DSTATE_WM_BINDING_TABLE_ENTRY_COUNT_SHIFT);
+
 	intel_bb_out(ibb, 0); /* scratch space stuff */
 	intel_bb_out(ibb, 0); /* scratch hi */
+
 	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
-		     GEN6_3DSTATE_WM_16_DISPATCH_ENABLE);
+	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
+	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
 	intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT);
 	intel_bb_out(ibb, 0); // kernel 1
 	intel_bb_out(ibb, 0); /* kernel 1 hi */
@@ -876,27 +907,32 @@ static void gen8_emit_primitive(struct intel_bb *ibb, uint32_t offset)
 #define BATCH_STATE_SPLIT 2048
 
 static
-void _gen9_render_copyfunc(struct intel_bb *ibb,
-			   struct intel_buf *src,
-			   unsigned int src_x, unsigned int src_y,
-			   unsigned int width, unsigned int height,
-			   struct intel_buf *dst,
-			   unsigned int dst_x, unsigned int dst_y,
-			   struct intel_buf *aux_pgtable_buf,
-			   const uint32_t ps_kernel[][4],
-			   uint32_t ps_kernel_size)
+void _gen9_render_op(struct intel_bb *ibb,
+		     struct intel_buf *src,
+		     unsigned int src_x, unsigned int src_y,
+		     unsigned int width, unsigned int height,
+		     struct intel_buf *dst,
+		     unsigned int dst_x, unsigned int dst_y,
+		     struct intel_buf *aux_pgtable_buf,
+		     const float clear_color[4],
+		     const uint32_t ps_kernel[][4],
+		     uint32_t ps_kernel_size)
 {
 	uint32_t ps_sampler_state, ps_kernel_off, ps_binding_table;
 	uint32_t scissor_state;
 	uint32_t vertex_buffer;
 	uint32_t aux_pgtable_state;
+	bool fast_clear = !src;
 
-	igt_assert(src->bpp == dst->bpp);
+	if (!fast_clear)
+		igt_assert(src->bpp == dst->bpp);
 
 	intel_bb_flush_render(ibb);
 
 	intel_bb_add_intel_buf(ibb, dst, true);
-	intel_bb_add_intel_buf(ibb, src, false);
+
+	if (!fast_clear)
+		intel_bb_add_intel_buf(ibb, src, false);
 
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
@@ -924,6 +960,18 @@ void _gen9_render_copyfunc(struct intel_bb *ibb,
 
 	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
 
+	if (fast_clear) {
+		for (int i = 0; i < 4; i++) {
+			intel_bb_out(ibb, MI_STORE_DWORD_IMM);
+			intel_bb_emit_reloc(ibb, dst->handle,
+					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
+                                            dst->cc.offset + i*sizeof(float),
+					    dst->addr.offset);
+			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
+               }
+       }
+
+
 	gen8_emit_sip(ibb);
 
 	gen7_emit_push_constants(ibb);
@@ -953,7 +1001,7 @@ void _gen9_render_copyfunc(struct intel_bb *ibb,
 
 	gen8_emit_sf(ibb);
 
-	gen8_emit_ps(ibb, ps_kernel_off);
+	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
 	intel_bb_out(ibb, ps_binding_table);
@@ -991,9 +1039,9 @@ void gen9_render_copyfunc(struct intel_bb *ibb,
 			  unsigned int dst_x, unsigned int dst_y)
 
 {
-	_gen9_render_copyfunc(ibb, src, src_x, src_y,
-			  width, height, dst, dst_x, dst_y, NULL,
-			  ps_kernel_gen9, sizeof(ps_kernel_gen9));
+	_gen9_render_op(ibb, src, src_x, src_y,
+		        width, height, dst, dst_x, dst_y, NULL, NULL,
+		        ps_kernel_gen9, sizeof(ps_kernel_gen9));
 }
 
 void gen11_render_copyfunc(struct intel_bb *ibb,
@@ -1003,9 +1051,9 @@ void gen11_render_copyfunc(struct intel_bb *ibb,
 			   struct intel_buf *dst,
 			   unsigned int dst_x, unsigned int dst_y)
 {
-	_gen9_render_copyfunc(ibb, src, src_x, src_y,
-			  width, height, dst, dst_x, dst_y, NULL,
-			  ps_kernel_gen11, sizeof(ps_kernel_gen11));
+	_gen9_render_op(ibb, src, src_x, src_y,
+		        width, height, dst, dst_x, dst_y, NULL, NULL,
+		        ps_kernel_gen11, sizeof(ps_kernel_gen11));
 }
 
 void gen12_render_copyfunc(struct intel_bb *ibb,
@@ -1019,11 +1067,32 @@ void gen12_render_copyfunc(struct intel_bb *ibb,
 
 	gen12_aux_pgtable_init(&pgtable_info, ibb, src, dst);
 
-	_gen9_render_copyfunc(ibb, src, src_x, src_y,
-			  width, height, dst, dst_x, dst_y,
-			  pgtable_info.pgtable_buf,
-			  gen12_render_copy,
-			  sizeof(gen12_render_copy));
+	_gen9_render_op(ibb, src, src_x, src_y,
+		        width, height, dst, dst_x, dst_y,
+		        pgtable_info.pgtable_buf,
+		        NULL,
+		        gen12_render_copy,
+		        sizeof(gen12_render_copy));
+
+	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+}
+
+void gen12_render_clearfunc(struct intel_bb *ibb,
+			    struct intel_buf *dst,
+			    unsigned int dst_x, unsigned int dst_y,
+			    unsigned int width, unsigned int height,
+			    const float clear_color[4])
+{
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
+
+	_gen9_render_op(ibb, NULL, 0, 0,
+		        width, height, dst, dst_x, dst_y,
+		        pgtable_info.pgtable_buf,
+		        clear_color,
+		        gen12_render_copy,
+		        sizeof(gen12_render_copy));
 
 	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
