Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C86CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 13:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5386910E7AD;
	Thu, 11 Jun 2026 13:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTuo/hJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3A410E7AD
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781183943; x=1812719943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZXMJPCahaW7k32+MlR5++NY+ZLiABBneoLKFxW4cu1Q=;
 b=aTuo/hJ7b9yeetwdB7tnyhGh8Az1sMg16g4gF/UeJfFgG2mne9U90ph4
 lFK9LW8h2/PD3lacy5EUQSJq3swKHWTWo+j/urqNuw1YdYmJ2Grg43sus
 7I817TfGf22MpGqeBJsn4E5k70kEB8xxGG+nIiXHhrvY1q0lPmqdLy4Yp
 /kLxc6Ne6xg/npVnYkpL0rztlwuLf/dymRIG6osP9/8ucKacdpgFfTqR1
 sF7iXzu7lEwx/h33UPRBlmv2Yp9lm8K6VacI62ArfU4PSDZSh17tat7dO
 Jrnrd5cj21tabi4J07AXYL7PJjooA32lK6TGeB4/1yGTUbwiPPerEi2+e w==;
X-CSE-ConnectionGUID: S2UP/T+dT5GaQ8goVKB/1A==
X-CSE-MsgGUID: yw5kIaGgSdWFetLVpUr9RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92673991"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="92673991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 06:19:03 -0700
X-CSE-ConnectionGUID: aG+/J+jpRkGwPr2/wY9GdA==
X-CSE-MsgGUID: 4uRsq2ILTOm2huVSurFXSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="250394725"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 06:19:02 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] RFC: Add disk usage quota carryover for igt_runner
Date: Thu, 11 Jun 2026 13:18:55 +0000
Message-ID: <20260611131855.368185-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add a quota carryover mechanism to the disk usage limit enforcement.
Instead of applying a hard per-test limit, unused disk budget from
frugal tests is accumulated in a quota pool and made available to
subsequent tests that need more space.

For each test:
  B = MIN(quota, L)       -- borrow from pool, capped at L
  effective_limit = L + B -- usable limit for this test
  quota += (effective_limit - actual_used) -- return leftover

This allows tests that write less than L bytes to subsidise tests
that occasionally need more, without raising the global limit.

The quota pool is seeded with L so the first test always receives
exactly 2xL as its limit.

Suggested-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 runner/executor.c | 68 ++++++++++++++++++++++++++++++++++++++---------
 runner/executor.h |  1 +
 2 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index a8907c575..c1775095a 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -821,14 +821,13 @@ static const char *show_kernel_task_state(const char *msg)
 	return msg;
 }
 
-static bool disk_usage_limit_exceeded(struct settings *settings,
-				      size_t disk_usage)
+static bool disk_usage_limit_exceeded(size_t limit, size_t disk_usage)
 {
-	return settings->disk_usage_limit != 0 &&
-		disk_usage > settings->disk_usage_limit;
+	return limit != 0 && disk_usage > limit;
 }
 
 static const char *need_to_timeout(struct settings *settings,
+				   size_t effective_limit,
 				   int killed,
 				   unsigned long taints,
 				   double time_since_activity,
@@ -897,7 +896,7 @@ static const char *need_to_timeout(struct settings *settings,
 		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
 	}
 
-	if (disk_usage_limit_exceeded(settings, disk_usage))
+	if (disk_usage_limit_exceeded(effective_limit, disk_usage))
 		return "Disk usage limit exceeded.\n";
 
 	return NULL;
@@ -961,6 +960,8 @@ static int monitor_output(pid_t child,
 			  int *outputs,
 			  double *time_spent,
 			  struct settings *settings,
+			  size_t effective_limit,
+			  size_t *total_disk_used,
 			  char **abortreason,
 			  bool *abort_already_written)
 {
@@ -981,6 +982,7 @@ static int monitor_output(pid_t child,
 	unsigned long taints = 0;
 	bool aborting = false;
 	size_t disk_usage = 0;
+	size_t total_disk_usage = 0;
 	size_t dmsg_chunk_size = 4096 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 16);
 	long dmesgwritten;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
@@ -1070,6 +1072,7 @@ static int monitor_output(pid_t child,
 
 			write(outputs[_F_OUT], buf, s);
 			disk_usage += s;
+			total_disk_usage += s;
 			if (settings->sync) {
 				fdatasync(outputs[_F_OUT]);
 			}
@@ -1162,6 +1165,7 @@ static int monitor_output(pid_t child,
 			} else {
 				write(outputs[_F_ERR], buf, s);
 				disk_usage += s;
+				total_disk_usage += s;
 				if (settings->sync) {
 					fdatasync(outputs[_F_ERR]);
 				}
@@ -1253,6 +1257,7 @@ static int monitor_output(pid_t child,
 
 				write_packet_with_canary(outputs[_F_SOCKET], packet, settings->sync);
 				disk_usage += packet->size;
+				total_disk_usage += packet->size;
 
 				if (packet->type == PACKETTYPE_SUBTEST_RESULT ||
 				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_RESULT)
@@ -1319,6 +1324,7 @@ static int monitor_output(pid_t child,
 				kmsgfd = -1;
 			} else {
 				disk_usage += dmesgwritten;
+				total_disk_usage += dmesgwritten;
 			}
 		}
 
@@ -1463,7 +1469,8 @@ static int monitor_output(pid_t child,
 				 * Same goes for stopping because we
 				 * exceeded the disk usage limit.
 				 */
-				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
+				if (killed &&
+				    disk_usage_limit_exceeded(effective_limit, disk_usage)) {
 					timeoutresult = false;
 
 					if (socket_comms_used) {
@@ -1474,7 +1481,7 @@ static int monitor_output(pid_t child,
 							 "runner: This test was killed due to exceeding disk usage limit. "
 							 "(Used %zd bytes, limit %zd)\n",
 							 disk_usage,
-							 settings->disk_usage_limit);
+							 effective_limit);
 						message = runnerpacket_log(STDOUT_FILENO, killmsg);
 						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
 						free(message);
@@ -1483,7 +1490,7 @@ static int monitor_output(pid_t child,
 							"\nrunner: This test was killed due to exceeding disk usage limit. "
 							"(Used %zd bytes, limit %zd)\n",
 							disk_usage,
-							settings->disk_usage_limit);
+							effective_limit);
 						if (settings->sync)
 							fdatasync(outputs[_F_OUT]);
 					}
@@ -1533,7 +1540,7 @@ static int monitor_output(pid_t child,
 		}
 
 		igt_kernel_tainted(&taints);
-		timeout_reason = need_to_timeout(settings, killed,
+		timeout_reason = need_to_timeout(settings, effective_limit, killed,
 						 taints,
 						 igt_time_elapsed(&time_last_activity, &time_now),
 						 igt_time_elapsed(&time_last_subtest, &time_now),
@@ -1553,7 +1560,8 @@ static int monitor_output(pid_t child,
 					asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
 				}
 
-				dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
+				dmsg_chunk_size = calc_last_dmesg_chunk(effective_limit,
+									disk_usage);
 				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
 				if (settings->sync)
 					fdatasync(outputs[_F_DMESG]);
@@ -1590,10 +1598,13 @@ static int monitor_output(pid_t child,
 		fdatasync(outputs[_F_DMESG]);
 	if (dmesgwritten > 0) {
 		disk_usage += dmesgwritten;
-		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
+		total_disk_usage += dmesgwritten;
+		if (effective_limit && disk_usage > effective_limit) {
 			char disk[1024];
 
-			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %zu > %zu\n", disk_usage, settings->disk_usage_limit);
+			snprintf(disk, sizeof(disk),
+				 "igt_runner: disk limit exceeded at dmesg dump, %zu > %zu\n",
+				 disk_usage, effective_limit);
 			if (settings->log_level >= LOG_LEVEL_NORMAL) {
 				outf("%s", disk);
 				fflush(stdout);
@@ -1610,6 +1621,8 @@ static int monitor_output(pid_t child,
 	close(socketfd);
 	close(kmsgfd);
 
+	*total_disk_used = total_disk_usage;
+
 	if (aborting)
 		return -1;
 
@@ -1770,6 +1783,8 @@ static int execute_next_entry(struct execute_state *state,
 			      struct job_list_entry *entry,
 			      int testdirfd, int resdirfd,
 			      int sigfd, sigset_t *sigmask,
+			      size_t effective_limit,
+			      size_t *disk_used_out,
 			      char **abortreason,
 			      bool *abort_already_written)
 {
@@ -1893,6 +1908,7 @@ static int execute_next_entry(struct execute_state *state,
 	result = monitor_output(child, outfd, errfd, socketfd,
 				kmsgfd, sigfd,
 				outputs, time_spent, settings,
+				effective_limit, disk_used_out,
 				abortreason, abort_already_written);
 
 out_kmsgfd:
@@ -2134,6 +2150,8 @@ bool initialize_execute_state_from_resume(int dirfd,
 	}
 
 	init_time_left(state, settings);
+	/* Seed with one limit so first test can borrow. */
+	state->quota = settings->disk_usage_limit;
 
 	for (i = list->size; i >= 0; i--) {
 		char name[32];
@@ -2214,6 +2232,8 @@ bool initialize_execute_state(struct execute_state *state,
 	init_time_left(state, settings);
 
 	state->dry = settings->dry_run;
+	/* Seed with one limit so first test can borrow. */
+	state->quota = settings->disk_usage_limit;
 
 	return true;
 }
@@ -2644,6 +2664,23 @@ bool execute(struct execute_state *state,
 		}
 
 		if (reason == NULL) {
+			size_t disk_used = 0;
+			size_t effective_limit = settings->disk_usage_limit;
+
+			/*
+			 * Quota carryover: borrow unused budget from previous
+			 * tests (up to L) so frugal tests subsidise heavy ones.
+			 *   B = MIN(Q, L)        -- borrow from quota
+			 *   U = L + B            -- usable limit for this test
+			 *   Q += (U - actual)    -- return leftover to quota
+			 */
+			if (settings->disk_usage_limit != 0) {
+				size_t borrow = min_t(size_t, state->quota,
+						       settings->disk_usage_limit);
+				state->quota -= borrow;
+				effective_limit = settings->disk_usage_limit + borrow;
+			}
+
 			result = execute_next_entry(state,
 						    job_list->size,
 						    &time_spent,
@@ -2651,8 +2688,15 @@ bool execute(struct execute_state *state,
 						    &job_list->entries[state->next],
 						    testdirfd, resdirfd,
 						    sigfd, &sigmask,
+						    effective_limit, &disk_used,
 						    &reason, &already_written);
 
+			if (settings->disk_usage_limit != 0) {
+				size_t leftover = (disk_used < effective_limit) ?
+					effective_limit - disk_used : 0;
+				state->quota += leftover;
+			}
+
 			if (settings->cov_results_per_test) {
 				code_coverage_stop(settings, job_name, sigfd, &reason);
 				free(job_name);
diff --git a/runner/executor.h b/runner/executor.h
index bc6ac80dc..e2210dac9 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -14,6 +14,7 @@ struct execute_state
 	 */
 	double time_left;
 	bool dry;
+	size_t quota; /* accumulated unused disk budget from previous tests */
 };
 
 enum {
-- 
2.43.0

