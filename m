Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594910E41F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 05:15:26 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 10:50:57 +0530
Message-Id: <20230905052058.2216763-2-riana.tauro@intel.com>
In-Reply-To: <20230905052058.2216763-1-riana.tauro@intel.com>
References: <20230905052058.2216763-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe: Add GT id to C6 assertions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add GT id to igt assertions in xe_pm_residency that
checks if a GT is in a required C State.
This helps to identify which GT is causing a failure.

No functional changes.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index bf8230114..a538d1917 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -100,7 +100,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
 
-	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
+	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
 		/*
@@ -156,7 +156,7 @@ static void toggle_gt_c6(int fd, int n)
 		/* check if all gts are in C0 after forcewake is acquired */
 		xe_for_each_gt(fd, gt)
 			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
-				     "Forcewake acquired, GT should be in C0\n");
+				     "Forcewake acquired, GT %d should be in C0\n", gt);
 
 		if (n == NUM_REPS)
 			measure_power(&gpu, &gt_c0_power);
@@ -165,7 +165,7 @@ static void toggle_gt_c6(int fd, int n)
 		/* check if all gts are in C6 after forcewake is released */
 		xe_for_each_gt(fd, gt)
 			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
-				     "Forcewake released, GT should be in C6\n");
+				     "Forcewake released, GT %d should be in C6\n", gt);
 
 		if (n == NUM_REPS)
 			measure_power(&gpu, &gt_c6_power);
@@ -194,7 +194,7 @@ igt_main
 	igt_describe("Validate GT C6 on idle");
 	igt_subtest("gt-c6-on-idle")
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
+			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
 
 	igt_describe("Validate idle residency measured over suspend cycle is within the tolerance");
 	igt_subtest("gt-c6-freeze") {
-- 
2.40.0
