Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1610E88E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 07:33:40 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Jan 2023 13:05:35 +0530
Message-Id: <20230112073537.27890-7-swati2.sharma@intel.com>
In-Reply-To: <20230112073537.27890-1-swati2.sharma@intel.com>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 6/8] lib/dsc: Add helpers for VDSC
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

v2: -improved func description (Ankit)
    -increased buff size (Ankit)
    -asserted bpp_prec (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  5 +++
 2 files changed, 89 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 269d574e9..e5e67a469 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -198,3 +198,87 @@ int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
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
+/*
+ * igt_get_dsc_fractional_bpp_supported:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: The dsc sink bpp precision.
+ * 	    Precision value of
+ * 				16 => 1/16
+ * 				8  => 1/8
+ * 				1  => fractional bpp not supported
+ */
+int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+	char buf[512];
+	char *start_loc;
+	int bpp_prec;
+
+	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	igt_assert(start_loc = strstr(buf, "DSC_Sink_BPP_Precision: "));
+	igt_assert_eq(sscanf(start_loc, "DSC_Sink_BPP_Precision: %d", &bpp_prec), 1);
+	igt_assert(bpp_prec > 0);
+
+	return bpp_prec;
+}
+
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
+/*
+ * igt_get_dsc_fractional_bpp_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the DSC Fractional BPP debugfs for the given connector,
+ * else returns -1.
+ */
+int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_dsc_fractional_bpp", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index e2b039f42..7dc958406 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -7,6 +7,7 @@
 #define IGT_DSC_H
 
 #include "igt_fb.h"
+#include "igt_core.h"
 
 bool igt_is_dsc_supported(int drmfd, char *connector_name);
 bool igt_is_fec_supported(int drmfd, char *connector_name);
@@ -19,5 +20,9 @@ bool igt_is_dsc_ycbcr420_supported(int drmfd, char *connector_name);
 bool igt_is_force_dsc_ycbcr420_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_ycbcr420_enable(int drmfd, char *connector_name);
 int igt_get_dsc_ycbcr420_debugfs_fd(int drmfd, char *connector_name);
+int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name);
+bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
+int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
+int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
 
 #endif
-- 
2.25.1
