Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E236E944
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 17:00:11 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  8 Jul 2021 22:19:00 +0530
Message-Id: <20210708164902.18250-3-venkata.sai.patnana@intel.com>
In-Reply-To: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
References: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib: Add helper functions to read/write
 dsc debugfs
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

Reuse code for reading and writing dsc debugfs and provide helper
functions to get dsc related parameters in lib igt_kms.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_kms.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   9 ++++
 2 files changed, 144 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c7c69b6ea0..2c44361a40 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5183,3 +5183,138 @@ void igt_dump_crtcs_fd(int drmfd)
 
 	drmModeFreeResources(mode_resources);
 }
+
+static
+bool check_dsc_debugfs(int drmfd, drmModeConnector *connector,
+		       const char *check_str)
+{
+	char file_name[128] = {0};
+	char buf[512];
+
+	sprintf(file_name, "%s-%d/i915_dsc_fec_support",
+		kmstest_connector_type_str(connector->connector_type),
+		connector->connector_type_id);
+
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	return strstr(buf, check_str);
+}
+
+static
+int write_dsc_debugfs(int drmfd, drmModeConnector *connector,
+		      const char *file_name,
+		      const char *write_buf)
+{
+	int debugfs_fd = igt_debugfs_dir(drmfd);
+	int len = strlen(write_buf);
+	int ret;
+	char file_path[128] = {0};
+
+	sprintf(file_path, "%s-%d/%s",
+		kmstest_connector_type_str(connector->connector_type),
+		connector->connector_type_id,
+		file_name);
+
+	ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
+
+	close(debugfs_fd);
+
+	return ret;
+}
+
+/*
+ * igt_is_dp_dsc_supported:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ *
+ * Returns: True if DSC is supported for the given connector, false otherwise.
+ */
+bool igt_is_dp_dsc_supported(int drmfd, drmModeConnector *connector)
+{
+	return check_dsc_debugfs(drmfd, connector, "DSC_Sink_Support: yes");
+}
+
+/*
+ * igt_is_dp_fec_supported:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ *
+ * Returns: True if FEC is supported for the given connector, false otherwise.
+ */
+bool igt_is_dp_fec_supported(int drmfd, drmModeConnector *connector)
+{
+
+	return check_dsc_debugfs(drmfd, connector, "FEC_Sink_Support: yes");
+}
+
+/*
+ * igt_is_dp_dsc_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ *
+ * Returns: True if DSC is enabled for the given connector, false otherwise.
+ */
+bool igt_is_dp_dsc_enabled(int drmfd, drmModeConnector *connector)
+{
+	return check_dsc_debugfs(drmfd, connector, "DSC_Enabled: yes");
+}
+
+/*
+ * igt_is_force_dsc_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ *
+ * Returns: True if DSC is force enabled (via debugfs) for the given connector,
+ * false otherwise.
+ */
+bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector)
+{
+	return check_dsc_debugfs(drmfd, connector, "Force_DSC_Enable: yes");
+}
+
+/*
+ * igt_force_dp_dsc_enable:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ *
+ * Returns: 1 on success or negative error code, in case of failure.
+ */
+int igt_force_dp_dsc_enable(int drmfd, drmModeConnector *connector)
+{
+	return write_dsc_debugfs(drmfd, connector, "i915_dsc_fec_support", "1");
+}
+
+/*
+ * igt_force_dp_dsc_enable:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ * @bpp: Compressed bpp to be used with DSC
+ *
+ * Returns: No. of bytes written or negative error code, in case of failure.
+ */
+int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector, int bpp)
+{
+	char buf[20] = {0};
+
+	sprintf(buf, "%d", bpp);
+
+	return write_dsc_debugfs(drmfd, connector, "i915_dsc_bpp", buf);
+}
+
+/*
+ * igt_get_dp_dsc_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector: Pointer to libdrm connector
+ *
+ * Returns: fd of the DSC debugfs for the given connector, else returns -1.
+ */
+int igt_get_dp_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s-%d/i915_dsc_fec_support",
+		kmstest_connector_type_str(connector->connector_type),
+		connector->connector_type_id);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8cde24b791..e87d1913e5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -917,4 +917,13 @@ void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 
+bool igt_is_dp_dsc_supported(int drmfd, drmModeConnector *connector);
+bool igt_is_dp_fec_supported(int drmfd, drmModeConnector *connector);
+bool igt_is_dp_dsc_enabled(int drmfd, drmModeConnector *connector);
+bool igt_is_force_dsc_enabled(int drmfd, drmModeConnector *connector);
+int igt_force_dp_dsc_enable(int drmfd, drmModeConnector *connector);
+int igt_force_dp_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
+				int bpp);
+int igt_get_dp_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
