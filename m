Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786C110E2BF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 10:57:21 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Jan 2023 12:53:38 +0200
Message-Id: <20230126105338.419418-4-petri.latvala@intel.com>
In-Reply-To: <20230126105338.419418-1-petri.latvala@intel.com>
References: <20230126105338.419418-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] runner: Use 'abort' as result if a test
 caused an abort
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

... when possible, which is when using socket comms.

v2: Handle abort conditions between dynamic subtests

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 110 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 13 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 5b4e84d1..597cd7f5 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -376,6 +376,13 @@ static char *need_to_abort(const struct settings *settings)
 	return _need_to_abort(settings->abort_mask, settings->log_level);
 }
 
+/* Check for abort conditions that can be checked in a timely manner */
+static char *need_to_abort_time_sensitive(const struct settings *settings)
+{
+	/* Leave out ABORT_PING */
+	return _need_to_abort(settings->abort_mask & ~ABORT_PING, settings->log_level);
+}
+
 static void prune_subtest(struct job_list_entry *entry, const char *subtest)
 {
 	char *excl;
@@ -863,7 +870,8 @@ static int monitor_output(pid_t child,
 			  int *outputs,
 			  double *time_spent,
 			  struct settings *settings,
-			  char **abortreason)
+			  char **abortreason,
+			  bool *abort_already_written)
 {
 	fd_set set;
 	char *buf;
@@ -883,6 +891,7 @@ static int monitor_output(pid_t child,
 	bool aborting = false;
 	size_t disk_usage = 0;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
+	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
 
 	igt_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
@@ -1106,8 +1115,6 @@ static int monitor_output(pid_t child,
 					goto socket_end;
 				}
 
-				write_packet_with_canary(outputs[_F_SOCKET], packet, settings->sync);
-
 				/*
 				 * runner sends EXEC itself before executing
 				 * the test, other types indicate the test
@@ -1120,10 +1127,44 @@ static int monitor_output(pid_t child,
 				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_START) {
 					time_last_subtest = time_now;
 					disk_usage = 0;
+
+					if (results_received && !aborting) {
+						/*
+						 * We already have
+						 * results for a
+						 * dynamic subtest or
+						 * a subtest. Before
+						 * writing to disk
+						 * that the next one
+						 * starts, check
+						 * whether it caused
+						 * an abort condition.
+						 */
+						*abortreason = need_to_abort_time_sensitive(settings);
+						if (*abortreason) {
+							write_packet_with_canary(outputs[_F_SOCKET],
+										 runnerpacket_log(STDOUT_FILENO, "\nThis test caused an abort condition: "),
+										 false);
+							write_packet_with_canary(outputs[_F_SOCKET],
+										 runnerpacket_log(STDOUT_FILENO, *abortreason),
+										 false);
+							write_packet_with_canary(outputs[_F_SOCKET],
+										 runnerpacket_resultoverride("abort"),
+										 settings->sync);
+
+							aborting = true;
+							*abort_already_written = true;
+						}
+					}
 				}
 
+				write_packet_with_canary(outputs[_F_SOCKET], packet, settings->sync);
 				disk_usage += packet->size;
 
+				if (packet->type == PACKETTYPE_SUBTEST_RESULT ||
+				    packet->type == PACKETTYPE_DYNAMIC_SUBTEST_RESULT)
+					results_received = true;
+
 				if (settings->log_level >= LOG_LEVEL_VERBOSE) {
 					runnerpacket_read_helper helper = {};
 					const char *time;
@@ -1593,7 +1634,8 @@ static int execute_next_entry(struct execute_state *state,
 			      struct job_list_entry *entry,
 			      int testdirfd, int resdirfd,
 			      int sigfd, sigset_t *sigmask,
-			      char **abortreason)
+			      char **abortreason,
+			      bool *abort_already_written)
 {
 	int dirfd;
 	int outputs[_F_LAST];
@@ -1709,7 +1751,7 @@ static int execute_next_entry(struct execute_state *state,
 	result = monitor_output(child, outfd, errfd, socketfd,
 				kmsgfd, sigfd,
 				outputs, time_spent, settings,
-				abortreason);
+				abortreason, abort_already_written);
 
 out_kmsgfd:
 	close(kmsgfd);
@@ -2207,6 +2249,31 @@ static void code_coverage_stop(struct settings *settings, const char *job_name,
 	run_as_root(argv, sigfd, abortreason);
 }
 
+/* Open the comms file if the test used socket comms */
+static int open_comms_if_valid(int resdirfd, size_t testidx)
+{
+	struct comms_visitor emptyvisitor = {};
+	char name[32];
+	int dirfd, commsfd;
+
+	snprintf(name, sizeof(name), "%zd", testidx);
+	dirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY);
+	if (dirfd < 0)
+		return -1;
+
+	commsfd = openat(dirfd, "comms", O_RDWR);
+	close(dirfd);
+
+	if (commsfd < 0)
+		return -1;
+
+	if (comms_read_dump(commsfd, &emptyvisitor) == COMMSPARSE_SUCCESS)
+		return commsfd;
+
+	close(commsfd);
+	return -1;
+}
+
 bool execute(struct execute_state *state,
 	     struct settings *settings,
 	     struct job_list *job_list)
@@ -2347,6 +2414,7 @@ bool execute(struct execute_state *state,
 		char *reason = NULL;
 		char *job_name;
 		int result;
+		bool already_written = false;
 
 		if (should_die_because_signal(sigfd)) {
 			status = false;
@@ -2360,13 +2428,13 @@ bool execute(struct execute_state *state,
 
 		if (reason == NULL) {
 			result = execute_next_entry(state,
-						job_list->size,
-						&time_spent,
-						settings,
-						&job_list->entries[state->next],
-						testdirfd, resdirfd,
-						sigfd, &sigmask,
-						&reason);
+						    job_list->size,
+						    &time_spent,
+						    settings,
+						    &job_list->entries[state->next],
+						    testdirfd, resdirfd,
+						    sigfd, &sigmask,
+						    &reason, &already_written);
 
 			if (settings->cov_results_per_test) {
 				code_coverage_stop(settings, job_name, sigfd, &reason);
@@ -2379,7 +2447,23 @@ bool execute(struct execute_state *state,
 			char *next = (state->next + 1 < job_list->size ?
 				      entry_display_name(&job_list->entries[state->next + 1]) :
 				      strdup("nothing"));
-			write_abort_file(resdirfd, reason, prev, next);
+
+			if (!already_written) {
+				int commsfd;
+
+				commsfd = open_comms_if_valid(resdirfd, state->next);
+				if (commsfd >= 0) {
+					lseek(commsfd, 0, SEEK_END);
+					write_packet_with_canary(commsfd, runnerpacket_log(STDOUT_FILENO, "\nThis test caused an abort condition: "), false);
+					write_packet_with_canary(commsfd, runnerpacket_log(STDOUT_FILENO, reason), false);
+					write_packet_with_canary(commsfd, runnerpacket_resultoverride("abort"), settings->sync);
+
+					close(commsfd);
+				} else {
+					write_abort_file(resdirfd, reason, prev, next);
+				}
+			}
+
 			free(prev);
 			free(next);
 			free(reason);
-- 
2.30.2
