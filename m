Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7068C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 10:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D5113B29;
	Wed, 31 Jan 2024 10:52:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651B8113B29
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706698329; x=1738234329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ril+FaHupOPlhk6MyB9HuROTKzDfGu4b2wQsc6dtm8U=;
 b=Xus7+Rd/sC7SfebIyyUwymzCBa2E3pUNRJxrohHL/Gv+Kg76/OV2msx4
 GArq+gHUin4peQcLBb2CPoALrrJf6/DefvrCbExZt3jxnlh/QeIhqAktN
 S2qLQfDki1zVLO+W9i3vx3xhawJVENI3HvQaDGViCTsE8stLOutgmnks7
 DNtCp+EQrMTTctM3NbMk1m7FiRo885hMx2dKoy3VatLe00imTGQweGd7J
 hieQyJToh75Y874/7Ao6muzdYtsNaPcZmhjBj+NzQJzt9kakzoVMQcEVL
 zLofbBXDmO7A5CSx9wEm5MRBYYcDU/mKbrG4sGpi+NfbDkhsrNZZ5fAae Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10200978"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10200978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858776744"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="858776744"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:52:07 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/4] tests/xe-ccs: Add tests which exercise small to
 large blit sizes
Date: Wed, 31 Jan 2024 11:51:48 +0100
Message-Id: <20240131105148.182261-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
References: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
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
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Testing block-copy for 512 x 512 x 32bpp is not enough to verify
blit is working for different (small) and not always aligned
resolutions. Add 'increment' subtests which checks blits from
small (1x1) to large (512x512) resolutions.

To avoid too long execution resolution increment equals 15x15 pixels.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
---
 tests/intel/xe_ccs.c | 144 +++++++++++++++++++++++++++++++++----------
 1 file changed, 112 insertions(+), 32 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0e8ed7a5..d7022f2121 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -28,9 +28,15 @@
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
  *
+ * SUBTEST: block-copy-compressed-inc-dimension
+ * Description: Check block-copy compressed blit for different sizes
+ *
  * SUBTEST: block-copy-uncompressed
  * Description: Check block-copy uncompressed blit
  *
+ * SUBTEST: block-copy-uncompressed-inc-dimension
+ * Description: Check block-copy uncompressed blit for different sizes
+ *
  * SUBTEST: block-multicopy-compressed
  * Description: Check block-multicopy flatccs compressed blit
  *
@@ -73,6 +79,8 @@ struct test_config {
 	bool surfcopy;
 	bool new_ctx;
 	bool suspend_resume;
+	int width_increment;
+	int width_steps;
 };
 
 #define PRINT_SURFACE_INFO(name, obj) do { \
@@ -285,9 +293,17 @@ static int blt_block_copy3(int xe,
 	return ret;
 }
 
+#define CHECK_MIN_WIDTH 2
+#define CHECK_MIN_HEIGHT 2
+#define MIN_EXP_WH(w, h) ((w) >= CHECK_MIN_WIDTH && (h) >= CHECK_MIN_HEIGHT)
+#define CHECK_FROM_WIDTH 256
+#define CHECK_FROM_HEIGHT 256
+#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
+
 static void block_copy(int xe,
 		       intel_ctx_t *ctx,
 		       uint32_t region1, uint32_t region2,
+		       uint32_t width, uint32_t height,
 		       enum blt_tiling_type mid_tiling,
 		       const struct test_config *config)
 {
@@ -300,7 +316,7 @@ static void block_copy(int xe,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
 							!xe_has_vram(xe)) ? region1 : region2;
-	uint32_t width = param.width, height = param.height, bb;
+	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -338,9 +354,16 @@ static void block_copy(int xe,
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
 	intel_ctx_xe_sync(ctx, true);
 
-	/* We expect mid != src if there's compression */
-	if (mid->compression)
-		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
+	/*
+	 * We expect mid != src if there's compression. Ignore this for small
+	 * width x height for linear as compression for gradient occurs in the
+	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
+	 * xmajor.
+	 */
+	if (mid->compression && MIN_EXP_WH(width, height)) {
+		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
+			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
+	}
 
 	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height);
 
@@ -415,6 +438,7 @@ static void block_copy(int xe,
 static void block_multicopy(int xe,
 			    intel_ctx_t *ctx,
 			    uint32_t region1, uint32_t region2,
+			    uint32_t width, uint32_t height,
 			    enum blt_tiling_type mid_tiling,
 			    const struct test_config *config)
 {
@@ -428,7 +452,7 @@ static void block_multicopy(int xe,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
 							!xe_has_vram(xe)) ? region1 : region2;
-	uint32_t width = param.width, height = param.height, bb;
+	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -520,6 +544,7 @@ static const struct {
 	void (*copyfn)(int fd,
 		       intel_ctx_t *ctx,
 		       uint32_t region1, uint32_t region2,
+		       uint32_t width, uint32_t height,
 		       enum blt_tiling_type btype,
 		       const struct test_config *config);
 } copyfns[] = {
@@ -527,17 +552,44 @@ static const struct {
 	[BLOCK_MULTICOPY] = { "-multicopy", block_multicopy },
 };
 
-static void block_copy_test(int xe,
-			    const struct test_config *config,
-			    struct igt_collection *set,
-			    enum copy_func copy_function)
+static void single_copy(int xe, const struct test_config *config,
+			int32_t region1, uint32_t region2,
+			uint32_t width, uint32_t height,
+			int tiling, enum copy_func copy_function)
 {
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
+	uint32_t vm, exec_queue;
+	uint32_t sync_bind, sync_out;
 	intel_ctx_t *ctx;
+
+	vm = xe_vm_create(xe, 0, 0);
+	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
+	sync_bind = syncobj_create(xe, 0);
+	sync_out = syncobj_create(xe, 0);
+	ctx = intel_ctx_xe(xe, vm, exec_queue,
+			   0, sync_bind, sync_out);
+
+	copyfns[copy_function].copyfn(xe, ctx,
+				      region1, region2,
+				      width, height,
+				      tiling, config);
+
+	xe_exec_queue_destroy(xe, exec_queue);
+	xe_vm_destroy(xe, vm);
+	syncobj_destroy(xe, sync_bind);
+	syncobj_destroy(xe, sync_out);
+	free(ctx);
+}
+
+static void block_copy_test(int xe,
+			    const struct test_config *config,
+			    struct igt_collection *set,
+			    enum copy_func copy_function)
+{
+
 	struct igt_collection *regions;
-	uint32_t vm, exec_queue;
 	int tiling;
 
 	if (config->compression && !blt_block_copy_supports_compression(xe))
@@ -554,6 +606,7 @@ static void block_copy_test(int xe,
 		for_each_variation_r(regions, 2, set) {
 			uint32_t region1, region2;
 			char *regtxt;
+			char testname[256];
 
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
@@ -565,30 +618,36 @@ static void block_copy_test(int xe,
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
 
-			igt_dynamic_f("%s-%s-compfmt%d-%s%s",
-				      blt_tiling_name(tiling),
-				      config->compression ?
-					      "compressed" : "uncompressed",
-				      param.compression_format, regtxt,
-				      copyfns[copy_function].suffix) {
-				uint32_t sync_bind, sync_out;
+			snprintf(testname, sizeof(testname),
+				 "%s-%s-compfmt%d-%s%s",
+				 blt_tiling_name(tiling),
+				 config->compression ?
+					 "compressed" : "uncompressed",
+				 param.compression_format, regtxt,
+				 copyfns[copy_function].suffix);
 
-				vm = xe_vm_create(xe, 0, 0);
-				exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
-				sync_bind = syncobj_create(xe, 0);
-				sync_out = syncobj_create(xe, 0);
-				ctx = intel_ctx_xe(xe, vm, exec_queue,
-						   0, sync_bind, sync_out);
+			if (!config->width_increment) {
+				igt_dynamic(testname)
+					single_copy(xe, config, region1, region2,
+						    param.width, param.height,
+						    tiling, copy_function);
+			} else {
+				for (int w = param.width;
+				     w < param.width + config->width_steps;
+				     w += config->width_increment) {
+					snprintf(testname, sizeof(testname),
+						 "%s-%s-compfmt%d-%s%s-%dx%d",
+						 blt_tiling_name(tiling),
+						 config->compression ?
+							 "compressed" : "uncompressed",
+						 param.compression_format, regtxt,
+						 copyfns[copy_function].suffix,
+						 w, w);
+					igt_dynamic(testname)
+						single_copy(xe, config, region1, region2,
+							    w, w, tiling, copy_function);
+				}
 
-				copyfns[copy_function].copyfn(xe, ctx,
-							      region1, region2,
-							      tiling, config);
-
-				xe_exec_queue_destroy(xe, exec_queue);
-				xe_vm_destroy(xe, vm);
-				syncobj_destroy(xe, sync_bind);
-				syncobj_destroy(xe, sync_out);
-				free(ctx);
 			}
 
 			free(regtxt);
@@ -668,6 +727,16 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
+	igt_describe("Check block-copy uncompressed blit with increment width/height");
+	igt_subtest_with_dynamic("block-copy-uncompressed-inc-dimension") {
+		struct test_config config = { .width_increment = 15,
+					      .width_steps = 512 };
+		param.width = 1;
+		param.height = 1;
+
+		block_copy_test(xe, &config, set, BLOCK_COPY);
+	}
+
 	igt_describe("Check block-copy flatccs compressed blit");
 	igt_subtest_with_dynamic("block-copy-compressed") {
 		struct test_config config = { .compression = true };
@@ -675,6 +744,17 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
+	igt_describe("Check block-copy compressed blit with increment width/height");
+	igt_subtest_with_dynamic("block-copy-compressed-inc-dimension") {
+		struct test_config config = { .compression = true,
+					      .width_increment = 15,
+					      .width_steps = 512 };
+		param.width = 1;
+		param.height = 1;
+
+		block_copy_test(xe, &config, set, BLOCK_COPY);
+	}
+
 	igt_describe("Check block-multicopy flatccs compressed blit");
 	igt_subtest_with_dynamic("block-multicopy-compressed") {
 		struct test_config config = { .compression = true };
-- 
2.34.1

