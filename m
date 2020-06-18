Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5F86E3D2
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:06:30 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 18 Jun 2020 15:06:22 +0300
Message-Id: <20200618120623.6853-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] runner: Inject a message when killing
 test to taints
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

Normally runner injecting a message to the test's stdout/stderr logs
has a race condition; The test outputs have special lines (subtest
starting/ending) and accidentally injecting stuff in between would
cause funky results.

When we're killing a test because the kernel got tainted, we know
already that we're not getting a subtest ending line and we can
inject, if we make sure we have newlines printed before and after the
injection.

Having a message in the stdout of the test will aid automatic bug
filtering.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/executor.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 06390262..7bb2b14c 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1049,9 +1049,27 @@ static int monitor_output(pid_t child,
 				 * the result an incomplete we avoid
 				 * journaling a timeout here.
 				 */
-				if (is_tainted(taints))
+				if (is_tainted(taints)) {
 					exitline = EXECUTOR_EXIT;
 
+					/*
+					 * Also inject a message to
+					 * the test's stdout. As we're
+					 * shooting for an incomplete
+					 * anyway, we don't need to
+					 * care if we're not between
+					 * full lines from stdout. We
+					 * do need to make sure we
+					 * have newlines on both ends
+					 * of this injection though.
+					 */
+					dprintf(outputs[_F_OUT],
+						"\nrunner: This test was killed due to a kernel taint (0x%lx).\n",
+						taints);
+					if (settings->sync)
+						fdatasync(outputs[_F_OUT]);
+				}
+
 				dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
 					exitline,
 					status, time);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
