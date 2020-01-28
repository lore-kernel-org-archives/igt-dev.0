Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93636EDEA
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 11:48:14 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 28 Jan 2020 13:48:01 +0200
Message-Id: <20200128114801.12282-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Make sure output is still collected
 when killing test due to taint
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

If the kernel is tainted, it stays tainted, so make sure the execution
monitoring still reaches the output collectors and other fd change
handlers.

Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 0927d1fd..ca9a12e3 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -759,28 +759,41 @@ static int monitor_output(pid_t child,
 			return -1;
 		}
 
-		if (settings->abort_mask & ABORT_TAINT && tainted(&taints)) /* cancel children after a kernel OOPS */
-			n = 0, intervals_left = 1;
+		/*
+		 * If we're configured to care about taints, kill the
+		 * test if there's a taint. But only if we didn't
+		 * already kill it, and make sure we still process the
+		 * fds select() marked for us.
+		 */
+		if (settings->abort_mask & ABORT_TAINT &&
+		    tainted(&taints) &&
+		    killed == 0) {
+			if (settings->log_level >= LOG_LEVEL_NORMAL) {
+				outf("Killing the test because the kernel is tainted.\n");
+				fflush(stdout);
+			}
 
-		if (n == 0) {
+			killed = SIGQUIT;
+			if (!kill_child(killed, child))
+				return -1;
+
+			/*
+			 * Now continue the loop and let the
+			 * dying child be handled normally.
+			 */
+			timeout = 20;
+			watchdogs_set_timeout(120);
+			intervals_left = timeout_intervals = 1;
+		} else if (n == 0) {
 			if (--intervals_left)
 				continue;
 
 			switch (killed) {
 			case 0:
-				/* If abort_mask doesn't have taint set, taints is still 0 here */
-				if (!is_tainted(taints)) {
-					show_kernel_task_state();
-					if (settings->log_level >= LOG_LEVEL_NORMAL) {
-						outf("Timeout. Killing the current test with SIGQUIT.\n");
-
-						fflush(stdout);
-					}
-				} else {
-					if (settings->log_level >= LOG_LEVEL_NORMAL) {
-						outf("Killing the test because the kernel is tainted.\n");
-						fflush(stdout);
-					}
+				show_kernel_task_state();
+				if (settings->log_level >= LOG_LEVEL_NORMAL) {
+					outf("Timeout. Killing the current test with SIGQUIT.\n");
+					fflush(stdout);
 				}
 
 				killed = SIGQUIT;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
