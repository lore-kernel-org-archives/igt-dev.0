Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CB1C77B7C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 05:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B2110E1FD;
	Wed, 25 Jun 2025 05:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPAZbguJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2D310E66A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750831059; x=1782367059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4iOp4t4HDwdxARE/ArHzZSrIdWrXHAaRCXf+fC80/YY=;
 b=bPAZbguJ6ucOuZScrHwy1dkgvhRyKN0cBkhK79ycwnJEwJf+biopDyN7
 dFcQUVrAFd5gbSGav9b5wSP7MpKPnRrgqj1bHRJ6mbHr934584cUngEMf
 hKoejLr0NAOAiiRDCteNhUqrRtU7skd7FmRZLsFOLTgj24JvBOxHqkbbf
 0a1xJ4N7yr73lQkKOKoXveIPB99UpToZx4yeJXByWZOMIqVJNlf+ebbrK
 sZLWPQRYiIVzeUyIcaLKhmqEpdkueX+UHmCj+Z0p6SrQDdM1Nagv/j7xA
 IMohWQEB8OLRzinAQEUku1W8TnXhwsvjK9SF/hgg6Qys2SfLUhFmnvAjT g==;
X-CSE-ConnectionGUID: So5idDndRw29hhNAX663vw==
X-CSE-MsgGUID: dSRkfOQOQ2OHz8HGqT8Sjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63349893"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="63349893"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 22:57:39 -0700
X-CSE-ConnectionGUID: uRsjpjscSm6ivE3w0hzqaw==
X-CSE-MsgGUID: 7EwRuUD4T3e3bzanGjOFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="157619766"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 22:57:36 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Nidhi Gupta <nidhi1.gupta@intel.com>
Subject: [PATCH i-g-t] tests/kms_prime: Add xe support
Date: Wed, 25 Jun 2025 11:25:13 +0530
Message-Id: <20250625055513.623777-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add buffer creation, mapping, and BLT copy support for Xe GPUs.
Update scratch buffer and framebuffer preparation to handle Xe dGPU.
Extend import logic to use BLT copy for Xe dGPU importers.
Add basic modeset path for Xe dGPU with VRAM-backed buffers.
Improve test coverage for hybrid and discrete GPU scenarios.

This work is a continuation of:
https://patchwork.freedesktop.org/series/128045/

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_prime.c | 202 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 184 insertions(+), 18 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1d011327c..dc28d29b3 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -39,6 +39,14 @@
 #include <sys/ioctl.h>
 #include <time.h>
 
+#include <xe/xe_ioctl.h>
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+
+#include <intel_blt.h>
+#include "intel_pat.h"
+#include "intel_common.h"
+
 /**
  * SUBTEST: D3hot
  * Description: Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU
@@ -128,24 +136,64 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	return output;
 }
 
+static uint32_t *prepare_xe_dgfx_scratch(int exporter_fd, struct dumb_bo *scratch)
+{
+	uint64_t bo_size;
+	uint32_t *ptr;
+	struct blt_copy_data ex_blt = {};
+	struct blt_copy_object *src = NULL;
+	uint32_t region;
+
+	region = DRM_XE_MEM_REGION_CLASS_VRAM;
+	bo_size = xe_bb_size(exporter_fd, SZ_4K);
+
+	igt_info("Preparing scratch buffer for DGfx exporter\n");
+
+	xe_bo_create(exporter_fd, 0, bo_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
+			DRM_XE_GEM_CREATE_FLAG_SCANOUT);
+	blt_copy_init(exporter_fd, &ex_blt);
+	src = blt_create_object(&ex_blt, region,
+				scratch->width, scratch->height,
+				scratch->bpp, 0, T_LINEAR,
+				COMPRESSION_DISABLED, 0, true);
+	scratch->handle = src->handle;
+	scratch->size = src->size;
+	scratch->pitch = src->pitch;
+	ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
+				       scratch->size, PROT_WRITE);
+	return ptr;
+}
+
 static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 			    drmModeModeInfo *mode, uint32_t color)
 {
 	uint32_t *ptr;
+	bool is_dgfx;
+
+	is_dgfx = is_intel_dgfx(exporter_fd);
 
 	scratch->width = mode->hdisplay;
 	scratch->height = mode->vdisplay;
 	scratch->bpp = 32;
 
-	if (!is_i915_device(exporter_fd)) {
-		scratch->handle = kmstest_dumb_create(exporter_fd,
-						      ALIGN(scratch->width, 256),
-						      scratch->height, scratch->bpp,
-						      &scratch->pitch, &scratch->size);
-
-		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
-					      scratch->size, PROT_WRITE);
-	} else {
+	if (is_xe_device(exporter_fd)) {
+		if (is_dgfx) {
+			ptr = prepare_xe_dgfx_scratch(exporter_fd, scratch);
+			if (ptr == MAP_FAILED) {
+				igt_info("Failed to map scratch buffer\n");
+				return;
+			}
+		} else {
+			printf("Creating scratch buffer for color %#08x\n", color);
+			scratch->handle = kmstest_dumb_create(exporter_fd,
+							      scratch->width,
+							      scratch->height, scratch->bpp,
+							      &scratch->pitch, &scratch->size);
+
+			ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
+						      scratch->size, PROT_WRITE | PROT_READ);
+		}
+	} else if (is_i915_device(exporter_fd)) {
 		struct igt_fb fb;
 
 		igt_init_fb(&fb, exporter_fd, mode->hdisplay, mode->vdisplay,
@@ -165,6 +213,14 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
 		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
 						PROT_WRITE | PROT_READ);
+	} else {
+		scratch->handle = kmstest_dumb_create(exporter_fd,
+						      ALIGN(scratch->width, 256),
+						      scratch->height, scratch->bpp,
+						      &scratch->pitch, &scratch->size);
+
+		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
+					      scratch->size, PROT_WRITE);
 	}
 
 	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
@@ -184,7 +240,7 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 }
 
 static void import_fb(int importer_fd, struct igt_fb *fb,
-		      int dmabuf_fd, uint32_t pitch)
+		      int dmabuf_fd, struct dumb_bo *scratch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
@@ -197,13 +253,17 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			igt_info("Importer is dGPU\n");
 			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
 			igt_assert(temp_buf_handle > 0);
-			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
-								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
+			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width,
+								       fb->height, fb->drm_format,
+								       fb->modifier, scratch->pitch,
+								       &fb_size, NULL, NULL);
 			igt_assert(fb->gem_handle > 0);
 
 			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
-					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
-					     fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier,
+					     0, scratch->pitch, fb->modifier,
+					     0, 0, fb_size, fb->width,
+					     fb->height, 32, fb->gem_handle,
+					     0, scratch->pitch, fb->modifier,
 					     0, 0, fb_size);
 
 			gem_sync(importer_fd, fb->gem_handle);
@@ -212,12 +272,83 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 		} else {
 			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
 		}
+	} else if (is_xe_device(importer_fd)) {
+		if (is_intel_dgfx(importer_fd)) {
+			uint64_t ahnd;
+			uint32_t vm, exec_queue;
+			intel_ctx_t *ctx;
+			struct blt_copy_object *src = NULL, *dst = NULL;
+			struct blt_copy_data im_blt = {0};
+			uint32_t bb;
+
+			struct drm_xe_engine_class_instance inst = {
+				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			};
+
+			igt_info("importer is dGPU xe\n");
+			vm = xe_vm_create(importer_fd, 0, 0);
+			exec_queue = xe_exec_queue_create(importer_fd, vm, &inst, 0);
+			ctx = intel_ctx_xe(importer_fd, vm, exec_queue, 0, 0, 0);
+			ahnd = intel_allocator_open_full(importer_fd, ctx->vm, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+			// Import the dmabuf as a handle
+			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+			igt_assert(temp_buf_handle > 0);
+
+			igt_init_fb(fb, importer_fd, scratch->width, scratch->height,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+
+			igt_calc_fb_size(fb);
+
+			fb->gem_handle = xe_bo_create(importer_fd, 0, fb->size,
+						      vram_if_possible(importer_fd, 0), 0);
+			igt_require(fb->gem_handle);
+
+			blt_copy_init(importer_fd, &im_blt);
+
+			src = blt_create_object(&im_blt, vram_if_possible(importer_fd, 0),
+						scratch->width, scratch->height, 32, 0,
+						T_LINEAR, COMPRESSION_DISABLED, 0, true);
+			blt_set_object(src, temp_buf_handle, scratch->size,
+				       vram_if_possible(importer_fd, 0), 0,
+				       DEFAULT_PAT_INDEX,
+				       T_LINEAR, COMPRESSION_DISABLED, 0);
+
+			dst = blt_create_object(&im_blt, vram_if_possible(importer_fd, 0),
+						scratch->width, scratch->height, 32, 0,
+						T_LINEAR, COMPRESSION_DISABLED, 0, true);
+			blt_set_object(dst, fb->gem_handle, fb->size,
+				       vram_if_possible(importer_fd, 0), 0,
+				       DEFAULT_PAT_INDEX,
+				       T_LINEAR, COMPRESSION_DISABLED, 0);
+
+			im_blt.color_depth = CD_32bit;
+			blt_set_copy_object(&im_blt.src, src);
+			blt_set_copy_object(&im_blt.dst, dst);
+
+			bb = xe_bo_create(importer_fd, 0, fb->size,
+					  vram_if_possible(importer_fd, 0), 0);
+
+			blt_set_batch(&im_blt.bb, bb, fb->size, vram_if_possible(importer_fd, 0));
+			blt_fast_copy(importer_fd, ctx, NULL, ahnd, &im_blt);
+
+			put_offset(ahnd, dst->handle);
+			put_offset(ahnd, src->handle);
+			put_offset(ahnd, bb);
+			intel_allocator_bind(ahnd, 0, 0);
+			put_ahnd(ahnd);
+		} else {
+			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		}
 	} else {
 		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
 	}
 
 	handles[0] = fb->gem_handle;
-	pitches[0] = pitch;
+	pitches[0] = scratch->pitch;
 	offsets[0] = 0;
 
 	ret = drmModeAddFB2(importer_fd, fb->width, fb->height,
@@ -252,7 +383,6 @@ static void collect_crc_for_fb(int importer_fd, struct igt_fb *fb, igt_display_t
 	info->str = igt_crc_to_string(&info->crc);
 	igt_debug("CRC through '%s' method for %#08x is %s\n",
 		  info->name, color, info->str);
-	igt_remove_fb(importer_fd, fb);
 }
 
 static void test_crc(int exporter_fd, int importer_fd)
@@ -284,7 +414,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 		gem_close(exporter_fd, scratch.handle);
 
 		prepare_fb(importer_fd, &scratch, &fb);
-		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
+		import_fb(importer_fd, &fb, dmabuf_fd, &scratch);
 		close(dmabuf_fd);
 
 		colors[i].prime_crc.name = "prime";
@@ -320,7 +450,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 			}
 			crc_equal = igt_check_crc_equal(&colors[i].prime_crc.crc,
 							&colors[j].direct_crc.crc);
-			igt_assert_f(!crc_equal, "CRC should be different");
+			igt_assert_f(!crc_equal, "CRC should be different\n");
 		}
 	}
 	igt_display_fini(&display);
@@ -333,6 +463,9 @@ static void test_basic_modeset(int drm_fd)
 	enum pipe pipe;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	uint32_t bo;
+	int ret;
+	uint32_t offsets[4] = { 0 };
 
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
@@ -341,6 +474,39 @@ static void test_basic_modeset(int drm_fd)
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
+	if (is_xe_device(drm_fd) && xe_has_vram(drm_fd)) {
+		uint32_t strides[4] = { ALIGN(mode->hdisplay * 4, 64) };
+
+		igt_info("Doing modeset on discrete\n");
+
+		igt_init_fb(&fb, drm_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&fb);
+
+		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0), 0);
+		igt_require(bo);
+
+		ret = __kms_addfb(drm_fd, bo,
+			  mode->hdisplay, mode->vdisplay,
+			  DRM_FORMAT_XRGB8888,
+			  DRM_FORMAT_MOD_LINEAR,
+			  strides, offsets, 1,
+			  DRM_MODE_FB_MODIFIERS, &fb.fb_id);
+
+		igt_assert_eq(ret, 0);
+
+		set_fb(&fb, &display, output);
+		gem_close(drm_fd, bo);
+
+		cairo_surface_destroy(fb.cairo_surface);
+		do_or_die(drmModeRmFB(drm_fd, fb.fb_id));
+
+		igt_display_fini(&display);
+		igt_info("Modeset on discrete done\n");
+		return;
+	}
+
 	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
 
-- 
2.34.1

