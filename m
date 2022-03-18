Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8C10E634
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 07:30:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 08:30:18 +0100
Message-Id: <20220318073018.26941-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220318073018.26941-1-zbigniew.kempczynski@intel.com>
References: <20220318073018.26941-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_ccs: Add suspend-resume
 subtest
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

Verify flatccs data won't be corrupted when device will be put
to S0 (s2idle) state.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ccs.c | 45 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 7e104f6ad8..eaa8e043b0 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -4,6 +4,7 @@
  */
 
 #include <errno.h>
+#include <glib.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
@@ -40,6 +41,7 @@ struct test_config {
 	bool inplace;
 	bool surfcopy;
 	bool new_ctx;
+	bool suspend_resume;
 };
 
 static void set_object(struct blt_copy_object *obj,
@@ -162,22 +164,24 @@ static void surf_copy(int i915,
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
@@ -193,6 +197,27 @@ static void surf_copy(int i915,
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
@@ -209,6 +234,7 @@ static void surf_copy(int i915,
 	set_blt_object(&blt.dst, dst);
 	set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
 	set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
+	bb_size = 4096;
 	bb = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
 	set_batch(&blt.bb, bb, bb_size, REGION_SMEM);
 	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
@@ -311,7 +337,8 @@ static void block_copy(int i915,
 							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 		}
 
-		surf_copy(i915, surf_ctx, &surf_e, surf_ahnd, src, mid, dst, run_id);
+		surf_copy(i915, surf_ctx, &surf_e, ahnd, src, mid, dst, run_id,
+			  config->suspend_resume);
 
 		if (surf_ctx != ctx) {
 			intel_ctx_destroy(i915, surf_ctx);
@@ -508,6 +535,14 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		block_copy_test(i915, &config, ctx, set);
 	}
 
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
