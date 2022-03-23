Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA79F10E6EC
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 15:20:48 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 17:20:13 +0200
Message-Id: <20220323152016.19033-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] runner: Introduce --prune_mode to
 igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow finer control of reporting dynamic subtests instead of
unconditionally assuming that the main subtest result and logs are
uninteresting if the subtest has dynamic subtests.

The default is still to remove subtest results when the subtest has
dynamic subtests. Other options are:

keep-subtests: Remove the dynamic subtests instead, for cases when a
stable test count is more important.

keep-all: Remove nothing.

keep-requested: Remove the results that were not directly requested to
be executed. This option is useful in cases where the test selection
is a hand-picked mix of subtests and particular dynamic subtests.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 runner/resultgen.c | 83 +++++++++++++++++++++++++++++++++++-----------
 runner/settings.c  | 49 +++++++++++++++++++++++++++
 runner/settings.h  |  8 +++++
 3 files changed, 121 insertions(+), 19 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index bccfca12..76f9fb7d 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1229,19 +1229,64 @@ static void fill_from_journal(int fd,
 	fclose(f);
 }
 
-static void prune_subtests_with_dynamic_subtests(const char *binary,
-						 struct subtest_list *subtests,
-						 struct json_object *tests)
+static bool result_is_requested(struct job_list_entry *entry,
+				const char *subtestname,
+				const char *dynamic_name)
 {
-	char piglit_name[256];
+	char entryname[512];
 	size_t i;
 
+	if (dynamic_name)
+		snprintf(entryname, sizeof(entryname) - 1, "%s@%s", subtestname, dynamic_name);
+	else
+		strncpy(entryname, subtestname, sizeof(entryname) - 1);
+
+	for (i = 0; i < entry->subtest_count; i++) {
+		if (!strcmp(entry->subtests[i], entryname))
+			return true;
+	}
+
+	return false;
+}
+
+static void prune_subtests(struct settings *settings,
+			   struct job_list_entry *entry,
+			   struct subtest_list *subtests,
+			   struct json_object *tests)
+{
+	char piglit_name[256];
+	char dynamic_piglit_name[256];
+	size_t i, k;
+
+	if (settings->prune_mode == PRUNE_KEEP_ALL)
+		return;
+
 	for (i = 0; i < subtests->size; i++) {
-		if (subtests->subs[i].dynamic_size) {
-			generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
+		generate_piglit_name(entry->binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
+
+		if (settings->prune_mode == PRUNE_KEEP_DYNAMIC) {
+			if (subtests->subs[i].dynamic_size)
+				json_object_object_del(tests, piglit_name);
+
+			continue;
+		}
+
+		assert(settings->prune_mode == PRUNE_KEEP_SUBTESTS || settings->prune_mode == PRUNE_KEEP_REQUESTED);
+
+		if (settings->prune_mode == PRUNE_KEEP_REQUESTED &&
+		    !result_is_requested(entry, subtests->subs[i].name, NULL)) {
 			json_object_object_del(tests, piglit_name);
 		}
 
+		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
+			if (settings->prune_mode == PRUNE_KEEP_SUBTESTS ||
+			    (settings->prune_mode == PRUNE_KEEP_REQUESTED &&
+			     !result_is_requested(entry, subtests->subs[i].name, subtests->subs[i].dynamic_names[k]))) {
+				generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
+								 dynamic_piglit_name, sizeof(dynamic_piglit_name));
+				json_object_object_del(tests, dynamic_piglit_name);
+			}
+		}
 	}
 }
 
@@ -1426,8 +1471,7 @@ static void add_to_totals(const char *binary,
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 
-		if (subtests->subs[i].dynamic_size == 0) {
-			test = get_or_create_json_object(results->tests, piglit_name);
+		if (json_object_object_get_ex(results->tests, piglit_name, &test)) {
 			if (!json_object_object_get_ex(test, "result", &resultobj)) {
 				fprintf(stderr, "Warning: No results set for %s\n", piglit_name);
 				return;
@@ -1441,17 +1485,18 @@ static void add_to_totals(const char *binary,
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
-			test = get_or_create_json_object(results->tests, dynamic_piglit_name);
-			if (!json_object_object_get_ex(test, "result", &resultobj)) {
-				fprintf(stderr, "Warning: No results set for %s\n", dynamic_piglit_name);
-				return;
+
+			if (json_object_object_get_ex(results->tests, dynamic_piglit_name, &test)) {
+				if (!json_object_object_get_ex(test, "result", &resultobj)) {
+					fprintf(stderr, "Warning: No results set for %s\n", dynamic_piglit_name);
+					return;
+				}
+				result = json_object_get_string(resultobj);
+				add_result_to_totals(emptystrtotal, result);
+				add_result_to_totals(roottotal, result);
+				add_result_to_totals(binarytotal, result);
 			}
-			result = json_object_get_string(resultobj);
-			add_result_to_totals(emptystrtotal, result);
-			add_result_to_totals(roottotal, result);
-			add_result_to_totals(binarytotal, result);
 		}
-
 	}
 }
 
@@ -1483,9 +1528,9 @@ static bool parse_test_directory(int dirfd,
 		goto parse_output_end;
 	}
 
-	prune_subtests_with_dynamic_subtests(entry->binary, &subtests, results->tests);
-
 	override_results(entry->binary, &subtests, results->tests);
+	prune_subtests(settings, entry, &subtests, results->tests);
+
 	add_to_totals(entry->binary, &subtests, results);
 
  parse_output_end:
diff --git a/runner/settings.c b/runner/settings.c
index a7a12f50..cd64b964 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -29,6 +29,7 @@ enum {
 	OPT_ENABLE_CODE_COVERAGE,
 	OPT_COV_RESULTS_PER_TEST,
 	OPT_VERSION,
+	OPT_PRUNE_MODE,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
 	OPT_DRY_RUN = 'd',
@@ -65,6 +66,18 @@ static struct {
 	{ 0, 0 },
 };
 
+static struct {
+	int value;
+	const char *name;
+} prune_modes[] = {
+	{ PRUNE_KEEP_DYNAMIC, "keep-dynamic-subtests" },
+	{ PRUNE_KEEP_DYNAMIC, "keep-dynamic" },
+	{ PRUNE_KEEP_SUBTESTS, "keep-subtests" },
+	{ PRUNE_KEEP_ALL, "keep-all" },
+	{ PRUNE_KEEP_REQUESTED, "keep-requested" },
+	{ 0, 0 },
+};
+
 static bool set_log_level(struct settings* settings, const char *level)
 {
 	typeof(*log_levels) *it;
@@ -103,6 +116,20 @@ static bool set_abort_condition(struct settings* settings, const char *cond)
 	return false;
 }
 
+static bool set_prune_mode(struct settings* settings, const char *mode)
+{
+	typeof(*prune_modes) *it;
+
+	for (it = prune_modes; it->name; it++) {
+		if (!strcmp(mode, it->name)) {
+			settings->prune_mode = it->value;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static bool parse_abort_conditions(struct settings *settings, const char *optarg)
 {
 	char *dup, *origdup, *p;
@@ -239,6 +266,19 @@ static const char *usage_str =
 	"                        (longer) filter list means the test result should\n"
 	"                        change. KERN_NOTICE dmesg level is treated as warn,\n"
 	"                        unless overridden with --dmesg-warn-level.\n"
+	"  --prune-mode <mode>   Control reporting of dynamic subtests by selecting test\n"
+	"                        results that are removed from the final results set.\n"
+	"                        Possible options:\n"
+	"                         keep-dynamic-subtests  - Remove subtests that have dynamic\n"
+	"                                                  subtests. (default)\n"
+	"                         keep-dynamic           - Alias for the above\n"
+	"                         keep-subtests          - Remove dynamic subtests,\n"
+	"                                                  leaving just the parent subtest.\n"
+	"                         keep-all               - Don't remove anything\n"
+	"                         keep-requested         - Remove reported results that are\n"
+	"                                                  not in the requested test set.\n"
+	"                                                  Useful when you have a hand-written\n"
+	"                                                  testlist.\n"
 	"  -b, --blacklist FILENAME\n"
 	"                        Exclude all test matching to regexes from FILENAME\n"
 	"                        (can be used more than once)\n"
@@ -423,6 +463,7 @@ bool parse_options(int argc, char **argv,
 		{"use-watchdog", no_argument, NULL, OPT_WATCHDOG},
 		{"piglit-style-dmesg", no_argument, NULL, OPT_PIGLIT_DMESG},
 		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
+		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
 		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
 		{"list-all", no_argument, NULL, OPT_LIST_ALL},
 		{ 0, 0, 0, 0},
@@ -521,6 +562,12 @@ bool parse_options(int argc, char **argv,
 		case OPT_DMESG_WARN_LEVEL:
 			settings->dmesg_warn_level = atoi(optarg);
 			break;
+		case OPT_PRUNE_MODE:
+			if (!set_prune_mode(settings, optarg)) {
+				usage("Cannot parse prune mode", stderr);
+				goto error;
+			}
+			break;
 		case OPT_BLACKLIST:
 			if (!parse_blacklist(&settings->exclude_regexes,
 					     absolute_path(optarg)))
@@ -779,6 +826,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, use_watchdog, "%d");
 	SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
 	SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
+	SERIALIZE_LINE(f, settings, prune_mode, "%d");
 	SERIALIZE_LINE(f, settings, test_root, "%s");
 	SERIALIZE_LINE(f, settings, results_path, "%s");
 	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
@@ -830,6 +878,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, use_watchdog, numval);
 		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
 		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
+		PARSE_LINE(settings, name, val, prune_mode, numval);
 		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
diff --git a/runner/settings.h b/runner/settings.h
index bbd965d2..6ae64695 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -24,6 +24,13 @@ _Static_assert(ABORT_ALL == (ABORT_TAINT | ABORT_LOCKDEP | ABORT_PING), "ABORT_A
 #define GCOV_RESET GCOV_DIR	"/reset"
 #define CODE_COV_RESULTS_PATH	"code_cov"
 
+enum {
+	PRUNE_KEEP_DYNAMIC = 0,
+	PRUNE_KEEP_SUBTESTS,
+	PRUNE_KEEP_ALL,
+	PRUNE_KEEP_REQUESTED,
+};
+
 struct regex_list {
 	char **regex_strings;
 	GRegex **regexes;
@@ -51,6 +58,7 @@ struct settings {
 	char *results_path;
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
+	int prune_mode;
 	bool list_all;
 	char *code_coverage_script;
 	bool enable_code_coverage;
-- 
2.30.2
