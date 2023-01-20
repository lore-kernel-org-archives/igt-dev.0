Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6D210E122
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 17:39:10 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 23:11:15 +0530
Message-Id: <20230120174119.3937-2-swati2.sharma@intel.com>
In-Reply-To: <20230120174119.3937-1-swati2.sharma@intel.com>
References: <20230120174119.3937-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/dsc: Move VDSC functions to
 separate lib file
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

Move dsc func() from lib/igt_kms to lib/igt_dsc. With
DSC1.2a new functions will be introduced. It's better
to create separate file having dsc specific functions
instead of overcrowding igt_kms.

v2: -use of SPDX licence placeholder

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt.h       |   1 +
 lib/igt_dsc.c   | 133 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h   |  19 +++++++
 lib/igt_kms.c   | 127 ---------------------------------------------
 lib/igt_kms.h   |  10 ----
 lib/meson.build |   1 +
 6 files changed, 154 insertions(+), 137 deletions(-)
 create mode 100644 lib/igt_dsc.c
 create mode 100644 lib/igt_dsc.h

diff --git a/lib/igt.h b/lib/igt.h
index 88938109..73b6f772 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -40,6 +40,7 @@
 #include "igt_pipe_crc.h"
 #include "igt_pm.h"
 #include "igt_stats.h"
+#include "igt_dsc.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_alsa.h"
 #include "igt_audio.h"
diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
new file mode 100644
index 00000000..25dcb584
--- /dev/null
+++ b/lib/igt_dsc.c
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <unistd.h>
+#include <fcntl.h>
+#include <string.h>
+#include "igt_dsc.h"
+#include "igt_sysfs.h"
+
+static bool check_dsc_debugfs(int drmfd, char *connector_name, const char *check_str)
+{
+	char file_name[128] = {0};
+	char buf[512];
+
+	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
+
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	return strstr(buf, check_str);
+}
+
+static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_name,
+			     const char *write_buf)
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
+	return ret;
+}
+
+/*
+ * igt_is_dsc_supported:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC is supported for the given connector, false otherwise.
+ */
+bool igt_is_dsc_supported(int drmfd, char *connector_name)
+{
+	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
+}
+
+/*
+ * igt_is_fec_supported:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if FEC is supported for the given connector, false otherwise.
+ */
+bool igt_is_fec_supported(int drmfd, char *connector_name)
+{
+	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
+}
+
+/*
+ * igt_is_dsc_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC is enabled for the given connector, false otherwise.
+ */
+bool igt_is_dsc_enabled(int drmfd, char *connector_name)
+{
+	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
+}
+
+/*
+ * igt_is_force_dsc_enabled:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC is force enabled (via debugfs) for the given connector,
+ * false otherwise.
+ */
+bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
+{
+	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
+}
+
+/*
+ * igt_force_dsc_enable:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: 1 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_enable(int drmfd, char *connector_name)
+{
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
+}
+
+/*
+ * igt_force_dsc_enable_bpc:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ * @bpc: Input BPC
+ *
+ * Returns: No. of bytes written or negative error code, in case of failure.
+ */
+int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
+{
+	char buf[20] = {0};
+
+	sprintf(buf, "%d", bpc);
+
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
+}
+
+/*
+ * igt_get_dsc_debugfs_fd:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: fd of the DSC debugfs for the given connector, else returns -1.
+ */
+int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+
+	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
+
+	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
new file mode 100644
index 00000000..291c2cde
--- /dev/null
+++ b/lib/igt_dsc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef IGT_DSC_H
+#define IGT_DSC_H
+
+#include "igt_fb.h"
+
+bool igt_is_dsc_supported(int drmfd, char *connector_name);
+bool igt_is_fec_supported(int drmfd, char *connector_name);
+bool igt_is_dsc_enabled(int drmfd, char *connector_name);
+bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
+int igt_force_dsc_enable(int drmfd, char *connector_name);
+int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
+int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
+
+#endif
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b4a98ae1..31e6dfda 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5564,133 +5564,6 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
-static
-bool check_dsc_debugfs(int drmfd, char *connector_name,
-		       const char *check_str)
-{
-	char file_name[128] = {0};
-	char buf[512];
-
-	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
-
-	igt_debugfs_read(drmfd, file_name, buf);
-
-	return strstr(buf, check_str);
-}
-
-static
-int write_dsc_debugfs(int drmfd, char *connector_name,
-		      const char *file_name,
-		      const char *write_buf)
-{
-	int debugfs_fd = igt_debugfs_dir(drmfd);
-	int len = strlen(write_buf);
-	int ret;
-	char file_path[128] = {0};
-
-	sprintf(file_path, "%s/%s", connector_name, file_name);
-
-	ret = igt_sysfs_write(debugfs_fd, file_path, write_buf, len);
-
-	close(debugfs_fd);
-
-	return ret;
-}
-
-/*
- * igt_is_dsc_supported:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- *
- * Returns: True if DSC is supported for the given connector, false otherwise.
- */
-bool igt_is_dsc_supported(int drmfd, char *connector_name)
-{
-	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
-}
-
-/*
- * igt_is_fec_supported:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- *
- * Returns: True if FEC is supported for the given connector, false otherwise.
- */
-bool igt_is_fec_supported(int drmfd, char *connector_name)
-{
-	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
-}
-
-/*
- * igt_is_dsc_enabled:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- *
- * Returns: True if DSC is enabled for the given connector, false otherwise.
- */
-bool igt_is_dsc_enabled(int drmfd, char *connector_name)
-{
-	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
-}
-
-/*
- * igt_is_force_dsc_enabled:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- *
- * Returns: True if DSC is force enabled (via debugfs) for the given connector,
- * false otherwise.
- */
-bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
-{
-	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
-}
-
-/*
- * igt_force_dsc_enable:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- *
- * Returns: 1 on success or negative error code, in case of failure.
- */
-int igt_force_dsc_enable(int drmfd, char *connector_name)
-{
-	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
-}
-
-/*
- * igt_force_dsc_enable_bpc:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- * @bpc: Input BPC
- *
- * Returns: No. of bytes written or negative error code, in case of failure.
- */
-int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
-{
-	char buf[20] = {0};
-
-	sprintf(buf, "%d", bpc);
-
-	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
-}
-
-/*
- * igt_get_dsc_debugfs_fd:
- * @drmfd: A drm file descriptor
- * @connector_name: Name of the libdrm connector we're going to use
- *
- * Returns: fd of the DSC debugfs for the given connector, else returns -1.
- */
-int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
-{
-	char file_name[128] = {0};
-
-	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
-
-	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
-}
-
 /*
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7a00d204..be5482e0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -974,16 +974,6 @@ void igt_require_pipe(igt_display_t *display,
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
-
-bool igt_is_dsc_supported(int drmfd, char *connector_name);
-bool igt_is_fec_supported(int drmfd, char *connector_name);
-bool igt_is_dsc_enabled(int drmfd, char *connector_name);
-bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
-int igt_force_dsc_enable(int drmfd, char *connector_name);
-int igt_force_dsc_enable_bpc(int drmfd, char *connector_name,
-			     int bpc);
-int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
-
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
diff --git a/lib/meson.build b/lib/meson.build
index cc784686..4e5b08bc 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -96,6 +96,7 @@ lib_sources = [
 	'igt_infoframe.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
+	'igt_dsc.c',
 ]
 
 lib_deps = [
-- 
2.25.1
