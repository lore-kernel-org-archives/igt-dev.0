Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103AD10E8B7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 May 2022 14:53:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 petri.latvala@intel.com
Date: Mon,  2 May 2022 20:21:14 +0530
Message-Id: <20220502145114.3188493-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/igt_kms: Add a helper function to check
 Bigjoiner support
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

Create a helper function to check that the system supports the
given crtc/connector mode(s).

Example: Pipe-D won't support Bigjoiner, hence we can't use the
connector modes greater than 5K on Pipe-D

To use this helper, each individual subtest needs to set the
@pipe to a specific @output by igt_output_set_pipe() and call
this helper to check the validity of the combo.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 68 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7838ff28..e277193d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5379,3 +5379,69 @@ int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
+/*
+ * igt_check_bigjoiner_support:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
+ * and check those pipes supports the selected mode(s).
+ *
+ * Example: Pipe-D can't support mode > 5K
+ *
+ * Returns: true if a valid crtc/connector mode combo found, else false
+ */
+bool igt_check_bigjoiner_support(igt_display_t *display)
+{
+	uint8_t i, total_pipes = 0, active_pipes = 0;
+	enum pipe p;
+	struct {
+		enum pipe idx;
+		drmModeModeInfo *mode;
+	} pipes[IGT_MAX_PIPES];
+
+	/* Get total enabled pipes. */
+	for_each_pipe(display, p)
+		total_pipes++;
+
+	/*
+	 * Get list of active pipes those were set by igt_output_set_pipe()
+	 * just before calling this function.
+	 */
+	for (i = 0 ; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+
+		if (output->pending_pipe == PIPE_NONE)
+			continue;
+
+		pipes[active_pipes].idx = output->pending_pipe;
+		pipes[active_pipes].mode = igt_output_get_mode(output);
+		active_pipes++;
+	}
+
+	if (active_pipes)
+		return true;
+
+	/*
+	 * if mode.hdisplay > 5120, then ignore
+	 *  - last crtc in single/multi-connector config
+	 *  - consecutive crtcs in multi-connector config
+	 *
+	 * in multi-connector config ignore if
+	 *  - previous crtc mode.hdisplay > 5120 and
+	 *  - current & previous crtcs are consecutive
+	 */
+	for (i = 0; i < active_pipes; i++) {
+		if (((pipes[i].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
+		     ((pipes[i].idx >= (total_pipes - 1)) ||
+		      ((i < (active_pipes - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
+		    ((i > 0) && (pipes[i - 1].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
+		     (abs(pipes[i].idx - pipes[i - 1].idx) <= 1))) {
+			igt_debug("CRTC/Connector is not possible with selected mode(s).\n");
+
+			return false;
+		}
+	}
+
+	return true;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e..8a14bb3c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -109,6 +109,7 @@ const char *kmstest_connector_status_str(int status);
 const char *kmstest_connector_type_str(int type);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
+#define MAX_HDISPLAY_PER_PIPE 5120
 
 int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
@@ -947,5 +948,6 @@ int igt_force_dsc_enable(int drmfd, drmModeConnector *connector);
 int igt_force_dsc_enable_bpp(int drmfd, drmModeConnector *connector,
 				int bpp);
 int igt_get_dsc_debugfs_fd(int drmfd, drmModeConnector *connector);
+bool igt_check_bigjoiner_support(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.35.1
