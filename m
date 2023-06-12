Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83F10E23A
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 12:49:43 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Mon, 12 Jun 2023 14:49:15 +0200
Message-Id: <20230612124916.7372-9-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230612124916.7372-1-dominik.karol.piatkowski@intel.com>
References: <20230612124916.7372-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/9] KUnit: Change subtest name from
 all-tests to module name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use KUnit module name instead of all-tests when no name is specified.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c |  2 +-
 tests/drm_mm.c | 42 +++++++++++++++++++++---------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index a6e751482..1511bdef4 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -855,7 +855,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 * and for documentation.
 	 */
 	if (name == NULL)
-		name = "all-tests";
+		name = module_name;
 
 	igt_subtest_with_dynamic(name)
 		__igt_kunit(module_name, opts);
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 089eae2b9..9a8b3f3fc 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -29,123 +29,123 @@
  * Feature: mapping
  * Run type: FULL
  *
- * SUBTEST: all-tests
+ * SUBTEST: drm_mm_test
  *
- * SUBTEST: all-tests@align
+ * SUBTEST: drm_mm_test@align
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@align32
+ * SUBTEST: drm_mm_test@align32
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@align64
+ * SUBTEST: drm_mm_test@align64
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@bottomup
+ * SUBTEST: drm_mm_test@bottomup
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@color
+ * SUBTEST: drm_mm_test@color
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@color_evict
+ * SUBTEST: drm_mm_test@color_evict
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@color_evict_range
+ * SUBTEST: drm_mm_test@color_evict_range
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@debug
+ * SUBTEST: drm_mm_test@debug
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@evict
+ * SUBTEST: drm_mm_test@evict
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@evict_range
+ * SUBTEST: drm_mm_test@evict_range
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@frag
+ * SUBTEST: drm_mm_test@frag
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@highest
+ * SUBTEST: drm_mm_test@highest
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@init
+ * SUBTEST: drm_mm_test@init
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@insert
+ * SUBTEST: drm_mm_test@insert
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@insert_range
+ * SUBTEST: drm_mm_test@insert_range
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@lowest
+ * SUBTEST: drm_mm_test@lowest
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@replace
+ * SUBTEST: drm_mm_test@replace
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@reserve
+ * SUBTEST: drm_mm_test@reserve
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@sanitycheck
+ * SUBTEST: drm_mm_test@sanitycheck
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: all-tests@topdown
+ * SUBTEST: drm_mm_test@topdown
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
-- 
2.34.1


