Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FE9C47DA9
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 18:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB971132C6;
	Tue, 30 Jan 2024 18:09:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E511132BD
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 18:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706638179; x=1738174179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wHCfkTuWR9dFSysTAKWsKyv1HhOT4L2ybW0qcslvACk=;
 b=cApiC/iHMdcSmKAKTQiXputiJHlCryquyPQZY61n+59Pv7GroUD+GENy
 8mpJnB3Kw4umLfCZBAGamShtVlaQ//ZgeBbJyE2mWJrzg9f+unlhExZEq
 Q9bnOJzpgTjwJWgXauGihpcMUwWM1rOIX0CvEbILlXJkYWjHYg9HeLFYR
 Qtt0X2+kYjaeIqxU+XRgtLR4pKOJCdx15z5kiCXwawXCkHddBdQajl4wO
 bHUhKH9k1eXITKanKFVvIExj146rFtkds7wXvZCG0GSM9b4NF2Vk5QFa2
 gicNRbi+6eUkYz9mMnPUSXTS9TVJk0YzmjfpcKg48jBQrXcCmYFkb4h8K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="21880876"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="21880876"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 10:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788273826"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="788273826"
Received: from linux-2012-client-platform.iind.intel.com ([10.223.74.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 10:09:34 -0800
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5] tests/kms_prime: Add XE support
Date: Tue, 30 Jan 2024 23:50:33 +0530
Message-Id: <20240130182033.24900-1-nidhi1.gupta@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add XE driver support for kms tests.

V2: - Use rendercopy method for both i915 & xe
    - Minor cleanup
V3: - New patch for cleanup & rendercopy
V4: - Fallback to blitter
V5: - Rebase
v7: - Rebase and patch cleanup
v8: - D3hot subtest is not required for xe
v9: - nitpicks (Matthew)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_prime.c | 188 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 154 insertions(+), 34 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 135c75168..f5f55a65a 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -36,10 +36,16 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include <fcntl.h>
+#include <limits.h>
 
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
+#include "lib/intel_blt.h"
+#include "lib/intel_mocs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
 
 /**
  * SUBTEST: D3hot
@@ -120,10 +126,14 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, *pipe);
-		if (intel_pipe_output_combo_valid(display)) {
-			found = true;
-			break;
+		if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
+		   (is_xe_device(importer_fd) && xe_has_vram(importer_fd))) {
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
 		}
+
+		found = true;
+		break;
 	}
 
 	igt_require_f(found, "No valid connector/pipe found\n");
@@ -131,6 +141,25 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	return output;
 }
 
+static igt_output_t *setup_hybrid_display(int importer_fd, igt_display_t *display,
+				   enum pipe *pipe)
+{
+	igt_output_t *output;
+	bool found = false;
+
+	for_each_pipe_with_valid_output(display, *pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, *pipe);
+
+		found = true;
+		break; /*Validation on single pipe is enough*/
+	}
+
+	igt_require_f(found, "No valid connector/pipe found\n");
+
+	return output;
+}
 static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 			    drmModeModeInfo *mode, uint32_t color)
 {
@@ -140,7 +169,29 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 	scratch->height = mode->vdisplay;
 	scratch->bpp = 32;
 
-	if (!is_i915_device(exporter_fd)) {
+	if (is_intel_device(exporter_fd)) {
+		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
+
+		if (is_i915_device(exporter_fd)) {
+			if (gem_has_lmem(exporter_fd))
+				scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
+								       REGION_LMEM(0), REGION_SMEM);
+			else
+				scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
+								       REGION_SMEM);
+
+			ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0,
+							scratch->size, PROT_WRITE | PROT_READ);
+		} else {
+			scratch->handle = xe_bo_create(exporter_fd, 0,
+							     ALIGN(scratch->size, xe_get_default_alignment(exporter_fd)),
+							     vram_if_possible(exporter_fd, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+			ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle,
+					     scratch->size, PROT_READ | PROT_WRITE);
+		}
+	} else {
 		scratch->handle = kmstest_dumb_create(exporter_fd,
 						      ALIGN(scratch->width, 256),
 						      scratch->height, scratch->bpp,
@@ -148,18 +199,6 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
 		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
 					      scratch->size, PROT_WRITE);
-	} else {
-		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
-		if (gem_has_lmem(exporter_fd))
-			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
-								       REGION_LMEM(0), REGION_SMEM);
-		else
-			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
-								       REGION_SMEM);
-
-		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
-						PROT_WRITE | PROT_READ);
 	}
 
 	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
@@ -178,23 +217,52 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 		    color_encoding, color_range);
 }
 
+static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
+					   uint32_t memregion, uint32_t pitch)
+{
+	uint32_t name, handle;
+	struct blt_copy_object *blt;
+
+	blt = malloc(sizeof(*blt));
+	igt_assert(blt);
+
+	name = gem_flink(fb->fd, fb->gem_handle);
+	handle = gem_open(fb->fd, name);
+
+	blt_set_object(blt, handle, fb->size, memregion,
+		       intel_get_uc_mocs_index(fb->fd),
+		       0, 0, 0, 0);
+
+	blt_set_geom(blt, pitch, 0, 0, fb->width, fb->height, 0, 0);
+
+	blt->plane_offset = 0;
+
+	blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
+				  PROT_READ | PROT_WRITE);
+	return blt;
+}
+
 static void import_fb(int importer_fd, struct igt_fb *fb,
 		      int dmabuf_fd, uint32_t pitch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
+	struct igt_fb dst_fb;
 
-	if (is_i915_device(importer_fd)) {
-		if (gem_has_lmem(importer_fd)) {
-			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
-			uint64_t fb_size = 0;
+	if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
+	    (is_xe_device(importer_fd) && xe_has_vram(importer_fd)))  {
+		uint64_t fb_size = 0;
+		uint64_t ahnd = 0;
 
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle > 0);
-			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
-								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
-			igt_assert(fb->gem_handle > 0);
+		igt_info("Importer is dGPU\n");
+		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(temp_buf_handle > 0);
+		fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
+							       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
+		igt_assert(fb->gem_handle > 0);
+
+		if (is_i915_device(importer_fd)) {
+			ahnd = get_reloc_ahnd(importer_fd, 0);
 
 			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
 					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
@@ -205,7 +273,63 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			gem_close(importer_fd, temp_buf_handle);
 			put_ahnd(ahnd);
 		} else {
-			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+			uint32_t xe_bb;
+			uint64_t bb_size = 4096;
+			struct blt_copy_data blt = {};
+			struct blt_copy_object *src, *dst;
+			struct blt_block_copy_data_ext ext = {};
+			uint32_t mem_region;
+			intel_ctx_t *xe_ctx;
+			uint32_t vm, xe_exec;
+
+			struct drm_xe_engine_class_instance inst = {
+				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			};
+			vm = xe_vm_create(importer_fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+			xe_exec = xe_exec_queue_create(importer_fd, vm, &inst, 0);
+			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
+			mem_region = vram_if_possible(importer_fd, 0);
+
+			ahnd = intel_allocator_open_full(importer_fd, xe_ctx->vm, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+			bb_size = ALIGN(bb_size + xe_cs_prefetch_size(importer_fd),
+					xe_get_default_alignment(importer_fd));
+			bb_size = xe_bb_size(importer_fd, bb_size);
+			xe_bb = xe_bo_create(importer_fd, 0, bb_size, mem_region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+
+
+			igt_init_fb(&dst_fb, importer_fd, fb->width, fb->height,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+			dst_fb.gem_handle = temp_buf_handle;
+
+			src = blt_fb_init(fb, mem_region, pitch);
+			dst = blt_fb_init(&dst_fb, mem_region, pitch);
+
+			blt_copy_init(importer_fd, &blt);
+			blt.color_depth = 32;
+			blt_set_copy_object(&blt.src, src);
+			blt_set_copy_object(&blt.dst, dst);
+
+			blt_set_object_ext(&ext.src, 0, fb->width, fb->height,
+					   SURFACE_TYPE_2D);
+			blt_set_object_ext(&ext.dst, 0, fb->width, fb->height,
+					   SURFACE_TYPE_2D);
+
+			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
+
+			blt_block_copy(importer_fd, xe_ctx, NULL, ahnd, &blt, &ext);
+
+			blt_destroy_object(importer_fd, dst);
+
+			put_ahnd(ahnd);
+			gem_close(importer_fd, xe_bb);
+			xe_exec_queue_destroy(importer_fd, xe_exec);
+			xe_vm_destroy(importer_fd, vm);
+			free(xe_ctx);
 		}
 	} else {
 		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
@@ -332,7 +456,7 @@ static void test_basic_modeset(int drm_fd)
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
 
-	output = setup_display(drm_fd, &display, &pipe);
+	output = setup_hybrid_display(drm_fd, &display, &pipe);
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
@@ -470,6 +594,8 @@ igt_main
 			igt_require(second_fd_vgem >= 0);
 			if (is_i915_device(first_fd))
 				igt_require(!gem_has_lmem(first_fd));
+			if (is_xe_device(first_fd))
+				igt_require(!xe_has_vram(first_fd));
 		}
 
 		igt_describe("Make a dumb color buffer, export to another device and"
@@ -480,11 +606,5 @@ igt_main
 				igt_dynamic("second-to-first")
 					test_crc(second_fd_vgem, first_fd);
 		}
-
-		igt_fixture
-			drm_close_driver(second_fd_vgem);
 	}
-
-	igt_fixture
-		drm_close_driver(first_fd);
 }
-- 
2.39.0

