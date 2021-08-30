Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF9089C1A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 05:33:50 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Mon, 30 Aug 2021 10:59:11 +0530
Message-Id: <20210830052911.1394388-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Fix DC9 Test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jigar.bhatt@intel.com, nischal.varide@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

1. Currently, check_dc9 is being called with reference
(previous) counter being read after dpms_off call.
At this time, already the counter is 0.
We need to read the counter before dpms_off is called
so that it holds the previous value which had
incremented while testing shallow states (DC5 or DC6).

2. Check for a condition dc counter to be reset along with
system should in runtime suspend state :
currect_dc < prev_dc && i915 runtime status == SUSPENDED.
If above condition pass, test is passed otherwise test is failed.

3. adding dc9_dpms_off()

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 9d0a15d8..98ee2d06 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -358,6 +358,15 @@ static void dpms_off(data_t *data)
 			   (IGT_RUNTIME_PM_STATUS_SUSPENDED));
 }
 
+static void dc9_dpms_off(data_t *data)
+{
+	for (int i = 0; i < data->display.n_outputs; i++) {
+		kmstest_set_connector_dpms(data->drm_fd,
+					   data->display.outputs[i].config.connector,
+					   DRM_MODE_DPMS_OFF);
+	}
+}
+
 static void dpms_on(data_t *data)
 {
 	for (int i = 0; i < data->display.n_outputs; i++) {
@@ -400,8 +409,11 @@ static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int
 	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
 	 */
 	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
-			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
-			prev_dc, seconds, 100);
+			prev_dc &&
+			igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)
+			: read_dc_counter(debugfs_fd, CHECK_DC5) < prev_dc &&
+			igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)
+			, seconds, 100);
 }
 
 static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
@@ -418,15 +430,16 @@ static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
 static void test_dc9_dpms(data_t *data)
 {
 	bool dc6_supported;
+	int prev_dc;
 
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dc6_supported = support_dc6(data->debugfs_fd);
 	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
 			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
-	dpms_off(data);
-	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
-				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-				read_dc_counter(data->debugfs_fd, CHECK_DC5),
+	prev_dc = dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
+		read_dc_counter(data->debugfs_fd, CHECK_DC5);
+	dc9_dpms_off(data);
+	igt_assert_f(check_dc9(data->debugfs_fd, prev_dc,
 				dc6_supported, 3000), "Not in DC9\n");
 	dpms_on(data);
 }
-- 
2.25.1
