Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03836EB45
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 16:55:48 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 25 Feb 2020 18:55:33 +0200
Message-ID: <20200225165533.213942-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
References: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/9] runner/runner_tests: Extract helper for
 inspecting test result
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

to make this bit of code more readable and to reuse it in the following patch

Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/runner_tests.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 2f4e0abb..139ee9fd 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -32,6 +32,23 @@ static const char testdatadir[] = TESTDATA_DIRECTORY;
 /* The total number of test binaries in runner/testdata/ */
 #define NUM_TESTDATA_BINARIES 4
 
+static const char *igt_get_result(struct json_object *tests, const char* testname)
+{
+	struct json_object *obj;
+
+	igt_assert(json_object_object_get_ex(tests, testname, &obj));
+	igt_assert(json_object_object_get_ex(obj, "result", &obj));
+
+	return json_object_get_string(obj);
+}
+
+static void igt_assert_no_result_for(struct json_object *tests, const char* testname)
+{
+	struct json_object *obj;
+	igt_assert(!json_object_object_get_ex(tests, testname, &obj));
+}
+
+
 static void igt_assert_eqstr(const char *one, const char *two)
 {
 	if (one == NULL && two == NULL)
@@ -1438,7 +1455,7 @@ igt_main
 
 		igt_subtest("dynamic-subtests-in-testlist") {
 			struct execute_state state;
-			struct json_object *results, *obj;
+			struct json_object *results, *tests;
 			const char *argv[] = { "runner",
 					       "--test-list", filename,
 					       testdatadir,
@@ -1459,16 +1476,13 @@ igt_main
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			obj = results;
-			igt_assert(json_object_object_get_ex(obj, "tests", &obj));
+			igt_assert(json_object_object_get_ex(results, "tests", &tests));
 
 			/* Check that the dynamic subtest we didn't request is not reported */
-			igt_assert(!json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@failing", NULL));
+			igt_assert_no_result_for(tests, "igt@dynamic@dynamic-subtest@failing");
 
 			/* Check that the dynamic subtest we did request is */
-			igt_assert(json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@passing", &obj));
-			igt_assert(json_object_object_get_ex(obj, "result", &obj));
-			igt_assert_eqstr(json_object_get_string(obj), "pass");
+			igt_assert_eqstr(igt_get_result(tests, "igt@dynamic@dynamic-subtest@passing"), "pass");
 
 			igt_assert_eq(json_object_put(results), 1);
 		}
@@ -1496,7 +1510,7 @@ igt_main
 
 		igt_subtest("dynamic-subtest-failure-should-not-cause-warn") {
 			struct execute_state state;
-			struct json_object *results, *obj;
+			struct json_object *results, *tests;
 			const char *argv[] = { "runner",
 					       "-t", "dynamic",
 					       testdatadir,
@@ -1513,12 +1527,9 @@ igt_main
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			obj = results;
-			igt_assert(json_object_object_get_ex(obj, "tests", &obj));
-			igt_assert(json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@passing", &obj));
-			igt_assert(json_object_object_get_ex(obj, "result", &obj));
+			igt_assert(json_object_object_get_ex(results, "tests", &tests));
 
-			igt_assert_eqstr(json_object_get_string(obj), "pass");
+			igt_assert_eqstr(igt_get_result(tests, "igt@dynamic@dynamic-subtest@passing"), "pass");
 
 			igt_assert_eq(json_object_put(results), 1);
 		}
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
