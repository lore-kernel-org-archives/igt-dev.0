Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEB510E5C1
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:14 +0200
Message-Id: <20230712171231.290555-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 04/21] tests/gem_ccs: Use global image
 dump comparison function
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

As this function was extracted and available globally keeping local
version doesn't makes sense.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ccs.c | 50 +-------------------------------------------
 1 file changed, 1 insertion(+), 49 deletions(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 9beddeaee4..8f5d5b4f96 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -85,54 +85,6 @@ struct test_config {
 	if (param.write_png) \
 		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
 
-static int compare_nxn(const struct blt_copy_object *surf1,
-		       const struct blt_copy_object *surf2,
-		       int xsize, int ysize, int bx, int by)
-{
-	int x, y, corrupted;
-	uint32_t pos, px1, px2;
-
-	corrupted = 0;
-	for (y = 0; y < ysize; y++) {
-		for (x = 0; x < xsize; x++) {
-			pos = bx * xsize + by * ysize * surf1->pitch / 4;
-			pos += x + y * surf1->pitch / 4;
-			px1 = surf1->ptr[pos];
-			px2 = surf2->ptr[pos];
-			if (px1 != px2)
-				corrupted++;
-		}
-	}
-
-	return corrupted;
-}
-
-static void dump_corruption_info(const struct blt_copy_object *surf1,
-				 const struct blt_copy_object *surf2)
-{
-	const int xsize = 8, ysize = 8;
-	int w, h, bx, by, corrupted;
-
-	igt_assert(surf1->x1 == surf2->x1 && surf1->x2 == surf2->x2);
-	igt_assert(surf1->y1 == surf2->y1 && surf1->y2 == surf2->y2);
-	w = surf1->x2;
-	h = surf1->y2;
-
-	igt_info("dump corruption - width: %d, height: %d, sizex: %x, sizey: %x\n",
-		 surf1->x2, surf1->y2, xsize, ysize);
-
-	for (by = 0; by < h / ysize; by++) {
-		for (bx = 0; bx < w / xsize; bx++) {
-			corrupted = compare_nxn(surf1, surf2, xsize, ysize, bx, by);
-			if (corrupted == 0)
-				igt_info(".");
-			else
-				igt_info("%c", '0' + corrupted);
-		}
-		igt_info("\n");
-	}
-}
-
 static void surf_copy(int i915,
 		      const intel_ctx_t *ctx,
 		      const struct intel_execution_engine2 *e,
@@ -232,7 +184,7 @@ static void surf_copy(int i915,
 	WRITE_PNG(i915, run_id, "corrected", &blt.dst, dst->x2, dst->y2);
 	result = memcmp(src->ptr, dst->ptr, src->size);
 	if (result)
-		dump_corruption_info(src, dst);
+		blt_dump_corruption_info_32b(src, dst);
 
 	munmap(ccsmap, ccssize);
 	gem_close(i915, ccs);
-- 
2.34.1
