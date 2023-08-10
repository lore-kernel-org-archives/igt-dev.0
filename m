Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C344B10E555
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 14:53:04 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <stylon.wang@amd.com>,
 <hamza.mahfooz@amd.com>, <sunpeng.li@amd.com>
Date: Thu, 10 Aug 2023 10:52:56 -0400
Message-ID: <20230810145257.88389-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] [i-g-t] lib/igt_kms: Re-try display_require
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

Add igt_display_setup to re-try igt_display_require.

At entry of each test, display setup is done by
igt_display_require and igt_display_require_output.
igt display require output may not be valid yet,
this will let test be skipped. By re-try
igt_display_require, require output could be valid.
This will fix test case intermittent skip issue.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e0959ccff..5506e2eb2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2862,6 +2862,25 @@ void igt_display_require_output(igt_display_t *display)
 	igt_skip("No valid crtc/connector combinations found.\n");
 }
 
+/**
+ * is_igt_display_require_output_valid:
+ * @display: A pointer to an #igt_display_t structure
+ *
+ * Checks whether there's a valid @pipe/@output combination for the given @display
+ * Returns: true if a valid combination of @pipe and @output is found, or false
+ * if not found
+ */
+bool is_igt_display_require_output_valid(igt_display_t *display)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+
+	for_each_pipe_with_valid_output(display, pipe, output)
+		return true;
+
+	return false;
+}
+
 /**
  * igt_display_require_output_on_pipe:
  * @display: A pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 91355c910..350966214 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -485,6 +485,7 @@ int  igt_display_drop_events(igt_display_t *display);
 int  igt_display_get_n_pipes(igt_display_t *display);
 void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
+bool is_igt_display_require_output_valid(igt_display_t *display);
 
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
@@ -722,6 +723,21 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
 		igt_plane_set_prop_changed(plane, prop); \
 	} while (0)
 
+#define IGT_DISPLAY_REQUIRE_OUTPUT_VALID_MAX_RETRY_TIMES 5
+
+#define igt_display_setup(display, fd, delay) \
+	for (int j__ = 0; j__ < IGT_DISPLAY_REQUIRE_OUTPUT_VALID_MAX_RETRY_TIMES; j__++) { \
+		igt_display_require(display, fd); \
+		if (is_igt_display_require_output_valid(display)) { \
+			if (j__ > 0) \
+				igt_info("retry times:%d delay:%d seconds\n", j__, delay * j__); \
+			break; \
+		} \
+		sleep(delay); \
+		if (j__ == IGT_DISPLAY_REQUIRE_OUTPUT_VALID_MAX_RETRY_TIMES - 1) \
+			igt_skip("No valid crtc/connector combinations found.\n"); \
+	}
+
 extern bool igt_plane_try_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
 				    const char *val);
-- 
2.25.1
