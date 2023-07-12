Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179D10E5C0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:12 +0200
Message-Id: <20230712171231.290555-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 02/21] tests/gem_ccs: Drop local function
 for setting ctrl surface object
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

Until now gem_ccs was the only user of set_surf_object() and probably
from this reason it wasn't "globalized". Upcoming gem_ccs counterpart
for xe - xe_ccs - uses same object initialization and we got this
function (with small rename) in the blitter library so we can use it
and get rid of local version.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ccs.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index f9ad9267df..9beddeaee4 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -77,17 +77,6 @@ struct test_config {
 	bool suspend_resume;
 };
 
-static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
-			    uint32_t handle, uint32_t region, uint64_t size,
-			    uint8_t mocs, enum blt_access_type access_type)
-{
-	obj->handle = handle;
-	obj->region = region;
-	obj->size = size;
-	obj->mocs = mocs;
-	obj->access_type = access_type;
-}
-
 #define PRINT_SURFACE_INFO(name, obj) do { \
 	if (param.print_surface_info) \
 		blt_surface_info((name), (obj)); } while (0)
@@ -169,10 +158,10 @@ static void surf_copy(int i915,
 
 	surf.fd = i915;
 	surf.print_bb = param.print_bb;
-	set_surf_object(&surf.src, mid->handle, mid->region, mid->size,
-			uc_mocs, BLT_INDIRECT_ACCESS);
-	set_surf_object(&surf.dst, ccs, REGION_SMEM, ccssize,
-			uc_mocs, DIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
+				 uc_mocs, BLT_INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, ccs, REGION_SMEM, ccssize,
+				 uc_mocs, DIRECT_ACCESS);
 	bb_size = 4096;
 	igt_assert_eq(__gem_create(i915, &bb_size, &bb1), 0);
 	blt_set_batch(&surf.bb, bb1, bb_size, REGION_SMEM);
@@ -191,8 +180,8 @@ static void surf_copy(int i915,
 
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 
-		set_surf_object(&surf.dst, ccs2, REGION_SMEM, ccssize,
-				0, DIRECT_ACCESS);
+		blt_set_ctrl_surf_object(&surf.dst, ccs2, REGION_SMEM, ccssize,
+					 0, DIRECT_ACCESS);
 		blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
 		gem_sync(i915, surf.dst.handle);
 
@@ -213,10 +202,10 @@ static void surf_copy(int i915,
 	/* corrupt ccs */
 	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
 		ccsmap[i] = i;
-	set_surf_object(&surf.src, ccs, REGION_SMEM, ccssize,
-			uc_mocs, DIRECT_ACCESS);
-	set_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
-			uc_mocs, INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.src, ccs, REGION_SMEM, ccssize,
+				 uc_mocs, DIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
+				 uc_mocs, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
 
 	memset(&blt, 0, sizeof(blt));
-- 
2.34.1
