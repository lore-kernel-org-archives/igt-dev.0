Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9959D5E142
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 06:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634B910E91F;
	Fri,  8 Nov 2024 06:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYEGBAaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2910E91F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731048451; x=1762584451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XIQf757PnYh4NRDStThYlTCFwbXkq4QlPGJEIvP8zSs=;
 b=bYEGBAazYpRhCzWo4aDqZYzOzY1qexLd1vKMmdpO748McVkpOP6CvYKk
 qHzyHX8UGUkZPdZpecKiZA8ZMUhFRUiw3SYisANoFSA3WuRLRjL0wyF97
 fOMRyf6kU9i5muwGoU86J4yMZEnygoyYHHiLRd126ebDA6ZUvunpI4zoo
 DBbcpgXwr9VXG6GoOu+cZMCFRUjk+HIM5022xDRk0AqI+Xmhzzh97/oam
 eUQ21wurHwWiDhHMbtBZPYVXBHnnBYxVO7Q9iyw1DDVrvR+Xct40caiQZ
 S3w6Hh6N3tqA+Q9Hx8iFMVCVldzHzQgFgYu5DjX6d+zudmwzH0pqrmDJ1 A==;
X-CSE-ConnectionGUID: 4hn2E+zpSWms1e6uIiLZBA==
X-CSE-MsgGUID: 7XqKsYTeRne/n9JG7Ha3Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34613032"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34613032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:31 -0800
X-CSE-ConnectionGUID: 2NLOsi8qREC7og2JLuDLZw==
X-CSE-MsgGUID: 8GjywTDfRMq/azbWt+d8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="86230981"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/3] tests/xe_ccs: Add large-ctrl-surf-copy subtest
Date: Fri,  8 Nov 2024 07:47:11 +0100
Message-Id: <20241108064712.252927-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
References: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
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

For big surface which ccs data might not fit in single ctrl-surf-copy
blit we need to ensure library code is properly populating batchbuffer
with couple of these commands.

Lets add the large-ctrl-surf-copy subtest which uses quite large surface
4096 x (4096 + 64) x 32bpp (16MiB). Value 64 was selected intentionally,
as 64 is expected aligned height for Tile64 (thus bigger than for other
supported tilings) and this size exceeds single ctrl-surf-copy blit on
Xe. On Xe2 we have bigger granularity per operation (4MiB) what will
produce more blits than on Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/xe_ccs.c | 145 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a2d18588fb..e154bf4dcc 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -51,6 +51,9 @@
  * SUBTEST: ctrl-surf-copy-new-ctx
  * Description: Check flatccs data are physically tagged and visible in vm
  *
+ * SUBTEST: large-ctrl-surf-copy
+ * Description: Check flatccs data can be copied from large surface
+ *
  * SUBTEST: suspend-resume
  * Description: Check flatccs data persists after suspend / resume (S0)
  */
@@ -85,6 +88,8 @@ struct test_config {
 	bool suspend_resume;
 	int width_increment;
 	int width_steps;
+	int overwrite_width;
+	int overwrite_height;
 };
 
 #define PRINT_SURFACE_INFO(name, obj) do { \
@@ -563,9 +568,92 @@ static void block_multicopy(int xe,
 	igt_assert_f(!result, "source and destination surfaces differs!\n");
 }
 
+static void block_copy_large(int xe,
+			     intel_ctx_t *ctx,
+			     uint32_t region1, uint32_t region2,
+			     uint32_t width, uint32_t height,
+			     enum blt_tiling_type tiling,
+			     const struct test_config *config)
+{
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
+	struct blt_copy_object *src, *dst;
+	const uint32_t bpp = 32;
+	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
+	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
+	uint64_t size;
+	uint32_t run_id = tiling;
+	uint32_t bb;
+	uint32_t *ptr;
+	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
+	bool result = true;
+	int i;
+
+	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+
+	if (!blt_uses_extended_block_copy(xe))
+		pext = NULL;
+
+	blt_copy_init(xe, &blt);
+
+	src = blt_create_object(&blt, region1, width, height, bpp, uc_mocs,
+				T_LINEAR, COMPRESSION_DISABLED,
+				COMPRESSION_TYPE_3D, true);
+	dst = blt_create_object(&blt, region2, width, height, bpp, uc_mocs,
+				tiling, COMPRESSION_ENABLED,
+				COMPRESSION_TYPE_3D, true);
+	PRINT_SURFACE_INFO("src", src);
+	PRINT_SURFACE_INFO("dst", dst);
+
+	blt_surface_fill_rect(xe, src, width, height);
+	WRITE_PNG(xe, run_id, "src", src, width, height, bpp);
+
+	blt.color_depth = CD_32bit;
+	blt.print_bb = param.print_bb;
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, dst);
+	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, param.compression_format,
+			   width, height, SURFACE_TYPE_2D);
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
+	intel_ctx_xe_sync(ctx, true);
+
+	blt_surface_get_flatccs_data(xe, ctx, NULL, ahnd, dst, &ptr, &size);
+	for (i = 0; i < size / sizeof(*ptr); i++) {
+		if (ptr[i] == 0) {
+			result = false;
+			break;
+		}
+	}
+
+	if (!result) {
+		for (i = 0; i < size / sizeof(*ptr); i += 8)
+			igt_debug("[%08x]: %08x %08x %08x %08x %08x %08x %08x %08x\n",
+				  i,
+				  ptr[i], ptr[i + 1], ptr[i + 2], ptr[i + 3],
+				  ptr[i + 4], ptr[i + 5], ptr[i + 6], ptr[i + 7]);
+	}
+
+	WRITE_PNG(xe, run_id, "dst", &blt.dst, width, height, bpp);
+
+	/* Politely clean vm */
+	put_offset(ahnd, src->handle);
+	put_offset(ahnd, dst->handle);
+	put_offset(ahnd, bb);
+	intel_allocator_bind(ahnd, 0, 0);
+	blt_destroy_object(xe, src);
+	blt_destroy_object(xe, dst);
+	gem_close(xe, bb);
+	put_ahnd(ahnd);
+
+	igt_assert_f(result, "ccs data must have no zeros!\n");
+}
+
 enum copy_func {
 	BLOCK_COPY,
 	BLOCK_MULTICOPY,
+	LARGE_SURFCOPY,
 };
 
 static const struct {
@@ -579,6 +667,7 @@ static const struct {
 } copyfns[] = {
 	[BLOCK_COPY] = { "", block_copy },
 	[BLOCK_MULTICOPY] = { "-multicopy", block_multicopy },
+	[LARGE_SURFCOPY] = { "", block_copy_large },
 };
 
 static void single_copy(int xe, const struct test_config *config,
@@ -619,7 +708,8 @@ static void block_copy_test(int xe,
 {
 	uint16_t dev_id = intel_get_drm_devid(xe);
 	struct igt_collection *regions;
-	int tiling;
+	int tiling, width, height;
+
 
 	if (intel_gen(dev_id) >= 20 && config->compression)
 		igt_require(HAS_FLATCCS(dev_id));
@@ -630,6 +720,9 @@ static void block_copy_test(int xe,
 	if (config->inplace && !config->compression)
 		return;
 
+	width = config->overwrite_width ?: param.width;
+	height = config->overwrite_height ?: param.height;
+
 	for_each_tiling(tiling) {
 		if (!blt_block_copy_supports_tiling(xe, tiling) ||
 		    (param.tiling >= 0 && param.tiling != tiling))
@@ -660,7 +753,7 @@ static void block_copy_test(int xe,
 			if (!config->width_increment) {
 				igt_dynamic(testname)
 					single_copy(xe, config, region1, region2,
-						    param.width, param.height,
+						    width, height,
 						    tiling, copy_function);
 			} else {
 				for (int w = param.incdim_width;
@@ -686,6 +779,35 @@ static void block_copy_test(int xe,
 	}
 }
 
+static void large_surf_ctrl_copy(int xe, const struct test_config *config)
+{
+	uint16_t dev_id = intel_get_drm_devid(xe);
+	int tiling, width, height;
+	uint32_t region1, region2;
+
+	igt_require(HAS_FLATCCS(dev_id));
+
+	region1 = system_memory(xe);
+	region2 = vram_if_possible(xe, 0);
+
+	width = config->overwrite_width;
+	height = config->overwrite_height;
+
+	/* Prefer TILE4 if supported */
+	if (blt_block_copy_supports_tiling(xe, T_TILE4)) {
+		tiling = T_TILE4;
+	} else {
+		for_each_tiling(tiling) {
+			if (!blt_block_copy_supports_tiling(xe, tiling))
+				continue;
+			break;
+		}
+	}
+
+	single_copy(xe, config, region1, region2, width, height, tiling,
+		    LARGE_SURFCOPY);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -815,6 +937,25 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
+	/*
+	 * Why 4096x4160 is chosen as WxH?
+	 *
+	 * On Xe ctrl-surf-copy size single increment does 256B ccs copy which
+	 * covers 64KiB surface. Size field is 10-bit so to exceed 64K * 1024
+	 * surface which is bigger than 4K x 4K x 32bpp (>64MiB) must be used.
+	 *
+	 * On Xe2+ ctrl-surf-copy has finer granularity - single size increment
+	 * copies 8B ccs which in turn covers 4KiB surface. So 64MiB+ surface
+	 * will require > 16 separate ctrl-surf-copy commands.
+	 */
+	igt_describe("Check flatccs data can be copied from large surface");
+	igt_subtest("large-ctrl-surf-copy") {
+		struct test_config config = { .overwrite_width = 4096,
+					      .overwrite_height = 4096+64, };
+
+		large_surf_ctrl_copy(xe, &config);
+	}
+
 	igt_describe("Check flatccs data persists after suspend / resume (S0)");
 	igt_subtest_with_dynamic("suspend-resume") {
 		struct test_config config = { .compression = true,
-- 
2.34.1

