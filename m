Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEEDCA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 17:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99A10E59A;
	Mon,  8 Sep 2025 17:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0/7Qlwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051A10E59A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757353416; x=1788889416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YFyAgTrCwrJmrWVgJ08MuwWAlxQAdl1/SSmqT9hXTKk=;
 b=R0/7QlwxYwijoosyTn5c95tqjueNljJotW5K/gqDQ7Kcft8axO0cO8nl
 inLAeQ/+u0tSaGbemWTUpqGZOGbPWoTBpLZXhIGcz2c7RTYXkFKJjwT5x
 YBeRWaXf9j/mUmMNHc1PrTuWch7sGnaYmHEolLNeW24cXx/LEbWwlSW5j
 7F1cxu2jNDGtA266LT86pKLDG7qAJJNtYQKVD4JAI2dFKhryA/YbDNY46
 uZ1ebARq3o9KHWw8uhqpdNV8oi9b34QZCt8KMtl6iS0+6Kt0HyhZ403dX
 NYw1lAkzt0Sax6HlJObZAQmDqXzY5EvmCFZr1mbEIZ1O7NLiI+vKeGbDU A==;
X-CSE-ConnectionGUID: q6A+reW5QE+sdcki2Z2OPw==
X-CSE-MsgGUID: eMbk+BaqRF+9pVEPD6B3GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58832425"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="58832425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:43:36 -0700
X-CSE-ConnectionGUID: beJYAYb/SG68w0uc1XAH+w==
X-CSE-MsgGUID: E2zufO55QqSOblqP9W2eww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172987760"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.244])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:43:35 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] runner: Add option disk-usage-limit-per-run
Date: Mon,  8 Sep 2025 19:43:19 +0200
Message-ID: <20250908174319.93968-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908174319.93968-1-kamil.konieczny@linux.intel.com>
References: <20250908174319.93968-1-kamil.konieczny@linux.intel.com>
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
usage will be added up and if that will exceed global per run
limit, runner will abort testing.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 70 +++++++++++++++++++++++++++++++++--------------
 runner/executor.h |  1 +
 runner/settings.c | 19 +++++++++++--
 runner/settings.h |  1 +
 4 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..7ddb51edd 100644
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
+							 "runner: This test was killed, exceeded disk usage limit per run. "
+							 "(Used %zd bytes, limit %zd)\n",
+							 *disk_usage_in_run,
+							 settings->disk_usage_limit_per_run);
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
 
diff --git a/runner/settings.c b/runner/settings.c
index dcad8340a..92865a954 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -21,6 +21,7 @@
 enum {
 	OPT_ABORT_ON_ERROR,
 	OPT_DISK_USAGE_LIMIT,
+	OPT_DISK_USAGE_LIMIT_PER_RUN,
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
 
@@ -278,6 +279,9 @@ static const char *usage_str =
 	"                        respectively. Limit of 0 (default) disables the limit.\n"
 	"  --disk-usage-limit-per-test <limit>\n"
 	"                        Alias for --disk-usage-limit\n"
+	"  --disk-usage-limit-per-run <limit>\n"
+	"                        Kill the run if logging accumulated for all tests exceed\n"
+	"                        the given limit in bytes.\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -731,6 +735,7 @@ bool parse_options(int argc, char **argv,
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"disk-usage-limit-per-test", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"disk-usage-limit-per-run", required_argument, NULL, OPT_DISK_USAGE_LIMIT_PER_RUN},
 		{"facts", no_argument, NULL, OPT_FACTS},
 		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
 		{"sync", no_argument, NULL, OPT_SYNC},
@@ -799,11 +804,17 @@ bool parse_options(int argc, char **argv,
 				goto error;
 			break;
 		case OPT_DISK_USAGE_LIMIT:
-			if (!parse_usage_limit(settings, optarg)) {
+			if (!parse_usage_limit(&settings->disk_usage_limit, optarg)) {
 				usage(stderr, "Cannot parse disk usage limit");
 				goto error;
 			}
 			break;
+		case OPT_DISK_USAGE_LIMIT_PER_RUN:
+			if (!parse_usage_limit(&settings->disk_usage_limit_per_run, optarg)) {
+				usage(stderr, "Cannot parse disk usage limit per run");
+				goto error;
+			}
+			break;
 		case OPT_FACTS:
 			settings->facts = true;
 			break;
@@ -1267,6 +1278,7 @@ bool serialize_settings(struct settings *settings)
 
 	SERIALIZE_INT(f, settings, abort_mask);
 	SERIALIZE_UL(f, settings, disk_usage_limit);
+	SERIALIZE_UL(f, settings, disk_usage_limit_per_run);
 	if (settings->test_list)
 		SERIALIZE_STR(f, settings, test_list);
 	if (settings->name)
@@ -1387,6 +1399,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		PARSE_INT(settings, name, val, abort_mask);
 		PARSE_UL(settings, name, val, disk_usage_limit);
+		PARSE_UL(settings, name, val, disk_usage_limit_per_run);
 		PARSE_STR(settings, name, val, test_list);
 		PARSE_STR(settings, name, val, name);
 		PARSE_INT(settings, name, val, dry_run);
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282..7161ade97 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -53,6 +53,7 @@ struct environment_variable {
 struct settings {
 	int abort_mask;
 	size_t disk_usage_limit;
+	size_t disk_usage_limit_per_run;
 	char *test_list;
 	char *name;
 	bool dry_run;
-- 
2.51.0

