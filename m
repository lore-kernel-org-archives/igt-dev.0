Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7C010E3B7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 08:20:07 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 13:41:29 +0530
Message-Id: <20230912081129.6809-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230907192236.76147-1-mohammed.thasleem@intel.com>
References: <20230907192236.76147-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Add helper to turn on and off
 the displays
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

This helper will turn on and off the displays with the help of
IGT_CRTC_ACTIVE properties set to ON and OFF.

v2: Use IGT_CRTC_ACTIVE for displays On/Off.
v3: -Update commit message and helper names.
    -Update display on and off helpers.
v4: Remove redundant code. (Bhanu)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 57 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c2f3728a6..b9cb6aa85 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6083,3 +6083,57 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
 
 	return connector_id;
 }
+
+/*
+ * igt_turn_on_display:
+ * @fd: A drm file descriptor
+ *
+ * It will Enable the all connected display.
+ */
+void igt_turn_on_display(int drm_fd)
+{
+	igt_display_t display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	if (!drmModeGetResources(drm_fd))
+		return;
+
+	igt_display_require(&display, drm_fd);
+	igt_display_reset(&display);
+
+	for_each_pipe(&display, pipe) {
+		for_each_valid_output_on_pipe(&display, pipe, output) {
+			if (output->pending_pipe != PIPE_NONE)
+				continue;
+
+			igt_output_set_pipe(output, pipe);
+			break;
+		}
+	}
+
+	igt_display_commit2(&display, COMMIT_ATOMIC);
+
+	igt_display_fini(&display);
+}
+
+/*
+ * igt_turn_off_display:
+ * @fd: A drm file descriptor
+ *
+ * It will disable  the all connected display.
+ */
+void igt_turn_off_display(int drm_fd)
+{
+	igt_display_t display;
+
+	if (!drmModeGetResources(drm_fd))
+		return;
+
+	igt_display_require(&display, drm_fd);
+	igt_display_reset(&display);
+
+	igt_display_commit2(&display, COMMIT_ATOMIC);
+
+	igt_display_fini(&display);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f2c3741fc..526477e4d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1016,4 +1016,7 @@ bool i915_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 
+void igt_turn_on_display(int drm_fd);
+void igt_turn_off_display(int drm_fd);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
