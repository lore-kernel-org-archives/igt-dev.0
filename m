Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D46810E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 07:33:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [v2 1/3] lib/igt_kms: add helpers for big joiner debugfs
Date: Thu, 11 Jan 2024 13:05:00 +0530
Message-Id: <20240111073502.151340-2-swati2.sharma@intel.com>
In-Reply-To: <20240111073502.151340-1-swati2.sharma@intel.com>
References: <20240111073502.151340-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add helpers for big joiner debugfs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 78 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a60..d8ed81e9b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6368,3 +6368,78 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
 	return num_scalers;
 }
+
+static int write_bigjoiner_debugfs(int drmfd, char *connector_name, const char *file_name,
+				   const char *write_buf)
+{
+	int debugfs_fd = igt_debugfs_dir(drmfd);
+	int len = strlen(write_buf);
+	int ret;
+	char file_path[128] = {0};
+
+	sprintf(file_path, "%s/%s", connector_name, file_name);
+
+	ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
+
+	close(debugfs_fd);
+
+	if (ret > 0)
+		return 0;
+
+	return ret;
+}
+
+static bool check_bigjoiner_debugfs(int drmfd, char *connector_name,
+				    const char *check_str)
+{
+	char file_name[128] = {0};
+	char buf[512];
+
+	sprintf(file_name, "%s/i915_bigjoiner_force_enable", connector_name);
+
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	return strstr(buf, check_str);
+}
+
+/**
+ * igt_is_force_bigjoiner_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if Big Joiner is force enabled (via debugfs) for the given connector,
+ * false otherwise.
+ */
+bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name)
+{
+	return check_bigjoiner_debugfs(drmfd, connector_name, "Bigjoiner enable: 1");
+}
+
+/**
+ * igt_force_bigjoiner_enable:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: 0 on success or negative error code, in case of failure.
+ */
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name)
+{
+	return write_bigjoiner_debugfs(drmfd, connector_name, "i915_bigjoiner_force_enable", "1");
+}
+
+/**
+ * igt_get_bigjoiner_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the Big Joiner debugfs for the given connector,
+ * else returns -1.
+ */
+int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_bigjoiner_force_enable", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..1b973a7fc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1218,5 +1218,8 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
+bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name);
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name);
+int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
