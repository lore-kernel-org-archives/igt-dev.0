Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C011BA59
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 23:20:50 +0000 (UTC)
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Jul 2022 16:20:31 -0700
Message-ID: <20220728232033.589-2-quic_rohiiyer@quicinc.com>
In-Reply-To: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
References: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v4 1/3] lib/igt_kms: Add helper to parse
 mode string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add helper method to parse a mode string and verify
correct number of arguments. This standardizes parsing mode strings.

Changes made in V4:
 - Corrected documentation
 - Changed *mode_string to a const char from char

Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 14064614..c17c10ea 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5777,3 +5777,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 	return true;
 }
+
+/**
+ * igt_parse_mode_string:
+ * @mode_string: modeline string
+ * @mode: a pointer to a drm mode structure
+ *
+ * Parse mode string and populate mode
+ *
+ * Format: <clock(MHz)>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,<vdisp>,<vsync-start>,
+ * <vsync-end>,<vtotal>
+ *
+ * Returns: true if the correct number of arguments are entered, else false.
+ */
+bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
+{
+	float force_clock;
+
+	if (sscanf(mode_string, "%f,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu",
+	   &force_clock, &mode->hdisplay, &mode->hsync_start, &mode->hsync_end, &mode->htotal,
+	   &mode->vdisplay, &mode->vsync_start, &mode->vsync_end, &mode->vtotal) != 9)
+		return false;
+
+	mode->clock = force_clock * 1000;
+
+	return true;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5856a4b3..a2cf0937 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -974,5 +974,6 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 bool igt_check_bigjoiner_support(igt_display_t *display);
+bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.31.0
