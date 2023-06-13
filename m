Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0210E344
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 07:27:56 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Tue, 13 Jun 2023 09:27:23 +0200
Message-Id: <20230613072726.4164-8-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/10] KUnit: Remove igt_kselftest fallback
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

As igt_kselftest fallback is removed, igt_kunit does not need
to return a value.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c       | 16 ++++++----------
 lib/igt_kmod.h       |  2 +-
 tests/drm_buddy.c    |  4 +---
 tests/drm_mm.c       |  5 +----
 tests/kms_selftest.c |  2 --
 5 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 2c0cc026d..a6e751482 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -754,7 +754,7 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
  *
  * Returns: IGT default codes
  */
-static int __igt_kunit(const char *module_name, const char *opts)
+static void __igt_kunit(const char *module_name, const char *opts)
 {
 	struct igt_ktest tst;
 	struct kmod_module *kunit_kmod;
@@ -764,19 +764,17 @@ static int __igt_kunit(const char *module_name, const char *opts)
 	struct ktap_test_results *results;
 	struct ktap_test_results_element *temp;
 
-	ret = IGT_EXIT_INVALID;
-
 	/* get normalized module name */
 	if (igt_ktest_init(&tst, module_name) != 0) {
 		igt_warn("Unable to initialize ktest for %s\n", module_name);
-		return ret;
+		igt_fail(IGT_EXIT_SKIP);
 	}
 
 	if (igt_ktest_begin(&tst) != 0) {
 		igt_warn("Unable to begin ktest for %s\n", module_name);
 
 		igt_ktest_fini(&tst);
-		return ret;
+		igt_fail(IGT_EXIT_SKIP);
 	}
 
 	if (tst.kmsg < 0) {
@@ -841,14 +839,13 @@ unload:
 	ret = ktap_parser_stop();
 
 	if (ret != 0)
-		ret = IGT_EXIT_ABORT;
+		igt_fail(IGT_EXIT_ABORT);
 
 	if (ret == 0)
 		igt_success();
-	return ret;
 }
 
-int igt_kunit(const char *module_name, const char *name, const char *opts)
+void igt_kunit(const char *module_name, const char *name, const char *opts)
 {
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
@@ -861,8 +858,7 @@ int igt_kunit(const char *module_name, const char *name, const char *opts)
 		name = "all-tests";
 
 	igt_subtest_with_dynamic(name)
-		return __igt_kunit(module_name, opts);
-	return 0;
+		__igt_kunit(module_name, opts);
 }
 
 static int open_parameters(const char *module_name)
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 248955475..990e5309d 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -71,7 +71,7 @@ static inline int igt_xe_driver_unload(void)
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
 
-int igt_kunit(const char *module_name, const char *name, const char *opts);
+void igt_kunit(const char *module_name, const char *name, const char *opts);
 
 void igt_kselftests(const char *module_name,
 		    const char *module_options,
diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 09feaf635..4f411464a 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -10,7 +10,5 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_bu
 
 igt_main
 {
-	int ret = igt_kunit("drm_buddy_test", NULL, NULL);
-	if (ret != 0 && ret != IGT_EXIT_ABORT)
-		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
+	igt_kunit("drm_buddy_test", NULL, NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index ada8cb936..089eae2b9 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -156,8 +156,5 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)"
 
 igt_main
 {
-	int ret = igt_kunit("drm_mm_test", NULL, NULL);
-
-	if (ret != 0 && ret != IGT_EXIT_ABORT)
-		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
+	igt_kunit("drm_mm_test", NULL, NULL);
 }
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index d83e5ff4b..5495c24f2 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -46,6 +46,4 @@ igt_main
 
 	for (int i = 0; kunit_subtests[i].kunit != NULL; i++)
 		igt_kunit(kunit_subtests[i].kunit, kunit_subtests[i].name, NULL);
-
-	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
 }
-- 
2.34.1


