Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18D2C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 17:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA7310EB50;
	Fri, 17 Jan 2025 17:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izOjDIbL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425E10EB53
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737135335; x=1768671335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XRgNKSUttjm7JzqmEI7YzCKrPOEp017LYPhlaakqQfc=;
 b=izOjDIbLSGWa/y1NOjuBMH5RjCSnpD371UvWredKoOgoirS4PaMUEOxz
 Yy9+Y4wEwIpL8b2GOS6PJUdRTMNcIVRuIaPgtEB6mHu3n01rBRAr+bYNg
 AKDG6VGj2msH5Szar+lKE9Fpv2wpWdVIroEX4oJ0hBOFeFFG/cEG7xurz
 K8eY00l64hiTXvS8yYvqJjZ37PQWVg4CPblPYEhUGQoNt5xk1FQCp7jRb
 w/hUKW4RDWIesis/cG5ByLWyeGmc77Hgg1dF6sr9QMaotPzF3QeHDjDw0
 eJdf/LGFvh/XOZmcm7IBTzJgyQORbjlYfy9opoijX4QqXdU76fTga0j/l A==;
X-CSE-ConnectionGUID: UYzK0OnNQfyluCZMXBF9aA==
X-CSE-MsgGUID: T2yTonngRle3r8SBi61J1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37596957"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37596957"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 09:35:35 -0800
X-CSE-ConnectionGUID: rE/vKae6T0W0eYHOjGBnjQ==
X-CSE-MsgGUID: UMH6STmoQlOUbvFv7sChgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110493006"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.25])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 09:35:33 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t] RFC: runner: Add total disk limit option
Date: Fri, 17 Jan 2025 18:35:26 +0100
Message-ID: <20250117173526.72550-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Disk limit option counts written bytes only for current subtest.
It also reset its accounting after a new (dynamic) subtest start
so, when a subtest have many sub-subtests, that makes it hard to
predict upper end size for complete run.
  Try to limit it a little harder and allow imposing a total size
for bytes written to disk with a new option --disk-total-limit

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

---
I am not so sure if this should be total limit for a single run
for all tests, or a total limit for only one single test, or
both with two new options.
---
 runner/executor.c | 66 +++++++++++++++++++++++++++++++++--------------
 runner/settings.c | 43 +++++++++++++++++++++++++++---
 runner/settings.h |  1 +
 3 files changed, 86 insertions(+), 24 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 999e7f719..be70da5df 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -769,10 +769,24 @@ static const char *show_kernel_task_state(const char *msg)
 }
 
 static bool disk_usage_limit_exceeded(struct settings *settings,
-				      size_t disk_usage)
+				      size_t disk_usage,
+				      size_t disk_total, bool *was_total)
 {
-	return settings->disk_usage_limit != 0 &&
-		disk_usage > settings->disk_usage_limit;
+	if (settings->disk_usage_limit &&
+	    disk_usage > settings->disk_usage_limit) {
+		*was_total = false;
+
+		return true;
+	}
+
+	if (settings->disk_total_limit &&
+	    disk_total > settings->disk_total_limit) {
+		*was_total = true;
+
+		return true;
+	}
+
+	return false;
 }
 
 static const char *need_to_timeout(struct settings *settings,
@@ -781,9 +795,11 @@ static const char *need_to_timeout(struct settings *settings,
 				   double time_since_activity,
 				   double time_since_subtest,
 				   double time_since_kill,
-				   size_t disk_usage)
+				   size_t disk_usage,
+				   size_t disk_total_usage)
 {
 	int decrease = 1;
+	bool bdisk;
 
 	if (killed) {
 		/*
@@ -839,8 +855,8 @@ static const char *need_to_timeout(struct settings *settings,
 		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
 	}
 
-	if (disk_usage_limit_exceeded(settings, disk_usage))
-		return "Disk usage limit exceeded.\n";
+	if (disk_usage_limit_exceeded(settings, disk_usage, disk_total_usage, &bdisk))
+		return bdisk ? "Disk total limit exceeded.\n" : "Disk usage limit exceeded.\n";
 
 	return NULL;
 }
@@ -902,6 +918,7 @@ static int monitor_output(pid_t child,
 			  int kmsgfd, int sigfd,
 			  int *outputs,
 			  double *time_spent,
+			  size_t *total_disk,
 			  struct settings *settings,
 			  char **abortreason,
 			  bool *abort_already_written)
@@ -1161,6 +1178,7 @@ static int monitor_output(pid_t child,
 				if (packet->type == PACKETTYPE_SUBTEST_START ||
 				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_START) {
 					time_last_subtest = time_now;
+					*total_disk += disk_usage;
 					disk_usage = 0;
 
 					if (results_received && !aborting) {
@@ -1354,6 +1372,7 @@ static int monitor_output(pid_t child,
 
 			if (!aborting) {
 				bool timeoutresult = false;
+				bool btotaldisk = false;
 
 				if (killed)
 					timeoutresult = true;
@@ -1405,27 +1424,30 @@ static int monitor_output(pid_t child,
 				 * Same goes for stopping because we
 				 * exceeded the disk usage limit.
 				 */
-				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
-					timeoutresult = false;
-
-					if (socket_comms_used) {
-						struct runnerpacket *message;
-						char killmsg[256];
+				if (killed && disk_usage_limit_exceeded(settings, disk_usage, *total_disk, &btotaldisk)) {
+					char killmsg[256];
 
+					timeoutresult = false;
+					if (btotaldisk)
 						snprintf(killmsg, sizeof(killmsg),
-							 "runner: This test was killed due to exceeding disk usage limit. "
+							 "runner: This test was killed due to exceeding disk useage limit. "
 							 "(Used %zd bytes, limit %zd)\n",
 							 disk_usage,
 							 settings->disk_usage_limit);
+					else
+						snprintf(killmsg, sizeof(killmsg),
+							 "runner: This test was killed due to exceeding total disk limit. "
+							 "(Total used %zd bytes, total disk limit %zd)\n",
+							 *total_disk,
+							 settings->disk_total_limit);
+
+					if (socket_comms_used) {
+						struct runnerpacket *message;
 						message = runnerpacket_log(STDOUT_FILENO, killmsg);
 						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
 						free(message);
 					} else {
-						dprintf(outputs[_F_OUT],
-							"\nrunner: This test was killed due to exceeding disk usage limit. "
-							"(Used %zd bytes, limit %zd)\n",
-							disk_usage,
-							settings->disk_usage_limit);
+						dprintf(outputs[_F_OUT], "\n%s", killmsg);
 						if (settings->sync)
 							fdatasync(outputs[_F_OUT]);
 					}
@@ -1479,7 +1501,8 @@ static int monitor_output(pid_t child,
 						 igt_time_elapsed(&time_last_activity, &time_now),
 						 igt_time_elapsed(&time_last_subtest, &time_now),
 						 igt_time_elapsed(&time_killed, &time_now),
-						 disk_usage);
+						 disk_usage,
+						 *total_disk);
 
 		if (timeout_reason) {
 			if (killed == SIGKILL) {
@@ -1707,6 +1730,7 @@ static char *entry_display_name(struct job_list_entry *entry)
 static int execute_next_entry(struct execute_state *state,
 			      size_t total,
 			      double *time_spent,
+			      size_t *total_disk,
 			      struct settings *settings,
 			      struct job_list_entry *entry,
 			      int testdirfd, int resdirfd,
@@ -1827,7 +1851,7 @@ static int execute_next_entry(struct execute_state *state,
 
 	result = monitor_output(child, outfd, errfd, socketfd,
 				kmsgfd, sigfd,
-				outputs, time_spent, settings,
+				outputs, time_spent, total_disk, settings,
 				abortreason, abort_already_written);
 
 out_kmsgfd:
@@ -2360,6 +2384,7 @@ bool execute(struct execute_state *state,
 	struct utsname unamebuf;
 	sigset_t sigmask;
 	double time_spent = 0.0;
+	size_t total_disk_used = 0;
 	bool status = true;
 	char *last_test = NULL;
 
@@ -2516,6 +2541,7 @@ bool execute(struct execute_state *state,
 			result = execute_next_entry(state,
 						    job_list->size,
 						    &time_spent,
+						    &total_disk_used,
 						    settings,
 						    &job_list->entries[state->next],
 						    testdirfd, resdirfd,
diff --git a/runner/settings.c b/runner/settings.c
index 92fd42ea6..afe4357ab 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -20,6 +20,7 @@
 enum {
 	OPT_ABORT_ON_ERROR,
 	OPT_DISK_USAGE_LIMIT,
+	OPT_DISK_TOTAL_LIMIT,
 	OPT_TEST_LIST,
 	OPT_IGNORE_MISSING,
 	OPT_PIGLIT_DMESG,
@@ -183,15 +184,14 @@ static size_t char_to_multiplier(char c)
 	return 0;
 }
 
-static bool parse_usage_limit(struct settings *settings, const char *optarg)
+static bool read_number_with_multiplier(size_t *value, struct settings *settings, const char *optarg)
 {
-	size_t value;
 	char *endptr = NULL;
 
 	if (!optarg)
 		return false;
 
-	value = strtoul(optarg, &endptr, 10);
+	*value = strtoul(optarg, &endptr, 10);
 
 	if (*endptr) {
 		size_t multiplier = char_to_multiplier(*endptr);
@@ -199,10 +199,33 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
 		if (multiplier == 0)
 			return false;
 
-		value *= multiplier;
+		*value *= multiplier;
 	}
 
+	return true;
+}
+
+static bool parse_usage_limit(struct settings *settings, const char *optarg)
+{
+	size_t value;
+
+	if (!read_number_with_multiplier(&value, settings, optarg))
+		return false;
+
 	settings->disk_usage_limit = value;
+
+	return true;
+}
+
+static bool parse_total_limit(struct settings *settings, const char *optarg)
+{
+	size_t value;
+
+	if (!read_number_with_multiplier(&value, settings, optarg))
+		return false;
+
+	settings->disk_total_limit = value;
+
 	return true;
 }
 
@@ -262,6 +285,9 @@ static const char *usage_str =
 	"                        kernel logs, exceed the given limit in bytes. The limit\n"
 	"                        parameter can use suffixes k, M and G for kilo/mega/gigabytes,\n"
 	"                        respectively. Limit of 0 (default) disables the limit.\n"
+	"  --disk-total-limit <limit>\n"
+	"                        Stop the run if logging from all tests up to current one\n"
+	"                        exceeds the given limit in bytes. Limit of 0 (default) disables it.\n"
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
@@ -667,6 +693,7 @@ bool parse_options(int argc, char **argv,
 		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"disk-total-limit", required_argument, NULL, OPT_DISK_TOTAL_LIMIT},
 		{"facts", no_argument, NULL, OPT_FACTS},
 		{"sync", no_argument, NULL, OPT_SYNC},
 		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
@@ -739,6 +766,12 @@ bool parse_options(int argc, char **argv,
 				goto error;
 			}
 			break;
+		case OPT_DISK_TOTAL_LIMIT:
+			if (!parse_total_limit(settings, optarg)) {
+				usage(stderr, "Cannot parse disk total limit");
+				goto error;
+			}
+			break;
 		case OPT_FACTS:
 			settings->facts = true;
 			break;
@@ -1098,6 +1131,7 @@ bool serialize_settings(struct settings *settings)
 
 	SERIALIZE_LINE(f, settings, abort_mask, "%d");
 	SERIALIZE_LINE(f, settings, disk_usage_limit, "%zd");
+	SERIALIZE_LINE(f, settings, disk_total_limit, "%zd");
 	if (settings->test_list)
 		SERIALIZE_LINE(f, settings, test_list, "%s");
 	if (settings->name)
@@ -1171,6 +1205,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		int numval = atoi(val);
 		PARSE_LINE(settings, name, val, abort_mask, numval);
 		PARSE_LINE(settings, name, val, disk_usage_limit, strtoul(val, NULL, 10));
+		PARSE_LINE(settings, name, val, disk_total_limit, strtoul(val, NULL, 10));
 		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, dry_run, numval);
diff --git a/runner/settings.h b/runner/settings.h
index f69f09778..0345b0e69 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -49,6 +49,7 @@ struct environment_variable {
 struct settings {
 	int abort_mask;
 	size_t disk_usage_limit;
+	size_t disk_total_limit;
 	char *test_list;
 	char *name;
 	bool dry_run;
-- 
2.48.1

