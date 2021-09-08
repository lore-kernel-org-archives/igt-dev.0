Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36CC6E192
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Sep 2021 11:20:34 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Wed,  8 Sep 2021 16:45:43 +0530
Message-Id: <20210908111543.1552728-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [ PATCH i-g-t v1 ] tests/i915/i915_pm_dc: Fix DC9 test
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

Currently, check_dc9 is being called with reference
(previous) counter being read after dpms_off call.
At this time, already the counter is 0.
We need to read the counter before dpms_off is called
so that it holds the previous value which had
incremented while testing shallow states (DC5 or DC6).

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 9d0a15d8..d1925e5a 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -400,8 +400,8 @@ static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int
 	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
 	 */
 	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
-			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
-			prev_dc, seconds, 100);
+			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) < prev_dc
+			, seconds, 100);
 }
 
 static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
@@ -418,15 +418,16 @@ static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
 static void test_dc9_dpms(data_t *data)
 {
 	bool dc6_supported;
+	int prev_dc;
 
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dc6_supported = support_dc6(data->debugfs_fd);
 	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
 			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
+	prev_dc = dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
+		read_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dpms_off(data);
-	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
-				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-				read_dc_counter(data->debugfs_fd, CHECK_DC5),
+	igt_assert_f(check_dc9(data->debugfs_fd, prev_dc,
 				dc6_supported, 3000), "Not in DC9\n");
 	dpms_on(data);
 }
-- 
2.25.1
