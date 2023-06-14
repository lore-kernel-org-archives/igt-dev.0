Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736310E44B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 10:58:40 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Wed, 14 Jun 2023 12:58:11 +0200
Message-Id: <20230614105811.3429-11-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
References: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/10] KUnit: gracefully skip on missing
 KUnit or tested module, fail otherwise
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

Sample drm_buddy output with missing KUnit module:
	Starting subtest: drm_buddy_test
	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
	Subtest drm_buddy_test: SKIP (0.001s)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1511bdef4..66c3028b3 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -763,27 +763,31 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	int ret;
 	struct ktap_test_results *results;
 	struct ktap_test_results_element *temp;
+	bool skip = false;
+	bool fail = false;
 
 	/* get normalized module name */
 	if (igt_ktest_init(&tst, module_name) != 0) {
 		igt_warn("Unable to initialize ktest for %s\n", module_name);
-		igt_fail(IGT_EXIT_SKIP);
+		igt_fail(IGT_EXIT_ABORT);
 	}
 
 	if (igt_ktest_begin(&tst) != 0) {
 		igt_warn("Unable to begin ktest for %s\n", module_name);
 
 		igt_ktest_fini(&tst);
-		igt_fail(IGT_EXIT_SKIP);
+		igt_fail(IGT_EXIT_ABORT);
 	}
 
 	if (tst.kmsg < 0) {
 		igt_warn("Could not open /dev/kmsg\n");
+		fail = true;
 		goto unload;
 	}
 
 	if (lseek(tst.kmsg, 0, SEEK_END)) {
 		igt_warn("Could not seek the end of /dev/kmsg\n");
+		fail = true;
 		goto unload;
 	}
 
@@ -791,6 +795,7 @@ static void __igt_kunit(const char *module_name, const char *opts)
 
 	if (f == NULL) {
 		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer\n");
+		fail = true;
 		goto unload;
 	}
 
@@ -798,7 +803,8 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	if (igt_kmod_load("kunit", NULL) != 0 ||
 	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) != 0) {
 		igt_warn("Unable to load KUnit\n");
-		igt_fail(IGT_EXIT_FAILURE);
+		skip = true;
+		goto unload;
 	}
 
 	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
@@ -808,7 +814,8 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	if (igt_kmod_load(module_name, opts) != 0) {
 		igt_warn("Unable to load %s module\n", module_name);
 		ret = ktap_parser_stop();
-		igt_fail(IGT_EXIT_FAILURE);
+		skip = true;
+		goto unload;
 	}
 
 	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
@@ -836,6 +843,12 @@ unload:
 
 	igt_ktest_fini(&tst);
 
+	if (skip)
+		igt_skip("");
+
+	if (fail)
+		igt_fail(IGT_EXIT_ABORT);
+
 	ret = ktap_parser_stop();
 
 	if (ret != 0)
-- 
2.34.1


