Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B1D10E31C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 11:09:13 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jul 2023 16:38:50 +0530
Message-Id: <20230718110852.2965553-2-anshuman.gupta@intel.com>
In-Reply-To: <20230718110852.2965553-1-anshuman.gupta@intel.com>
References: <20230718110852.2965553-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/3] lib/igt_kms: Add helper with DPMS to
 turn on and off the displays
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
	Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

This helper will turn on and off the displays with the help of DPMS
properties set to ON and OFF.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c12823d31..b3f048acc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5921,3 +5921,39 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
 	 */
 	return igt_check_bigjoiner_support(display);
 }
+
+void igt_dpms_turn_on_display(int drm_fd)
+{
+	igt_display_t display;
+	igt_output_t *output;
+
+	if (!drmModeGetResources(drm_fd))
+		return;
+
+	igt_display_require(&display, drm_fd);
+
+	for_each_connected_output(&display, output)
+		igt_output_set_prop_value(output, IGT_CONNECTOR_DPMS, DRM_MODE_DPMS_ON);
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
+
+	if (!drmModeGetResources(drm_fd))
+		return;
+
+	igt_display_require(&display, drm_fd);
+
+	for_each_connected_output(&display, output)
+		igt_output_set_prop_value(output, IGT_CONNECTOR_DPMS, DRM_MODE_DPMS_OFF);
+
+	igt_display_commit2(&display, COMMIT_ATOMIC);
+
+	igt_display_fini(&display);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2b9179251..51de4c3b3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -994,4 +994,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
 
+void igt_dpms_turn_on_display(int drm_fd);
+void igt_dpms_turn_off_display(int drm_fd);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
