Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:42 +0200
Message-ID: <20231011141734.590321-20-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 07/11] tests/kms_selftest: Let subtest
 names match suite names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

There is a rule specified in Kunit Test Style and Nomenclature guidelines
[1] that states modules should be named after the test suite, followed by
_test.  Of course, that rule applies only to modules that provide one test
suite per module.

As long as that rule is obeyed by authors of Kunit test modules, there is
no need to hardcode related IGT subtest names in IGT source code.  We are
already able to derive subtest names from module names, with their _test
or _kunit suffixes stripped.  We may expect those names will match Kunit
suite names provided by the modules.

Drop custom subtest names from IGT Kunit tests that still use them.
However, keep the mechanism that allows us to provide a name that differs
from that derived from module name.  That will be required if we ever need
to support a kunit test module that provides multiple test suites (think
of i915 selftests code converted to kunit and the i915 module potentially
providing three test suites: mock, live and perf).

[1] https://docs.kernel.org/dev-tools/kunit/style.html

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_selftest.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index 080ffdf2c0..6618dbe50b 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -37,35 +37,30 @@
  *
  * arg[1]:
  *
- * @drm_cmdline:            drm cmdline
- * @drm_damage:             drm damage
- * @drm_dp_mst:             drm dp mst
+ * @drm_cmdline_parser:     drm cmdline parser
+ * @drm_damage_helper:      drm damage helper
+ * @drm_dp_mst_helper:      drm dp mst helper
  * @drm_format_helper:      drm format helper
  * @drm_format:             drm format
- * @drm_plane:              drm plane
- * @framebuffer:            framebuffer
+ * @drm_plane_helper:       drm plane helper
+ * @drm_framebuffer:        drm framebuffer
  */
 
 IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
-struct kms_kunittests {
-	const char *kunit;
-	const char *name;
-};
-
 igt_main
 {
-	static const struct kms_kunittests kunit_subtests[] = {
-		{ "drm_cmdline_parser_test",	"drm_cmdline" },
-		{ "drm_damage_helper_test",	"drm_damage" },
-		{ "drm_dp_mst_helper_test",	"drm_dp_mst" },
-		{ "drm_format_helper_test",	"drm_format_helper" },
-		{ "drm_format_test",		"drm_format" },
-		{ "drm_framebuffer_test",	"framebuffer" },
-		{ "drm_plane_helper_test",	"drm_plane" },
-		{ NULL, NULL}
+	static const char *kunit_subtests[] = {
+		"drm_cmdline_parser_test",
+		"drm_damage_helper_test",
+		"drm_dp_mst_helper_test",
+		"drm_format_helper_test",
+		"drm_format_test",
+		"drm_framebuffer_test",
+		"drm_plane_helper_test",
+		NULL,
 	};
 
-	for (int i = 0; kunit_subtests[i].kunit != NULL; i++)
-		igt_kunit(kunit_subtests[i].kunit, kunit_subtests[i].name, NULL);
+	for (int i = 0; kunit_subtests[i] != NULL; i++)
+		igt_kunit(kunit_subtests[i], NULL, NULL);
 }
-- 
2.42.0
