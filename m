Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203E10E343
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 07:27:56 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Tue, 13 Jun 2023 09:27:22 +0200
Message-Id: <20230613072726.4164-7-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/10] kunit tests: add an optional name for
 the selftests
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

When multiple KUnit tests are called by the same program, it is
interesting to group them with a name. This would allow IGT
namespace to better refer to the KUnit tests and will give some
filtering capability to it.

After those changes, the IGT kUnit tests will be better named:

	$ for i in kms_selftest drm_buddy drm_mm; do echo $i:; build/tests/$i --list; echo; done
	kms_selftest:
	drm_cmdline
	drm_damage
	drm_dp_mst
	drm_format_helper
	drm_format
	framebuffer
	drm_plane
	all-tests

	drm_buddy:
	all-tests

	drm_mm:
	all-tests

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/igt_kmod.c       |  7 +++++--
 lib/igt_kmod.h       |  2 +-
 tests/drm_buddy.c    |  2 +-
 tests/drm_mm.c       |  3 ++-
 tests/kms_selftest.c | 23 +++++++++++++++++------
 5 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 73478f75e..2c0cc026d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -848,7 +848,7 @@ unload:
 	return ret;
 }
 
-int igt_kunit(const char *module_name, const char *opts)
+int igt_kunit(const char *module_name, const char *name, const char *opts)
 {
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
@@ -857,7 +857,10 @@ int igt_kunit(const char *module_name, const char *opts)
 	 * proper namespace for dynamic subtests, with is required for CI
 	 * and for documentation.
 	 */
-	igt_subtest_with_dynamic("all-tests")
+	if (name == NULL)
+		name = "all-tests";
+
+	igt_subtest_with_dynamic(name)
 		return __igt_kunit(module_name, opts);
 	return 0;
 }
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index ce17c714e..248955475 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -71,7 +71,7 @@ static inline int igt_xe_driver_unload(void)
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
 
-int igt_kunit(const char *module_name, const char *opts);
+int igt_kunit(const char *module_name, const char *name, const char *opts);
 
 void igt_kselftests(const char *module_name,
 		    const char *module_options,
diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
index 3261f0d61..09feaf635 100644
--- a/tests/drm_buddy.c
+++ b/tests/drm_buddy.c
@@ -10,7 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_bu
 
 igt_main
 {
-	int ret = igt_kunit("drm_buddy_test", NULL);
+	int ret = igt_kunit("drm_buddy_test", NULL, NULL);
 	if (ret != 0 && ret != IGT_EXIT_ABORT)
 		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
 }
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index 88f76a57c..ada8cb936 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -156,7 +156,8 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)"
 
 igt_main
 {
-	int ret = igt_kunit("drm_mm_test", NULL);
+	int ret = igt_kunit("drm_mm_test", NULL, NULL);
+
 	if (ret != 0 && ret != IGT_EXIT_ABORT)
 		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
 }
diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index b27f60fb3..d83e5ff4b 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -26,15 +26,26 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
+struct kms_kunittests {
+	const char *kunit;
+	const char *name;
+};
+
 igt_main
 {
-	static const char *kunit_subtests[] = { "drm_cmdline_parser_test", "drm_damage_helper_test",
-						"drm_dp_mst_helper_test", "drm_format_helper_test",
-						"drm_format_test", "drm_framebuffer_test",
-						"drm_plane_helper_test", NULL };
+	static const struct kms_kunittests kunit_subtests[] = {
+		{ "drm_cmdline_parser_test",	"drm_cmdline" },
+		{ "drm_damage_helper_test",	"drm_damage" },
+		{ "drm_dp_mst_helper_test",	"drm_dp_mst" },
+		{ "drm_format_helper_test",	"drm_format_helper" },
+		{ "drm_format_test",		"drm_format" },
+		{ "drm_framebuffer_test",	"framebuffer" },
+		{ "drm_plane_helper_test",	"drm_plane" },
+		{ NULL, NULL}
+	};
 
-	for (int i = 0; kunit_subtests[i] != NULL; i++)
-		igt_kunit(kunit_subtests[i], NULL);
+	for (int i = 0; kunit_subtests[i].kunit != NULL; i++)
+		igt_kunit(kunit_subtests[i].kunit, kunit_subtests[i].name, NULL);
 
 	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
 }
-- 
2.34.1


