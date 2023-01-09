Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5E10E39F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 10:04:27 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 11:56:31 +0200
Message-Id: <20230109095631.142221-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] runner: Correctly handle abort before
 first test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Don't leave the execution in a "please resume me" state if bootup
causes an abort condition. Especially handle the case of abort on
bootup when resuming correctly, so that it doesn't attempt to run a
test on a tainted kernel if we've explicitly configured the runner to
not execute when there's a taint.

v2: Fudge the results directory instead to get the desired results:
    runner exits with nonzero, and resuming exits with "all done" instead
    of executing anything.

v3: Use faccessat instead of open+close, use less magic strings,
    remember to close fds (Chris)

v4: Use GRACEFUL_EXITCODE in monitor_output, remove the 'resuming'
    field (why was it a double?!). (Ryszard)
    Stop trying to execute if all tests are already run, to avoid a
    crash in environment validation.

v5: Remember to git add so the 'resuming' field really gets
    removed. (Kamil)
    Use 0.000 in the printf format directly instead of formatting 0.0
    to %.3f. (Kamil)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 59 +++++++++++++++++++++++++++++++++++++++++++----
 runner/executor.h |  1 -
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index d2253082..9d3623b4 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -37,6 +37,7 @@
 
 #define KMSG_HEADER "[IGT] "
 #define KMSG_WARN 4
+#define GRACEFUL_EXITCODE -SIGHUP
 
 static struct {
 	int *fds;
@@ -1247,9 +1248,9 @@ static int monitor_output(pid_t child,
 						write_packet_with_canary(outputs[_F_SOCKET], override, settings->sync);
 						free(override);
 					} else {
-						dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
+						dprintf(outputs[_F_JOURNAL], "%s%d (0.000s)\n",
 							EXECUTOR_EXIT,
-							-SIGHUP, 0.0);
+							GRACEFUL_EXITCODE);
 						if (settings->sync)
 							fdatasync(outputs[_F_JOURNAL]);
 					}
@@ -1720,6 +1721,41 @@ out_dirfd:
 	return result;
 }
 
+static void fill_results_directory_with_notruns(struct job_list *list,
+						int resdirfd)
+{
+	int outputs[_F_LAST];
+	char name[32];
+	int dirfd;
+	size_t i;
+
+	for (i = 0; i < list->size; i++) {
+		snprintf(name, sizeof(name), "%zd", i);
+
+		if (faccessat(resdirfd, name, F_OK, 0) == 0)
+			continue;
+
+		mkdirat(resdirfd, name, 0777);
+		dirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY);
+		if (dirfd < 0) {
+			errf("Error accessing individual test result directory\n");
+			return;
+		}
+
+		if (!open_output_files(dirfd, outputs, true)) {
+			errf("Error opening output files\n");
+			close(dirfd);
+			return;
+		}
+
+		dprintf(outputs[_F_OUT], "Forced notrun result because of abort condition on bootup\n");
+		dprintf(outputs[_F_JOURNAL], "%s%d (0.000s)\n", EXECUTOR_EXIT, GRACEFUL_EXITCODE);
+
+		close_outputs(outputs);
+		close(dirfd);
+	}
+}
+
 static int remove_file(int dirfd, const char *name)
 {
 	return unlinkat(dirfd, name, 0) && errno != ENOENT;
@@ -1845,7 +1881,6 @@ bool initialize_execute_state_from_resume(int dirfd,
 	clear_settings(settings);
 	free_job_list(list);
 	memset(state, 0, sizeof(*state));
-	state->resuming = true;
 
 	if (!read_settings_from_dir(settings, dirfd) ||
 	    !read_job_list(list, dirfd)) {
@@ -2183,6 +2218,11 @@ bool execute(struct execute_state *state,
 		return true;
 	}
 
+	if (state->next >= job_list->size) {
+		outf("All tests already executed.\n");
+		return true;
+	}
+
 	igt_list_for_each_entry(env_var, &settings->env_vars, link) {
 		setenv(env_var->key, env_var->value, 1);
 	}
@@ -2271,7 +2311,7 @@ bool execute(struct execute_state *state,
 	close(unamefd);
 
 	/* Check if we're already in abort-state at bootup */
-	if (!state->resuming) {
+	{
 		char *reason;
 
 		if ((reason = need_to_abort(settings)) != NULL) {
@@ -2280,6 +2320,17 @@ bool execute(struct execute_state *state,
 			free(reason);
 			free(nexttest);
 
+			/*
+			 * If an abort condition happened at bootup,
+			 * assume that it happens on every boot,
+			 * making this test execution impossible.
+			 * Write stuff to the results directory
+			 * indicating this so resuming immediately
+			 * finishes instead of getting stuck in an
+			 * infinite reboot loop.
+			 */
+			fill_results_directory_with_notruns(job_list, resdirfd);
+
 			status = false;
 
 			goto end;
diff --git a/runner/executor.h b/runner/executor.h
index 31f4ac16..ab6a0c17 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -13,7 +13,6 @@ struct execute_state
 	 * > 0 : Timeout in use, time left.
 	 */
 	double time_left;
-	double resuming;
 	bool dry;
 };
 
-- 
2.30.2
