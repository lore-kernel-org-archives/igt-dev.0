Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D19210E273
 for <igt-dev@lists.freedesktop.org>; Wed,  3 May 2023 11:40:56 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  3 May 2023 17:10:13 +0530
Message-Id: <20230503114014.132968-2-swati2.sharma@intel.com>
In-Reply-To: <20230503114014.132968-1-swati2.sharma@intel.com>
References: <20230503114014.132968-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/dsc: Add helpers for VDSC output
 format debugfs entry
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

Helper functions are added for VDSC output format debugfs entry.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_dsc.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  5 +++++
 lib/igt_kms.h |  6 ++++++
 3 files changed, 60 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 64dd6b29..9e1ab9b1 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -134,3 +134,52 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
+/*
+ * igt_is_dsc_output_format_supported_by_sink:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ * @output_format: Output format
+ *
+ * Returns: True if DSC output format is supported for the given connector,
+ * false otherwise.
+ */
+bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
+						enum dsc_output_format output_format)
+{
+	const char *check_str = "OUTPUTFORMATNOTFOUND";
+
+	switch (output_format) {
+	case DSC_FORMAT_RGB:
+		check_str = "RGB: yes";
+		break;
+	case DSC_FORMAT_YCBCR420:
+		check_str = "YCBCR420: yes";
+		break;
+	case DSC_FORMAT_YCBCR444:
+		check_str = "YCBCR444: yes";
+		break;
+	default:
+		break;
+	}
+
+	return check_dsc_debugfs(drmfd, connector_name, check_str);
+}
+
+/*
+ * igt_force_dsc_output_format:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ * @output_format: Output format
+ *
+ * Returns: 0 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_output_format(int drmfd, char *connector_name,
+				enum dsc_output_format output_format)
+{
+	char buf[20] = {0};
+
+	sprintf(buf, "%d", output_format);
+
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_output_format", buf);
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 291c2cde..9608aad4 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -7,6 +7,7 @@
 #define IGT_DSC_H
 
 #include "igt_fb.h"
+#include "igt_kms.h"
 
 bool igt_is_dsc_supported(int drmfd, char *connector_name);
 bool igt_is_fec_supported(int drmfd, char *connector_name);
@@ -15,5 +16,9 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
+bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
+						enum dsc_output_format output_format);
+int igt_force_dsc_output_format(int drmfd, char *connector_name,
+				enum dsc_output_format output_format);
 
 #endif
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 483b4165..41e041b6 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -108,6 +108,12 @@ enum igt_custom_edid_type {
  */
 #define kmstest_port_name(port) ((port) + 'A')
 
+enum dsc_output_format {
+	DSC_FORMAT_RGB = 0,
+	DSC_FORMAT_YCBCR420,
+	DSC_FORMAT_YCBCR444,
+};
+
 const char *kmstest_encoder_type_str(int type);
 const char *kmstest_connector_status_str(int status);
 const char *kmstest_connector_type_str(int type);
-- 
2.25.1
