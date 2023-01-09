Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4010E4AA
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 15:27:10 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 20:58:26 +0530
Message-Id: <20230109152832.3310-4-swati2.sharma@intel.com>
In-Reply-To: <20230109152832.3310-1-swati2.sharma@intel.com>
References: <20230109152832.3310-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/dsc: Add helpers for VDSC YCbCr420
 debugfs entry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Helper functions are added for getting/setting VDSC YCbCr420 debugfs entry.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  4 +++
 2 files changed, 71 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 2d54c1ce5..d02c364aa 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -149,3 +149,70 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
+static
+bool check_dsc_ycbcr420_debugfs(int drmfd, char *connector_name,
+                                const char *check_str)
+{
+	char file_name[128] = {0};
+	char buf[512];
+
+	sprintf(file_name, "%s/i915_dsc_ycbcr420", connector_name);
+
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	return strstr(buf, check_str);
+}
+
+/*
+ * igt_is_dsc_ycbcr420_supported:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC YCbCr420 is supported for the given connector, false otherwise.
+ */
+bool igt_is_dsc_ycbcr420_supported(int drmfd, char *connector_name)
+{
+	return check_dsc_debugfs(drmfd, connector_name, "DSC_YCBCR420_Sink_Support: yes");
+}
+
+/*
+ * igt_is_force_dsc_ycbcr420_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC YCbCr420 is force enabled (via debugfs) for the given connector,
+ * false otherwise.
+ */
+bool igt_is_force_dsc_ycbcr420_enabled(int drmfd, char *connector_name)
+{
+	return check_dsc_ycbcr420_debugfs(drmfd, connector_name, "Force_DSC_YCBCR420_Enable: yes");
+}
+
+/*
+ * igt_force_dsc_ycbcr420_enable:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: 1 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_ycbcr420_enable(int drmfd, char *connector_name)
+{
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_ycbcr420", "1");
+}
+
+/*
+ * igt_get_dsc_ycbcr420_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the DSC YCbCr420 debugfs for the given connector, else returns -1.
+ */
+int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_dsc_ycbcr420", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 047db42eb..eeb4593be 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -33,5 +33,9 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
+bool igt_is_dsc_ycbcr420_supported(int drmfd, char *connector_name);
+bool igt_is_force_dsc_ycbcr420_enabled(int drmfd, char *connector_name);
+int igt_force_dsc_ycbcr420_enable(int drmfd, char *connector_name);
+int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name);
 
 #endif
-- 
2.25.1
