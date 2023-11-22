Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7404F10E09D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 17:20:42 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>
Date: Wed, 22 Nov 2023 12:20:33 -0500
Message-ID: <20231122172034.65982-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] [i-g-t] lib/igt_amd: Re-try display_require
 if require output is not valid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add igt_amd_display_require_retry to re-try
igt_display_require.

At entry of each test, display setup is done by
igt_display_require and igt_display_require_output.
igt display require output may not be valid yet,
this will let test be skipped. By re-try
igt_display_require, require output could be valid.
This will fix test case intermittent skip issue.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_amd.c | 19 +++++++++++++++++++
 lib/igt_amd.h | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 247a42f37..c068f07e7 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1298,3 +1298,22 @@ bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm opt
 
 	return res;
 }
+
+/**
+ * is_igt_amd_display_require_output_valid:
+ * @display: A pointer to an #igt_display_t structure
+ *
+ * Checks whether there's a valid @pipe/@output combination for the given @display
+ * Returns: true if a valid combination of @pipe and @output is found, or false
+ * if not found
+ */
+bool is_igt_amd_display_require_output_valid(igt_display_t *display)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+
+	for_each_pipe_with_valid_output(display, pipe, output)
+		return true;
+
+	return false;
+}
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 1e66348ad..529b3beba 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -202,4 +202,20 @@ bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm opt
 void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled);
 void igt_amd_get_subvp_status(int drm_fd, bool *supported, bool *enabled);
 bool igt_amd_output_has_odm_combine_segments(int drm_fd, char *connector_name);
+
+bool is_igt_amd_display_require_output_valid(igt_display_t *display);
+
+#define igt_amd_display_require_retry(display, fd, delay, retry_times) \
+	for (int j__ = 0; j__ < retry_times + 1; j__++) { \
+		igt_display_require(display, fd); \
+		if (is_igt_amd_display_require_output_valid(display)) { \
+			if (j__ > 0) \
+				igt_info("retry times:%d delay:%d seconds\n", j__, delay * j__); \
+			break; \
+		} \
+		if (j__ == retry_times) \
+			igt_skip("No valid crtc/connector combinations found.\n"); \
+		else \
+			sleep(delay); \
+	}
 #endif /* IGT_AMD_H */
-- 
2.25.1
