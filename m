Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AE66E0E3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 09:59:50 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 12 Mar 2020 11:59:42 +0200
Message-Id: <20200312095944.7477-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] runner: Handle outputs before checking
 for timeout
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 72 +++++++++++++++++++++++------------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 72e45b65..28b8a443 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -828,42 +828,6 @@ static int monitor_output(pid_t child,
 
 		igt_gettime(&time_now);
 
-		timeout_reason = need_to_timeout(settings, killed, tainted(&taints),
-						 igt_time_elapsed(&time_last_activity, &time_now),
-						 igt_time_elapsed(&time_last_subtest, &time_now),
-						 igt_time_elapsed(&time_killed, &time_now));
-
-		if (timeout_reason) {
-			if (killed == SIGKILL) {
-				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
-
-				if (settings->log_level >= LOG_LEVEL_NORMAL) {
-					errf("Child refuses to die, tainted 0x%lx. Aborting.\n",
-					     taints);
-					if (kill(child, 0) && errno == ESRCH)
-						errf("The test process no longer exists, "
-						     "but we didn't get informed of its demise...\n");
-				}
-
-				close_watchdogs(settings);
-				free(outbuf);
-				close(outfd);
-				close(errfd);
-				close(kmsgfd);
-				return -1;
-			}
-
-			if (settings->log_level >= LOG_LEVEL_NORMAL) {
-				outf("%s", timeout_reason);
-				fflush(stdout);
-			}
-
-			killed = next_kill_signal(killed);
-			if (!kill_child(killed, child))
-				return -1;
-			time_killed = time_now;
-		}
-
 		/* TODO: Refactor these handlers to their own functions */
 		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
 			char *newline;
@@ -1072,6 +1036,42 @@ static int monitor_output(pid_t child,
 			child = 0;
 			sigfd = -1; /* we are dying, no signal handling for now */
 		}
+
+		timeout_reason = need_to_timeout(settings, killed, tainted(&taints),
+						 igt_time_elapsed(&time_last_activity, &time_now),
+						 igt_time_elapsed(&time_last_subtest, &time_now),
+						 igt_time_elapsed(&time_killed, &time_now));
+
+		if (timeout_reason) {
+			if (killed == SIGKILL) {
+				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
+
+				if (settings->log_level >= LOG_LEVEL_NORMAL) {
+					errf("Child refuses to die, tainted 0x%lx. Aborting.\n",
+					     taints);
+					if (kill(child, 0) && errno == ESRCH)
+						errf("The test process no longer exists, "
+						     "but we didn't get informed of its demise...\n");
+				}
+
+				close_watchdogs(settings);
+				free(outbuf);
+				close(outfd);
+				close(errfd);
+				close(kmsgfd);
+				return -1;
+			}
+
+			if (settings->log_level >= LOG_LEVEL_NORMAL) {
+				outf("%s", timeout_reason);
+				fflush(stdout);
+			}
+
+			killed = next_kill_signal(killed);
+			if (!kill_child(killed, child))
+				return -1;
+			time_killed = time_now;
+		}
 	}
 
 	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
