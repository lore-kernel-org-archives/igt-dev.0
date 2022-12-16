Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49C110E152
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Dec 2022 19:16:26 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 17 Dec 2022 00:41:24 +0530
Message-Id: <20221216191124.27930-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc : Check DC5 state
 with externel active panel
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

This test validates negative scenario of DC5 state by keeping
all connectors's DPMS property set to ON.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index ba49d014..ebbf5fc9 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -246,6 +246,13 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
+static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
+{
+	igt_assert_f(!dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
+			"%s state is achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMAIN_INFO,
+			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
+}
+
 static void setup_videoplayback(data_t *data)
 {
 	color_t red_green_blue[] = {
@@ -411,6 +418,18 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	cleanup_dc_dpms(data);
 }
 
+static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
+{
+	uint32_t dc_counter;
+
+	require_dc_counter(data->debugfs_fd, dc_flag);
+	setup_dc_dpms(data);
+	dc_counter = read_dc_counter(data->debugfs_fd, dc_flag);
+	dpms_on(data);
+	check_dc_counter_negative(data, dc_flag, dc_counter);
+	cleanup_dc_dpms(data);
+}
+
 static bool support_dc6(int debugfs_fd)
 {
 	char buf[4096];
@@ -552,6 +571,13 @@ igt_main
 		test_dc_state_dpms(&data, CHECK_DC5);
 	}
 
+	igt_describe("This test validates negative scenario of DC5 display "
+		     "engine entry to DC5 state while all connectors's DPMS "
+		     "property set to ON");
+	igt_subtest("dc5-dpms-negative") {
+		test_dc_state_dpms_negative(&data, CHECK_DC5);
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while all connectors's DPMS property set to OFF");
 	igt_subtest("dc6-dpms") {
-- 
2.25.1
