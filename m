Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196F10E864
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 10:39:00 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Apr 2022 16:09:07 +0530
Message-Id: <20220420103909.17175-3-jeevan.b@intel.com>
In-Reply-To: <20220420103909.17175-1-jeevan.b@intel.com>
References: <20220420103909.17175-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/4] lib/DG2: create flat ccs
 framebuffers with 4-tile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>

Add support for DG2 flat ccs framebuffers with tile-4.

Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/gen9_render.h       |  40 ++++++++++---
 lib/igt_fb.c            |  49 ++++++++++++----
 lib/intel_aux_pgtable.c |   6 +-
 lib/intel_batchbuffer.c |   2 +-
 lib/intel_bufops.c      | 119 +++++++++++++++++++++++++++++++++----
 lib/intel_chipset.h     |   3 +-
 lib/rendercopy_gen9.c   | 127 +++++++++++++++++++++++++++-------------
 lib/veboxcopy_gen12.c   | 109 +++++++++++++++++++++++++---------
 8 files changed, 348 insertions(+), 107 deletions(-)

diff --git a/lib/gen9_render.h b/lib/gen9_render.h
index 06d9718c..82a9f99c 100644
--- a/lib/gen9_render.h
+++ b/lib/gen9_render.h
@@ -59,9 +59,15 @@ struct gen9_surface_state {
 		uint32_t depth:11;
 	} ss3;
 
-	struct {
-		uint32_t minimum_array_element:27;
-		uint32_t pad0:5;
+	union {
+		struct {
+			uint32_t minimum_array_element:27;
+			uint32_t pad0:5;
+		} skl;
+		struct {
+			uint32_t decompress_in_l3:1;
+			uint32_t pad0:31;
+		} dg2;
 	} ss4;
 
 	struct {
@@ -116,6 +122,15 @@ struct gen9_surface_state {
 			uint32_t media_compression:1;
 			uint32_t pad2:1;
 		} tgl;
+
+		struct {
+			uint32_t pad0:14;
+			uint32_t disable_support_for_multi_gpu_partial_writes:1;
+			uint32_t disable_support_for_multi_gpu_atomics:1;
+			uint32_t pad1:14;
+			uint32_t memory_compression_enable:1;
+			uint32_t memory_compression_type:1;
+		} dg2;
 	} ss7;
 
 	struct {
@@ -138,15 +153,22 @@ struct gen9_surface_state {
 		uint32_t aux_base_addr_hi;
 	} ss11;
 
-	/* register can be used for either
-	 * clear value or depth clear value
-	 */
 	struct {
-		uint32_t clear_address;
-	} ss12;
+		/*
+		 * compression_format is used only dg2 onward.
+		 * prior to dg2 full ss12 is used for the address
+		 * but due to alignments bits 0..6 will be zero
+		 * and asserted in code to be so
+		 */
+		uint32_t compression_format:5;
+		uint32_t pad0:1;
+		uint32_t clear_address:26;
+        } ss12;
 
 	struct {
-		uint32_t clear_address_hi;
+		uint32_t clear_address_hi:16;
+		uint32_t pad0:16;
+
 	} ss13;
 
 	struct {
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index eafbe7fd..93e98733 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -457,6 +457,9 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
@@ -565,14 +568,17 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 
 static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
 {
-	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
+	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
 }
 
 static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_mc_ccs_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
+		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
 }
 
 static bool is_ccs_modifier(uint64_t modifier)
@@ -584,7 +590,7 @@ static bool is_ccs_modifier(uint64_t modifier)
 
 static bool is_ccs_plane(const struct igt_fb *fb, int plane)
 {
-	if (!is_ccs_modifier(fb->modifier))
+	if (!is_ccs_modifier(fb->modifier) || HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		return false;
 
 	return plane >= fb->num_planes / 2;
@@ -602,8 +608,15 @@ static bool is_gen12_ccs_plane(const struct igt_fb *fb, int plane)
 
 static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
 {
-	return fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
-	       plane == 2;
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
+	    plane == 2)
+		return true;
+
+	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC &&
+            plane == 1)
+		return true;
+
+	return false;
 }
 
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
@@ -689,7 +702,8 @@ static int fb_num_planes(const struct igt_fb *fb)
 	if (is_ccs_modifier(fb->modifier))
 		num_planes *= 2;
 
-	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+	    fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
 		num_planes++;
 
 	return num_planes;
@@ -763,7 +777,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		return ALIGN(min_stride, tile_width);
 	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
 		/* clear color always fixed to 64 bytes */
-		return 64;
+		return HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 512 : 64;
 	} else if (is_gen12_ccs_plane(fb, plane)) {
 		/*
 		 * The CCS surface stride is
@@ -966,6 +980,9 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 		return I915_TILING_Y;
 	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 		return I915_TILING_4;
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
@@ -2504,9 +2521,10 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (is_ccs_modifier(fb->modifier)) {
 		igt_assert_eq(fb->strides[0] & 127, 0);
 
-		if (is_gen12_ccs_modifier(fb->modifier))
-			igt_assert_eq(fb->strides[1] & 63, 0);
-		else
+		if (is_gen12_ccs_modifier(fb->modifier)) {
+			if (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+				igt_assert_eq(fb->strides[1] & 63, 0);
+		} else
 			igt_assert_eq(fb->strides[1] & 127, 0);
 
 		if (is_gen12_mc_ccs_modifier(fb->modifier))
@@ -2539,7 +2557,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
 
 	if (is_ccs_modifier(fb->modifier)) {
-		num_surfaces = fb->num_planes / 2;
+		num_surfaces = fb->num_planes / (HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 1 : 2);
 		for (i = 0; i < num_surfaces; i++)
 			init_buf_ccs(buf, i,
 				     fb->offsets[num_surfaces + i],
@@ -2560,6 +2578,9 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
 		buf->cc.offset = fb->offsets[2];
 
+	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
+		buf->cc.offset = fb->offsets[1];
+
 	return buf;
 }
 
@@ -4570,6 +4591,12 @@ const char *igt_fb_modifier_name(uint64_t modifier)
 		return "Y-MC_CCS";
 	case I915_FORMAT_MOD_4_TILED:
 		return "4";
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+		return "4-RC_CCS";
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return "4-MC_CCS";
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+		return "4-RC_CCS-CC";
 	default:
 		return "?";
 	}
diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index f5796fdf..e31a6c34 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -263,7 +263,8 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 	} entry = {
 		.e = {
 			.valid = 1,
-			.tile_mode = buf->tiling == I915_TILING_Y ? 1 : 0,
+			.tile_mode = buf->tiling == I915_TILING_Y ? 1 :
+				(buf->tiling == I915_TILING_4 ? 2 : 0),
 		}
 	};
 
@@ -274,7 +275,8 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 	 */
 	igt_assert(buf->tiling == I915_TILING_Y ||
 		   buf->tiling == I915_TILING_Yf ||
-		   buf->tiling == I915_TILING_Ys);
+		   buf->tiling == I915_TILING_Ys ||
+		   buf->tiling == I915_TILING_4);
 
 	entry.e.ycr = surface_idx > 0;
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ebf3c598..81d2e140 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1146,7 +1146,7 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
 		copy = gen9_render_copyfunc;
 	else if (IS_GEN11(devid))
 		copy = gen11_render_copyfunc;
-	else if (IS_DG2(devid))
+	else if (HAS_4TILE(devid))
 		copy = gen12p71_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index f13063fa..72b1bafa 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -89,6 +89,7 @@
 #define TILE_Y      TILE_DEF(I915_TILING_Y)
 #define TILE_Yf     TILE_DEF(I915_TILING_Yf)
 #define TILE_Ys     TILE_DEF(I915_TILING_Ys)
+#define TILE_4      TILE_DEF(I915_TILING_4)
 
 #define CCS_OFFSET(buf) (buf->ccs[0].offset)
 #define CCS_SIZE(gen, buf) \
@@ -105,16 +106,19 @@ struct buf_ops {
 	uint32_t supported_hw_tiles;
 	uint32_t swizzle_x;
 	uint32_t swizzle_y;
+	uint32_t swizzle_tile4;
 	bo_copy linear_to;
 	bo_copy linear_to_x;
 	bo_copy linear_to_y;
 	bo_copy linear_to_yf;
 	bo_copy linear_to_ys;
+	bo_copy linear_to_tile4;
 	bo_copy to_linear;
 	bo_copy x_to_linear;
 	bo_copy y_to_linear;
 	bo_copy yf_to_linear;
 	bo_copy ys_to_linear;
+	bo_copy tile4_to_linear;
 };
 
 static const char *tiling_str(uint32_t tiling)
@@ -125,6 +129,7 @@ static const char *tiling_str(uint32_t tiling)
 	case I915_TILING_Y:    return "Y";
 	case I915_TILING_Yf:   return "Yf";
 	case I915_TILING_Ys:   return "Ys";
+	case I915_TILING_4:    return "4";
 	default:               return "UNKNOWN";
 	}
 }
@@ -222,7 +227,8 @@ static void set_hw_tiled(struct buf_ops *bops, struct intel_buf *buf)
 {
 	uint32_t ret_tiling, ret_swizzle;
 
-	if (buf->tiling != I915_TILING_X && buf->tiling != I915_TILING_Y)
+	if (buf->tiling != I915_TILING_X && buf->tiling != I915_TILING_Y &&
+	    buf->tiling != I915_TILING_4)
 		return;
 
 	if (!buf_ops_has_hw_fence(bops, buf->tiling)) {
@@ -320,6 +326,50 @@ static void *y_ptr(void *ptr,
 	return ptr + pos;
 }
 
+/*
+ * (x,y) to memory location in tiled-4 surface
+ *
+ * coverted those divisions and multiplications to shifts and masks
+ * in hope this wouldn't be so slow.
+ */
+static void *tile4_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	const int tile_width = 128;
+	const int tile_height = 32;
+	const int subtile_size = 64;
+	const int owords = 16;
+	int base, _x, _y, subtile, tile_x, tile_y;
+	int x_loc = x << __builtin_ctz(cpp);
+	int pos;
+
+	/* Pixel in tile via masks */
+	tile_x = x_loc & (tile_width - 1);
+	tile_y = y & (tile_height - 1);
+
+	/* subtile in 4k tile */
+	_x = tile_x >> __builtin_ctz(owords);
+	_y = tile_y >> 2;
+
+	/* tile-4 swizzle */
+	subtile = ((_y >> 1) << 4) + ((_y & 1) << 2) + (_x & 3) + ((_x & 4) << 1);
+
+	/* memory location */
+	base = (y >> __builtin_ctz(tile_height)) *
+		(stride << __builtin_ctz(tile_height)) +
+		(((x_loc >> __builtin_ctz(tile_width)) << __builtin_ctz(4096)));
+
+	pos = base + (subtile << __builtin_ctz(subtile_size)) +
+		((tile_y & 3) << __builtin_ctz(owords)) +
+		(tile_x & (owords - 1));
+	igt_assert((pos & (cpp - 1)) == 0);
+	pos = pos >> __builtin_ctz(cpp);
+
+	return ptr + pos;
+}
+
+
 static void *yf_ptr(void *ptr,
 		    unsigned int x, unsigned int y,
 		    unsigned int stride, unsigned int cpp)
@@ -365,6 +415,8 @@ static tile_fn __get_tile_fn_ptr(int tiling)
 	case I915_TILING_Yf:
 		fn = yf_ptr;
 		break;
+	case I915_TILING_4:
+		fn = tile4_ptr;
 	case I915_TILING_Ys:
 		/* To be implemented */
 		break;
@@ -391,7 +443,7 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
 	void *map;
 	int gen;
 
-	if (!buf->compression)
+	if (!buf->compression || HAS_FLATCCS(intel_get_drm_devid(bops->fd)))
 		return;
 
 	gen = bops->intel_gen;
@@ -551,6 +603,13 @@ static void copy_linear_to_ys(struct buf_ops *bops, struct intel_buf *buf,
 	__copy_linear_to(bops->fd, buf, linear, I915_TILING_Ys, 0);
 }
 
+static void copy_linear_to_tile4(struct buf_ops *bops, struct intel_buf *buf,
+				 uint32_t *linear)
+{
+	DEBUGFN();
+	__copy_linear_to(bops->fd, buf, linear, I915_TILING_4, bops->swizzle_tile4);
+}
+
 static void __copy_to_linear(int fd, struct intel_buf *buf,
 			     uint32_t *linear, int tiling, uint32_t swizzle)
 {
@@ -601,6 +660,13 @@ static void copy_ys_to_linear(struct buf_ops *bops, struct intel_buf *buf,
 	__copy_to_linear(bops->fd, buf, linear, I915_TILING_Ys, 0);
 }
 
+static void copy_tile4_to_linear(struct buf_ops *bops, struct intel_buf *buf,
+				 uint32_t *linear)
+{
+	DEBUGFN();
+	__copy_to_linear(bops->fd, buf, linear, I915_TILING_4, 0);
+}
+
 static void copy_linear_to_gtt(struct buf_ops *bops, struct intel_buf *buf,
 			       uint32_t *linear)
 {
@@ -752,11 +818,10 @@ static void __intel_buf_init(struct buf_ops *bops,
 	IGT_INIT_LIST_HEAD(&buf->link);
 
 	if (compression) {
-		int aux_width, aux_height;
-
 		igt_require(bops->intel_gen >= 9);
 		igt_assert(req_tiling == I915_TILING_Y ||
-			   req_tiling == I915_TILING_Yf);
+			   req_tiling == I915_TILING_Yf ||
+			   req_tiling == I915_TILING_4);
 		/*
 		 * On GEN12+ we align the main surface to 4 * 4 main surface
 		 * tiles, which is 64kB. These 16 tiles are mapped by 4 AUX
@@ -778,13 +843,19 @@ static void __intel_buf_init(struct buf_ops *bops,
 		buf->bpp = bpp;
 		buf->compression = compression;
 
-		aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
-		aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
+		if (!HAS_FLATCCS(intel_get_drm_devid(bops->fd))) {
+			int aux_width, aux_height;
 
-		buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
-		buf->ccs[0].stride = aux_width;
+			aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
+			aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
 
-		size = buf->ccs[0].offset + aux_width * aux_height;
+			buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
+			buf->ccs[0].stride = aux_width;
+			size = buf->ccs[0].offset + aux_width * aux_height;
+		}
+		else {
+			size = buf->ccs[0].offset;
+		}
 	} else {
 		if (tiling) {
 			devid =  intel_get_drm_devid(bops->fd);
@@ -1176,17 +1247,19 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
 	.gen_start          = __gen_start, \
 	.gen_end            = __gen_end, \
-	.supported_hw_tiles = TILE_X | TILE_Y, \
+	.supported_hw_tiles = TILE_X | TILE_Y | TILE_4, \
 	.linear_to          = copy_linear_to_wc, \
 	.linear_to_x        = copy_linear_to_gtt, \
 	.linear_to_y        = copy_linear_to_gtt, \
 	.linear_to_yf       = copy_linear_to_yf, \
 	.linear_to_ys       = copy_linear_to_ys, \
+	.linear_to_tile4    = copy_linear_to_tile4, \
 	.to_linear          = copy_wc_to_linear, \
 	.x_to_linear        = copy_gtt_to_linear, \
 	.y_to_linear        = copy_gtt_to_linear, \
 	.yf_to_linear       = copy_yf_to_linear, \
-	.ys_to_linear       = copy_ys_to_linear
+	.ys_to_linear       = copy_ys_to_linear, \
+	.tile4_to_linear    = copy_tile4_to_linear
 
 struct buf_ops buf_ops_arr[] = {
 	{
@@ -1201,7 +1274,7 @@ struct buf_ops buf_ops_arr[] = {
 
 	{
 		DEFAULT_BUFOPS(12, 12),
-		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys,
+		.supported_tiles   = TILE_NONE | TILE_X | TILE_Y | TILE_Yf | TILE_Ys | TILE_4,
 	},
 };
 
@@ -1230,6 +1303,8 @@ static bool probe_hw_tiling(struct buf_ops *bops, uint32_t tiling,
 			bops->swizzle_x = buf_swizzle;
 		else if (tiling == I915_TILING_Y)
 			bops->swizzle_y = buf_swizzle;
+		else if (tiling == I915_TILING_4)
+			bops->swizzle_tile4 = buf_swizzle;
 
 		*swizzling_supported = buf_swizzle == phys_swizzle;
 	}
@@ -1390,6 +1465,24 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		}
 	}
 
+	if (is_hw_tiling_supported(bops, I915_TILING_4)) {
+		bool swizzling_supported;
+		bool supported = probe_hw_tiling(bops, I915_TILING_4,
+						 &swizzling_supported);
+
+		if (!swizzling_supported) {
+			igt_debug("Swizzling for 4 is not supported\n");
+			bops->supported_tiles &= ~TILE_4;
+		}
+
+		igt_debug("4 fence support: %s\n", bool_str(supported));
+		if (!supported) {
+			bops->supported_hw_tiles &= ~TILE_4;
+			bops->linear_to_tile4 = copy_linear_to_tile4;
+			bops->tile4_to_linear = copy_tile4_to_linear;
+		}
+	}
+
 	/* Disable other tiling format functions if not supported */
 	if (!is_tiling_supported(bops, I915_TILING_Yf)) {
 		igt_debug("Yf format not supported\n");
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index db75a829..4d9f4623 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -219,6 +219,7 @@ void intel_check_pch(void);
 
 #define HAS_4TILE(devid)	(intel_get_device_info(devid)->has_4tile)
 
-#define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
+/* use HAS_4TILE here as all devices with 4-tile have flat ccs. */
+#define HAS_FLATCCS(devid)	HAS_4TILE(devid)
 
 #endif /* _INTEL_CHIPSET_H */
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 6c45efb4..9d7e5b71 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -165,7 +165,8 @@ intel_get_uc_mocs(int fd) {
 
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
-gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
+gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
+	      bool fast_clear) {
 	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain;
 	uint64_t address;
@@ -192,15 +193,26 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
 		default: igt_assert(0);
 	}
-	ss->ss0.render_cache_read_write = 1;
 	ss->ss0.vertical_alignment = 1; /* align 4 */
-	ss->ss0.horizontal_alignment = 1; /* align 4 */
+	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
+
+	if (HAS_4TILE(ibb->devid)) {
+		/*
+		 * mocs table version 1 index 3 groub wb use l3
+		 */
+		ss->ss1.memory_object_control = 3 << 1;
+		ss->ss5.mip_tail_start_lod = 0;
+	} else {
+		ss->ss0.render_cache_read_write = 1;
+		ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
+		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
+	}
+
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
 	else if (buf->tiling != I915_TILING_NONE)
 		ss->ss0.tiled_mode = 3;
 
-	ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
 	if (intel_buf_pxp(buf))
 		ss->ss1.memory_object_control |= 1;
 
@@ -208,7 +220,6 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 		ss->ss5.trmode = 1;
 	else if (buf->tiling == I915_TILING_Ys)
 		ss->ss5.trmode = 2;
-	ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
 
 	address = intel_bb_offset_reloc(ibb, buf->handle,
 					read_domain, write_domain,
@@ -229,20 +240,22 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
 	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		igt_assert(buf->ccs[0].stride);
-
 		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
-		ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
 
-		address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
-							   read_domain, write_domain,
-							   (buf->cc.offset ? (1 << 10) : 0) | buf->ccs[0].offset,
-							   intel_bb_offset(ibb) + 4 * 10,
-							   buf->addr.offset);
-		ss->ss10.aux_base_addr = (address + buf->ccs[0].offset) >> 12;
-		ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
+		if (buf->ccs[0].stride) {
+
+			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
+
+			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+								   read_domain, write_domain,
+								   (buf->cc.offset ? (1 << 10) : 0) | buf->ccs[0].offset,
+								   intel_bb_offset(ibb) + 4 * 10,
+								   buf->addr.offset);
+			ss->ss10.aux_base_addr = (address + buf->ccs[0].offset) >> 12;
+			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
+		}
 
-		if (buf->cc.offset) {
+		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
 			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
 
 			ss->ss10.clearvalue_addr_enable = 1;
@@ -252,9 +265,30 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 								   buf->cc.offset,
 								   intel_bb_offset(ibb) + 4 * 12,
 								   buf->addr.offset);
-			ss->ss12.clear_address = address + buf->cc.offset;
-			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
-		}
+
+			/*
+                         * If this assert doesn't hold below clear address will be
+                         * written wrong.
+                         */
+                        igt_assert(__builtin_ctzl(address + buf->cc.offset) >= 6 &&
+                                   (__builtin_clzl(address + buf->cc.offset) >= 16));
+
+                        ss->ss12.clear_address = (address + buf->cc.offset) >> 6;
+                        ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
+                } else if (HAS_FLATCCS(ibb->devid)) {
+                        ss->ss7.dg2.memory_compression_type = 0;
+                        ss->ss7.dg2.memory_compression_enable = 0;
+                        ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
+                        ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
+
+                        /*
+                         * For now here is coming only 32bpp rgb format
+                         * which is marked below as B8G8R8X8_UNORM = '8'
+                         * If here ever arrive other formats below need to be
+                         * fixed to take that into account.
+                         */
+                        ss->ss12.compression_format = 8;
+                }
 	}
 
 	return intel_bb_ptr_add_return_prev_offset(ibb, sizeof(*ss));
@@ -266,14 +300,15 @@ gen8_bind_surfaces(struct intel_bb *ibb,
 		   const struct intel_buf *dst)
 {
 	uint32_t *binding_table, binding_table_offset;
+	bool fast_clear = !src;
 
 	binding_table = intel_bb_ptr_align(ibb, 32);
 	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
 
-	binding_table[0] = gen8_bind_buf(ibb, dst, 1);
+	binding_table[0] = gen8_bind_buf(ibb, dst, 1, fast_clear);
 
 	if (src != NULL)
-		binding_table[1] = gen8_bind_buf(ibb, src, 0);
+		binding_table[1] = gen8_bind_buf(ibb, src, 0, false);
 
 	return binding_table_offset;
 }
@@ -856,12 +891,14 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 static void
 gen9_emit_depth(struct intel_bb *ibb)
 {
+	bool need_10dw = HAS_4TILE(ibb->devid);
+
 	intel_bb_out(ibb, GEN8_3DSTATE_WM_DEPTH_STENCIL | (4 - 2));
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
-	intel_bb_out(ibb, GEN7_3DSTATE_DEPTH_BUFFER | (8-2));
+	intel_bb_out(ibb, GEN7_3DSTATE_DEPTH_BUFFER | (need_10dw ? (10-2) : (8-2)));
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
@@ -869,6 +906,10 @@ gen9_emit_depth(struct intel_bb *ibb)
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
+	if (need_10dw) {
+		intel_bb_out(ibb, 0);
+		intel_bb_out(ibb, 0);
+	}
 
 	intel_bb_out(ibb, GEN8_3DSTATE_HIER_DEPTH_BUFFER | (5-2));
 	intel_bb_out(ibb, 0);
@@ -1080,7 +1121,7 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen9_emit_state_base_address(ibb);
 
-	if (IS_DG2(ibb->devid) || intel_gen(ibb->devid) > 12) {
+	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
 		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
 		intel_bb_emit_reloc(ibb, ibb->handle,
 				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
@@ -1197,18 +1238,12 @@ void gen12p71_render_copyfunc(struct intel_bb *ibb,
 			      struct intel_buf *dst,
 			      unsigned int dst_x, unsigned int dst_y)
 {
-	struct aux_pgtable_info pgtable_info = { };
-
-	gen12_aux_pgtable_init(&pgtable_info, ibb, src, dst);
-
 	_gen9_render_op(ibb, src, src_x, src_y,
 			width, height, dst, dst_x, dst_y,
-			pgtable_info.pgtable_buf,
+			NULL,
 			NULL,
 			gen12p71_render_copy,
 			sizeof(gen12p71_render_copy));
-
-	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
 }
 
 void gen12_render_clearfunc(struct intel_bb *ibb,
@@ -1217,16 +1252,24 @@ void gen12_render_clearfunc(struct intel_bb *ibb,
 			    unsigned int width, unsigned int height,
 			    const float clear_color[4])
 {
-	struct aux_pgtable_info pgtable_info = { };
-
-	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
-
-	_gen9_render_op(ibb, NULL, 0, 0,
-		        width, height, dst, dst_x, dst_y,
-		        pgtable_info.pgtable_buf,
-		        clear_color,
-		        gen12_render_copy,
-		        sizeof(gen12_render_copy));
-
-	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+	if (!HAS_4TILE(ibb->devid)) {
+		struct aux_pgtable_info pgtable_info = { };
+		gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
+
+		_gen9_render_op(ibb, NULL, 0, 0,
+			        width, height, dst, dst_x, dst_y,
+			        pgtable_info.pgtable_buf,
+			        clear_color,
+			        gen12_render_copy,
+			        sizeof(gen12_render_copy));
+
+		gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+	} else {
+			_gen9_render_op(ibb, NULL, 0, 0,
+					width, height, dst, dst_x, dst_y,
+					NULL,
+					clear_color,
+					gen12p71_render_copy,
+					sizeof(gen12p71_render_copy));
+	}
 }
diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 17564493..7c3ca245 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -53,19 +53,25 @@ struct vebox_surface_state {
 		uint32_t width:14;
 		uint32_t height:14;
 	} ss2;
-	struct {
+	union {
+		struct {
 #define VEBOX_TILE_WALK_XMAJOR 0
 #define VEBOX_TILE_WALK_YMAJOR 1
-		uint32_t tile_walk:1;
-		uint32_t tiled_surface:1;
-		uint32_t chroma_half_pitch:1;
-		uint32_t surface_pitch:17;
-		uint32_t chroma_interleave:1;
-		uint32_t lsb_packed_enable:1;
-		uint32_t bayer_input_alignment:2;
-		uint32_t bayer_pattern_format:1;
-		uint32_t bayer_pattern_offset:2;
-		uint32_t surface_format:5;
+			uint32_t tile_walk:1;
+			uint32_t tiled_surface:1;
+			uint32_t chroma_half_pitch:1;
+			uint32_t surface_pitch:17;
+			uint32_t chroma_interleave:1;
+			uint32_t lsb_packed_enable:1;
+			uint32_t bayer_input_alignment:2;
+			uint32_t bayer_pattern_format:1;
+			uint32_t bayer_pattern_offset:2;
+			uint32_t surface_format:5;
+		} tgl;
+		struct {
+			uint32_t tile_mode:2;
+			uint32_t pad0:30;
+		} dg2;
 	} ss3;
 	struct {
 		uint32_t u_y_offset:15;
@@ -82,9 +88,15 @@ struct vebox_surface_state {
 		uint32_t frame_x_offset:15;
 		uint32_t pad:2;
 	} ss6;
-	struct {
-		uint32_t derived_surface_pitch:17;
-		uint32_t pad:15;
+	union {
+		struct {
+			uint32_t derived_surface_pitch:17;
+			uint32_t pad:15;
+		} skl;
+		struct {
+			uint32_t pad:27;
+			uint32_t compression_format:5;
+		} dg2;
 	} ss7;
 	struct {
 		uint32_t skin_score_output_surface_pitch:17;
@@ -166,17 +178,46 @@ static void emit_surface_state_cmd(struct intel_bb *ibb,
 	ss->ss2.height = height - 1;
 	ss->ss2.width = width - 1;
 
-	ss->ss3.surface_format = format;
+	ss->ss3.tgl.surface_format = format;
 	if (format_is_interleaved_yuv(format))
-		ss->ss3.chroma_interleave = 1;
-	ss->ss3.surface_pitch = pitch - 1;
-	ss->ss3.tile_walk = (tiling == I915_TILING_Y) ||
-			    (tiling == I915_TILING_Yf);
-	ss->ss3.tiled_surface = tiling != I915_TILING_NONE;
+		ss->ss3.tgl.chroma_interleave = 1;
+	ss->ss3.tgl.surface_pitch = pitch - 1;
 
 	ss->ss4.u_y_offset = uv_offset / pitch;
 
-	ss->ss7.derived_surface_pitch = pitch - 1;
+	if (HAS_FLATCCS(ibb->devid)) {
+                /*
+                 * f-tile = 3 (Tile F)
+                 */
+                ss->ss3.dg2.tile_mode = (tiling != I915_TILING_NONE) ? 3 : 0;
+
+                switch (format) {
+                case R8G8B8A8_UNORM:
+                        ss->ss7.dg2.compression_format = 0xa;
+                        break;
+                case PLANAR_420_8:
+                        ss->ss7.dg2.compression_format = 0xf;
+                        break;
+                case PLANAR_420_16:
+                        ss->ss7.dg2.compression_format = 8;
+                        break;
+                case YCRCB_NORMAL:
+                        ss->ss7.dg2.compression_format = 3;
+                        break;
+                case PACKED_444A_8:
+                        ss->ss7.dg2.compression_format = 0x9;
+                        break;
+                default:
+                        igt_assert(0);
+                }
+        } else {
+                ss->ss3.tgl.tile_walk = (tiling == I915_TILING_Y) ||
+                        (tiling == I915_TILING_Yf) ||
+                        (tiling == I915_TILING_4);
+                ss->ss3.tgl.tiled_surface = tiling != I915_TILING_NONE;
+        }
+
+	ss->ss7.skl.derived_surface_pitch = pitch - 1;
 
 	intel_bb_ptr_add(ibb, sizeof(*ss));
 }
@@ -203,7 +244,11 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
 		tc->tc1_2.input_compression_type =
 			src->compression == I915_COMPRESSION_RENDER;
 	}
-	tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
+
+	if (HAS_4TILE(ibb->devid))
+		tc->tc1_2.input_mocs_idx = 3;
+	else
+		tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
 	reloc_delta = tc->tc1_2_l;
 
 	igt_assert(src->addr.offset == ALIGN(src->addr.offset, 0x1000));
@@ -220,7 +265,12 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
 		tc->tc3_4.output_compression_type =
 			dst->compression == I915_COMPRESSION_RENDER;
 	}
-	tc->tc3_4.output_tiled_resource_mode = dst->tiling == I915_TILING_Yf;
+
+	if (HAS_4TILE(ibb->devid))
+		tc->tc3_4.output_mocs_idx = 3;
+	else
+		tc->tc3_4.output_tiled_resource_mode = dst->tiling == I915_TILING_Yf;
+
 	reloc_delta = tc->tc3_4_l;
 
 	igt_assert(dst->addr.offset == ALIGN(dst->addr.offset, 0x1000));
@@ -255,10 +305,12 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 	intel_bb_add_intel_buf(ibb, dst, true);
 	intel_bb_add_intel_buf(ibb, src, false);
 
-	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
-	gen12_aux_pgtable_init(&aux_pgtable_info, ibb, src, dst);
-	aux_pgtable_state = gen12_create_aux_pgtable_state(ibb,
-							   aux_pgtable_info.pgtable_buf);
+	if (!HAS_FLATCCS(ibb->devid)) {
+		intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+		gen12_aux_pgtable_init(&aux_pgtable_info, ibb, src, dst);
+		aux_pgtable_state = gen12_create_aux_pgtable_state(ibb,
+								   aux_pgtable_info.pgtable_buf);
+	}
 
 	intel_bb_ptr_set(ibb, 0);
 	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, false);
@@ -311,5 +363,6 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 
 	intel_bb_reset(ibb, false);
 
-	gen12_aux_pgtable_cleanup(ibb, &aux_pgtable_info);
+	if (!HAS_FLATCCS(ibb->devid))
+		gen12_aux_pgtable_cleanup(ibb, &aux_pgtable_info);
 }
-- 
2.35.1
