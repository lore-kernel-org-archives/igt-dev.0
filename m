Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D6DC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 10:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B8710F2E8;
	Fri,  9 Feb 2024 10:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NJVfrpKN";
	dkim-atps=neutral
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5F10F2E8
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 10:09:04 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51167e470f7so950490e87.2
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Feb 2024 02:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707473342; x=1708078142; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cXTuUzdoamVSQ93ACrP0RRRqtYU5JP9TA/sHfr/cXCE=;
 b=NJVfrpKNQjEs7n54P+9NmG+rVyYho+zYBg2YBKX8lRX4NLYtYwgCFwj+F1KTuWTJoN
 KZSPRx1ffMo8nlaQZF5lvxCYxtOQKNEzeiU698QwB+uBq7m9vkYvv6fo94UyovYdteUK
 g02FCQBIBc4ik/Xa5kuAJ8ojyWw/3NVbv/YWG5rl2uE/IdzSxoRmQIqqIh+5B21eTSar
 Ixv3fXBrROKmewJcUbq5w4GD+CTOP85MBsmjJbqBul9poIV6R0BnQ87r/PxW11vIElzB
 jiya3krSvTsD45j94fx/sqg2KMqHR5Cs94hbXxfR+LOQJ80R8fjneluYcdwmKoz+yrah
 VekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707473342; x=1708078142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cXTuUzdoamVSQ93ACrP0RRRqtYU5JP9TA/sHfr/cXCE=;
 b=q6UFFC9fYYW38Eb5kVckFTL6O+bZpllAJpJsn+xzIGNXgDVDWgh1Wc3NT8Ki3DUlyn
 WCLsPphTshF/Y7+52wOdfn6BRYuirmqPk6LxN9vQsl/8R/iuYn4/dXgYZ6sGzd6k8sLa
 3eEVAseKEVuCxj3YmN/InQHkpnjp4MSbTvrx1lPLHWoiAeRljC32aRqTrdQeGmmUyE/R
 nvJxZUkg55eOQ8vo+mGoGUFfyeM3aJGIR/VN7usBWilSfI5PhqJ5xit4w1vw+Gt51eEe
 W7iboxtv44+tPYMSeWye90r2nxsMW1uM83jvzGbcqutPhC1vqlMDhCTmtkzD614kxR14
 euRg==
X-Gm-Message-State: AOJu0YzC1LITVu4yxF8GG5e7r8fg17hAA0DWsR1yaDzz0BvXu7nv2hUb
 ws10vczrh7lUXmyn7KlaQZMq4tlQlluUViruqJR8r3JSLbWD1efGwuThdgmwXI4vbgT7
X-Google-Smtp-Source: AGHT+IGC6yfEzvOe5CIsmt2x1l++sJhSb0twohBRyqic8VLQyEQpdY3LqQTHLCGMw8qm295c99eWww==
X-Received: by 2002:a05:6512:694:b0:511:4f21:4517 with SMTP id
 t20-20020a056512069400b005114f214517mr850862lfe.33.1707473341464; 
 Fri, 09 Feb 2024 02:09:01 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 v22-20020a056512349600b005116aed81a6sm244579lfr.294.2024.02.09.02.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 02:09:01 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: Add Xe2 ccs crc tests
Date: Fri,  9 Feb 2024 12:08:54 +0200
Message-Id: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/kms_ccs.c | 239 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 229 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 74bc78477..82714af93 100644
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
 
@@ -107,12 +110,54 @@
  * arg[2]:
  *
  * @bad-pixel-format:            Bad pixel format
+ *
+ * arg[3]:
+ *
+ * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
+ * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
+ * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
+ * @4-tiled-mtl-mc-ccs:        4 tiled mtl mc ccs
+ * @4-tiled-mtl-rc-ccs:        4 tiled mtl rc ccs
+ * @4-tiled-mtl-rc-ccs-cc:     4 tiled mtl rc ccs cc
+ * @y-tiled-ccs:               Y tiled ccs
+ * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
+ * @y-tiled-gen12-rc-ccs:      Y tiled gen12 rc ccs
+ * @y-tiled-gen12-rc-ccs-cc:   Y tiled gen12 rc ccs cc
+ * @yf-tiled-ccs:              YF tiled ccs
+ */
+
+/**
+ * SUBTEST: %s-%s-%s
+ * Description: Test %arg[2] with %arg[3] modifier
+ *
+ * arg[1]:
+ *
+ * @pipe-A:                      Pipe A
+ * @pipe-B:                      Pipe B
+ * @pipe-C:                      Pipe C
+ * @pipe-D:                      Pipe D
+ * @pipe-E:                      Pipe E
+ * @pipe-F:                      Pipe F
+ * @pipe-G:                      Pipe G
+ * @pipe-H:                      Pipe H
+ * @pipe-I:                      Pipe I
+ * @pipe-J:                      Pipe J
+ * @pipe-K:                      Pipe K
+ * @pipe-L:                      Pipe L
+ * @pipe-M:                      Pipe M
+ * @pipe-N:                      Pipe N
+ * @pipe-O:                      Pipe O
+ * @pipe-P:                      Pipe P
+ *
+ * arg[2]:
+ *
  * @crc-primary-basic:           Primary plane CRC compatibility
  * @crc-sprite-planes-basic:     Sprite plane CRC compatability
  * @random-ccs-data:             Random CCS data
  *
  * arg[3]:
  *
+ * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
  * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
  * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
@@ -157,6 +202,7 @@
  *
  * arg[3]:
  *
+ * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
  * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
  * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
@@ -248,6 +294,7 @@ static const struct {
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-cc"},
+	{I915_FORMAT_MOD_4_TILED, "4-tiled-xe2-ccs"},
 };
 
 static bool check_ccs_planes;
@@ -534,6 +581,143 @@ static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
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
@@ -572,15 +756,37 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
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
 
@@ -748,8 +954,11 @@ static int test_ccs(data_t *data)
 
 static void test_output(data_t *data, const int testnum)
 {
+	uint16_t dev_id;
+
 	igt_fixture {
 		bool found = false;
+		dev_id = intel_get_drm_devid(data->drm_fd);
 
 		data->flags = tests[testnum].flags;
 
@@ -767,11 +976,13 @@ static void test_output(data_t *data, const int testnum)
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
-		if ((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
+		if (((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
 		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
 		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
-		    tests[testnum].flags & TEST_BAD_CCS_PLANE)
-		    continue;
+		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
+		    (tests[testnum].flags & TEST_FAIL_ON_ADDFB2 &&
+		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED))
+			continue;
 
 		data->ccs_modifier = ccs_modifiers[i].modifier;
 
@@ -780,6 +991,14 @@ static void test_output(data_t *data, const int testnum)
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

