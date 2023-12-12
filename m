Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAE910E1B3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 09:27:33 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: assert only if idle
 residency is lesser than elapsed time
Date: Tue, 12 Dec 2023 15:05:01 +0530
Message-Id: <20231212093501.4105363-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When device is suspended (system suspend or runtime suspend),
device needs to be woken up to read residency.
Idle residency may increase above tolerance
based on the resume time, thus being greater than elapsed ms.

assert only if idle residency is less than elapsed time
and not within tolerance.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 5542f8fb4..7db3cd162 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -204,13 +204,6 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 		residency_start = read_idle_residency(fd, gt);
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 		residency_end = read_idle_residency(fd, gt);
-
-		/*
-		 * Idle residency may increase even after suspend, only assert if residency
-		 * is lesser than autoresume delay and is not within tolerance.
-		 */
-		if ((residency_end - residency_start) >= elapsed_ms)
-			return;
 	}
 
 	if (flag == TEST_IDLE) {
@@ -222,6 +215,14 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	igt_info("Measured %lums of idle residency in %lums\n",
 		 residency_end - residency_start, elapsed_ms);
 
+	/*
+	 * When suspended (system or runtime suspend), device needs to be woken up to read
+	 * residency. Idle residency may increase during resume thus being greater than
+	 * elapsed ms.
+	 */
+	if ((residency_end - residency_start) >= elapsed_ms)
+		return;
+
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
-- 
2.40.0
