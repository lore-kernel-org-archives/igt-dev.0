Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71338CAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 12:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FDF10E6F7;
	Tue,  9 Sep 2025 12:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7KzAiQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11D10E6F7
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757422028; x=1788958028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=In9YpYSfNPOwFZ8Lf4fCuBgN9PEgpRD4jJCOyVheNxY=;
 b=m7KzAiQ93dSU+hxzQt+vU8QUAX7OmnwmuLQwVDadQXn0p6GB+EAsfOcl
 mPTycky8SThm+Et41aiT1dS49YPrVF5J1NyE6ZMUWeR8DUZ0807IkZlhi
 oYpmuHZuY7813vK+dgVtIchAcwzOdfzNF+zIDaZml6lrTOx53qFQy8UqC
 Y7zrrpAxjJkIr7IxqhUEtsamp6RRtbmyr+0Pnjp86gbJxMjPvR1efkPUj
 ZmZbgV8USrjptE85lpOr+Gw5P1l53WfZU7/+9mpipvZIRgxXHD2POJzBX
 KWjnRLstqp2BpDxDMvn49ZlgGZzsCnIz/ZGr3L9M2gPGZ1LU2JPRI2lAE A==;
X-CSE-ConnectionGUID: FgcTX5DOQXujYtiWbQR64A==
X-CSE-MsgGUID: AJ13ZnPkRE2tsfvmAWzuig==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62330862"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="62330862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:47:07 -0700
X-CSE-ConnectionGUID: F6TXqM2eQoynEWFVehu54g==
X-CSE-MsgGUID: 0PuKmJprQ/68iFM4znvOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="203850777"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:47:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] runner: Add option disk-limit-per-run
Date: Tue,  9 Sep 2025 14:46:51 +0200
Message-ID: <20250909124651.173431-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
References: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add new option for a global disk limit where each tests disk
usage will be added up and if that will exceed per run limit,
runner will abort testing.

v2: use short name for option, add testing (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c     | 70 ++++++++++++++++++++++++++++++-------------
 runner/executor.h     |  1 +
 runner/runner_tests.c |  6 ++++
 runner/settings.c     | 19 ++++++++++--
 runner/settings.h     |  1 +
 5 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..ecebb8f59 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -46,6 +46,9 @@
 #define KMSG_WARN 4
 #define GRACEFUL_EXITCODE -SIGHUP
 
+#define DISK_EXCEEDED_IN_TEST 1
+#define DISK_EXCEEDED_IN_RUN  2
+
 static struct {
 	int *fds;
 	size_t num_dogs;
@@ -820,11 +823,20 @@ static const char *show_kernel_task_state(const char *msg)
 	return msg;
 }
 
-static bool disk_usage_limit_exceeded(struct settings *settings,
-				      size_t disk_usage)
+static int disk_usage_limit_exceeded(struct settings *settings,
+				     size_t disk_usage_in_test,
+				     size_t disk_usage_in_run)
 {
-	return settings->disk_usage_limit != 0 &&
-		disk_usage > settings->disk_usage_limit;
+	if (!settings->disk_usage_limit)
+		return 0;
+
+	if (disk_usage_in_test > settings->disk_usage_limit)
+		return DISK_EXCEEDED_IN_TEST;
+
+	if (disk_usage_in_run > settings->disk_usage_limit)
+		return DISK_EXCEEDED_IN_RUN;
+
+	return 0;
 }
 
 static const char *need_to_timeout(struct settings *settings,
@@ -833,7 +845,8 @@ static const char *need_to_timeout(struct settings *settings,
 				   double time_since_activity,
 				   double time_since_subtest,
 				   double time_since_kill,
-				   size_t disk_usage)
+				   size_t disk_usage_in_test,
+				   size_t disk_usage_in_run)
 {
 	int decrease = 1;
 
@@ -896,7 +909,7 @@ static const char *need_to_timeout(struct settings *settings,
 		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
 	}
 
-	if (disk_usage_limit_exceeded(settings, disk_usage))
+	if (disk_usage_limit_exceeded(settings, disk_usage_in_test, disk_usage_in_run))
 		return "Disk usage limit exceeded.\n";
 
 	return NULL;
@@ -959,6 +972,7 @@ static int monitor_output(pid_t child,
 			  int kmsgfd, int sigfd,
 			  int *outputs,
 			  double *time_spent,
+			  size_t *disk_usage_in_run,
 			  struct settings *settings,
 			  char **abortreason,
 			  bool *abort_already_written)
@@ -1069,6 +1083,7 @@ static int monitor_output(pid_t child,
 
 			write(outputs[_F_OUT], buf, s);
 			disk_usage += s;
+			*disk_usage_in_run += s;
 			if (settings->sync) {
 				fdatasync(outputs[_F_OUT]);
 			}
@@ -1093,6 +1108,7 @@ static int monitor_output(pid_t child,
 
 					time_last_subtest = time_now;
 					disk_usage = s;
+					*disk_usage_in_run += s;
 
 					if (settings->log_level >= LOG_LEVEL_VERBOSE) {
 						fwrite(outbuf, 1, linelen, stdout);
@@ -1126,6 +1142,7 @@ static int monitor_output(pid_t child,
 				    !memcmp(outbuf, STARTING_DYNAMIC_SUBTEST, strlen(STARTING_DYNAMIC_SUBTEST))) {
 					time_last_subtest = time_now;
 					disk_usage = s;
+					*disk_usage_in_run += s;
 
 					if (settings->log_level >= LOG_LEVEL_VERBOSE) {
 						fwrite(outbuf, 1, linelen, stdout);
@@ -1161,6 +1178,7 @@ static int monitor_output(pid_t child,
 			} else {
 				write(outputs[_F_ERR], buf, s);
 				disk_usage += s;
+				*disk_usage_in_run += s;
 				if (settings->sync) {
 					fdatasync(outputs[_F_ERR]);
 				}
@@ -1252,6 +1270,7 @@ static int monitor_output(pid_t child,
 
 				write_packet_with_canary(outputs[_F_SOCKET], packet, settings->sync);
 				disk_usage += packet->size;
+				*disk_usage_in_run += packet->size;
 
 				if (packet->type == PACKETTYPE_SUBTEST_RESULT ||
 				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_RESULT)
@@ -1318,6 +1337,7 @@ static int monitor_output(pid_t child,
 				kmsgfd = -1;
 			} else {
 				disk_usage += dmesgwritten;
+				*disk_usage_in_run += dmesgwritten;
 			}
 		}
 
@@ -1411,6 +1431,7 @@ static int monitor_output(pid_t child,
 
 			if (!aborting) {
 				bool timeoutresult = false;
+				int disk_reason = 0;
 
 				if (killed)
 					timeoutresult = true;
@@ -1462,27 +1483,31 @@ static int monitor_output(pid_t child,
 				 * Same goes for stopping because we
 				 * exceeded the disk usage limit.
 				 */
-				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
-					timeoutresult = false;
-
-					if (socket_comms_used) {
-						struct runnerpacket *message;
-						char killmsg[256];
+				if (killed && (disk_reason = disk_usage_limit_exceeded(settings, disk_usage, *disk_usage_in_run))) {
+					char killmsg[256];
 
+					timeoutresult = false;
+					if (disk_reason == DISK_EXCEEDED_IN_TEST)
 						snprintf(killmsg, sizeof(killmsg),
-							 "runner: This test was killed due to exceeding disk usage limit. "
+							 "runner: This test was killed due to exceeding disk usage limit per test. "
 							 "(Used %zd bytes, limit %zd)\n",
 							 disk_usage,
 							 settings->disk_usage_limit);
+					else
+						snprintf(killmsg, sizeof(killmsg),
+							 "runner: This test was killed, exceeded disk limit per run. "
+							 "(Used %zd bytes, limit %zd)\n",
+							 *disk_usage_in_run,
+							 settings->disk_limit_per_run);
+
+					if (socket_comms_used) {
+						struct runnerpacket *message;
+
 						message = runnerpacket_log(STDOUT_FILENO, killmsg);
 						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
 						free(message);
 					} else {
-						dprintf(outputs[_F_OUT],
-							"\nrunner: This test was killed due to exceeding disk usage limit. "
-							"(Used %zd bytes, limit %zd)\n",
-							disk_usage,
-							settings->disk_usage_limit);
+						dprintf(outputs[_F_OUT], "%s", killmsg);
 						if (settings->sync)
 							fdatasync(outputs[_F_OUT]);
 					}
@@ -1537,7 +1562,7 @@ static int monitor_output(pid_t child,
 						 igt_time_elapsed(&time_last_activity, &time_now),
 						 igt_time_elapsed(&time_last_subtest, &time_now),
 						 igt_time_elapsed(&time_killed, &time_now),
-						 disk_usage);
+						 disk_usage, *disk_usage_in_run);
 
 		if (timeout_reason) {
 			if (killed == SIGKILL) {
@@ -1589,6 +1614,7 @@ static int monitor_output(pid_t child,
 		fdatasync(outputs[_F_DMESG]);
 	if (dmesgwritten > 0) {
 		disk_usage += dmesgwritten;
+		*disk_usage_in_run += dmesgwritten;
 		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
 			char disk[1024];
 
@@ -1765,6 +1791,7 @@ static char *entry_display_name(struct job_list_entry *entry)
 static int execute_next_entry(struct execute_state *state,
 			      size_t total,
 			      double *time_spent,
+			      size_t *disk_usage_in_run,
 			      struct settings *settings,
 			      struct job_list_entry *entry,
 			      int testdirfd, int resdirfd,
@@ -1885,7 +1912,8 @@ static int execute_next_entry(struct execute_state *state,
 
 	result = monitor_output(child, outfd, errfd, socketfd,
 				kmsgfd, sigfd,
-				outputs, time_spent, settings,
+				outputs, time_spent, disk_usage_in_run,
+				settings,
 				abortreason, abort_already_written);
 
 out_kmsgfd:
@@ -2423,6 +2451,7 @@ bool execute(struct execute_state *state,
 	struct utsname unamebuf;
 	sigset_t sigmask;
 	double time_spent = 0.0;
+	size_t disk_used_in_run = 0;
 	bool status = true;
 	char *last_test = NULL;
 
@@ -2595,6 +2624,7 @@ bool execute(struct execute_state *state,
 			result = execute_next_entry(state,
 						    job_list->size,
 						    &time_spent,
+						    &disk_used_in_run,
 						    settings,
 						    &job_list->entries[state->next],
 						    testdirfd, resdirfd,
diff --git a/runner/executor.h b/runner/executor.h
index 3b1cabcf5..f47b17c6e 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -13,6 +13,7 @@ struct execute_state
 	 * > 0 : Timeout in use, time left.
 	 */
 	double time_left;
+	size_t disk_used_in_run;
 	bool dry;
 };
 
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index af1650101..1b671de68 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -186,6 +186,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	 */
 	igt_assert_eq(one->abort_mask, two->abort_mask);
 	igt_assert_eq_u64(one->disk_usage_limit, two->disk_usage_limit);
+	igt_assert_eq_u64(one->disk_limit_per_run, two->disk_limit_per_run);
 	igt_assert_eqstr(one->test_list, two->test_list);
 	igt_assert_eqstr(one->name, two->name);
 	igt_assert_eq(one->dry_run, two->dry_run);
@@ -328,6 +329,7 @@ igt_main
 
 		igt_assert_eq(settings->abort_mask, 0);
 		igt_assert_eq_u64(settings->disk_usage_limit, 0UL);
+		igt_assert_eq_u64(settings->disk_limit_per_run, 0UL);
 		igt_assert(!settings->test_list);
 		igt_assert_eqstr(settings->name, "path-to-results");
 		igt_assert(!settings->dry_run);
@@ -486,6 +488,7 @@ igt_main
 				       "-n", "foo",
 				       "--abort-on-monitored-error=taint,lockdep",
 				       "--disk-usage-limit=4096",
+				       "--disk-limit-per-run=4096",
 				       "--test-list", "path-to-test-list",
 				       "--ignore-missing",
 				       "--dry-run",
@@ -528,6 +531,7 @@ igt_main
 
 		igt_assert_eq(settings->abort_mask, ABORT_TAINT | ABORT_LOCKDEP);
 		igt_assert_eq_u64(settings->disk_usage_limit, 4096UL);
+		igt_assert_eq_u64(settings->disk_limit_per_run, 4096UL);
 		igt_assert(strstr(settings->test_list, "path-to-test-list") != NULL);
 		igt_assert_eqstr(settings->name, "foo");
 		igt_assert(settings->dry_run);
@@ -704,6 +708,7 @@ igt_main
 	igt_subtest("disk-usage-limit-suffixes") {
 		test_disk_usage_limit_suffixes("--disk-usage-limit", settings);
 		test_disk_usage_limit_suffixes("--disk-limit-per-subtest", settings);
+		test_disk_usage_limit_suffixes("--disk-limit-per-run", settings);
 	}
 
 	igt_subtest("prune-modes") {
@@ -991,6 +996,7 @@ igt_main
 					       "-n", "foo",
 					       "--abort-on-monitored-error",
 					       "--disk-usage-limit=4k",
+					       "--disk-limit-per-run=4k",
 					       "--test-list", "path-to-test-list",
 					       "--ignore-missing",
 					       "--dry-run",
diff --git a/runner/settings.c b/runner/settings.c
index 47f244a0d..6447760eb 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -21,6 +21,7 @@
 enum {
 	OPT_ABORT_ON_ERROR,
 	OPT_DISK_USAGE_LIMIT,
+	OPT_DISK_LIMIT_PER_RUN,
 	OPT_TEST_LIST,
 	OPT_IGNORE_MISSING,
 	OPT_PIGLIT_DMESG,
@@ -187,7 +188,7 @@ static size_t char_to_multiplier(char c)
 	return 0;
 }
 
-static bool parse_usage_limit(struct settings *settings, const char *optarg)
+static bool parse_usage_limit(size_t *dst, const char *optarg)
 {
 	size_t value;
 	char *endptr = NULL;
@@ -206,7 +207,7 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
 		value *= multiplier;
 	}
 
-	settings->disk_usage_limit = value;
+	*dst = value;
 	return true;
 }
 
@@ -279,6 +280,9 @@ static const char *usage_str =
 	"                        For dynamic tests, it applies to sub-subtests separately.\n"
 	"  --disk-limit-per-subtest <limit>\n"
 	"                        Alias for --disk-usage-limit\n"
+	"  --disk-limit-per-run <limit>\n"
+	"                        Kill the run if logging accumulated for all tests exceed\n"
+	"                        the given limit in bytes.\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -732,6 +736,7 @@ bool parse_options(int argc, char **argv,
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"disk-limit-per-subtest", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"disk-limit-per-run", required_argument, NULL, OPT_DISK_LIMIT_PER_RUN},
 		{"facts", no_argument, NULL, OPT_FACTS},
 		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
 		{"sync", no_argument, NULL, OPT_SYNC},
@@ -800,11 +805,17 @@ bool parse_options(int argc, char **argv,
 				goto error;
 			break;
 		case OPT_DISK_USAGE_LIMIT:
-			if (!parse_usage_limit(settings, optarg)) {
+			if (!parse_usage_limit(&settings->disk_usage_limit, optarg)) {
 				usage(stderr, "Cannot parse disk usage limit");
 				goto error;
 			}
 			break;
+		case OPT_DISK_LIMIT_PER_RUN:
+			if (!parse_usage_limit(&settings->disk_limit_per_run, optarg)) {
+				usage(stderr, "Cannot parse disk limit per run");
+				goto error;
+			}
+			break;
 		case OPT_FACTS:
 			settings->facts = true;
 			break;
@@ -1268,6 +1279,7 @@ bool serialize_settings(struct settings *settings)
 
 	SERIALIZE_INT(f, settings, abort_mask);
 	SERIALIZE_UL(f, settings, disk_usage_limit);
+	SERIALIZE_UL(f, settings, disk_limit_per_run);
 	if (settings->test_list)
 		SERIALIZE_STR(f, settings, test_list);
 	if (settings->name)
@@ -1388,6 +1400,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		PARSE_INT(settings, name, val, abort_mask);
 		PARSE_UL(settings, name, val, disk_usage_limit);
+		PARSE_UL(settings, name, val, disk_limit_per_run);
 		PARSE_STR(settings, name, val, test_list);
 		PARSE_STR(settings, name, val, name);
 		PARSE_INT(settings, name, val, dry_run);
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282..05be71392 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -53,6 +53,7 @@ struct environment_variable {
 struct settings {
 	int abort_mask;
 	size_t disk_usage_limit;
+	size_t disk_limit_per_run;
 	char *test_list;
 	char *name;
 	bool dry_run;
-- 
2.51.0

