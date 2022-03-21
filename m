Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17D910E20B
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Mar 2022 11:11:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Mar 2022 12:11:29 +0100
Message-Id: <20220321111130.145805-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220321111130.145805-1-zbigniew.kempczynski@intel.com>
References: <20220321111130.145805-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_ccs: Check
 ctrl-surf-copy in new context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Verify ccs data is binded to physical memory by using
XY_CTRL_SURF_COPY_BLT command in separate context.

v2: add separate allocator handle for new context (Zbigniew)

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ccs.c | 50 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index fdf1fe75f5..7e104f6ad8 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -39,6 +39,7 @@ struct test_config {
 	bool compression;
 	bool inplace;
 	bool surfcopy;
+	bool new_ctx;
 };
 
 static void set_object(struct blt_copy_object *obj,
@@ -234,9 +235,8 @@ static void block_copy(int i915,
 		       const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       uint32_t region1, uint32_t region2,
-		       enum blt_tiling mid_tiling, bool compression,
-		       bool inplace,
-		       bool surfcopy)
+		       enum blt_tiling mid_tiling,
+		       const struct test_config *config)
 {
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
@@ -249,7 +249,7 @@ static void block_copy(int i915,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = region2, bb;
 	uint32_t width = param.width, height = param.height;
-	enum blt_compression mid_compression = compression;
+	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
 	uint8_t uc_mocs = intel_get_uc_mocs(i915);
@@ -293,8 +293,31 @@ static void block_copy(int i915,
 	WRITE_PNG(i915, run_id, "src", &blt.src, width, height);
 	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
 
-	if (surfcopy && pext)
-		surf_copy(i915, ctx, e, ahnd, src, mid, dst, run_id);
+	if (config->surfcopy && pext) {
+		const intel_ctx_t *surf_ctx = ctx;
+		uint64_t surf_ahnd = ahnd;
+		struct intel_execution_engine2 surf_e = *e;
+
+		if (config->new_ctx) {
+			intel_ctx_cfg_t cfg = {};
+
+			cfg.num_engines = 1;
+			cfg.engines[0].engine_class = e->class;
+			cfg.engines[0].engine_instance = e->instance;
+			surf_ctx = intel_ctx_create(i915, &cfg);
+			surf_e.flags = 0;
+			ahnd = intel_allocator_open_full(i915, surf_ctx->id, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+		}
+
+		surf_copy(i915, surf_ctx, &surf_e, surf_ahnd, src, mid, dst, run_id);
+
+		if (surf_ctx != ctx) {
+			intel_ctx_destroy(i915, surf_ctx);
+			put_ahnd(surf_ahnd);
+		}
+	}
 
 	memset(&blt, 0, sizeof(blt));
 	blt.color_depth = CD_32bit;
@@ -303,7 +326,7 @@ static void block_copy(int i915,
 	set_blt_object(&blt.dst, dst);
 	set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
 	set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
-	if (inplace) {
+	if (config->inplace) {
 		set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
 			   T_LINEAR, COMPRESSION_DISABLED, comp_type);
 		blt.dst.ptr = mid->ptr;
@@ -367,10 +390,7 @@ static void block_copy_test(int i915,
 					      param.compression_format, regtxt) {
 					block_copy(i915, ctx, e,
 						   region1, region2,
-						   tiling,
-						   config->compression,
-						   config->inplace,
-						   config->surfcopy);
+						   tiling, config);
 				}
 				free(regtxt);
 			}
@@ -480,6 +500,14 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(i915, &config, ctx, set);
 	}
 
+	igt_subtest_with_dynamic("ctrl-surf-copy-new-ctx") {
+		struct test_config config = { .compression = true,
+					      .surfcopy = true,
+					      .new_ctx = true };
+
+		block_copy_test(i915, &config, ctx, set);
+	}
+
 	igt_fixture {
 		igt_disallow_hang(i915, hang);
 		close(i915);
-- 
2.32.0
