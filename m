Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC9CD5E141
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 06:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD7D10E155;
	Fri,  8 Nov 2024 06:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0kbZ+V0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870710E155
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 06:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731048456; x=1762584456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y7jsTrSeEj2DJsY1sduvIosisPvpmQe/EmzhQAIJTlk=;
 b=T0kbZ+V0Gc4hkzGFH6I7h0lwiP2ysz2oI25Hd2qcFuUupX+ubBWhKDIU
 G0l2r4ktXnus4ajJJxfcNT3HyFysaLXqG7iuQP7QLx0nps/uqTAKNsFz+
 iwLMg3q2JPhz18n91yF8gUkcal8fY2I3TXqgpr0vdn4EjROGNfse2CrPM
 n2j43qlM7YeyI26DCUMw1CuzYWNqd+z1vQW5rarWLdkTPLZqzw4gTupFP
 1IlVOgk/LxXG+zj9X+0QvOI97D5iUnKZWaMm/F0RWxhb5OzI8CGnngZQA
 GtPNC27vYAeYPcrBfPPvnJqQ2eoyMpPH9D5UCCsLeTblHH+CixaiIFatE A==;
X-CSE-ConnectionGUID: BI+qG51uRDCrsbjsSP6gbQ==
X-CSE-MsgGUID: quWvDze3S1OlXRDyPT7toQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34613040"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34613040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:36 -0800
X-CSE-ConnectionGUID: qzNZFD4mSWeGkaYCnvJBlA==
X-CSE-MsgGUID: 34GpudzjR8qBFIjv1rNPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="86231018"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:33 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/3] tests/gem_ccs: Add large-ctrl-surf-copy subtest
Date: Fri,  8 Nov 2024 07:47:12 +0100
Message-Id: <20241108064712.252927-4-zbigniew.kempczynski@intel.com>
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

This is counterpart subtest for i915 driver which has same meaning for
Xe (DG2) - check if big surface which ccs data might not fit in single
ctrl-surf-copy is handled properly in the blitter library.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/gem_ccs.c | 130 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 07aa6d322d..af1e85f6aa 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -45,6 +45,9 @@
  * Description: Check flatccs data are physically tagged and visible i
  *		different contexts
  *
+ * SUBTEST: large-ctrl-surf-copy
+ * Description: Check flatccs data can be copied from large surface
+ *
  * SUBTEST: suspend-resume
  * Description: Check flatccs data persists after suspend / resume (S0)
  * Feature: flat_ccs_mapping, suspend
@@ -76,6 +79,8 @@ struct test_config {
 	bool surfcopy;
 	bool new_ctx;
 	bool suspend_resume;
+	int overwrite_width;
+	int overwrite_height;
 };
 
 #define PRINT_SURFACE_INFO(name, obj) do { \
@@ -520,6 +525,85 @@ static void block_multicopy(int i915,
 	igt_assert_f(!result, "source and destination surfaces differs!\n");
 }
 
+static void block_copy_large(int i915,
+			     intel_ctx_t *ctx,
+			     const struct intel_execution_engine2 *e,
+			     uint32_t region1, uint32_t region2,
+			     uint32_t width, uint32_t height,
+			     enum blt_tiling_type tiling,
+			     const struct test_config *config)
+{
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
+	struct blt_copy_object *src, *dst;
+	const uint32_t bpp = 32;
+	uint64_t bb_size = SZ_4K;
+	uint64_t ahnd = intel_allocator_open(i915, ctx->vm, INTEL_ALLOCATOR_RELOC);
+	uint64_t size;
+	uint32_t run_id = tiling;
+	uint32_t bb;
+	uint32_t *ptr;
+	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
+	bool result = true;
+	int i;
+
+	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
+
+	if (!blt_uses_extended_block_copy(i915))
+		pext = NULL;
+
+	blt_copy_init(i915, &blt);
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
+	blt_surface_fill_rect(i915, src, width, height);
+	WRITE_PNG(i915, run_id, "src", src, width, height, bpp);
+
+	blt.color_depth = CD_32bit;
+	blt.print_bb = param.print_bb;
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, dst);
+	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, param.compression_format,
+			   width, height, SURFACE_TYPE_2D);
+	blt_set_batch(&blt.bb, bb, bb_size, region1);
+	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+	gem_sync(i915, blt.dst.handle);
+
+	blt_surface_get_flatccs_data(i915, ctx, e, ahnd, dst, &ptr, &size);
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
+	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height, bpp);
+
+	/* Politely clean vm */
+	blt_destroy_object(i915, src);
+	blt_destroy_object(i915, dst);
+	gem_close(i915, bb);
+	put_ahnd(ahnd);
+
+	igt_assert_f(result, "ccs data must have no zeros!\n");
+}
+
 enum copy_func {
 	BLOCK_COPY,
 	BLOCK_MULTICOPY,
@@ -591,6 +675,44 @@ static void block_copy_test(int i915,
 	}
 }
 
+static void large_surf_ctrl_copy(int i915, const struct test_config *config,
+				 intel_ctx_t *ctx)
+{
+	uint16_t dev_id = intel_get_drm_devid(i915);
+	const struct intel_execution_engine2 *e;
+	int tiling, width, height;
+	uint32_t region1, region2;
+
+	igt_require(HAS_FLATCCS(dev_id));
+
+	region1 = REGION_SMEM;
+	region2 = gem_has_lmem(i915) ? REGION_LMEM(0) : REGION_SMEM;
+
+	width = config->overwrite_width;
+	height = config->overwrite_height;
+
+	/* Prefer TILE4 if supported */
+	if (blt_block_copy_supports_tiling(i915, T_TILE4)) {
+		tiling = T_TILE4;
+	} else {
+		for_each_tiling(tiling) {
+			if (!blt_block_copy_supports_tiling(i915, tiling))
+				continue;
+			break;
+		}
+	}
+
+	for_each_ctx_engine(i915, ctx, e) {
+		if (!gem_engine_can_block_copy(i915, e))
+			continue;
+
+		block_copy_large(i915, ctx, e, region1, region2, width, height,
+				 tiling, config);
+
+		break;
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -710,6 +832,14 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
 	}
 
+	igt_describe("Check flatccs data can be copied from large surface");
+	igt_subtest("large-ctrl-surf-copy") {
+		struct test_config config = { .overwrite_width = 4096,
+					      .overwrite_height = 4096+64, };
+
+		large_surf_ctrl_copy(i915, &config, (intel_ctx_t *) ctx);
+	}
+
 	igt_describe("Check flatccs data persists after suspend / resume (S0)");
 	igt_subtest_with_dynamic("suspend-resume") {
 		struct test_config config = { .compression = true,
-- 
2.34.1

