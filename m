Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D76E10E346
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 07:28:02 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Tue, 13 Jun 2023 09:27:26 +0200
Message-Id: <20230613072726.4164-11-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/10] KUnit: replace abort with graceful
 skip
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

Sample drm_buddy output with missing requirements:
	Starting subtest: drm_buddy_test
	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
	Subtest drm_buddy_test: SKIP (0.001s)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1511bdef4..04220f404 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -763,27 +763,27 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	int ret;
 	struct ktap_test_results *results;
 	struct ktap_test_results_element *temp;
+	bool skip = false;
 
 	/* get normalized module name */
 	if (igt_ktest_init(&tst, module_name) != 0) {
-		igt_warn("Unable to initialize ktest for %s\n", module_name);
-		igt_fail(IGT_EXIT_SKIP);
+		igt_skip("Unable to initialize ktest for %s\n", module_name);
 	}
 
 	if (igt_ktest_begin(&tst) != 0) {
-		igt_warn("Unable to begin ktest for %s\n", module_name);
-
 		igt_ktest_fini(&tst);
-		igt_fail(IGT_EXIT_SKIP);
+		igt_skip("Unable to begin ktest for %s\n", module_name);
 	}
 
 	if (tst.kmsg < 0) {
 		igt_warn("Could not open /dev/kmsg\n");
+		skip = true;
 		goto unload;
 	}
 
 	if (lseek(tst.kmsg, 0, SEEK_END)) {
 		igt_warn("Could not seek the end of /dev/kmsg\n");
+		skip = true;
 		goto unload;
 	}
 
@@ -791,6 +791,7 @@ static void __igt_kunit(const char *module_name, const char *opts)
 
 	if (f == NULL) {
 		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer\n");
+		skip = true;
 		goto unload;
 	}
 
@@ -798,7 +799,8 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	if (igt_kmod_load("kunit", NULL) != 0 ||
 	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) != 0) {
 		igt_warn("Unable to load KUnit\n");
-		igt_fail(IGT_EXIT_FAILURE);
+		skip = true;
+		goto unload;
 	}
 
 	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
@@ -808,7 +810,8 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	if (igt_kmod_load(module_name, opts) != 0) {
 		igt_warn("Unable to load %s module\n", module_name);
 		ret = ktap_parser_stop();
-		igt_fail(IGT_EXIT_FAILURE);
+		skip = true;
+		goto unload;
 	}
 
 	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
@@ -836,6 +839,9 @@ unload:
 
 	igt_ktest_fini(&tst);
 
+	if (skip)
+		igt_skip("");
+
 	ret = ktap_parser_stop();
 
 	if (ret != 0)
-- 
2.34.1


