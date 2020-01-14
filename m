Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF086E32C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 09:17:57 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 14 Jan 2020 11:17:43 +0200
Message-Id: <20200114091745.4555-2-petri.latvala@intel.com>
In-Reply-To: <20200114091745.4555-1-petri.latvala@intel.com>
References: <20200114091745.4555-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] runner_tests: Replace magic numbers
 with named constants
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

We have some handcrafted test binaries in runner/testdata/ for runner
testing, and hardcoded numbers for the total amount of subtests and
test binaries all over the runner's unit tests. Replace magic numbers
with clear defines so new tests can easily be added.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/runner_tests.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 39d4a078..9bbc4252 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -20,6 +20,15 @@
 
 static const char testdatadir[] = TESTDATA_DIRECTORY;
 
+/*
+ * The total sum of subtests in the tests in runner/testdata/. Note
+ * that test binaries without subtests should still be counted as one
+ * for this macro.
+ */
+#define NUM_TESTDATA_SUBTESTS 5
+/* The total number of test binaries in runner/testdata/ */
+#define NUM_TESTDATA_BINARIES 3
+
 static void igt_assert_eqstr(const char *one, const char *two)
 {
 	if (one == NULL && two == NULL)
@@ -650,11 +659,11 @@ igt_main
 		}
 	}
 
-	job_list_filter_test("nofilters", "-n", "placeholderargs", 5, 3);
+	job_list_filter_test("nofilters", "-n", "placeholderargs", NUM_TESTDATA_SUBTESTS, NUM_TESTDATA_BINARIES);
 	job_list_filter_test("binary-include", "-t", "successtest", 2, 1);
-	job_list_filter_test("binary-exclude", "-x", "successtest", 3, 2);
+	job_list_filter_test("binary-exclude", "-x", "successtest", NUM_TESTDATA_SUBTESTS - 2, NUM_TESTDATA_BINARIES - 1);
 	job_list_filter_test("subtest-include", "-t", "first-subtest", 1, 1);
-	job_list_filter_test("subtest-exclude", "-x", "second-subtest", 4, 3);
+	job_list_filter_test("subtest-exclude", "-x", "second-subtest", NUM_TESTDATA_SUBTESTS - 1, NUM_TESTDATA_BINARIES);
 	job_list_filter_test("piglit-names", "-t", "igt@successtest", 2, 1);
 	job_list_filter_test("piglit-names-subtest", "-t", "igt@successtest@first", 1, 1);
 
@@ -869,7 +878,7 @@ igt_main
 			igt_assert(initialize_execute_state(&state, settings, list));
 			igt_assert_eq(state.next, 0);
 			igt_assert(state.dry);
-			igt_assert_eq(list->size, 5);
+			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS);
 
 			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
 				     "Dry run initialization didn't create the results directory.\n");
@@ -890,7 +899,7 @@ igt_main
 			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
 			igt_assert_eq(state.next, 0);
 			igt_assert(!state.dry);
-			igt_assert_eq(list->size, 5);
+			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS);
 			/* initialize_execute_state_from_resume() closes the dirfd */
 			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
 				     "Dry run resume somehow deleted the results directory.\n");
@@ -940,7 +949,7 @@ igt_main
 			igt_assert(initialize_execute_state(&state, settings, list));
 
 			igt_assert_eq(state.next, 0);
-			igt_assert_eq(list->size, 5);
+			igt_assert_eq(list->size, NUM_TESTDATA_SUBTESTS);
 			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
 				     "Execute state initialization didn't create the results directory.\n");
 			igt_assert_f((fd = openat(dirfd, "metadata.txt", O_RDONLY)) >= 0,
@@ -1096,7 +1105,7 @@ igt_main
 
 			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
 			igt_assert(create_job_list(list, settings));
-			igt_assert(list->size == 3);
+			igt_assert(list->size == NUM_TESTDATA_BINARIES);
 
 			if (!strcmp(list->entries[0].binary, "no-subtests")) {
 				struct job_list_entry tmp = list->entries[0];
@@ -1120,7 +1129,7 @@ igt_main
 			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
 
 			igt_assert_eq(state.next, 1);
-			igt_assert_eq(list->size, 3);
+			igt_assert_eq(list->size, NUM_TESTDATA_BINARIES);
 		}
 
 		igt_fixture {
@@ -1154,12 +1163,12 @@ igt_main
 				struct execute_state state;
 				const char *argv[] = { "runner",
 						       multiple ? "--multiple-mode" : "--sync",
-						       "-t", "-subtest",
+						       "-t", "successtest.*-subtest",
 						       testdatadir,
 						       dirname,
 				};
 				char testdirname[16];
-				size_t expected_tests = multiple ? 2 : 3;
+				size_t expected_tests = multiple ? 1 : 2;
 				size_t i;
 
 				igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
