Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414F210E730
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 17:28:36 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 22:53:18 +0530
Message-Id: <20230404172318.150403-3-mohammed.thasleem@intel.com>
In-Reply-To: <20230404172318.150403-1-mohammed.thasleem@intel.com>
References: <20230404172318.150403-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v7 2/2] tests/i915/i915_pm_dc: Add DC6 PSR test
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
v3: - Changed name from test_pkc_state_psr to test_pgkc_state_psr.
v4: - Updated igt_assert_f string in test_pkgc_state_psr.
v5: - %s/achieived/achieved/ in igt_assert_f.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/i915_pm_dc.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 0629ed7b..6f08cb3f 100644
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
@@ -551,6 +565,23 @@ static void test_pkgc_state_dpms(data_t *data)
 	cleanup_dc_dpms(data);
 }
 
+static void test_pkgc_state_psr(data_t *data)
+{
+	unsigned int timeout_sec = 6;
+	unsigned int prev_value = 0, cur_value = 0;
+
+	prev_value = read_pkgc_counter(data->debugfs_root_fd);
+	setup_output(data);
+	setup_primary(data);
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode));
+	psr_dpms(data, DRM_MODE_DPMS_OFF);
+	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
+		  timeout_sec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
+	psr_dpms(data, DRM_MODE_DPMS_ON);
+	cleanup_dc_psr(data);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -611,7 +642,10 @@ igt_main
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_psr(&data, CHECK_DC6);
+		if (intel_display_ver(data.devid) >= 14)
+			test_pkgc_state_psr(&data);
+		else
+			test_dc_state_psr(&data, CHECK_DC6);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
-- 
2.25.1
