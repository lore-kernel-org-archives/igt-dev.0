Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19206F9DB
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 10:36:21 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Wed,  1 Dec 2021 16:07:17 +0530
Message-Id: <20211201103717.1048521-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/i915_pm_dc: Moved prev DC counter
 reading logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Reading of prev_dc counter in dc9-dpms subtest as 0, after reset
comparison with 0 test gets failed. taken prev_dc counter after
enterd into shallow DC state.fixes dc9-dpms subtest failures.

changes since V1:
        - Removed new lines and warnings from checkpatch.pl
        - Updated Subject

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
Reviewed-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 4ebeb3eb..2c2c5086 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -434,22 +434,22 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	dpms_off(data);
 	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	dpms_on(data);
 	cleanup_dc_dpms(data);
+	dpms_off(data);
+	sleep(1); /* wait for counters reset*/
+	check_dc9(data, dc_target, prev_dc);
+	dpms_on(data);
 }
 
 static void test_dc9_dpms(data_t *data)
 {
-	int prev_dc, dc_target;
+	int dc_target;
 
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
-	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc9_dpms(data, dc_target);
-	dpms_off(data);
-	sleep(1); /* wait for counters reset*/
-	check_dc9(data, dc_target, prev_dc);
-	dpms_on(data);
 }
 
 static void kms_poll_state_restore(int sig)
-- 
2.25.1
