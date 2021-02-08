Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDE96E85C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Feb 2021 10:24:48 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  8 Feb 2021 12:24:39 +0200
Message-Id: <20210208102439.29463-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Handle graceful exit regardless of
 log level
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The SIGHUP handling was incorrectly done only when log level was at
least 'normal'.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 runner/executor.c | 52 ++++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 3ca2d20a..9b582179 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1008,37 +1008,33 @@ static int monitor_output(pid_t child,
 					     get_cmdline(siginfo.ssi_pid, comm, sizeof(comm)),
 					     siginfo.ssi_pid,
 					     strsignal(siginfo.ssi_signo));
+				}
 
-					if (siginfo.ssi_signo == SIGHUP) {
-						/*
-						 * If taken down with
-						 * SIGHUP, arrange the
-						 * current test to be
-						 * marked as notrun
-						 * instead of
-						 * incomplete. For
-						 * other signals we
-						 * don't need to do
-						 * anything, the lack
-						 * of a completion
-						 * marker of any kind
-						 * in the logs will
-						 * mark those tests as
-						 * incomplete. Note
-						 * that since we set
-						 * 'aborting' to true
-						 * we're going to skip
-						 * all other journal
-						 * writes later.
-						 */
+				if (siginfo.ssi_signo == SIGHUP) {
+					/*
+					 * If taken down with SIGHUP,
+					 * arrange the current test to
+					 * be marked as notrun instead
+					 * of incomplete. For other
+					 * signals we don't need to do
+					 * anything, the lack of a
+					 * completion marker of any
+					 * kind in the logs will mark
+					 * those tests as
+					 * incomplete. Note that since
+					 * we set 'aborting' to true
+					 * we're going to skip all
+					 * other journal writes later.
+					 */
 
+					if (settings->log_level >= LOG_LEVEL_NORMAL)
 						outf("Exiting gracefully, currently running test will have a 'notrun' result\n");
-						dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
-							EXECUTOR_EXIT,
-							-SIGHUP, 0.0);
-						if (settings->sync)
-							fdatasync(outputs[_F_JOURNAL]);
-					}
+
+					dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
+						EXECUTOR_EXIT,
+						-SIGHUP, 0.0);
+					if (settings->sync)
+						fdatasync(outputs[_F_JOURNAL]);
 				}
 
 				aborting = true;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
