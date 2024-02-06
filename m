Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAABC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 19:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C9112D71;
	Tue,  6 Feb 2024 19:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DYIltNHU";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEE3112D71
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 19:05:09 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51124e08565so9211765e87.3
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Feb 2024 11:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707246307; x=1707851107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UZDHAFFDDy785aTfSbOkngRb0C+GxvwtdY8HdMUCNqw=;
 b=DYIltNHUQ1mm/TktL/V6CN0ZiLfowm8CArE40T+nYBg72j5LR9WfREGCCtlI9FDumh
 7pM0gGnH+GONdKM6dpEpHFmhYqvt7aZowjYtBjJ17+l7BoU6bLwYkL9vvfq0jg7dTBqw
 10g8iGcKUlsqtB3umXwMyc7Xpd8aIaKuRFhhOOMzEgr99h8ryDOKh5rFD5Ve9ZCpjR18
 eXTygCe9szGj/ySo3DFfjInliXPfz0nlF1Y6LKpX0e3hje3/DbtkcgdBCY+XZcpzi9LL
 XZFW/Aphz+5WP0sYlmGnMbNnhLW+FePX/s+WNgZ4Aazv0zmoSIMxJoAJ9rHi4iMkUGts
 74Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707246307; x=1707851107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZDHAFFDDy785aTfSbOkngRb0C+GxvwtdY8HdMUCNqw=;
 b=bdE6jsr4p8tEoNvdmuCdzelY0SKvbxBvLTO/bdLj7H0ASIGbJZXdRC/yEiqsRDm5Vh
 fPaQKbivz9ZblUsZ1aYcuH8yVDljoD8zQolErUbuKrXyGEJl3rOqJWLdpgoAVRbQUPho
 O+XsQTl8Ht0oUXUkdY16BQ4CulWjou2Rqg/aMlScMGE4HS9extSy2A4PFvu9iXo61Ctp
 lLXrbPaMAJFLLpc8XOGkiRG8J975WOqCn+qYbUmCKzAojPjw0ZVGJ0JfQKmBphktTyaJ
 z3MOHIXJyCuspUj/xgxqSf2c8zpLOUnbTKsyoJt8f3W8UN9idYt4LR5uuyh60gv/y3gO
 zgbw==
X-Gm-Message-State: AOJu0Yz1x2L5amuWiAo7FMgoACpWUzerEuwD3qUzd6h3oHC8lDOXuEyy
 6j15HAfHGLzJAL84Wnv1iasqxKQqj8MrTy421HdnYc160RqPzT90EKA0kNd6ipc=
X-Google-Smtp-Source: AGHT+IHrw0oFUivxKU4LpPYcIAJSEQ5jm0n4lMa82JG7UXoJutVCIxhcm3QNi9hCVBQJSEo4dFL5PQ==
X-Received: by 2002:a05:6512:4d1:b0:50f:f9b9:f542 with SMTP id
 w17-20020a05651204d100b0050ff9b9f542mr2794953lfq.7.1707246306411; 
 Tue, 06 Feb 2024 11:05:06 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 e30-20020a19691e000000b0051163ccf93csm25780lfc.129.2024.02.06.11.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 11:05:05 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: Add Xe2 ccs crc tests
Date: Tue,  6 Feb 2024 21:05:02 +0200
Message-Id: <20240206190502.487549-1-juhapekka.heikkila@gmail.com>
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

Add Xe2 pat index type ccs tests for testing

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 197 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 187 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 74bc78477..cbd80ae5a 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -37,6 +37,9 @@
 #include "igt.h"
 
 #include "i915/gem_create.h"
+#include "intel_pat.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -248,6 +251,7 @@ static const struct {
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-cc"},
+	{I915_FORMAT_MOD_4_TILED, "4-tiled-xe2-ccs"},
 };
 
 static bool check_ccs_planes;
@@ -534,6 +538,143 @@ static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
 	buf_ops_destroy(bops);
 }
 
+static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
+					   uint32_t plane, uint32_t memregion,
+					   uint8_t pat_index)
+{
+	uint32_t name, handle;
+	struct blt_copy_object *blt;
+	uint64_t stride;
+
+	blt = malloc(sizeof(*blt));
+	igt_assert(blt);
+
+	name = gem_flink(fb->fd, fb->gem_handle);
+	handle = gem_open(fb->fd, name);
+
+	stride = fb->strides[plane] / 4;
+
+	blt_set_object(blt, handle, fb->size, memregion,
+		       intel_get_uc_mocs_index(fb->fd),
+		       pat_index,
+		       T_TILE4,
+		       COMPRESSION_DISABLED,
+		       COMPRESSION_TYPE_3D);
+
+	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
+	blt->plane_offset = fb->offsets[plane];
+	blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
+				  PROT_READ | PROT_WRITE);
+	return blt;
+}
+
+static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
+{
+	switch (fb->plane_bpp[0]) {
+	case 8:
+		return CD_8bit;
+	case 16:
+		return CD_16bit;
+	case 32:
+		return CD_32bit;
+	case 64:
+		return CD_64bit;
+	case 96:
+		return CD_96bit;
+	case 128:
+		return CD_128bit;
+	default:
+		igt_assert(0);
+	}
+}
+
+static uint32_t blt_compression_format(struct blt_copy_data *blt,
+				       const struct igt_fb *fb)
+{
+	switch (fb->drm_format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+	case DRM_FORMAT_YUYV:
+		return 8;
+	case DRM_FORMAT_XYUV8888:
+	case DRM_FORMAT_NV12:
+		return 9;
+	default:
+		igt_assert_f(0, "Unknown format\n");
+	}
+}
+
+static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb)
+{
+	uint64_t ahnd = 0;
+
+	struct blt_copy_data blt = {};
+	struct blt_copy_object *src, *dst;
+	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
+	uint32_t mem_region;
+	intel_ctx_t *xe_ctx;
+	uint32_t vm, exec_queue;
+	uint32_t xe_bb;
+	uint64_t bb_size = 4096;
+	struct igt_fb *dst_fb = fb, *src_fb = temp_fb;
+
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+
+	vm = xe_vm_create(src_fb->fd, 0, 0);
+
+	exec_queue = xe_exec_queue_create(src_fb->fd, vm, &inst, 0);
+	xe_ctx = intel_ctx_xe(src_fb->fd, vm, exec_queue, 0, 0, 0);
+	mem_region = vram_if_possible(src_fb->fd, 0);
+
+	ahnd = intel_allocator_open_full(src_fb->fd, xe_ctx->vm, 0, 0,
+						INTEL_ALLOCATOR_SIMPLE,
+						ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+	bb_size = ALIGN(bb_size + xe_cs_prefetch_size(src_fb->fd),
+			xe_get_default_alignment(src_fb->fd));
+	xe_bb = xe_bo_create(src_fb->fd, 0, bb_size,
+			     vram_if_possible(dst_fb->fd, 0), 0);
+
+	for (int i = 0; i < dst_fb->num_planes; i++) {
+		src = blt_fb_init(src_fb, i, mem_region, intel_get_pat_idx_uc(src_fb->fd));
+		dst = blt_fb_init(dst_fb, i, mem_region, intel_get_pat_idx_wt(dst_fb->fd));
+
+		blt_copy_init(src_fb->fd, &blt);
+		blt.color_depth = blt_get_bpp(src_fb);
+		blt_set_copy_object(&blt.src, src);
+		blt_set_copy_object(&blt.dst, dst);
+
+		blt_set_object_ext(&ext.src,
+				blt_compression_format(&blt, src_fb),
+				src_fb->width, src_fb->height,
+				SURFACE_TYPE_2D);
+
+		blt_set_object_ext(&ext.dst,
+				blt_compression_format(&blt, dst_fb),
+				dst_fb->width, dst_fb->height,
+				SURFACE_TYPE_2D);
+
+		pext = &ext;
+
+		blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
+
+		blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
+
+		blt_destroy_object(src_fb->fd, src);
+		blt_destroy_object(dst_fb->fd, dst);
+	}
+
+	put_ahnd(ahnd);
+	gem_close(dst_fb->fd, xe_bb);
+	xe_exec_queue_destroy(dst_fb->fd, exec_queue);
+	xe_vm_destroy(dst_fb->fd, vm);
+	free(xe_ctx);
+}
+
 static void generate_fb(data_t *data, struct igt_fb *fb,
 			int width, int height,
 			enum test_fb_flags fb_flags)
@@ -572,15 +713,37 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
 			fast_clear_fb(data->drm_fd, fb, cc_color);
 		} else {
-			cr = igt_get_cairo_ctx(data->drm_fd, fb);
+			if (modifier == I915_FORMAT_MOD_4_TILED) {
+				struct igt_fb temp_fb;
+				/* tile4 is used as ccs modifier
+				 * on Xe2 where compression is handled
+				 * through PAT indexes.
+				 */
+
+				// non compressed temporary pattern image
+				if (do_solid_fill)
+					igt_create_color_fb(data->drm_fd, width, height,
+						fb->drm_format, I915_FORMAT_MOD_4_TILED,
+						colors[c].r, colors[c].g, colors[c].b,
+						&temp_fb);
+				else
+					igt_create_pattern_fb(data->drm_fd, width, height,
+							fb->drm_format, I915_FORMAT_MOD_4_TILED,
+							&temp_fb);
+
+				xe2_ccs_blit(data, fb, &temp_fb);
+				igt_remove_fb(data->drm_fd, &temp_fb);
+			} else {
+				cr = igt_get_cairo_ctx(data->drm_fd, fb);
 
-			if (do_solid_fill)
-				igt_paint_color(cr, 0, 0, width, height,
-						colors[c].r, colors[c].g, colors[c].b);
-			else
-				igt_paint_test_pattern(cr, width, height);
+				if (do_solid_fill)
+					igt_paint_color(cr, 0, 0, width, height,
+							colors[c].r, colors[c].g, colors[c].b);
+				else
+					igt_paint_test_pattern(cr, width, height);
 
-			igt_put_cairo_ctx(cr);
+				igt_put_cairo_ctx(cr);
+			}
 		}
 	}
 
@@ -748,8 +911,11 @@ static int test_ccs(data_t *data)
 
 static void test_output(data_t *data, const int testnum)
 {
+	uint16_t dev_id;
+
 	igt_fixture {
 		bool found = false;
+		dev_id = intel_get_drm_devid(data->drm_fd);
 
 		data->flags = tests[testnum].flags;
 
@@ -767,10 +933,13 @@ static void test_output(data_t *data, const int testnum)
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
-		if ((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
+		if (((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
 		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
-		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
-		    tests[testnum].flags & TEST_BAD_CCS_PLANE)
+		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
+		    AT_LEAST_GEN(dev_id, 20)) &&
+		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
+		    (tests[testnum].flags & TEST_BAD_PIXEL_FORMAT &&
+		    AT_LEAST_GEN(dev_id, 20)))
 		    continue;
 
 		data->ccs_modifier = ccs_modifiers[i].modifier;
@@ -780,6 +949,14 @@ static void test_output(data_t *data, const int testnum)
 			      tests[testnum].testname, ccs_modifiers[i].str) {
 			int valid_tests = 0;
 
+			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
+				igt_require_f(AT_LEAST_GEN(dev_id, 20),
+					      "Xe2 platform needed.\n");
+			} else {
+				igt_require_f(intel_get_device_info(dev_id)->graphics_ver < 20,
+					      "Older than Xe2 platform needed.\n");
+			}
+
 			if (data->flags == TEST_RANDOM)
 				igt_info("Testing with seed %d\n", data->seed);
 
-- 
2.25.1

