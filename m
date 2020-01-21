Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C266EC6A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 11:17:47 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 21 Jan 2020 11:17:38 +0000
Message-Id: <20200121111738.127417-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Clean up quickly if the kernel
 OOPSed during a test
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

If the kernel OOPSed during the test, it is unlikely to ever complete.
Furthermore, we have the reason why it won't complete and so do not need
to burden ourselves with the full stacktrace of every process -- or at
least we have a more pressing bug to fix before worrying about the
system deadlock.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index f36bfd3dd..00cd3b08a 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -314,13 +314,28 @@ static const struct {
   {(1 << 9), "TAINT_WARN: WARN_ON has happened."},
   {0, 0}};
 
+static unsigned long bad_taints(void)
+{
+	static unsigned long __bad_taints;
+
+	if (!__bad_taints) {
+		for (typeof(*abort_taints) *taint = abort_taints;
+		     taint->bit;
+		     taint++)
+			__bad_taints |= taint->bit;
+	}
+
+	return __bad_taints;
+}
+
+static unsigned long is_tainted(unsigned long taints)
+{
+	return taints & bad_taints();
+}
+
 static unsigned long tainted(unsigned long *taints)
 {
 	FILE *f;
-	unsigned long bad_taints = 0;
-
-	for (typeof(*abort_taints) *taint = abort_taints; taint->bit; taint++)
-		bad_taints |= taint->bit;
 
 	*taints = 0;
 
@@ -330,7 +345,7 @@ static unsigned long tainted(unsigned long *taints)
 		fclose(f);
 	}
 
-	return *taints & bad_taints;
+	return is_tainted(*taints);
 }
 
 static char *handle_taint(void)
@@ -744,13 +759,17 @@ static int monitor_output(pid_t child,
 			return -1;
 		}
 
+		if (tainted(&taints)) /* cancel children after a kernel OOPS */
+			n = 0, intervals_left = 1;
+
 		if (n == 0) {
 			if (--intervals_left)
 				continue;
 
 			switch (killed) {
 			case 0:
-				show_kernel_task_state();
+				if (!is_tainted(taints))
+					show_kernel_task_state();
 
 				if (settings->log_level >= LOG_LEVEL_NORMAL) {
 					outf("Timeout. Killing the current test with SIGQUIT.\n");
@@ -791,7 +810,7 @@ static int monitor_output(pid_t child,
 				intervals_left = 1; /* Intervals handled separately for sigkill */
 				break;
 			case SIGKILL:
-				if (!tainted(&taints) && --sigkill_intervals_left) {
+				if (!is_tainted(taints) && --sigkill_intervals_left) {
 					intervals_left = 1;
 					break;
 				}
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
