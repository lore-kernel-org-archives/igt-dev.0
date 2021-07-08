Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D846E8CE
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 14:48:25 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  8 Jul 2021 20:06:36 +0530
Message-Id: <20210708143637.17558-4-venkata.sai.patnana@intel.com>
In-Reply-To: <20210708143637.17558-1-venkata.sai.patnana@intel.com>
References: <20210708143637.17558-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_dp_dsc: Use helper functions
 to read/write dsc debugfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Remove funtions for reading different dsc parameters from dsc debugfs.
Use the helper functions for reading and writing dsc debugfs.

Cc: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_dp_dsc.c | 87 ++++++++--------------------------------------
 1 file changed, 15 insertions(+), 72 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 08414e316e..e5dce993c7 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -55,7 +55,6 @@ enum dsc_test_type
 
 typedef struct {
 	int drm_fd;
-	int debugfs_fd;
 	uint32_t devid;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
@@ -76,91 +75,36 @@ static inline void manual(const char *expected)
 	igt_debug_manual_check("all", expected);
 }
 
-static bool is_dp_dsc_supported(data_t *data)
-{
-	char file_name[128] = {0};
-	char buf[512];
-
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_fec_support");
-	igt_debugfs_read(data->drm_fd, file_name, buf);
-
-	return strstr(buf, "DSC_Sink_Support: yes");
-}
-
-static bool is_dp_fec_supported(data_t *data)
-{
-	char file_name[128] = {0};
-	char buf[512];
-
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_fec_support");
-	igt_debugfs_read(data->drm_fd, file_name, buf);
-
-	return strstr(buf, "FEC_Sink_Support: yes");
-}
-
-static bool is_dp_dsc_enabled(data_t *data)
-{
-	char file_name[128] = {0};
-	char buf[512];
-
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_fec_support");
-	igt_debugfs_read(data->drm_fd, file_name, buf);
-
-	return strstr(buf, "DSC_Enabled: yes");
-}
-
 static void force_dp_dsc_enable(data_t *data)
 {
-	char file_name[128] = {0};
 	int ret;
 
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_fec_support");
 	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
-	ret = igt_sysfs_write(data->debugfs_fd, file_name, "1", 1);
+	ret = igt_force_dp_dsc_enable(data->drm_fd,
+				      data->output->config.connector);
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
 static void force_dp_dsc_enable_bpp(data_t *data)
 {
 	int ret;
-	char file_name[128] = {0};
-	char buffer[20];
 
-	sprintf(buffer, "%d", data->compression_bpp);
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_bpp");
 	igt_debug("Forcing DSC BPP to %d on %s\n",
 		  data->compression_bpp, data->conn_name);
-	ret = igt_sysfs_write(data->debugfs_fd, file_name,
-			      buffer, sizeof(buffer));
+	ret = igt_force_dp_dsc_enable_bpp(data->drm_fd,
+					  data->output->config.connector,
+					  data->compression_bpp);
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
-static bool is_force_dsc_enabled(data_t *data)
-{
-	char file_name[128] = {0};
-	char buf[512];
-
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_fec_support");
-	igt_debugfs_read(data->drm_fd, file_name, buf);
-
-	return strstr(buf, "Force_DSC_Enable: yes");
-}
-
 static void save_force_dsc_en(data_t *data)
 {
-	char file_name[128] = {0};
-
-	force_dsc_en_orig = is_force_dsc_enabled(data);
-	strcpy(file_name, data->conn_name);
-	strcat(file_name, "/i915_dsc_fec_support");
-	force_dsc_restore_fd = openat(igt_debugfs_dir(data->drm_fd),
-				      file_name, O_WRONLY);
+	force_dsc_en_orig =
+		igt_is_force_dsc_enabled(data->drm_fd,
+					 data->output->config.connector);
+	force_dsc_restore_fd =
+		igt_get_dp_dsc_debugfs_fd(data->drm_fd,
+					  data->output->config.connector);
 	igt_assert(force_dsc_restore_fd >= 0);
 }
 
@@ -211,13 +155,13 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 		kmstest_connector_type_str(connector->connector_type),
 		connector->connector_type_id);
 
-	if (!is_dp_dsc_supported(data)) {
+	if (!igt_is_dp_dsc_supported(data->drm_fd, connector)) {
 		igt_debug("DSC not supported on connector %s\n",
 			  data->conn_name);
 		return false;
 	}
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-	    !is_dp_fec_supported(data)) {
+	    !igt_is_dp_fec_supported(data->drm_fd, connector)) {
 		igt_debug("DSC cannot be enabled without FEC on %s\n",
 			  data->conn_name);
 		return false;
@@ -261,7 +205,8 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	 */
 	manual("RGB test pattern without corruption");
 
-	enabled = is_dp_dsc_enabled(data);
+	enabled = igt_is_dp_dsc_enabled(data->drm_fd,
+					data->output->config.connector);
 	restore_force_dsc_en();
 
 	igt_assert_f(enabled,
@@ -321,7 +266,6 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require_intel(data.drm_fd);
 		data.devid = intel_get_drm_devid(data.drm_fd);
-		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dp_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
@@ -361,7 +305,6 @@ igt_main
 			drmModeFreeConnector(connector);
 		test_cleanup(&data);
 		drmModeFreeResources(res);
-		close(data.debugfs_fd);
 		close(data.drm_fd);
 		igt_display_fini(&data.display);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
