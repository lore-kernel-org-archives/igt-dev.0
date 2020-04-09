Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720106EB47
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2020 05:49:56 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu,  9 Apr 2020 11:09:48 +0530
Message-Id: <20200409053951.26929-3-anshuman.gupta@intel.com>
In-Reply-To: <20200409053951.26929-1-anshuman.gupta@intel.com>
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 2/5] lib/igt_pm: Add lib func to get lpsp
 capability
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
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This lib function evaluate the lpsp capability from
the connector specific debugfs attribute i915_lpsp_info.

v2:
- changed the lib function prefix igt_output_is_lpsp_capable
  to i915_output_is_lpsp_capable. [Martin]
v3:
- early return for the connector which doesn't support
  lpsp on any platform.
v4:
- debugfs entry changed from i915_lpsp_info to i915_lpsp_capability.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_pm.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 9d441e1b..3418b69a 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -37,6 +37,7 @@
 #include <dirent.h>
 
 #include "drmtest.h"
+#include "igt_kms.h"
 #include "igt_pm.h"
 #include "igt_aux.h"
 #include "igt_sysfs.h"
@@ -827,3 +828,39 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 
 	return true;
 }
+
+/**
+ * i915_output_is_lpsp_capable:
+ * @drm_fd: fd to drm device
+ * @output: igt output for which lpsp capability need to be evaluated
+ * Check lpsp capability for a given output.
+ *
+ * Returns:
+ * True if given output is lpsp capable otherwise false.
+ */
+bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
+{
+	drmModeConnectorPtr c = output->config.connector;
+	char buf[256];
+	int fd, len;
+
+	/* only eDP/DP/DSI/HDMI can support LPSP */
+	if (c->connector_type != DRM_MODE_CONNECTOR_eDP &&
+	    c->connector_type != DRM_MODE_CONNECTOR_DSI &&
+	    c->connector_type != DRM_MODE_CONNECTOR_DisplayPort &&
+	    c->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+	    c->connector_type != DRM_MODE_CONNECTOR_HDMIB)
+		return false;
+
+	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_require(fd >= 0);
+	len = igt_debugfs_simple_read(fd, "i915_lpsp_capability",
+				      buf, sizeof(buf));
+
+	if (len < 0)
+		igt_assert_eq(len, -ENODEV);
+
+	close(fd);
+
+	return strstr(buf, "LPSP: capable");
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 5e438452..162d3ca3 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -53,5 +53,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void);
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);
 bool igt_pm_dmc_loaded(int debugfs);
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);
+bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output);
 
 #endif /* IGT_PM_H */
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
