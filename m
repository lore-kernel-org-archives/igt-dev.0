Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0126BCCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB83410E578;
	Tue,  4 Nov 2025 09:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8rsu6Kq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4910E56E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762246932; x=1793782932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QtbJZY/K1YOlkX1N75xtTC/W9uOQMZZaChlnEN3l8+I=;
 b=T8rsu6KqpX35IzjygsiPMr889BliEoEcfA7KWbpbejwlgpE/QjPMQNpz
 BGJmLM+dPQ+1k70an95IVbcX5WIrzFo/hFZRLr4O/oEAEDK77BQIHAPP3
 mnU8X3FCERxwscfboaxIlO82ZQZKU1ouyGeX1CuZqKQ6QpFgnbdQOE2uI
 gtMJl0k2yghBquDM1hXoJeeOwujVAv2x9JTfhMHfm0nkNYTOWPZcrJcKq
 R3wDAcrM8whawV5RH5wI0yR88eGFQIA3IUmDt66t+FZadusxPe/m/N0vV
 aFD3bT6EvE1VEEJ3Ly3UE+M1XtDmu+MgTbgj88k8dbF+yXXH1DHpU1fwJ g==;
X-CSE-ConnectionGUID: Iw8dQW9NRemBCZ16b3O6Nw==
X-CSE-MsgGUID: slGX6v6YSSKxlA9gtRcBKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64032928"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64032928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:12 -0800
X-CSE-ConnectionGUID: wxoTfoFkQO+obSGErCMoeg==
X-CSE-MsgGUID: xctGkmT6TeiETxT/cp9uSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="224354194"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:09 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v16 1/3] tests/kms_prime: Add XE support
Date: Tue,  4 Nov 2025 14:26:38 +0530
Message-Id: <20251104085640.795121-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
References: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
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
v10:- Rebase
v11:- Split the commits per subtest and refactor code (Kamil, Kunal)
      - Enable basic-crc-hybrid subtest for xe.
      - Added Xe Prime support for hybrid graphics by enabling
        buffer sharing between integrated and discrete GPUs.
      - Refactor buffer creation function for Xe discrete buffers.
      - Introduced helper functions for creating and mapping dumb buffers.
      	Also, implement fast buffer import for Xe discrete GPUs
	using BLT copy operations.
v12: Fix CRC mismatch by using correct color depth constant.
v13: Align B0 width to 256 for consitancy with existing logic,
     cleanup of xe resources after use (Kunal)
     - Reorder header includes and add missing closing calls (Kamil)
v14: Include igt headers in appropriate order (Kamil)
     - Fix VGEM detection before checking for Intel dGPU
v15: cleanup blt resources and avoid mutating width (Kunal)
v16: ADD *_VISIBLE_VRAM to all xe_bo_create() , so batch buffers and
     import buffers reside in visible VRAM , preventing SIGBUS/ invalid
     access on dGPU.
     - Fix incorrect blt_rdestroy_object param, and stop blt_destroy_obj
     for dst as it still wraps fb->gem_handle to avoid freeing as it is
     still needed for import.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_prime.c | 189 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 159 insertions(+), 30 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1d011327c..d210f23a9 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -29,15 +29,23 @@
  * Mega feature: General Display Features
  */
 
+#include <fcntl.h>
+#include <limits.h>
+#include <poll.h>
+#include <sys/ioctl.h>
+#include <time.h>
+
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
-#include <fcntl.h>
 
-#include <poll.h>
-#include <sys/ioctl.h>
-#include <time.h>
+#include "lib/intel_blt.h"
+#include "lib/intel_common.h"
+#include "lib/intel_pat.h"
+#include "lib/intel_mocs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 /**
  * SUBTEST: D3hot
@@ -128,24 +136,65 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	return output;
 }
 
+static uint32_t *create_and_map_dumb_bo(int fd, struct dumb_bo *bo,
+					uint32_t width, uint32_t height,
+					uint32_t bpp, uint32_t *pitch,
+					uint64_t *size)
+{
+	uint32_t *ptr;
+	const uint32_t alloc_w = ALIGN(width, 256);
+
+	bo->height = height;
+	bo->bpp = bpp;
+	bo->handle = kmstest_dumb_create(fd, alloc_w,
+					 bo->height, bo->bpp, pitch, size);
+
+	ptr = kmstest_dumb_map_buffer(fd, bo->handle, *size, PROT_READ | PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
+
+	return ptr;
+}
+
+static uint32_t *prepare_xe_dgfx_scratch(int exporter_fd, struct dumb_bo *scratch)
+{
+	uint32_t *ptr;
+	struct blt_copy_data ex_blt = {};
+	struct blt_copy_object *src = NULL;
+
+	igt_debug("Preparing scratch buffer for DGfx exporter\n");
+
+	blt_copy_init(exporter_fd, &ex_blt);
+	src = blt_create_object(&ex_blt, DRM_XE_MEM_REGION_CLASS_VRAM,
+				scratch->width, scratch->height,
+				scratch->bpp, 0, T_LINEAR,
+				COMPRESSION_DISABLED, 0, true);
+	scratch->handle = src->handle;
+	scratch->size = src->size;
+	scratch->pitch = src->pitch;
+	ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle, scratch->size,
+			     PROT_READ | PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
+	return ptr;
+}
+
 static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 			    drmModeModeInfo *mode, uint32_t color)
 {
 	uint32_t *ptr;
+	bool is_dgfx;
 
 	scratch->width = mode->hdisplay;
 	scratch->height = mode->vdisplay;
 	scratch->bpp = 32;
 
-	if (!is_i915_device(exporter_fd)) {
-		scratch->handle = kmstest_dumb_create(exporter_fd,
-						      ALIGN(scratch->width, 256),
-						      scratch->height, scratch->bpp,
-						      &scratch->pitch, &scratch->size);
+	if (drm_get_chipset(exporter_fd) == DRIVER_VGEM)
+		is_dgfx = false;
+	else
+		is_dgfx = is_intel_dgfx(exporter_fd);
 
-		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
-					      scratch->size, PROT_WRITE);
-	} else {
+	if (is_xe_device(exporter_fd) && is_dgfx) {
+		ptr = prepare_xe_dgfx_scratch(exporter_fd, scratch);
+	} else if (is_i915_device(exporter_fd)) {
 		struct igt_fb fb;
 
 		igt_init_fb(&fb, exporter_fd, mode->hdisplay, mode->vdisplay,
@@ -165,6 +214,11 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
 		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
 						PROT_WRITE | PROT_READ);
+	} else {
+		ptr = create_and_map_dumb_bo(exporter_fd, scratch,
+					     scratch->width, scratch->height,
+					     scratch->bpp, &scratch->pitch,
+					     &scratch->size);
 	}
 
 	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
@@ -184,40 +238,113 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 }
 
 static void import_fb(int importer_fd, struct igt_fb *fb,
-		      int dmabuf_fd, uint32_t pitch)
+		      int dmabuf_fd, struct dumb_bo *scratch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
 
-	if (is_i915_device(importer_fd)) {
-		if (gem_has_lmem(importer_fd)) {
-			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
-			uint64_t fb_size = 0;
+	igt_debug("Importing FB: importer_fd=%d, dmabuf_fd=%d, width=%u, height=%u\n",
+		  importer_fd, dmabuf_fd, fb->width, fb->height);
+
+	if (is_intel_dgfx(importer_fd)) {
+		uint64_t fb_size = 0;
+		uint64_t ahnd = 0;
 
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle > 0);
-			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
-								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
-			igt_assert(fb->gem_handle > 0);
+		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(temp_buf_handle > 0);
+		fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width,
+							       fb->height, fb->drm_format,
+							       fb->modifier, scratch->pitch,
+							       &fb_size, NULL, NULL);
+		igt_assert(fb->gem_handle > 0);
+
+		if (is_i915_device(importer_fd)) {
+			ahnd = get_reloc_ahnd(importer_fd, 0);
 
 			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
-					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
-					     fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier,
-					     0, 0, fb_size);
+						 0, scratch->pitch, fb->modifier,
+						 0, 0, fb_size, fb->width,
+						 fb->height, 32, fb->gem_handle,
+						 0, scratch->pitch, fb->modifier,
+						 0, 0, fb_size);
 
 			gem_sync(importer_fd, fb->gem_handle);
 			gem_close(importer_fd, temp_buf_handle);
 			put_ahnd(ahnd);
-		} else {
-			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		}  else if (is_xe_device(importer_fd)) {
+			uint32_t xe_bb;
+			struct blt_copy_data blt = {0};
+			struct blt_copy_object *src, *dst;
+			uint32_t vm, xe_exec;
+			intel_ctx_t *xe_ctx;
+
+			struct drm_xe_engine_class_instance inst = {
+				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			};
+
+			vm = xe_vm_create(importer_fd, 0, 0);
+			xe_exec = xe_exec_queue_create(importer_fd, vm, &inst, 0);
+			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
+			ahnd = intel_allocator_open_full(importer_fd, xe_ctx->vm, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+			igt_calc_fb_size(fb);
+
+			fb->gem_handle = xe_bo_create(importer_fd, 0, fb->size,
+						      vram_if_possible(importer_fd, 0),
+						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			igt_require(fb->gem_handle);
+
+			blt_copy_init(importer_fd, &blt);
+
+			src = blt_create_object(&blt, vram_if_possible(importer_fd, 0),
+						scratch->width, scratch->height, 32, 0,
+						T_LINEAR, COMPRESSION_DISABLED, 0, true);
+			blt_set_object(src, temp_buf_handle, scratch->size,
+				       vram_if_possible(importer_fd, 0), 0,
+				       DEFAULT_PAT_INDEX,
+				       T_LINEAR, COMPRESSION_DISABLED, 0);
+
+			dst = blt_create_object(&blt, vram_if_possible(importer_fd, 0),
+						scratch->width, scratch->height, 32, 0,
+						T_LINEAR, COMPRESSION_DISABLED, 0, true);
+			blt_set_object(dst, fb->gem_handle, fb->size,
+				       vram_if_possible(importer_fd, 0), 0,
+				       DEFAULT_PAT_INDEX,
+				       T_LINEAR, COMPRESSION_DISABLED, 0);
+
+			blt.color_depth = CD_32bit;
+			blt_set_copy_object(&blt.src, src);
+			blt_set_copy_object(&blt.dst, dst);
+
+			xe_bb = xe_bo_create(importer_fd, 0, fb->size,
+					     vram_if_possible(importer_fd, 0),
+					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+			blt_set_batch(&blt.bb, xe_bb, fb->size, vram_if_possible(importer_fd, 0));
+			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &blt);
+
+			put_offset(ahnd, dst->handle);
+			put_offset(ahnd, src->handle);
+			put_offset(ahnd, xe_bb);
+			intel_allocator_bind(ahnd, 0, 0);
+			put_ahnd(ahnd);
+
+			xe_exec_queue_destroy(importer_fd, xe_exec);
+			xe_vm_destroy(importer_fd, vm);
+			blt_destroy_object(importer_fd, src);
+			gem_close(importer_fd, xe_bb);
+			intel_allocator_close(ahnd);
+			intel_ctx_destroy(importer_fd, xe_ctx);
 		}
 	} else {
 		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(fb->gem_handle > 0);
 	}
 
 	handles[0] = fb->gem_handle;
-	pitches[0] = pitch;
+	pitches[0] = scratch->pitch;
 	offsets[0] = 0;
 
 	ret = drmModeAddFB2(importer_fd, fb->width, fb->height,
@@ -284,7 +411,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 		gem_close(exporter_fd, scratch.handle);
 
 		prepare_fb(importer_fd, &scratch, &fb);
-		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
+		import_fb(importer_fd, &fb, dmabuf_fd, &scratch);
 		close(dmabuf_fd);
 
 		colors[i].prime_crc.name = "prime";
@@ -475,6 +602,8 @@ igt_main
 			igt_require(second_fd_vgem >= 0);
 			if (is_i915_device(first_fd))
 				igt_require(!gem_has_lmem(first_fd));
+			if (is_xe_device(first_fd))
+				igt_require(!xe_has_vram(first_fd));
 		}
 
 		igt_describe("Make a dumb color buffer, export to another device and"
-- 
2.34.1

