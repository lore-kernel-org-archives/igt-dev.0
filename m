Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9AE10E741
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 11:56:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 17:28:06 +0530
Message-Id: <20221125115808.13394-5-swati2.sharma@intel.com>
In-Reply-To: <20221125115808.13394-1-swati2.sharma@intel.com>
References: <20221125115808.13394-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] lib/kms: Add helpers for VDSC
 Fractional BPP debugfs entry
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

Helper functions are added for getting/setting VDSC Fractional BPP
debugfs entry.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  4 +++
 2 files changed, 82 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c7135790b..93f45410c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5592,6 +5592,20 @@ bool check_dsc_ycbcr420_debugfs(int drmfd, char *connector_name,
 	return strstr(buf, check_str);
 }
 
+static
+bool check_dsc_fractional_bpp_debugfs(int drmfd, char *connector_name,
+				      const char *check_str)
+{
+	char file_name[128] = {0};
+	char buf[512];
+
+	sprintf(file_name, "%s/i915_dsc_fractional_bpp", connector_name);
+
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	return strstr(buf, check_str);
+}
+
 static
 int write_dsc_debugfs(int drmfd, char *connector_name,
 		      const char *file_name,
@@ -5623,6 +5637,29 @@ bool igt_is_dsc_supported(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
 }
 
+/*
+ * igt_get_dsc_fractional_bpp_supported:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: The dsc sink bpp precision.
+ */
+int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+	char buf[24];
+	char *start_loc;
+	int bpp_prec;
+
+	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	igt_assert(start_loc = strstr(buf, "DSC_Sink_BPP_Precision: "));
+	igt_assert_eq(sscanf(start_loc, "DSC_Sink_BPP_Precision: %d", &bpp_prec), 1);
+
+	return bpp_prec;
+}
+
 /*
  * igt_is_dsc_ycbcr420_supported:
  * @drmfd: A drm file descriptor
@@ -5685,6 +5722,19 @@ bool igt_is_force_dsc_ycbcr420_enabled(int drmfd, char *connector_name)
 	return check_dsc_ycbcr420_debugfs(drmfd, connector_name, "Force_DSC_YCBCR420_Enable: yes");
 }
 
+/*
+ * igt_is_force_dsc_fractional_bpp_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC Fractional BPP is force enabled (via debugfs) for the given connector,
+ * false otherwise.
+ */
+bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name)
+{
+	return check_dsc_fractional_bpp_debugfs(drmfd, connector_name, "Force_DSC_Fractional_BPP_Enable: yes");
+}
+
 /*
  * igt_force_dsc_enable:
  * @drmfd: A drm file descriptor
@@ -5709,6 +5759,18 @@ int igt_force_dsc_ycbcr420_enable(int drmfd, char *connector_name)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_ycbcr420", "1");
 }
 
+/*
+ * igt_force_dsc_fractional_bpp_enable:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: 1 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name)
+{
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fractional_bpp", "1");
+}
+
 /*
  * igt_force_dsc_enable_bpc:
  * @drmfd: A drm file descriptor
@@ -5758,6 +5820,22 @@ int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name)
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
 
+/*
+ * igt_get_dsc_fractional_bpp_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the DSC Fractional BPP debugfs for the given connector, else returns -1.
+ */
+int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_dsc_fractional_bpp", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
+
 /*
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ccd8adf2c..990157bbc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -977,15 +977,19 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
 
 bool igt_is_dsc_supported(int drmfd, char *connector_name);
 bool igt_is_dsc_ycbcr420_supported(int drmfd, char *connector_name);
+int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name);
 bool igt_is_fec_supported(int drmfd, char *connector_name);
 bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_ycbcr420_enabled(int drmfd, char *connector_name);
+bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
 int igt_force_dsc_ycbcr420_enable(int drmfd, char *connector_name);
+int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
 int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name);
+int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
 
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
-- 
2.25.1
