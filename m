Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42910F6B0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 06:54:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Date: Fri,  8 Apr 2022 12:21:40 +0530
Message-Id: <20220408065143.1485069-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
References: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/4] lib/igt_kms: Add helper functions to read few
 debugfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add helper functions:
    - Read maximum bpc from connector debugfs
    - Read Current bpc from crtc debugfs
    - Assert if Current & Requested bpc are not equal

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  5 +++
 2 files changed, 89 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7838ff28..8161d2e1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5379,3 +5379,87 @@ int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
+/*
+ * igt_get_output_max_bpc:
+ * @drmfd: A drm file descriptor
+ * @output_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: The maximum bpc from the connector debugfs.
+ */
+unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name)
+{
+	char buf[24];
+	char *start_loc;
+	int fd, res;
+	unsigned int maximum;
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
+	igt_require(res > 0);
+
+	close(fd);
+
+	igt_assert(start_loc = strstr(buf, "Maximum: "));
+	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
+
+	return maximum;
+}
+
+/*
+ * igt_get_pipe_current_bpc:
+ * @drmfd: A drm file descriptor
+ * @pipe: Display pipe
+ *
+ * Returns: The current bpc from the crtc debugfs.
+ */
+unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
+{
+	char buf[24];
+	char debugfs_name[24];
+	char *start_loc;
+	int fd, res;
+	unsigned int current;
+
+	fd = igt_debugfs_pipe_dir(drmfd, pipe, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	if (is_i915_device(drmfd))
+		strcpy(debugfs_name, "i915_current_bpc");
+	else if (is_amdgpu_device(drmfd))
+		strcpy(debugfs_name, "amdgpu_current_bpc");
+
+	res = igt_debugfs_simple_read(fd, debugfs_name, buf, sizeof(buf));
+	igt_require(res > 0);
+
+	close(fd);
+
+	igt_assert(start_loc = strstr(buf, "Current: "));
+	igt_assert_eq(sscanf(start_loc, "Current: %u", &current), 1);
+
+	return current;
+}
+
+/*
+ * igt_assert_output_bpc_equal:
+ * @drmfd: A drm file descriptor
+ * @pipe: Display pipe
+ * @output_name: Name of the libdrm connector we're going to use
+ * @bpc: BPC to compare with max & current bpc
+ *
+ * Returns: True if crtc has the correct requested bpc, else False.
+ */
+void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
+				 char *output_name, unsigned int bpc)
+{
+	unsigned int maximum = igt_get_output_max_bpc(drmfd, output_name);
+	unsigned int current = igt_get_pipe_current_bpc(drmfd, pipe);
+
+	igt_require_f(maximum >= bpc,
+		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
+		      maximum);
+
+	igt_assert_eq(current, bpc);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e..aca541d8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -948,4 +948,9 @@ int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
 				int bpp);
 int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
 
+unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
+unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
+void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
+				char *output_name, unsigned int bpc);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.35.1
