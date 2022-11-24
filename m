Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD7B10E6EA
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 11:55:40 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Nov 2022 17:27:12 +0530
Message-Id: <20221124115714.31557-2-swati2.sharma@intel.com>
In-Reply-To: <20221124115714.31557-1-swati2.sharma@intel.com>
References: <20221124115714.31557-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/kms: Add helpers for VDSC YCbCr420
 debugfs entry
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
 lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  7 ++++--
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b4a98ae17..c7135790b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5578,6 +5578,20 @@ bool check_dsc_debugfs(int drmfd, char *connector_name,
 	return strstr(buf, check_str);
 }
 
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
 static
 int write_dsc_debugfs(int drmfd, char *connector_name,
 		      const char *file_name,
@@ -5609,6 +5623,18 @@ bool igt_is_dsc_supported(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
 }
 
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
 /*
  * igt_is_fec_supported:
  * @drmfd: A drm file descriptor
@@ -5646,6 +5672,19 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
 }
 
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
 /*
  * igt_force_dsc_enable:
  * @drmfd: A drm file descriptor
@@ -5658,6 +5697,18 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
 }
 
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
 /*
  * igt_force_dsc_enable_bpc:
  * @drmfd: A drm file descriptor
@@ -5691,6 +5742,22 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
 
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
+
 /*
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7a00d2045..ccd8adf2c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -976,13 +976,16 @@ void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 
 bool igt_is_dsc_supported(int drmfd, char *connector_name);
+bool igt_is_dsc_ycbcr420_supported(int drmfd, char *connector_name);
 bool igt_is_fec_supported(int drmfd, char *connector_name);
 bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
+bool igt_is_force_dsc_ycbcr420_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
-int igt_force_dsc_enable_bpc(int drmfd, char *connector_name,
-			     int bpc);
+int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
+int igt_force_dsc_ycbcr420_enable(int drmfd, char *connector_name);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
+int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name);
 
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
-- 
2.25.1
