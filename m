Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDB66E3EC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 11:20:05 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 22 Apr 2020 14:19:50 +0300
Message-Id: <20200422111952.16969-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] runner: Add --prune-dynamic-results
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Before, if a test had dynamic subtests, igt_runner reported only the
dynamic subtest results and didn't report the subtest itself at
all. For some particular scenarios the opposite reporting is desired,
so add --prune-dynamic-results flag to igt_runner to achieve that
opposite reporting style.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c    | 39 +++++++++++++++++++++++----------------
 runner/runner_tests.c |  5 +++++
 runner/settings.c     | 12 ++++++++++++
 runner/settings.h     |  1 +
 4 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index fe59aafe..37560cd8 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -668,7 +668,8 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 	}
 }
 
-static bool fill_from_output(int fd, const char *binary, const char *key,
+static bool fill_from_output(int fd, struct settings *settings,
+			     const char *binary, const char *key,
 			     struct subtest_list *subtests,
 			     struct json_object *tests)
 {
@@ -760,14 +761,15 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 			set_runtime(current_test, time);
 		}
 
-		process_dynamic_subtest_output(piglit_name,
-					       igt_version, igt_version_len,
-					       matches,
-					       begin_idx, result_idx,
-					       beg, end,
-					       key,
-					       tests,
-					       &subtests->subs[i]);
+		if (!settings->prune_dynamics)
+			process_dynamic_subtest_output(piglit_name,
+						       igt_version, igt_version_len,
+						       matches,
+						       begin_idx, result_idx,
+						       beg, end,
+						       key,
+						       tests,
+						       &subtests->subs[i]);
 	}
 
 	free_matches(&matches);
@@ -1008,7 +1010,8 @@ static bool fill_from_dmesg(int fd,
 			current_test = get_or_create_json_object(tests, piglit_name);
 		}
 
-		if (current_test != NULL &&
+		if (!settings->prune_dynamics &&
+		    current_test != NULL &&
 		    (dynamic_subtest = strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG)) != NULL) {
 			if (current_dynamic_test != NULL) {
 				/* Done with the previous dynamic subtest, file up */
@@ -1029,19 +1032,22 @@ static bool fill_from_dmesg(int fd,
 			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
 			    g_regex_match(re, message, 0, NULL)) {
 				append_line(&warnings, &warningslen, formatted);
-				if (current_test != NULL)
+				if (!settings->prune_dynamics &&
+				    current_test != NULL)
 					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
 			}
 		} else {
 			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
 			    !g_regex_match(re, message, 0, NULL)) {
 				append_line(&warnings, &warningslen, formatted);
-				if (current_test != NULL)
+				if (!settings->prune_dynamics &&
+				    current_test != NULL)
 					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
 			}
 		}
 		append_line(&dmesg, &dmesglen, formatted);
-		append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
+		if (!settings->prune_dynamics)
+			append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
 		free(formatted);
 	}
 	free(line);
@@ -1456,15 +1462,16 @@ static bool parse_test_directory(int dirfd,
 	 */
 	fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
 
-	if (!fill_from_output(fds[_F_OUT], entry->binary, "out", &subtests, results->tests) ||
-	    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests) ||
+	if (!fill_from_output(fds[_F_OUT], settings, entry->binary, "out", &subtests, results->tests) ||
+	    !fill_from_output(fds[_F_ERR], settings, entry->binary, "err", &subtests, results->tests) ||
 	    !fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
 		fprintf(stderr, "Error parsing output files\n");
 		status = false;
 		goto parse_output_end;
 	}
 
-	prune_subtests_with_dynamic_subtests(entry->binary, &subtests, results->tests);
+	if (!settings->prune_dynamics)
+		prune_subtests_with_dynamic_subtests(entry->binary, &subtests, results->tests);
 
 	override_results(entry->binary, &subtests, results->tests);
 	add_to_totals(entry->binary, &subtests, results);
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 60e00960..000670a9 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -193,6 +193,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->inactivity_timeout, two->inactivity_timeout);
 	igt_assert_eq(one->per_test_timeout, two->per_test_timeout);
 	igt_assert_eq(one->use_watchdog, two->use_watchdog);
+	igt_assert_eq(one->prune_dynamics, two->prune_dynamics);
 	igt_assert_eqstr(one->test_root, two->test_root);
 	igt_assert_eqstr(one->results_path, two->results_path);
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
@@ -283,6 +284,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 0);
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
+		igt_assert_eq(settings->prune_dynamics, 0);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
@@ -401,6 +403,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 0);
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
+		igt_assert_eq(settings->prune_dynamics, 0);
 		igt_assert(strstr(settings->test_root, testdatadir) != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 		igt_assert(!settings->piglit_style_dmesg);
@@ -434,6 +437,7 @@ igt_main
 				       "--use-watchdog",
 				       "--piglit-style-dmesg",
 				       "--dmesg-warn-level=3",
+				       "--prune-dynamic-results",
 				       "test-root-dir",
 				       "path-to-results",
 		};
@@ -463,6 +467,7 @@ igt_main
 		igt_assert_eq(settings->per_test_timeout, 72);
 		igt_assert_eq(settings->overall_timeout, 360);
 		igt_assert(settings->use_watchdog);
+		igt_assert_eq(settings->prune_dynamics, 1);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
 		igt_assert(strstr(settings->results_path, "path-to-results") != NULL);
 
diff --git a/runner/settings.c b/runner/settings.c
index d18e55d1..501fe2a0 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -24,6 +24,7 @@ enum {
 	OPT_OVERALL_TIMEOUT,
 	OPT_PER_TEST_TIMEOUT,
 	OPT_VERSION,
+	OPT_PRUNE_DYNAMICS,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
 	OPT_DRY_RUN = 'd',
@@ -188,6 +189,11 @@ static const char *usage_str =
 	"                        (longer) filter list means the test result should\n"
 	"                        change. KERN_NOTICE dmesg level is treated as warn,\n"
 	"                        unless overridden with --dmesg-warn-level.\n"
+	"  --prune-dynamic-results\n"
+	"                        Don't report results for dynamic subtests separately, only\n"
+	"                        the containing subtest's result. By default, the containing\n"
+	"                        subtest's result is omitted and dynamic subtests are reported\n"
+	"                        instead.\n"
 	"  -b, --blacklist FILENAME\n"
 	"                        Exclude all test matching to regexes from FILENAME\n"
 	"                        (can be used more than once)\n"
@@ -350,6 +356,7 @@ bool parse_options(int argc, char **argv,
 		{"use-watchdog", no_argument, NULL, OPT_WATCHDOG},
 		{"piglit-style-dmesg", no_argument, NULL, OPT_PIGLIT_DMESG},
 		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
+		{"prune-dynamic-results", no_argument, NULL, OPT_PRUNE_DYNAMICS},
 		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
 		{"list-all", no_argument, NULL, OPT_LIST_ALL},
 		{ 0, 0, 0, 0},
@@ -429,6 +436,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_DMESG_WARN_LEVEL:
 			settings->dmesg_warn_level = atoi(optarg);
 			break;
+		case OPT_PRUNE_DYNAMICS:
+			settings->prune_dynamics = 1;
+			break;
 		case OPT_BLACKLIST:
 			if (!parse_blacklist(&settings->exclude_regexes,
 					     absolute_path(optarg)))
@@ -649,6 +659,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, use_watchdog, "%d");
 	SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
 	SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
+	SERIALIZE_LINE(f, settings, prune_dynamics, "%d");
 	SERIALIZE_LINE(f, settings, test_root, "%s");
 	SERIALIZE_LINE(f, settings, results_path, "%s");
 
@@ -695,6 +706,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, use_watchdog, numval);
 		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
 		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
+		PARSE_LINE(settings, name, val, prune_dynamics, numval);
 		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
 
diff --git a/runner/settings.h b/runner/settings.h
index 5203ec6e..32faa6ec 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -45,6 +45,7 @@ struct settings {
 	char *results_path;
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
+	bool prune_dynamics;
 	bool list_all;
 };
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
