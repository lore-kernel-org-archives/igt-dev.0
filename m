Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9410E341
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 10:53:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Nov 2023 16:13:32 +0530
Message-Id: <20231113104332.1266113-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] syncobj_timeline: don't expect EINVAL for
 WAIT_UNSUBMITTED | WAIT_AVAILABLE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Erik Kurzinger <ekurzinger@nvidia.com>

The syncobj_timeline test expects waiting for an unsubmitted fence with
the WAIT_AVAILABLE flag set to fail with EINVAL. While this matches the
behavior of current kernels, that behavior is incorrect and will be
fixed by
https://lists.freedesktop.org/archives/dri-devel/2023-August/418710.html

With that fix, the WAIT_AVAILABLE flag will have the intended semantics
of waiting for an unsubmitted fence to be submitted instead of failing.

Note that this will cause the test to fail with kernels that lack the
fix, but such failures will reflect a genuine defect.

V2: Fix testplan documentation

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/syncobj_timeline.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index b4e1d093a..ea8341a30 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -135,16 +135,16 @@
  *   Verifies that as we signal points from the host, the syncobj timeline value increments and
  *   that waits for submits/signals works properly.
  *
- * SUBTEST: invalid-multi-wait-all-available-unsubmitted
+ * SUBTEST: etime-multi-wait-all-available-unsubmitted
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-all-available-unsubmitted-signaled
+ * SUBTEST: etime-multi-wait-all-available-unsubmitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-all-available-unsubmitted-submitted
+ * SUBTEST: etime-multi-wait-all-available-unsubmitted-submitted
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-all-available-unsubmitted-submitted-signaled
+ * SUBTEST: etime-multi-wait-all-available-unsubmitted-submitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
@@ -159,16 +159,16 @@
  * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-available-unsubmitted
+ * SUBTEST: etime-multi-wait-available-unsubmitted
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-available-unsubmitted-signaled
+ * SUBTEST: multi-wait-available-unsubmitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-available-unsubmitted-submitted
+ * SUBTEST: multi-wait-available-unsubmitted-submitted
  * Description: Verifies waiting on a list of timeline syncobjs
  *
- * SUBTEST: invalid-multi-wait-available-unsubmitted-submitted-signaled
+ * SUBTEST: multi-wait-available-unsubmitted-submitted-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
  *
  * SUBTEST: invalid-multi-wait-unsubmitted
@@ -213,13 +213,13 @@
  * SUBTEST: invalid-signal-zero-handles
  * Description: Verify that signaling an empty list of syncobj handles is rejected
  *
- * SUBTEST: invalid-single-wait-all-available-unsubmitted
+ * SUBTEST: etime-single-wait-all-available-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
  *
  * SUBTEST: invalid-single-wait-all-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
  *
- * SUBTEST: invalid-single-wait-available-unsubmitted
+ * SUBTEST: etime-single-wait-available-unsubmitted
  * Description: Verifies wait behavior on a single timeline syncobj
  *
  * SUBTEST: invalid-single-wait-unsubmitted
@@ -1782,7 +1782,7 @@ igt_main
 						WAIT_SIGNALED)) != 1)
 			continue;
 
-		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT))
+		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE)))
 			err = -EINVAL;
 		else if (!(flags & WAIT_SIGNALED) && !((flags & WAIT_SUBMITTED) && (flags & WAIT_AVAILABLE)))
 			err = -ETIME;
@@ -1851,7 +1851,7 @@ igt_main
 			continue;
 
 		err = 0;
-		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT)) {
+		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE))) {
 			err = -EINVAL;
 		} else if (flags & WAIT_ALL) {
 			if (flags & (WAIT_UNSUBMITTED | WAIT_SUBMITTED))
-- 
2.40.0
