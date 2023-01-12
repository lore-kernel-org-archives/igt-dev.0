Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB9A10E889
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 07:33:35 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Jan 2023 13:05:32 +0530
Message-Id: <20230112073537.27890-4-swati2.sharma@intel.com>
In-Reply-To: <20230112073537.27890-1-swati2.sharma@intel.com>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 3/8] lib/dsc: Add helpers for VDSC
 YCbCr420 debugfs entry
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

Helper functions are added for getting/setting VDSC YCbCr420 debugfs entry.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  4 +++
 2 files changed, 71 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 25dcb5840..269d574e9 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -131,3 +131,70 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
 
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
index 291c2cdea..e2b039f42 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -15,5 +15,9 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
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
