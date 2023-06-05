Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521B110E295
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 10:48:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.20.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BF02A580D61
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 03:48:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q67kq-00D4h6-1R
 for igt-dev@lists.freedesktop.org; Mon, 05 Jun 2023 12:48:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 12:47:59 +0200
Message-Id: <20230605104759.3116294-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230605104759.3116294-1-mauro.chehab@linux.intel.com>
References: <20230605104759.3116294-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] kunit tests: add an optional name for
 the selftests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: 20230602082721.7818-7-dominik.karol.piatkowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
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
---
 lib/igt_kmod.c       |  7 +++++--
 lib/igt_kmod.h       |  2 +-
 tests/drm_buddy.c    |  2 +-
 tests/drm_mm.c       |  3 ++-
 tests/kms_selftest.c | 23 +++++++++++++++++------
 5 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1309ab212b11..c62eb97a19a1 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -852,7 +852,7 @@ unload:
 	return ret;
 }
 
-int igt_kunit(const char *module_name, const char *opts)
+int igt_kunit(const char *module_name, const char *name, const char *opts)
 {
 	/*
 	 * We need to use igt_subtest here, as otherwise it may crash with:
@@ -861,7 +861,10 @@ int igt_kunit(const char *module_name, const char *opts)
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
index ce17c714e292..248955475a90 100644
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
index 3261f0d61dfa..09feaf635311 100644
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
index 88f76a57cc0c..ada8cb936919 100644
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
index b27f60fb3a54..d83e5ff4b5e7 100644
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
2.40.1
