Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0DD6F569
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 13:57:55 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 29 Jan 2020 15:56:19 +0200
Message-Id: <20200129135619.15949-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Make the result an incomplete if a
 test is killed due to taint
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

If we're checking for taints, we kill the test as soon as we notice a
taint. Out of the box, such killing will get marked as such and yields
a 'timeout' result, which is misleading. The test didn't spend too
much time, it just did nasties.

Make sure taint-killing results in an 'incomplete' result
instead. It's still not completely truthful for the state of the
testing but closer than a 'timeout'. And stands out more in CI result
analysis.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 runner/executor.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index ca9a12e3..dbe6fa57 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1010,8 +1010,26 @@ static int monitor_output(pid_t child,
 				time = 0.0;
 
 			if (!aborting) {
+				const char *exitline;
+
+				exitline = killed ? EXECUTOR_TIMEOUT : EXECUTOR_EXIT;
+
+				/* If we're stopping because we killed
+				 * the test for tainting, let's not
+				 * call it a timeout. Since the test
+				 * execution was still going on, we
+				 * probably didn't yet get the subtest
+				 * result line printed. Such a case is
+				 * parsed as an incomplete unless the
+				 * journal says timeout, ergo to make
+				 * the result an incomplete we avoid
+				 * journaling a timeout here.
+				 */
+				if (is_tainted(taints))
+					exitline = EXECUTOR_EXIT;
+
 				dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
-					killed ? EXECUTOR_TIMEOUT : EXECUTOR_EXIT,
+					exitline,
 					status, time);
 				if (settings->sync) {
 					fdatasync(outputs[_F_JOURNAL]);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
