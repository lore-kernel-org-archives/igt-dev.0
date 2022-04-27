Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3DD10E3ED
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 08:08:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Apr 2022 11:08:53 +0300
Message-Id: <20220427080853.9535-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] runner: Correctly handle abort before
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 runner/executor.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 6e6ca9cc..42f5549c 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -32,6 +32,7 @@
 
 #define KMSG_HEADER "[IGT] "
 #define KMSG_WARN 4
+#define GRACEFUL_EXITCODE -SIGHUP
 
 static struct {
 	int *fds;
@@ -1425,6 +1426,41 @@ out_dirfd:
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
+		dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n", EXECUTOR_EXIT, GRACEFUL_EXITCODE, 0.0);
+
+		close_outputs(outputs);
+		close(dirfd);
+	}
+}
+
 static int remove_file(int dirfd, const char *name)
 {
 	return unlinkat(dirfd, name, 0) && errno != ENOENT;
@@ -1956,7 +1992,7 @@ bool execute(struct execute_state *state,
 	close(unamefd);
 
 	/* Check if we're already in abort-state at bootup */
-	if (!state->resuming) {
+	{
 		char *reason;
 
 		if ((reason = need_to_abort(settings)) != NULL) {
@@ -1965,6 +2001,17 @@ bool execute(struct execute_state *state,
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
-- 
2.30.2
