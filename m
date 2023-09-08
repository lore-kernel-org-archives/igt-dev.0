Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 14:32:50 +0200
Message-ID: <20230908123233.137134-35-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 16/17] lib/kunit: Strip "_test" or
 "_kunit" suffix from subtest names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If a user (an IGT test) doesn't provide a subtest name when calling
igt_kunit() then we now use the requested kernel module name as IGT
subtest name.  Since names of kunit test modules usually end with a
"_test" or "_kunit" suffix, those parts of the names don't carry any
useful information.  Strip those suffixes from IGT subtest names.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 26 ++++++++++++++++++++++----
 tests/drm_mm.c | 42 +++++++++++++++++++++---------------------
 2 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 46a6f81e73..ddd5499f5e 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -944,8 +944,29 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	if (igt_ktest_init(&tst, module_name) != 0)
 		return;
 
-	igt_fixture
+	/*
+	 * If the caller (an IGT test) provides no subtest name then we
+	 * take the module name, drop the trailing "_test" or "_kunit"
+	 * suffix, if any, and use the result as our IGT subtest name.
+	 */
+	if (!name) {
+		name = strdup(module_name);
+		if (name) {
+			char *suffix = strstr(name, "_test");
+
+			if (!suffix)
+				suffix = strstr(name, "_kunit");
+
+			if (suffix)
+				*suffix = '\0';
+		}
+	}
+
+	igt_fixture {
+		igt_require(name);
+
 		igt_require(igt_ktest_begin(&tst) == 0);
+	}
 
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
@@ -954,9 +975,6 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 * proper namespace for dynamic subtests, with is required for CI
 	 * and for documentation.
 	 */
-	if (name == NULL)
-		name = module_name;
-
 	igt_subtest_with_dynamic(name)
 		__igt_kunit(&tst, opts);
 
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 9a8b3f3fcb..e6ba224745 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -29,123 +29,123 @@
  * Feature: mapping
  * Run type: FULL
  *
- * SUBTEST: drm_mm_test
+ * SUBTEST: drm_mm
  *
- * SUBTEST: drm_mm_test@align
+ * SUBTEST: drm_mm@align
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@align32
+ * SUBTEST: drm_mm@align32
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@align64
+ * SUBTEST: drm_mm@align64
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@bottomup
+ * SUBTEST: drm_mm@bottomup
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@color
+ * SUBTEST: drm_mm@color
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@color_evict
+ * SUBTEST: drm_mm@color_evict
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@color_evict_range
+ * SUBTEST: drm_mm@color_evict_range
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@debug
+ * SUBTEST: drm_mm@debug
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@evict
+ * SUBTEST: drm_mm@evict
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@evict_range
+ * SUBTEST: drm_mm@evict_range
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@frag
+ * SUBTEST: drm_mm@frag
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@highest
+ * SUBTEST: drm_mm@highest
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@init
+ * SUBTEST: drm_mm@init
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@insert
+ * SUBTEST: drm_mm@insert
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@insert_range
+ * SUBTEST: drm_mm@insert_range
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@lowest
+ * SUBTEST: drm_mm@lowest
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@replace
+ * SUBTEST: drm_mm@replace
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@reserve
+ * SUBTEST: drm_mm@reserve
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@sanitycheck
+ * SUBTEST: drm_mm@sanitycheck
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
  * Test category: GEM_Legacy
  *
- * SUBTEST: drm_mm_test@topdown
+ * SUBTEST: drm_mm@topdown
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
  * Functionality: DRM memory mangemnt
-- 
2.41.0
