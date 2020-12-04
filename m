Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A826E138
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Dec 2020 11:51:57 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri,  4 Dec 2020 12:51:38 +0100
Message-Id: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Don't kill a test on taint if
 watching timeouts
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
Cc: drm-intel@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We may still be interested in results of a test even if it has tainted
the kernel.  On the other hand, we need to kill the test on taint if no
other means of killing it on a jam is active.

If abort on both kernel taint or a timeout is requested, decrease all
potential timeouts significantly while the taint is detected instead of
aborting immediately.  However, report the taint as the reason of the
abort if a timeout decreased by the taint expires.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 runner/executor.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 1688ae41d..e39d8a73b 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -726,6 +726,8 @@ static const char *need_to_timeout(struct settings *settings,
 				   double time_since_kill,
 				   size_t disk_usage)
 {
+	int decrease = 1;
+
 	if (killed) {
 		/*
 		 * Timeout after being killed is a hardcoded amount
@@ -753,20 +755,32 @@ static const char *need_to_timeout(struct settings *settings,
 	}
 
 	/*
-	 * If we're configured to care about taints, kill the
-	 * test if there's a taint.
+	 * If we're configured to care about taints,
+	 * decrease timeouts in use if there's a taint,
+	 * or kill the test if no timeouts have been requested.
 	 */
 	if (settings->abort_mask & ABORT_TAINT &&
-	    is_tainted(taints))
-		return "Killing the test because the kernel is tainted.\n";
+	    is_tainted(taints)) {
+		/* list of timeouts that may postpone immediate kill on taint */
+		if (settings->per_test_timeout || settings->inactivity_timeout)
+			decrease = 10;
+		else
+			return "Killing the test because the kernel is tainted.\n";
+	}
 
 	if (settings->per_test_timeout != 0 &&
-	    time_since_subtest > settings->per_test_timeout)
-		return show_kernel_task_state("Per-test timeout exceeded. Killing the current test with SIGQUIT.\n");
+	    time_since_subtest > settings->per_test_timeout / decrease) {
+		if (decrease > 1)
+			return "Killing the test because the kernel is tainted.\n";
+		return "Per-test timeout exceeded. Killing the current test with SIGQUIT.\n";
+	}
 
 	if (settings->inactivity_timeout != 0 &&
-	    time_since_activity > settings->inactivity_timeout)
-		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
+	    time_since_activity > settings->inactivity_timeout / decrease ) {
+		if (decrease > 1)
+			return "Killing the test because the kernel is tainted.\n";
+		return "Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n";
+	}
 
 	if (disk_usage_limit_exceeded(settings, disk_usage))
 		return "Disk usage limit exceeded.\n";
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
