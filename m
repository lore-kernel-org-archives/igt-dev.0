Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C5E6E0DA
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 05:52:09 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Mon, 13 Sep 2021 11:17:02 +0530
Message-Id: <20210913054702.1584441-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/i915_pm_dc: Fix DC9 test
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
Cc: jigar.bhatt@intel.com, uma.shankar@intel.com, nischal.varide@intel.com, imre.deak@intel.com, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V1:
Currently, check_dc9 is being called with reference
(previous) counter being read after dpms_off call.
At this time, already the counter is 0.
We need to read the counter before dpms_off is called
so that it holds the previous value which had
incremented while testing shallow states (DC5 or DC6).

V2:
Bit cleaner code.[Imre]
dump the i915_pm_runtime_status debugfs file in case of test
failure.[Anshuman]

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 9d0a15d8..551b9c6e 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -393,23 +393,35 @@ static bool support_dc6(int debugfs_fd)
 	return strstr(buf, "DC5 -> DC6 count");
 }
 
-static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int seconds)
+static bool dc9_wait_entry(uint32_t debugfs_fd, int prev_dc, int dc_target, int seconds)
 {
 	/*
 	 * since we do not have DC9 counter,
 	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
 	 */
-	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
-			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
-			prev_dc, seconds, 100);
+	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
+			prev_dc, seconds, 100);
 }
 
-static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
+static void check_dc9(data_t *data, int dc_target, uint32_t prev_dc)
 {
+	char tmp[64];
+
+	snprintf(tmp, sizeof(tmp), "%s", dc_target & CHECK_DC3CO ? "DC3CO" :
+		(dc_target & CHECK_DC5 ? "DC5" : "DC6"));
+	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
+		     "%s state is not achieved\n%s:\n%s\n", tmp, PWR_DOMAIN_INFO,
+		     data->pwr_dmn_info = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
+}
+
+static void setup_dc9_dpms(data_t *data, int dc_target)
+{
+	int prev_dc;
+
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc_dpms(data);
 	dpms_off(data);
-	igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
-				prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
+	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
 	dpms_on(data);
 	cleanup_dc_dpms(data);
@@ -417,17 +429,14 @@ static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
 
 static void test_dc9_dpms(data_t *data)
 {
-	bool dc6_supported;
+	int prev_dc, dc_target;
 
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
-	dc6_supported = support_dc6(data->debugfs_fd);
-	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
+	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
+	setup_dc9_dpms(data, dc_target);
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	dpms_off(data);
-	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
-				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-				read_dc_counter(data->debugfs_fd, CHECK_DC5),
-				dc6_supported, 3000), "Not in DC9\n");
+	check_dc9(data, dc_target, prev_dc);
 	dpms_on(data);
 }
 
-- 
2.25.1
