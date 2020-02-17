Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485B96E970
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:50:47 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 17 Feb 2020 16:50:42 +0200
Message-Id: <20200217145042.829-2-petri.latvala@intel.com>
In-Reply-To: <20200217145042.829-1-petri.latvala@intel.com>
References: <20200217145042.829-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] runner: Introduce per-test timeouts
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

A new config option, --per-test-timeout, sets a time a single test
cannot exceed without getting itself killed. The time resets when
starting a subtest or a dynamic subtest, so an execution with
--per-test-timeout=20 can indeed go over 20 seconds a long as it
launches a dynamic subtest within that time.

As a bonus, verbose log level from runner now also prints dynamic
subtest begin/result.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c     | 34 +++++++++++++++++++++++++++++++---
 runner/runner_tests.c |  6 ++++++
 runner/settings.c     | 11 +++++++++++
 runner/settings.h     |  1 +
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 33610c9e..72e45b65 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -676,6 +676,7 @@ static const char *need_to_timeout(struct settings *settings,
 				   int killed,
 				   unsigned long taints,
 				   double time_since_activity,
+				   double time_since_subtest,
 				   double time_since_kill)
 {
 	if (killed) {
@@ -712,10 +713,16 @@ static const char *need_to_timeout(struct settings *settings,
 	    is_tainted(taints))
 		return "Killing the test because the kernel is tainted.\n";
 
+	if (settings->per_test_timeout != 0 &&
+	    time_since_subtest > settings->per_test_timeout) {
+		show_kernel_task_state();
+		return "Per-test timeout exceeded. Killing the current test with SIGQUIT.\n";
+	}
+
 	if (settings->inactivity_timeout != 0 &&
 	    time_since_activity > settings->inactivity_timeout) {
 		show_kernel_task_state();
-		return "Timeout. Killing the current test with SIGQUIT.\n";
+		return "Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n";
 	}
 
 	return NULL;
@@ -759,12 +766,12 @@ static int monitor_output(pid_t child,
 	const int interval_length = 1;
 	int wd_timeout;
 	int killed = 0; /* 0 if not killed, signal number otherwise */
-	struct timespec time_beg, time_now, time_last_activity, time_killed;
+	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
 	unsigned long taints = 0;
 	bool aborting = false;
 
 	igt_gettime(&time_beg);
-	time_last_activity = time_killed = time_beg;
+	time_last_activity = time_last_subtest = time_killed = time_beg;
 
 	if (errfd > nfds)
 		nfds = errfd;
@@ -823,6 +830,7 @@ static int monitor_output(pid_t child,
 
 		timeout_reason = need_to_timeout(settings, killed, tainted(&taints),
 						 igt_time_elapsed(&time_last_activity, &time_now),
+						 igt_time_elapsed(&time_last_subtest, &time_now),
 						 igt_time_elapsed(&time_killed, &time_now));
 
 		if (timeout_reason) {
@@ -893,6 +901,8 @@ static int monitor_output(pid_t child,
 					       linelen - strlen(STARTING_SUBTEST));
 					current_subtest[linelen - strlen(STARTING_SUBTEST)] = '\0';
 
+					time_last_subtest = time_now;
+
 					if (settings->log_level >= LOG_LEVEL_VERBOSE) {
 						fwrite(outbuf, 1, linelen, stdout);
 					}
@@ -921,6 +931,24 @@ static int monitor_output(pid_t child,
 						}
 					}
 				}
+				if (linelen > strlen(STARTING_DYNAMIC_SUBTEST) &&
+				    !memcmp(outbuf, STARTING_DYNAMIC_SUBTEST, strlen(STARTING_DYNAMIC_SUBTEST))) {
+					time_last_subtest = time_now;
+
+					if (settings->log_level >= LOG_LEVEL_VERBOSE) {
+						fwrite(outbuf, 1, linelen, stdout);
+					}
+				}
+				if (linelen > strlen(DYNAMIC_SUBTEST_RESULT) &&
+				    !memcmp(outbuf, DYNAMIC_SUBTEST_RESULT, strlen(DYNAMIC_SUBTEST_RESULT))) {
+					char *delim = memchr(outbuf, ':', linelen);
+
+					if (delim != NULL) {
+						if (settings->log_level >= LOG_LEVEL_VERBOSE) {
+							fwrite(outbuf, 1, linelen, stdout);
+						}
+					}
+				}
 
 				memmove(outbuf, newline + 1, outbufsize - linelen);
 				outbufsize -= linelen;
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index ed30b3f9..2f4e0abb 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -173,6 +173,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->overwrite, two->overwrite);
 	igt_assert_eq(one->multiple_mode, two->multiple_mode);
 	igt_assert_eq(one->inactivity_timeout, two->inactivity_timeout);
+	igt_assert_eq(one->per_test_timeout, two->per_test_timeout);
 	igt_assert_eq(one->use_watchdog, two->use_watchdog);
 	igt_assert_eqstr(one->test_root, two->test_root);
 	igt_assert_eqstr(one->results_path, two->results_path);
@@ -261,6 +262,7 @@ igt_main
 		igt_assert(!settings->overwrite);
 		igt_assert(!settings->multiple_mode);
 		igt_assert_eq(settings->inactivity_timeout, 0);
+		igt_assert_eq(settings->per_test_timeout, 0);
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
@@ -378,6 +380,7 @@ igt_main
 		igt_assert(!settings->overwrite);
 		igt_assert(!settings->multiple_mode);
 		igt_assert_eq(settings->inactivity_timeout, 0);
+		igt_assert_eq(settings->per_test_timeout, 0);
 		igt_assert_eq(settings->overall_timeout, 0);
 		igt_assert(!settings->use_watchdog);
 		igt_assert(strstr(settings->test_root, testdatadir) != NULL);
@@ -408,6 +411,7 @@ igt_main
 				       "--overwrite",
 				       "--multiple-mode",
 				       "--inactivity-timeout", "27",
+				       "--per-test-timeout", "72",
 				       "--overall-timeout", "360",
 				       "--use-watchdog",
 				       "--piglit-style-dmesg",
@@ -438,6 +442,7 @@ igt_main
 		igt_assert(settings->overwrite);
 		igt_assert(settings->multiple_mode);
 		igt_assert_eq(settings->inactivity_timeout, 27);
+		igt_assert_eq(settings->per_test_timeout, 72);
 		igt_assert_eq(settings->overall_timeout, 360);
 		igt_assert(settings->use_watchdog);
 		igt_assert(strstr(settings->test_root, "test-root-dir") != NULL);
@@ -827,6 +832,7 @@ igt_main
 					       "--overwrite",
 					       "--multiple-mode",
 					       "--inactivity-timeout", "27",
+					       "--per-test-timeout", "72",
 					       "--overall-timeout", "360",
 					       "--use-watchdog",
 					       "--piglit-style-dmesg",
diff --git a/runner/settings.c b/runner/settings.c
index d601cd11..32840307 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -20,6 +20,7 @@ enum {
 	OPT_PIGLIT_DMESG,
 	OPT_DMESG_WARN_LEVEL,
 	OPT_OVERALL_TIMEOUT,
+	OPT_PER_TEST_TIMEOUT,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
 	OPT_DRY_RUN = 'd',
@@ -163,6 +164,10 @@ static const char *usage_str =
 	"  --inactivity-timeout <seconds>\n"
 	"                        Kill the running test after <seconds> of inactivity in\n"
 	"                        the test's stdout, stderr, or dmesg\n"
+	"  --per-test-timeout <seconds>\n"
+	"                        Kill the running test after <seconds>. This timeout is per\n"
+	"                        subtest, or dynamic subtest. In other words, every subtest,\n"
+	"                        even when running in multiple-mode, must finish in <seconds>.\n"
 	"  --overall-timeout <seconds>\n"
 	"                        Don't execute more tests after <seconds> has elapsed\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
@@ -325,6 +330,7 @@ bool parse_options(int argc, char **argv,
 		{"ignore-missing", no_argument, NULL, OPT_IGNORE_MISSING},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
 		{"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
+		{"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
 		{"overall-timeout", required_argument, NULL, OPT_OVERALL_TIMEOUT},
 		{"use-watchdog", no_argument, NULL, OPT_WATCHDOG},
 		{"piglit-style-dmesg", no_argument, NULL, OPT_PIGLIT_DMESG},
@@ -388,6 +394,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_TIMEOUT:
 			settings->inactivity_timeout = atoi(optarg);
 			break;
+		case OPT_PER_TEST_TIMEOUT:
+			settings->per_test_timeout = atoi(optarg);
+			break;
 		case OPT_OVERALL_TIMEOUT:
 			settings->overall_timeout = atoi(optarg);
 			break;
@@ -617,6 +626,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, overwrite, "%d");
 	SERIALIZE_LINE(f, settings, multiple_mode, "%d");
 	SERIALIZE_LINE(f, settings, inactivity_timeout, "%d");
+	SERIALIZE_LINE(f, settings, per_test_timeout, "%d");
 	SERIALIZE_LINE(f, settings, overall_timeout, "%d");
 	SERIALIZE_LINE(f, settings, use_watchdog, "%d");
 	SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
@@ -662,6 +672,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, overwrite, numval);
 		PARSE_LINE(settings, name, val, multiple_mode, numval);
 		PARSE_LINE(settings, name, val, inactivity_timeout, numval);
+		PARSE_LINE(settings, name, val, per_test_timeout, numval);
 		PARSE_LINE(settings, name, val, overall_timeout, numval);
 		PARSE_LINE(settings, name, val, use_watchdog, numval);
 		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
diff --git a/runner/settings.h b/runner/settings.h
index 13409f04..5203ec6e 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -38,6 +38,7 @@ struct settings {
 	bool overwrite;
 	bool multiple_mode;
 	int inactivity_timeout;
+	int per_test_timeout;
 	int overall_timeout;
 	bool use_watchdog;
 	char *test_root;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
