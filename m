Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5A6E3CB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:06:32 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 18 Jun 2020 15:06:23 +0300
Message-Id: <20200618120623.6853-2-petri.latvala@intel.com>
In-Reply-To: <20200618120623.6853-1-petri.latvala@intel.com>
References: <20200618120623.6853-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] runner: Introduce --disk-usage-limit
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

Disk usage limit is a limit of disk space taken, per (dynamic)
subtest. If the test's output, kernel log included, exceeds this
limit, the test is killed, similarly to killing the test when the
kernel gets tainted.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/executor.c     | 55 ++++++++++++++++++++++++++++++++++++-------
 runner/runner_tests.c | 28 ++++++++++++++++++++++
 runner/settings.c     | 55 +++++++++++++++++++++++++++++++++++++++++++
 runner/settings.h     |  1 +
 4 files changed, 130 insertions(+), 9 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 7bb2b14c..25e37bff 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -540,7 +540,8 @@ void close_outputs(int *fds)
 	}
 }
 
-static int dump_dmesg(int kmsgfd, int outfd)
+/* Returns the number of bytes written to disk, or a negative number on error */
+static long dump_dmesg(int kmsgfd, int outfd)
 {
 	/*
 	 * Write kernel messages to the log file until we reach
@@ -556,6 +557,7 @@ static int dump_dmesg(int kmsgfd, int outfd)
 	char cont;
 	char buf[2048];
 	ssize_t r;
+	long written = 0;
 
 	if (kmsgfd < 0)
 		return 0;
@@ -600,15 +602,16 @@ static int dump_dmesg(int kmsgfd, int outfd)
 				continue;
 			} else if (errno != EAGAIN) {
 				errf("Error reading from kmsg: %m\n");
-				return errno;
+				return -errno;
 			}
 
 			/* EAGAIN, so we're done dumping */
 			close(comparefd);
-			return 0;
+			return written;
 		}
 
 		write(outfd, buf, r);
+		written += r;
 
 		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
 					    &flags, &seq, &usec, &cont) == 4) {
@@ -618,7 +621,7 @@ static int dump_dmesg(int kmsgfd, int outfd)
 			 * enough.
 			 */
 			if (seq >= cmpseq)
-				return 0;
+				return written;
 		}
 	}
 }
@@ -708,12 +711,20 @@ static const char *show_kernel_task_state(const char *msg)
 	return msg;
 }
 
+static bool disk_usage_limit_exceeded(struct settings *settings,
+				      size_t disk_usage)
+{
+	return settings->disk_usage_limit != 0 &&
+		disk_usage > settings->disk_usage_limit;
+}
+
 static const char *need_to_timeout(struct settings *settings,
 				   int killed,
 				   unsigned long taints,
 				   double time_since_activity,
 				   double time_since_subtest,
-				   double time_since_kill)
+				   double time_since_kill,
+				   size_t disk_usage)
 {
 	if (killed) {
 		/*
@@ -757,6 +768,9 @@ static const char *need_to_timeout(struct settings *settings,
 	    time_since_activity > settings->inactivity_timeout)
 		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
 
+	if (disk_usage_limit_exceeded(settings, disk_usage))
+		return "Disk usage limit exceeded.\n";
+
 	return NULL;
 }
 
@@ -801,6 +815,7 @@ static int monitor_output(pid_t child,
 	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
 	unsigned long taints = 0;
 	bool aborting = false;
+	size_t disk_usage = 0;
 
 	igt_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
@@ -878,6 +893,7 @@ static int monitor_output(pid_t child,
 			}
 
 			write(outputs[_F_OUT], buf, s);
+			disk_usage += s;
 			if (settings->sync) {
 				fdatasync(outputs[_F_OUT]);
 			}
@@ -901,6 +917,7 @@ static int monitor_output(pid_t child,
 					current_subtest[linelen - strlen(STARTING_SUBTEST)] = '\0';
 
 					time_last_subtest = time_now;
+					disk_usage = s;
 
 					if (settings->log_level >= LOG_LEVEL_VERBOSE) {
 						fwrite(outbuf, 1, linelen, stdout);
@@ -933,6 +950,7 @@ static int monitor_output(pid_t child,
 				if (linelen > strlen(STARTING_DYNAMIC_SUBTEST) &&
 				    !memcmp(outbuf, STARTING_DYNAMIC_SUBTEST, strlen(STARTING_DYNAMIC_SUBTEST))) {
 					time_last_subtest = time_now;
+					disk_usage = s;
 
 					if (settings->log_level >= LOG_LEVEL_VERBOSE) {
 						fwrite(outbuf, 1, linelen, stdout);
@@ -967,6 +985,7 @@ static int monitor_output(pid_t child,
 				errfd = -1;
 			} else {
 				write(outputs[_F_ERR], buf, s);
+				disk_usage += s;
 				if (settings->sync) {
 					fdatasync(outputs[_F_ERR]);
 				}
@@ -974,17 +993,19 @@ static int monitor_output(pid_t child,
 		}
 
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
-			int dmesgstatus;
+			long dmesgwritten;
 
 			time_last_activity = time_now;
 
-			dmesgstatus = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
 			if (settings->sync)
 				fdatasync(outputs[_F_DMESG]);
 
-			if (dmesgstatus) {
+			if (dmesgwritten < 0) {
 				close(kmsgfd);
 				kmsgfd = -1;
+			} else {
+				disk_usage += dmesgwritten;
 			}
 		}
 
@@ -1070,6 +1091,21 @@ static int monitor_output(pid_t child,
 						fdatasync(outputs[_F_OUT]);
 				}
 
+				/*
+				 * Same goes for stopping because we
+				 * exceeded the disk usage limit.
+				 */
+				if (disk_usage_limit_exceeded(settings, disk_usage)) {
+					exitline = EXECUTOR_EXIT;
+					dprintf(outputs[_F_OUT],
+						"\nrunner: This test was killed due to exceeding disk usage limit. "
+						"(Used %zd bytes, limit %zd)\n",
+						disk_usage,
+						settings->disk_usage_limit);
+					if (settings->sync)
+						fdatasync(outputs[_F_OUT]);
+				}
+
 				dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
 					exitline,
 					status, time);
@@ -1091,7 +1127,8 @@ static int monitor_output(pid_t child,
 		timeout_reason = need_to_timeout(settings, killed, tainted(&taints),
 						 igt_time_elapsed(&time_last_activity, &time_now),
 						 igt_time_elapsed(&time_last_subtest, &time_now),
-						 igt_time_elapsed(&time_killed, &time_now));
+						 igt_time_elapsed(&time_killed, &time_now),
+						 disk_usage);
 
 		if (timeout_reason) {
 			if (killed == SIGKILL) {
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 48b02107..cd033f6c 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -183,6 +183,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	 * here.
 	 */
 	igt_assert_eq(one->abort_mask, two->abort_mask);
+	igt_assert_eq_u64(one->disk_usage_limit, two->disk_usage_limit);
 	igt_assert_eqstr(one->test_list, two->test_list);
 	igt_assert_eqstr(one->name, two->name);
 	igt_assert_eq(one->dry_run, two->dry_run);
@@ -270,6 +271,7 @@ igt_main
 		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
 
 		igt_assert_eq(settings->abort_mask, 0);
+		igt_assert_eq_u64(settings->disk_usage_limit, 0UL);
 		igt_assert(!settings->test_list);
 		igt_assert_eqstr(settings->name, "path-to-results");
 		igt_assert(!settings->dry_run);
@@ -415,6 +417,7 @@ igt_main
 		const char *argv[] = { "runner",
 				       "-n", "foo",
 				       "--abort-on-monitored-error=taint,lockdep",
+				       "--disk-usage-limit=4096",
 				       "--test-list", "path-to-test-list",
 				       "--ignore-missing",
 				       "--dry-run",
@@ -444,6 +447,7 @@ igt_main
 		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
 
 		igt_assert_eq(settings->abort_mask, ABORT_TAINT | ABORT_LOCKDEP);
+		igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
 		igt_assert(strstr(settings->test_list, "path-to-test-list") != NULL);
 		igt_assert_eqstr(settings->name, "foo");
 		igt_assert(settings->dry_run);
@@ -592,6 +596,29 @@ igt_main
 
 	}
 
+	igt_subtest("disk-usage-limit-suffixes") {
+		const char *argv[] = { "runner",
+				       "--disk-usage-limit=4096",
+				       "test-root-dir",
+				       "results-path",
+		};
+
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
+
+		argv[1] = "--disk-usage-limit=4k";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
+
+		argv[1] = "--disk-usage-limit=1M";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL);
+
+		argv[1] = "--disk-usage-limit=1G";
+		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+		igt_assert_eq_u64(settings->disk_usage_limit, 1024UL * 1024UL * 1024UL);
+	}
+
 	igt_subtest("parse-clears-old-data") {
 		const char *argv[] = { "runner",
 				       "-n", "foo",
@@ -838,6 +865,7 @@ igt_main
 			const char *argv[] = { "runner",
 					       "-n", "foo",
 					       "--abort-on-monitored-error",
+					       "--disk-usage-limit=4k",
 					       "--test-list", "path-to-test-list",
 					       "--ignore-missing",
 					       "--dry-run",
diff --git a/runner/settings.c b/runner/settings.c
index 25f248ef..200f1ce5 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -17,6 +17,7 @@
 
 enum {
 	OPT_ABORT_ON_ERROR,
+	OPT_DISK_USAGE_LIMIT,
 	OPT_TEST_LIST,
 	OPT_IGNORE_MISSING,
 	OPT_PIGLIT_DMESG,
@@ -124,6 +125,46 @@ static bool parse_abort_conditions(struct settings *settings, const char *optarg
 	return true;
 }
 
+static size_t char_to_multiplier(char c)
+{
+	switch (c) {
+	case 'k':
+	case 'K':
+		return 1024UL;
+	case 'm':
+	case 'M':
+		return 1024UL * 1024UL;
+	case 'g':
+	case 'G':
+		return 1024UL * 1024UL * 1024UL;
+	}
+
+	return 0;
+}
+
+static bool parse_usage_limit(struct settings *settings, const char *optarg)
+{
+	size_t value;
+	char *endptr = NULL;
+
+	if (!optarg)
+		return false;
+
+	value = strtoul(optarg, &endptr, 10);
+
+	if (*endptr) {
+		size_t multiplier = char_to_multiplier(*endptr);
+
+		if (multiplier == 0)
+			return false;
+
+		value *= multiplier;
+	}
+
+	settings->disk_usage_limit = value;
+	return true;
+}
+
 static const char *usage_str =
 	"usage: runner [options] [test_root] results-path\n"
 	"   or: runner --list-all [options] [test_root]\n\n"
@@ -173,6 +214,11 @@ static const char *usage_str =
 	"                        even when running in multiple-mode, must finish in <seconds>.\n"
 	"  --overall-timeout <seconds>\n"
 	"                        Don't execute more tests after <seconds> has elapsed\n"
+	"  --disk-usage-limit <limit>\n"
+	"                        Kill the running test if its logging, both itself and the\n"
+	"                        kernel logs, exceed the given limit in bytes. The limit\n"
+	"                        parameter can use suffixes k, M and G for kilo/mega/gigabytes,\n"
+	"                        respectively. Limit of 0 (default) disables the limit.\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -338,6 +384,7 @@ bool parse_options(int argc, char **argv,
 		{"include-tests", required_argument, NULL, OPT_INCLUDE},
 		{"exclude-tests", required_argument, NULL, OPT_EXCLUDE},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
+		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"sync", no_argument, NULL, OPT_SYNC},
 		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
 		{"test-list", required_argument, NULL, OPT_TEST_LIST},
@@ -388,6 +435,12 @@ bool parse_options(int argc, char **argv,
 			if (!parse_abort_conditions(settings, optarg))
 				goto error;
 			break;
+		case OPT_DISK_USAGE_LIMIT:
+			if (!parse_usage_limit(settings, optarg)) {
+				usage("Cannot parse disk usage limit", stderr);
+				goto error;
+			}
+			break;
 		case OPT_SYNC:
 			settings->sync = true;
 			break;
@@ -634,6 +687,7 @@ bool serialize_settings(struct settings *settings)
 	}
 
 	SERIALIZE_LINE(f, settings, abort_mask, "%d");
+	SERIALIZE_LINE(f, settings, disk_usage_limit, "%zd");
 	if (settings->test_list)
 		SERIALIZE_LINE(f, settings, test_list, "%s");
 	if (settings->name)
@@ -682,6 +736,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		int numval = atoi(val);
 		PARSE_LINE(settings, name, val, abort_mask, numval);
+		PARSE_LINE(settings, name, val, disk_usage_limit, strtoul(val, NULL, 10));
 		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, dry_run, numval);
diff --git a/runner/settings.h b/runner/settings.h
index 5203ec6e..409391f9 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -28,6 +28,7 @@ struct regex_list {
 
 struct settings {
 	int abort_mask;
+	size_t disk_usage_limit;
 	char *test_list;
 	char *name;
 	bool dry_run;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
