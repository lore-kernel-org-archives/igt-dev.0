Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2536E321
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 09:17:50 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 14 Jan 2020 11:17:45 +0200
Message-Id: <20200114091745.4555-4-petri.latvala@intel.com>
In-Reply-To: <20200114091745.4555-1-petri.latvala@intel.com>
References: <20200114091745.4555-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] runner_tests: Test that dynamic subtest
 failure is handled correctly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

See also: commit 0e6457f1bfe2 ("lib: Don't dump log buffer when
dynamic subtest failure is inherited")

This is quite an explicit top-to-bottom test that we don't get an
incorrect warn result for an innocent dynamic subtest. It is tested
here in runner_test instead of testing in lib/tests that the extra
lines are not printed, because not printing the extra lines is an
implementation detail that might change later. The issue is after all
about test results parsed by igt_runner.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/meson.build    |  2 +-
 runner/runner_tests.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/runner/meson.build b/runner/meson.build
index 404b8e04..7c2e8e0d 100644
--- a/runner/meson.build
+++ b/runner/meson.build
@@ -59,7 +59,7 @@ if jsonc.found()
 				 c_args : '-DTESTDATA_DIRECTORY="@0@"'.format(testdata_dir),
 				 link_with : runnerlib,
 				 install : false,
-				 dependencies : igt_deps)
+				 dependencies : [igt_deps, jsonc])
 	test('runner', runner_test, timeout : 300)
 
 	runner_json_test = executable('runner_json_test', runner_json_test_sources,
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index a232aa2b..6b0e6cc4 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -4,11 +4,14 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include <json.h>
+
 #include "igt.h"
 
 #include "settings.h"
 #include "job_list.h"
 #include "executor.h"
+#include "resultgen.h"
 
 /*
  * NOTE: this test is using a lot of variables that are changed in igt_fixture,
@@ -1348,6 +1351,54 @@ igt_main
 			free(list);
 	}
 
+	igt_subtest_group {
+		struct job_list *list = malloc(sizeof(*list));
+		volatile int dirfd = -1;
+		char dirname[] = "tmpdirXXXXXX";
+
+		igt_fixture {
+			igt_require(mkdtemp(dirname) != NULL);
+			rmdir(dirname);
+
+			init_job_list(list);
+		}
+
+		igt_subtest("dynamic-subtest-failure-should-not-cause-warn") {
+			struct execute_state state;
+			struct json_object *results, *obj;
+			const char *argv[] = { "runner",
+					       "-t", "dynamic",
+					       testdatadir,
+					       dirname,
+			};
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+			igt_assert(create_job_list(list, settings));
+			igt_assert(initialize_execute_state(&state, settings, list));
+			igt_assert(execute(&state, settings, list));
+
+			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
+				     "Execute didn't create the results directory\n");
+			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
+				     "Results parsing failed\n");
+
+			obj = results;
+			igt_assert(json_object_object_get_ex(obj, "tests", &obj));
+			igt_assert(json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@passing", &obj));
+			igt_assert(json_object_object_get_ex(obj, "result", &obj));
+
+			igt_assert_eqstr(json_object_get_string(obj), "pass");
+
+			igt_assert_eq(json_object_put(results), 1);
+		}
+
+		igt_fixture {
+			close(dirfd);
+			clear_directory(dirname);
+			free_job_list(list);
+		}
+	}
+
 	igt_subtest("file-descriptor-leakage") {
 		int i;
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
