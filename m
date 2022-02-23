Return-path: <SRS0=UqwI=TG=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CC010E899
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 11:17:27 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nMpe7-001xZg-KB
 for igt-dev@lists.freedesktop.org; Wed, 23 Feb 2022 12:17:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 12:16:33 +0100
Message-Id: <20220223111641.467123-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220223111641.467123-1-mauro.chehab@linux.intel.com>
References: <20220223111641.467123-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/9] runner: check if it has root permissions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Without root permissions, most IGT tests won't actually run, but they
would be displayed at the runner's output as if everything went fine.

In order to avoid that, check if one attempts to run IGT without root
permission. Such check can be disbled with a new command line option:

	--allow-non-root

As runner_tests runs as non-root, most unit tests need to pass
--allow-non-root in order for them to not return an error.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/executor.c     | 14 +++++++++++++-
 runner/resume.c       |  4 +---
 runner/runner_tests.c | 27 +++++++++++++++++++++++++++
 runner/settings.c     |  8 ++++++++
 runner/settings.h     |  1 +
 5 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 9b5821790100..15bd53dd150c 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1526,6 +1526,12 @@ bool initialize_execute_state_from_resume(int dirfd,
 	if (!read_settings_from_dir(settings, dirfd) ||
 	    !read_job_list(list, dirfd)) {
 		close(dirfd);
+		fprintf(stderr, "Failure reading metadata\n");
+		return false;
+	}
+
+	if (!settings->allow_non_root && (getuid() != 0)) {
+		fprintf(stderr, "Runner needs to run with UID 0 (root).\n");
 		return false;
 	}
 
@@ -1573,6 +1579,11 @@ bool initialize_execute_state(struct execute_state *state,
 			      struct settings *settings,
 			      struct job_list *job_list)
 {
+	if (!settings->allow_non_root && (getuid() != 0)) {
+		fprintf(stderr, "Runner needs to run with UID 0 (root).\n");
+		return false;
+	}
+
 	memset(state, 0, sizeof(*state));
 
 	if (!validate_settings(settings))
@@ -1840,7 +1851,8 @@ bool execute(struct execute_state *state,
 			}
 			close(sigfd);
 			close(testdirfd);
-			initialize_execute_state_from_resume(resdirfd, state, settings, job_list);
+			if (initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
+				return false;
 			state->time_left = time_left;
 			return execute(state, settings, job_list);
 		}
diff --git a/runner/resume.c b/runner/resume.c
index f5d69e218322..eb8074e31ad8 100644
--- a/runner/resume.c
+++ b/runner/resume.c
@@ -31,10 +31,8 @@ int main(int argc, char **argv)
 		return 127;
 	}
 
-	if (!initialize_execute_state_from_resume(dirfd, &state, &settings, &job_list)) {
-		fprintf(stderr, "Failure reading metadata in %s\n", argv[1]);
+	if (!initialize_execute_state_from_resume(dirfd, &state, &settings, &job_list))
 		return 127;
-	}
 
 	if (!execute(&state, &settings, &job_list)) {
 		exitcode = 1;
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index cd033f6c258f..e67e08a8c99f 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -112,6 +112,7 @@ static void job_list_filter_test(const char *name, const char *filterarg1, const
 		igt_subtest_f("job-list-filters-%s-%s", name, multiple ? "multiple" : "normal") {
 			struct job_list list;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       /* Ugly but does the trick */
 					       multiple ? "--multiple-mode" : "--sync",
 					       filterarg1, filterarg2,
@@ -187,6 +188,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eqstr(one->test_list, two->test_list);
 	igt_assert_eqstr(one->name, two->name);
 	igt_assert_eq(one->dry_run, two->dry_run);
+	igt_assert_eq(one->allow_non_root, two->allow_non_root);
 	igt_assert_eq(one->sync, two->sync);
 	igt_assert_eq(one->log_level, two->log_level);
 	igt_assert_eq(one->overwrite, two->overwrite);
@@ -264,6 +266,7 @@ igt_main
 
 	igt_subtest("default-settings") {
 		const char *argv[] = { "runner",
+				       "--allow-non-root",
 				       "test-root-dir",
 				       "path-to-results",
 		};
@@ -348,6 +351,7 @@ igt_main
 
 		igt_subtest("absolute-path-usage") {
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "--test-list", pathtotestlist,
 					       testdatadir,
 					       dirname,
@@ -382,6 +386,7 @@ igt_main
 
 	igt_subtest("environment-overrides-test-root-flag") {
 		const char *argv[] = { "runner",
+				       "--allow-non-root",
 				       "test-root-dir",
 				       "path-to-results",
 		};
@@ -415,6 +420,7 @@ igt_main
 	igt_subtest("parse-all-settings") {
 		char blacklist_name[PATH_MAX], blacklist2_name[PATH_MAX];
 		const char *argv[] = { "runner",
+				       "--allow-non-root",
 				       "-n", "foo",
 				       "--abort-on-monitored-error=taint,lockdep",
 				       "--disk-usage-limit=4096",
@@ -451,6 +457,7 @@ igt_main
 		igt_assert(strstr(settings->test_list, "path-to-test-list") != NULL);
 		igt_assert_eqstr(settings->name, "foo");
 		igt_assert(settings->dry_run);
+		igt_assert(settings->allow_non_root);
 		igt_assert_eq(settings->include_regexes.size, 2);
 		igt_assert_eqstr(settings->include_regexes.regex_strings[0], "pattern1");
 		igt_assert_eqstr(settings->include_regexes.regex_strings[1], "pattern2");
@@ -484,6 +491,7 @@ igt_main
 
 	igt_subtest("dmesg-warn-level-inferred") {
 		const char *argv[] = { "runner",
+				       "--allow-non-root",
 				       "test-root-dir",
 				       "path-to-results",
 		};
@@ -496,6 +504,7 @@ igt_main
 
 	igt_subtest("dmesg-warn-level-inferred-with-piglit-style") {
 		const char *argv[] = { "runner",
+				       "--allow-non-root",
 				       "--piglit-style-dmesg",
 				       "test-root-dir",
 				       "path-to-results",
@@ -509,6 +518,7 @@ igt_main
 
 	igt_subtest("dmesg-warn-level-overridable-with-piglit-style") {
 		const char *argv[] = { "runner",
+				       "--allow-non-root",
 				       "--piglit-style-dmesg",
 				       "--dmesg-warn-level=3",
 				       "test-root-dir",
@@ -560,6 +570,7 @@ igt_main
 	igt_subtest("abort-conditions") {
 		const char *argv[] = { "runner",
 				       "--abort-on-monitored-error=taint",
+				       "--allow-non-root",
 				       "test-root-dir",
 				       "results-path",
 		};
@@ -623,6 +634,7 @@ igt_main
 		const char *argv[] = { "runner",
 				       "-n", "foo",
 				       "--dry-run",
+				       "--allow-non-root",
 				       "test-root-dir",
 				       "results-path",
 		};
@@ -656,6 +668,7 @@ igt_main
 
 		igt_subtest("validate-ok") {
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "--test-list", filename,
 					       testdatadir,
 					       "path-to-results",
@@ -983,6 +996,7 @@ igt_main
 			struct execute_state state;
 			const char *argv[] = { "runner",
 					       "--dry-run",
+					       "--allow-non-root",
 					       "-x", "^abort",
 					       testdatadir,
 					       dirname,
@@ -1055,6 +1069,7 @@ igt_main
 		igt_subtest("execute-initialize-new-run") {
 			struct execute_state state;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       testdatadir,
 					       dirname,
 			};
@@ -1102,6 +1117,7 @@ igt_main
 		igt_subtest("execute-initialize-subtest-started") {
 			struct execute_state state;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "--multiple-mode",
 					       "-t", "successtest",
 					       testdatadir,
@@ -1158,6 +1174,7 @@ igt_main
 		igt_subtest("execute-initialize-all-subtests-started") {
 			struct execute_state state;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "--multiple-mode",
 					       "-t", "successtest@first-subtest",
 					       "-t", "successtest@second-subtest",
@@ -1213,6 +1230,7 @@ igt_main
 		igt_subtest("execute-initialize-subtests-complete") {
 			struct execute_state state;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "--multiple-mode",
 					       testdatadir,
 					       dirname,
@@ -1278,6 +1296,7 @@ igt_main
 			igt_subtest_f("execute-subtests-%s", multiple ? "multiple" : "normal") {
 				struct execute_state state;
 				const char *argv[] = { "runner",
+						       "--allow-non-root",
 						       multiple ? "--multiple-mode" : "--sync",
 						       "-t", "successtest.*-subtest",
 						       testdatadir,
@@ -1413,6 +1432,7 @@ igt_main
 			igt_subtest_f("execute-skipper-journal-%s", multiple ? "multiple" : "normal") {
 				struct execute_state state;
 				const char *argv[] = { "runner",
+						       "--allow-non-root",
 						       multiple ? "--multiple-mode" : "--sync",
 						       "-t", "skippers",
 						       testdatadir,
@@ -1499,6 +1519,7 @@ igt_main
 			struct execute_state state;
 			struct json_object *results, *tests;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "--test-list", filename,
 					       testdatadir,
 					       dirname,
@@ -1554,6 +1575,7 @@ igt_main
 			struct execute_state state;
 			struct json_object *results, *tests;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "-t", "^dynamic$",
 					       testdatadir,
 					       dirname,
@@ -1599,6 +1621,7 @@ igt_main
 			struct execute_state state;
 			struct json_object *results, *tests;
 			const char *argv[] = { "runner",
+					       "--allow-non-root",
 					       "-t", "^abort-simple$",
 					       testdatadir,
 					       dirname,
@@ -1646,6 +1669,7 @@ igt_main
 				struct execute_state state;
 				struct json_object *results, *tests;
 				const char *argv[] = { "runner",
+						       "--allow-non-root",
 						       "-t", "^abort$",
 						       multiple ? "--multiple-mode" : "--sync",
 						       testdatadir,
@@ -1701,6 +1725,7 @@ igt_main
 				struct execute_state state;
 				struct json_object *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
+						       "--allow-non-root",
 						       "-t", "^abort-fixture$",
 						       testdatadir,
 						       dirname,
@@ -1767,6 +1792,7 @@ igt_main
 				struct execute_state state;
 				struct json_object *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
+						       "--allow-non-root",
 						       "--test-list", filename,
 						       testdatadir,
 						       dirname,
@@ -1822,6 +1848,7 @@ igt_main
 				struct execute_state state;
 				struct json_object *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
+						       "--allow-non-root",
 						       "-t", "^abort-dynamic$",
 						       testdatadir,
 						       dirname,
diff --git a/runner/settings.c b/runner/settings.c
index 200f1ce59ed6..ac090b081e3b 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -24,6 +24,7 @@ enum {
 	OPT_DMESG_WARN_LEVEL,
 	OPT_OVERALL_TIMEOUT,
 	OPT_PER_TEST_TIMEOUT,
+	OPT_ALLOW_NON_ROOT,
 	OPT_VERSION,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
@@ -199,6 +200,7 @@ static const char *usage_str =
 	"  --ignore-missing      Ignored but accepted, for piglit compatibility\n"
 	"\n"
 	" Incompatible options:\n"
+	"  --allow-non-root      Allow running tests without being the root user.\n"
 	"  -m, --multiple-mode   Run multiple subtests in the same binary execution.\n"
 	"                        If a testlist file is given, consecutive subtests are\n"
 	"                        run in the same execution if they are from the same\n"
@@ -381,6 +383,7 @@ bool parse_options(int argc, char **argv,
 		{"help", no_argument, NULL, OPT_HELP},
 		{"name", required_argument, NULL, OPT_NAME},
 		{"dry-run", no_argument, NULL, OPT_DRY_RUN},
+		{"allow-non-root", no_argument, NULL, OPT_ALLOW_NON_ROOT},
 		{"include-tests", required_argument, NULL, OPT_INCLUDE},
 		{"exclude-tests", required_argument, NULL, OPT_EXCLUDE},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
@@ -423,6 +426,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_DRY_RUN:
 			settings->dry_run = true;
 			break;
+		case OPT_ALLOW_NON_ROOT:
+			settings->allow_non_root = true;
+			break;
 		case OPT_INCLUDE:
 			if (!add_regex(&settings->include_regexes, strdup(optarg)))
 				goto error;
@@ -693,6 +699,7 @@ bool serialize_settings(struct settings *settings)
 	if (settings->name)
 		SERIALIZE_LINE(f, settings, name, "%s");
 	SERIALIZE_LINE(f, settings, dry_run, "%d");
+	SERIALIZE_LINE(f, settings, allow_non_root, "%d");
 	SERIALIZE_LINE(f, settings, sync, "%d");
 	SERIALIZE_LINE(f, settings, log_level, "%d");
 	SERIALIZE_LINE(f, settings, overwrite, "%d");
@@ -740,6 +747,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, dry_run, numval);
+		PARSE_LINE(settings, name, val, allow_non_root, numval);
 		PARSE_LINE(settings, name, val, sync, numval);
 		PARSE_LINE(settings, name, val, log_level, numval);
 		PARSE_LINE(settings, name, val, overwrite, numval);
diff --git a/runner/settings.h b/runner/settings.h
index 409391f9b9de..bc61faeb6c86 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -32,6 +32,7 @@ struct settings {
 	char *test_list;
 	char *name;
 	bool dry_run;
+	bool allow_non_root;
 	struct regex_list include_regexes;
 	struct regex_list exclude_regexes;
 	bool sync;
-- 
2.35.1
