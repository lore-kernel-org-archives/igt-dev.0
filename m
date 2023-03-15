Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3234D10E329
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 21:05:26 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 02:31:47 +0530
Message-Id: <20230315210147.19557-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230315210147.19557-1-mohammed.thasleem@intel.com>
References: <20230315210147.19557-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/i915_pm_dc: Add DC6 PSR test
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

The flow for DC6 validation has changed for MTL.
DC6 state achieved based on PKGC10 entry.
This test validates PKGC10 entry and confirm DC6 achieved.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 54 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 322a0c60..ed573ce6 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -407,6 +407,38 @@ static void dpms_on(data_t *data)
 			   (IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
 
+static void psr_pkc_enable(data_t *data)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		kmstest_set_connector_dpms(data->drm_fd,
+					   data->display.outputs->config.connector,
+					   DRM_MODE_DPMS_OFF);
+	}
+}
+
+static void psr_pkc_disable(data_t *data)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		kmstest_set_connector_dpms(data->drm_fd,
+					   data->display.outputs->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+}
+
 static void test_dc_state_dpms(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter;
@@ -551,6 +583,23 @@ static void test_pkc_state_dpms(data_t *data)
 	dpms_on(data);
 }
 
+static void test_pkc_state_psr(data_t *data)
+{
+	unsigned int timeout_msec = 30;
+	unsigned int prev_value = 0, cur_value = 0;
+
+	prev_value = read_pkc_state_value(data->pmc_fd);
+	setup_output(data);
+	setup_primary(data);
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode));
+	psr_pkc_enable(data);
+	cleanup_dc_psr(data);
+	igt_wait((cur_value = read_pkc_state_value(data->pmc_fd)),
+		  timeout_msec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PK10 is not achieived.\n");
+	psr_pkc_disable(data);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -609,7 +658,10 @@ igt_main
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_psr(&data, CHECK_DC6);
+		if (intel_display_ver(data.devid) == 14)
+			test_pkc_state_psr(&data);
+		else
+			test_dc_state_psr(&data, CHECK_DC6);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.25.1
