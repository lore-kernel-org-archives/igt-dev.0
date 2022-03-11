Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D371210E477
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 18:15:40 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Mar 2022 19:15:34 +0100
Message-Id: <20220311181534.134751-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_ccs: Add subtests
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

- Verify ccs data is binded to physical memory by using
  XY_CTRL_SURF_COPY_BLT command in separate context.

- Introduce suspend/resume and verify validity of objects.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ccs.c | 79 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index fdf1fe75f5..073e5b3d3e 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -4,6 +4,7 @@
  */
 
 #include <errno.h>
+#include <glib.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
@@ -39,6 +40,8 @@ struct test_config {
 	bool compression;
 	bool inplace;
 	bool surfcopy;
+	bool new_ctx;
+	bool suspend_resume;
 };
 
 static void set_object(struct blt_copy_object *obj,
@@ -161,22 +164,24 @@ static void surf_copy(int i915,
 		      const struct blt_copy_object *src,
 		      const struct blt_copy_object *mid,
 		      const struct blt_copy_object *dst,
-		      int run_id)
+		      int run_id, bool suspend_resume)
 {
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
-	uint32_t bb, ccs, *ccsmap;
-	uint64_t bb_size = 4096;
-	uint64_t ccssize = mid->size / CCS_RATIO;
+	uint32_t bb, ccs, ccs2, *ccsmap, *ccsmap2;
+	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs(i915);
 	int result;
+	char *orig, *orig2, *new, *new2;
 
 	igt_assert(mid->compression);
 	ccscopy = (uint32_t *) malloc(ccssize);
+	bb_size = 4096;
 	bb = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
 	ccs = gem_create(i915, ccssize);
+	ccs2 = gem_create(i915, ccssize);
 
 	surf.i915 = i915;
 	surf.print_bb = param.print_bb;
@@ -192,6 +197,27 @@ static void surf_copy(int i915,
 					   PROT_READ | PROT_WRITE);
 	memcpy(ccscopy, ccsmap, ccssize);
 
+	if (suspend_resume) {
+		orig = g_compute_checksum_for_data(G_CHECKSUM_SHA1, (void *)ccsmap, surf.dst.size);
+		orig2 = g_compute_checksum_for_data(G_CHECKSUM_SHA1, (void *)mid->ptr, mid->size);
+
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+
+		set_surf_object(&surf.dst, ccs2, REGION_SMEM, ccssize,
+				0, DIRECT_ACCESS);
+		blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
+		gem_sync(i915, surf.dst.handle);
+
+		ccsmap2 = gem_mmap__device_coherent(i915, ccs2, 0, surf.dst.size,
+						    PROT_READ | PROT_WRITE);
+		new = g_compute_checksum_for_data(G_CHECKSUM_SHA1, (void *)ccsmap2, surf.dst.size);
+		new2 = g_compute_checksum_for_data(G_CHECKSUM_SHA1, (void *)mid->ptr, mid->size);
+
+		igt_assert(!strcmp(orig, new));
+		igt_assert(!strcmp(orig2, new2));
+		munmap(ccsmap2, ccssize);
+	}
+
 	/* corrupt ccs */
 	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
 		ccsmap[i] = i;
@@ -208,6 +234,7 @@ static void surf_copy(int i915,
 	set_blt_object(&blt.dst, dst);
 	set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
 	set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
+	bb_size = 4096;
 	bb = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
 	set_batch(&blt.bb, bb, bb_size, REGION_SMEM);
 	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
@@ -228,15 +255,15 @@ static void surf_copy(int i915,
 
 	munmap(ccsmap, ccssize);
 	gem_close(i915, ccs);
+	gem_close(i915, ccs2);
 }
 
 static void block_copy(int i915,
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
@@ -249,7 +276,7 @@ static void block_copy(int i915,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = region2, bb;
 	uint32_t width = param.width, height = param.height;
-	enum blt_compression mid_compression = compression;
+	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
 	uint8_t uc_mocs = intel_get_uc_mocs(i915);
@@ -293,8 +320,17 @@ static void block_copy(int i915,
 	WRITE_PNG(i915, run_id, "src", &blt.src, width, height);
 	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
 
-	if (surfcopy && pext)
-		surf_copy(i915, ctx, e, ahnd, src, mid, dst, run_id);
+	if (config->surfcopy && pext) {
+		const intel_ctx_t *surf_ctx = ctx;
+
+		if (config->new_ctx)
+			surf_ctx = intel_ctx_create(i915, &ctx->cfg);
+
+		surf_copy(i915, surf_ctx, e, ahnd, src, mid, dst, run_id, config->suspend_resume);
+
+		if (surf_ctx != ctx)
+			intel_ctx_destroy(i915, surf_ctx);
+	}
 
 	memset(&blt, 0, sizeof(blt));
 	blt.color_depth = CD_32bit;
@@ -303,7 +339,7 @@ static void block_copy(int i915,
 	set_blt_object(&blt.dst, dst);
 	set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
 	set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
-	if (inplace) {
+	if (config->inplace) {
 		set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
 			   T_LINEAR, COMPRESSION_DISABLED, comp_type);
 		blt.dst.ptr = mid->ptr;
@@ -367,10 +403,7 @@ static void block_copy_test(int i915,
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
@@ -480,6 +513,22 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
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
+	igt_subtest_with_dynamic("suspend-resume") {
+		struct test_config config = { .compression = true,
+					      .surfcopy = true,
+					      .suspend_resume = true };
+
+		block_copy_test(i915, &config, ctx, set);
+	}
+
 	igt_fixture {
 		igt_disallow_hang(i915, hang);
 		close(i915);
-- 
2.32.0
