Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA46CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C0D10E49D;
	Mon, 23 Sep 2024 20:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQ5LBCVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C7510E49C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124377; x=1758660377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+7EJ20YQZCSjk7Pe9pII8QF8v96HsEnWcwyrVJUPUag=;
 b=cQ5LBCVuxtNQnKnTOOjeOS5PlhXEqCyoK5m/tPOHZmaip++DwWWW/01j
 UDR8m7ALQ/8PCXmbA/LWCanGWx1p8lzIJAglD21yb6abIahndSucv65Nn
 BZmUsNDXy+VpIBYromAYfGS98CCe7ApYSKQjk/K/Ozq0IEUZ6qcuN3Rbf
 JhmV4dxvWQYW1gmlp9Jz5PrcD/6wwj24hBtKecD/V+VAsYby00oyugaDu
 XquiiRdx/ZNBVGNCJuZsbduWSoC97KXI6Ezw6WlQLQXIZp8HPHwulvqYk
 dOun3vH8uOBpBHxp5comneqdcv+UwGUjUbGNBmZHP1Q/vJxh3SPXHUIiW A==;
X-CSE-ConnectionGUID: IK4ZU6kiR92Ar4jckuEEmA==
X-CSE-MsgGUID: +YmOwgCUQp6gcMWYKT2RSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25956002"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25956002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:17 -0700
X-CSE-ConnectionGUID: oQ0HX1djQVON0kgf9VJHtw==
X-CSE-MsgGUID: bTxzwYF6Rw6BaYpVMBB6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326899"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:46:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:46:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/6] igt: Get rid of AT_LEAST_GEN()
Date: Mon, 23 Sep 2024 23:45:57 +0300
Message-ID: <20240923204557.32123-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

AT_LEAST_GEN() seems utterluy pointless. Just
compare the numbers the natural way.

Partly done with cocci (until it choked on the
igt magic constructs):
@@
expression devid, ver;
@@
(
- !AT_LEAST_GEN(devid, ver)
+ intel_gen(devid) < ver
|
- AT_LEAST_GEN(devid, ver)
+ intel_gen(devid) >= ver
)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/gpu_cmds.c                         |  2 +-
 lib/i915/intel_decode.c                |  2 +-
 lib/intel_batchbuffer.c                |  2 +-
 lib/intel_blt.c                        |  4 ++--
 lib/intel_blt.h                        |  2 +-
 lib/intel_bufops.c                     |  8 ++++----
 lib/intel_chipset.h                    |  9 ++++-----
 lib/intel_common.c                     |  2 +-
 lib/intel_mocs.c                       |  2 +-
 lib/intel_pat.c                        |  2 +-
 lib/rendercopy_gen9.c                  | 18 +++++++++---------
 tests/intel/kms_ccs.c                  |  8 ++++----
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  6 +++---
 tests/intel/perf.c                     |  2 +-
 tests/intel/xe_ccs.c                   | 16 ++++++++--------
 tests/intel/xe_debugfs.c               |  2 +-
 tests/intel/xe_query.c                 |  2 +-
 18 files changed, 45 insertions(+), 46 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index c44b24c79bd1..f6a9bd09fe4c 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -867,7 +867,7 @@ gen_emit_media_object(struct intel_bb *ibb,
 	/* inline data (xoffset, yoffset) */
 	intel_bb_out(ibb, xoffset);
 	intel_bb_out(ibb, yoffset);
-	if (AT_LEAST_GEN(ibb->devid, 8) && !IS_CHERRYVIEW(ibb->devid))
+	if (intel_gen(ibb->devid) >= 8 && !IS_CHERRYVIEW(ibb->devid))
 		gen8_emit_media_state_flush(ibb);
 }
 
diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index 1b6de5edafad..b78993c474c6 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -3944,7 +3944,7 @@ intel_decode(struct intel_decode *ctx)
 			index += decode_2d(ctx);
 			break;
 		case 0x3:
-			if (AT_LEAST_GEN(devid, 4)) {
+			if (intel_gen(devid) >= 4) {
 				index +=
 				    decode_3d_965(ctx);
 			} else if (IS_GEN3(devid)) {
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 41b1c419375b..72bbbf8c6ac2 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -660,7 +660,7 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
 		copy = mtl_render_copyfunc;
 	else if (IS_DG2(devid))
 		copy = gen12p71_render_copyfunc;
-	else if (AT_LEAST_GEN(devid, 20))
+	else if (intel_gen(devid) >= 20)
 		copy = xe2_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index a21df1e8cf77..1b0f27917750 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1987,7 +1987,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		if (create_mapping && region != system_memory(blt->fd))
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
-		if (AT_LEAST_GEN(intel_get_drm_devid(blt->fd), 20) && compression) {
+		if (intel_gen(intel_get_drm_devid(blt->fd)) >= 20 && compression) {
 			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
@@ -2214,7 +2214,7 @@ void blt_surface_get_flatccs_data(int fd,
 		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
 		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
 
-		if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && obj->compression) {
+		if (intel_gen(intel_get_drm_devid(fd)) >= 20 && obj->compression) {
 			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
 			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 		}
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index edf75c088724..5d6191ac92a3 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -52,7 +52,7 @@
 #include "igt.h"
 #include "intel_cmds_info.h"
 
-#define CCS_RATIO(fd) (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) ? 512 : 256)
+#define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
 
 enum blt_color_depth {
 	CD_8bit,
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 1dfc12bf45f7..600a485362b5 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -973,7 +973,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 		} else {
 			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
 
-			if (AT_LEAST_GEN(bops->devid, 20) && compression)
+			if (intel_gen(bops->devid) >= 20 && compression)
 				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 
 			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
@@ -1015,7 +1015,7 @@ void intel_buf_init(struct buf_ops *bops,
 	uint64_t region;
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && AT_LEAST_GEN(bops->devid, 20))
+	if (compression && intel_gen(bops->devid) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
@@ -1041,7 +1041,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 {
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-	if (compression && AT_LEAST_GEN(bops->devid, 20))
+	if (compression && intel_gen(bops->devid) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
@@ -1112,7 +1112,7 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(handle);
 	igt_assert(size);
 
-	if (compression && AT_LEAST_GEN(bops->devid, 20))
+	if (compression && intel_gen(bops->devid) >= 20)
 		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 85c075a4ad8b..0c04476bf39d 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -209,7 +209,6 @@ void intel_check_pch(void);
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
-#define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
 
 #define IS_GEN2(devid)		IS_GEN(devid, 2)
 #define IS_GEN3(devid)		IS_GEN(devid, 3)
@@ -224,12 +223,12 @@ void intel_check_pch(void);
 #define IS_GEN12(devid)		IS_GEN(devid, 12)
 
 #define IS_MOBILE(devid)	(intel_get_device_info(devid)->is_mobile)
-#define IS_965(devid)		AT_LEAST_GEN(devid, 4)
+#define IS_965(devid)		(intel_gen(devid) >= 4)
 
-#define HAS_BSD_RING(devid)	AT_LEAST_GEN(devid, 5)
-#define HAS_BLT_RING(devid)	AT_LEAST_GEN(devid, 6)
+#define HAS_BSD_RING(devid)	(intel_gen(devid) >= 5)
+#define HAS_BLT_RING(devid)	(intel_gen(devid) >= 6)
 
-#define HAS_PCH_SPLIT(devid)	(AT_LEAST_GEN(devid, 5) && \
+#define HAS_PCH_SPLIT(devid)	(intel_gen(devid) >= 5 && \
 				 !(IS_VALLEYVIEW(devid) || \
 				   IS_CHERRYVIEW(devid) || \
 				   IS_BROXTON(devid)))
diff --git a/lib/intel_common.c b/lib/intel_common.c
index 4cee70c53a89..8b8f4652adf5 100644
--- a/lib/intel_common.c
+++ b/lib/intel_common.c
@@ -91,7 +91,7 @@ bool is_intel_region_compressible(int fd, uint64_t region)
 		return true;
 
 	/* Integrated Xe2+ supports compression on system memory */
-	if (AT_LEAST_GEN(devid, 20) && !is_dgfx && is_intel_system_region(fd, region))
+	if (intel_gen(devid) >= 20 && !is_dgfx && is_intel_system_region(fd, region))
 		return true;
 
 	/* Discrete supports compression on vram */
diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index b0559e0a59f5..5698c6cca0f7 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -68,7 +68,7 @@ uint8_t intel_get_defer_to_pat_mocs_index(int fd)
 	struct drm_intel_mocs_index mocs;
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(AT_LEAST_GEN(dev_id, 20));
+	igt_assert(intel_gen(dev_id) >= 20);
 
 	get_mocs_index(fd, &mocs);
 
diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index b72fbfadfebb..7f175b057927 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -70,7 +70,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
 	struct intel_pat_cache pat = {};
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	igt_assert(AT_LEAST_GEN(dev_id, 20));
+	igt_assert(intel_gen(dev_id) >= 20);
 
 	intel_get_pat_idx(fd, &pat);
 	return pat.uc_comp;
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 719307e6f45b..e6e5b8214866 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -256,7 +256,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
 	else if (buf->compression == I915_COMPRESSION_RENDER) {
-		if (AT_LEAST_GEN(ibb->devid, 20))
+		if (intel_gen(ibb->devid) >= 20)
 			ss->ss6.aux_mode = 0x0; /* AUX_NONE, unified compression */
 		else
 			ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
@@ -303,7 +303,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
 			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
 
-			if (AT_LEAST_GEN(ibb->devid, 20))
+			if (intel_gen(ibb->devid) >= 20)
 				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
 			else
 				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
@@ -681,7 +681,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	/* WaBindlessSurfaceStateModifyEnable:skl,bxt */
 	/* The length has to be one less if we dont modify
 	   bindless state */
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | 20);
 	else
 		intel_bb_out(ibb, GEN4_STATE_BASE_ADDRESS | (19 - 1 - 2));
@@ -726,7 +726,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
 
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20)) {
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
 		/* Bindless sampler */
 		intel_bb_out(ibb, 0);
 		intel_bb_out(ibb, 0);
@@ -899,7 +899,7 @@ gen9_emit_ds(struct intel_bb *ibb) {
 
 static void
 gen8_emit_wm_hz_op(struct intel_bb *ibb) {
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20)) {
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20) {
 		intel_bb_out(ibb, GEN8_3DSTATE_WM_HZ_OP | (6-2));
 		intel_bb_out(ibb, 0);
 	} else {
@@ -989,7 +989,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, 0);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, kernel | 1);
 	else
 		intel_bb_out(ibb, kernel);
@@ -1006,7 +1006,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, (max_threads - 1) << GEN8_3DSTATE_PS_MAX_THREADS_SHIFT |
 	             GEN6_3DSTATE_WM_16_DISPATCH_ENABLE |
 	             (fast_clear ? GEN8_3DSTATE_FAST_CLEAR_ENABLE : 0));
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, 6 << GEN6_3DSTATE_WM_DISPATCH_START_GRF_0_SHIFT |
 			     GENXE_KERNEL0_POLY_PACK16_FIXED << GENXE_KERNEL0_PACKING_POLICY);
 	else
@@ -1061,7 +1061,7 @@ gen9_emit_depth(struct intel_bb *ibb)
 
 static void
 gen7_emit_clear(struct intel_bb *ibb) {
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		return;
 
 	intel_bb_out(ibb, GEN7_3DSTATE_CLEAR_PARAMS | (3-2));
@@ -1072,7 +1072,7 @@ gen7_emit_clear(struct intel_bb *ibb) {
 static void
 gen6_emit_drawing_rectangle(struct intel_bb *ibb, const struct intel_buf *dst)
 {
-	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+	if (intel_gen(intel_get_drm_devid(ibb->fd)) >= 20)
 		intel_bb_out(ibb, GENXE2_3DSTATE_DRAWING_RECTANGLE_FAST | (4 - 2));
 	else
 		intel_bb_out(ibb, GEN4_3DSTATE_DRAWING_RECTANGLE | (4 - 2));
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 8be8ac58e576..49c8828d2450 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -394,7 +394,7 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
-	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &&
+	uint32_t region = (intel_gen(intel_get_drm_devid(fb->fd)) >= 20 &&
 			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
 
 	struct drm_xe_engine_class_instance inst = {
@@ -474,7 +474,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 	igt_assert_eq(0, gem_munmap(map, fb->size));
 
 	/* randomize also ccs surface on Xe2 */
-	if (AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 20))
+	if (intel_gen(intel_get_drm_devid(drm_fd)) >= 20)
 		access_flat_ccs_surface(fb, false);
 }
 
@@ -1031,10 +1031,10 @@ static void test_output(data_t *data, const int testnum)
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
 			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
 			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
-				igt_require_f(AT_LEAST_GEN(dev_id, 20),
+				igt_require_f(intel_gen(dev_id) >= 20,
 					      "Xe2 platform needed.\n");
 			} else {
-				igt_require_f(intel_get_device_info(dev_id)->graphics_ver < 20,
+				igt_require_f(intel_gen(dev_id) < 20,
 					      "Older than Xe2 platform needed.\n");
 			}
 
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index edf6f8d4e54c..6d134ea6264a 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -185,7 +185,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 	 * For older GENs FBC is still expected to be disabled as it still
 	 * relies on a tiled and fenceable framebuffer to track modifications.
 	 */
-	if (AT_LEAST_GEN(intel_get_drm_devid(drm->fd), 9)) {
+	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
 		if (!fbc_wait_until_enabled(drm->debugfs_fd))
 			return false;
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0646af62e51c..b7e3f73793b5 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3384,12 +3384,12 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 
 	switch (tiling) {
 	case TILING_LINEAR:
-		return AT_LEAST_GEN(drm.devid, 9);
+		return intel_gen(drm.devid) >= 9;
 	case TILING_X:
 	case TILING_Y:
 		return true;
 	case TILING_4:
-		return AT_LEAST_GEN(drm.devid, 12);
+		return intel_gen(drm.devid) >= 12;
 	default:
 		igt_assert(false);
 		return false;
@@ -4767,7 +4767,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					igt_require(igt_draw_supports_method(drm.fd, t.method));
 
 					if (t.tiling == TILING_Y) {
-						igt_require(AT_LEAST_GEN(drm.devid, 9));
+						igt_require(intel_gen(drm.devid) >= 9);
 						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
 					}
 
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index c5a103c945a2..681d94844e69 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -801,7 +801,7 @@ oa_report_ctx_is_valid(uint32_t *report)
 		return false; /* TODO */
 	} else if (IS_GEN8(devid)) {
 		return report[0] & (1ul << 25);
-	} else if (AT_LEAST_GEN(devid, 9)) {
+	} else if (intel_gen(devid) >= 9) {
 		return report[0] & (1ul << 16);
 	}
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index e656e5123841..a2d18588fb17 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -119,7 +119,7 @@ static void surf_copy(int xe,
 	int result;
 
 	igt_assert(mid->compression);
-	if (AT_LEAST_GEN(devid, 20) && mid->compression) {
+	if (intel_gen(devid) >= 20 && mid->compression) {
 		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
 	}
@@ -168,7 +168,7 @@ static void surf_copy(int xe,
 			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
 				igt_assert(!strcmp(orig, newsum));
 				igt_assert(!strcmp(orig2, newsum2));
-			} else if (AT_LEAST_GEN(devid, 20)) {
+			} else if (intel_gen(devid) >= 20) {
 				if (is_intel_dgfx(xe)) {
 					/* buffer object would become
 					 * uncompressed in xe2+ dgfx
@@ -218,7 +218,7 @@ static void surf_copy(int xe,
 	 * uncompressed in xe2+ dgfx, and therefore retrieve the
 	 * ccs by copying 0 to ccsmap
 	 */
-	if (suspend_resume && AT_LEAST_GEN(devid, 20) && is_intel_dgfx(xe))
+	if (suspend_resume && intel_gen(devid) >= 20 && is_intel_dgfx(xe))
 		memset(ccsmap, 0, ccssize);
 	else
 		/* retrieve back ccs */
@@ -344,7 +344,7 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
+	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -432,7 +432,7 @@ static void block_copy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && config->compression)
+		if (intel_gen(intel_get_drm_devid(xe)) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
@@ -479,7 +479,7 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
+	uint32_t mid_region = (intel_gen(intel_get_drm_devid(xe)) >= 20 &&
 			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
@@ -521,7 +521,7 @@ static void block_multicopy(int xe,
 	if (config->inplace) {
 		uint8_t pat_index = DEFAULT_PAT_INDEX;
 
-		if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && config->compression)
+		if (intel_gen(intel_get_drm_devid(xe)) >= 20 && config->compression)
 			pat_index = intel_get_pat_idx_uc_comp(xe);
 
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
@@ -621,7 +621,7 @@ static void block_copy_test(int xe,
 	struct igt_collection *regions;
 	int tiling;
 
-	if (AT_LEAST_GEN(dev_id, 20) && config->compression)
+	if (intel_gen(dev_id) >= 20 && config->compression)
 		igt_require(HAS_FLATCCS(dev_id));
 
 	if (config->compression && !blt_block_copy_supports_compression(xe))
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index a7c567c45ce2..700575031375 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -105,7 +105,7 @@ test_base(int fd, struct drm_xe_query_config *config)
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-	if (!AT_LEAST_GEN(devid, 20)) {
+	if (intel_gen(devid) < 20) {
 		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
 		case 48:
 			val = 3;
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 3a0a83135d40..732049fb0116 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -404,7 +404,7 @@ test_query_gt_topology(int fd)
 	}
 
 	/* sanity check EU type */
-	if (IS_PONTEVECCHIO(dev_id) || AT_LEAST_GEN(dev_id, 20)) {
+	if (IS_PONTEVECCHIO(dev_id) || intel_gen(dev_id) >= 20) {
 		igt_assert(topo_types & (1 << DRM_XE_TOPO_SIMD16_EU_PER_DSS));
 		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
 	} else {
-- 
2.44.2

