Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AC810E1E1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 09:40:01 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 15:02:01 +0530
Message-Id: <20230807093201.70650-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230718110852.2965553-2-anshuman.gupta@intel.com>
References: <20230718110852.2965553-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 3/3] lib/igt_kms: Add helper with DPMS to turn
 on and off the displays
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

This helper will turn on and off the displays with the help of DPMS
properties set to ON and OFF.

v2: Use IGT_CRTC_ACTIVE for displays On/Off.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f2b0eed57..97283d55e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6029,3 +6029,53 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
 	 */
 	return igt_check_bigjoiner_support(display);
 }
+
+void igt_dpms_turn_on_display(int drm_fd)
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
+	for_each_connected_output(&display, output) {
+		for_each_pipe(&display, pipe) {
+			igt_display_reset(&display);
+			igt_output_set_pipe(output, pipe);
+			igt_pipe_set_prop_value(&display, pipe, IGT_CRTC_ACTIVE, 1);
+		}
+	}
+
+	igt_display_commit2(&display, COMMIT_ATOMIC);
+
+	igt_display_fini(&display);
+}
+
+void igt_dpms_turn_off_display(int drm_fd)
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
+	for_each_connected_output(&display, output) {
+		for_each_pipe(&display, pipe) {
+			igt_display_reset(&display);
+			igt_output_set_pipe(output, pipe);
+			igt_pipe_set_prop_value(&display, pipe, IGT_CRTC_ACTIVE, 0);
+		}
+	}
+
+	igt_display_commit2(&display, COMMIT_ATOMIC);
+
+	igt_display_fini(&display);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1b6988c17..32d20d683 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1005,4 +1005,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
 
+void igt_dpms_turn_on_display(int drm_fd);
+void igt_dpms_turn_off_display(int drm_fd);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
