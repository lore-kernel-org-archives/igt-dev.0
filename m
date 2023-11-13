Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BF510E150
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 05:32:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Nov 2023 10:53:04 +0530
Message-Id: <20231113052304.1092040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/syncobj_timeline: Fix testplan documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix testplan documentaion to build the IGT.

Fixes: f6f590334 syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, | WAIT_AVAILABLE
Cc: Erik Kurzinger <ekurzinger@nvidia.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/syncobj_timeline.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 0422bca51..ea8341a30 100644
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
-- 
2.40.0
