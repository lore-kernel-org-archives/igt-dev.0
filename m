Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676BB10E571
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 11:29:44 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] lib/igt_kms: add helpers for big joiner debugfs
Date: Wed, 10 Jan 2024 17:09:05 +0530
Message-Id: <20240110113906.523857-2-kunal1.joshi@intel.com>
In-Reply-To: <20240110113906.523857-1-kunal1.joshi@intel.com>
References: <20240110113906.523857-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

Add helpers for big joiner debugfs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 78 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a60..0208eccc4 100644
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
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
+{
+	return write_bigjoiner_debugfs(drmfd, connector_name, "i915_bigjoiner_force_enable", enable ? "1" : "0");
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
index b3882808b..2d000d54d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1218,5 +1218,8 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
+bool igt_is_force_bigjoiner_enabled(int drmfd, char *connector_name);
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
+int igt_get_bigjoiner_debugfs_fd(int drmfd, char *connector_name);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
