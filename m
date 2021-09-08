Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7497F10EA2C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Feb 2022 09:10:09 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
Date: Thu,  9 Sep 2021 01:34:55 +0530
Message-Id: <20210908200455.6551-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc : Add func to check
 connected panel
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
Cc: nischal.varide@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add check_connected_panel function for checking external connected panel,
if it's connected there is no point to check DC states. Adding this to
igt_fixture to avoid wasting CI cycles.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2c2c5086..eb331be9 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -62,6 +62,7 @@ typedef struct {
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool runtime_suspend_disabled;
+	uint32_t external_panel;
 } data_t;
 
 static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
@@ -463,6 +464,23 @@ static void kms_poll_state_restore(int sig)
 	}
 }
 
+static void check_connected_panel(data_t *data)
+{
+	uint32_t count;
+	igt_display_t *display = &data->display;
+
+	for (count = 0; count < display->n_outputs; count++) {
+		if (display->outputs[count].config.connector->connection
+			== DRM_MODE_CONNECTED) {
+			if (display->outputs[count].config.connector->connector_type
+				!= DRM_MODE_CONNECTOR_eDP)
+				data->external_panel++;
+		}
+	}
+	igt_skip_on_f(data->external_panel,
+			"External panel detected skip execution\n");
+}
+
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
@@ -479,6 +497,7 @@ int main(int argc, char *argv[])
 		igt_require(igt_setup_runtime_pm(data.drm_fd));
 		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
 		igt_display_require(&data.display, data.drm_fd);
+		check_connected_panel(&data);
 		/* Make sure our Kernel supports MSR and the module is loaded */
 		igt_require(igt_kmod_load("msr", NULL) == 0);
 
-- 
2.25.1
