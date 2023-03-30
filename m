Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1929910E253
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 11:35:30 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 17:01:28 +0530
Message-Id: <20230330113128.87221-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230330113128.87221-1-mohammed.thasleem@intel.com>
References: <20230330113128.87221-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/2] tests/i915/i915_pm_dc: Add DC6 PSR test
 for mtl
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

The flow for DC6 has changed in display when compared to older projects.
DMC, does not do any special flow or save/restore when doing a DC6 entry.
The save/restore is done opportunistically when we do DC5 entry.
This test validates PKGC10 entry and confirm DC6 achieved.

v2: - Updated description. (Jouni)
    - Clubbed psr_pkc_enable/disable in psr_dpms. (Jouni)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index b315a9b9..733cd456 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -345,6 +345,20 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	cleanup_dc3co_fbs(data);
 }
 
+static void psr_dpms(data_t *data, int mode)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		drmModeConnectorPtr connector = output->config.connector;
+
+		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		kmstest_set_connector_dpms(data->drm_fd, connector, mode);
+	}
+}
+
 static void test_dc_state_psr(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -356,6 +370,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
 	cleanup_dc_psr(data);
+
 }
 
 static void cleanup_dc_dpms(data_t *data)
@@ -550,6 +565,24 @@ static void test_pkc_state_dpms(data_t *data)
 	cleanup_dc_dpms(data);
 }
 
+static void test_pkc_state_psr(data_t *data)
+{
+	unsigned int timeout_sec = 6;
+	unsigned int prev_value = 0, cur_value = 0;
+
+	prev_value = read_pkgc_counter(data->sysfs_fd);
+	setup_output(data);
+	setup_primary(data);
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode));
+	psr_dpms(data, DRM_MODE_DPMS_OFF);
+	igt_wait((cur_value = read_pkgc_counter(data->sysfs_fd)) > prev_value,
+		  timeout_sec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PK10 is not achieived.\n");
+	psr_dpms(data, DRM_MODE_DPMS_ON);
+	cleanup_dc_psr(data);
+}
+
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -610,7 +643,10 @@ igt_main
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_psr(&data, CHECK_DC6);
+		if (intel_display_ver(data.devid) >= 14)
+			test_pkc_state_psr(&data);
+		else
+			test_dc_state_psr(&data, CHECK_DC6);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.25.1
