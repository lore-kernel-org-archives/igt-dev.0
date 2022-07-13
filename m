Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C6E10FC8F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 22:23:23 +0000 (UTC)
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Jul 2022 15:22:33 -0700
Message-ID: <20220713222235.11655-2-quic_rohiiyer@quicinc.com>
In-Reply-To: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
References: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1 1/3] lib/igt_kms: Add helper to parse
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

Add helper method to parse a mode string from command line, and verify
correct number of arguments. This standardizes parsing mode strings.

Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d8867f09..6df6658a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5739,3 +5739,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 	return true;
 }
+
+/**
+ * igt_parse_mode_string:
+ * @mode_string: a pointer to the optarg
+ * @mode: a pointer to a drm mode structure
+ *
+ * Parse mode string from command line and populate mode
+ *
+ * Format: <clock(MHz)>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,<vdisp>,<vsync-start>,
+ * <vsync-end>,<vtotal>
+ *
+ * Returns: true if the correct number of arguments are entered, else false.
+ */
+bool igt_parse_mode_string(char *mode_string, drmModeModeInfo *mode)
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
index 4b67708d..8d946a25 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -972,5 +972,6 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 		int (*comparator)(const void *, const void*));
 
 bool igt_check_bigjoiner_support(igt_display_t *display);
+bool igt_parse_mode_string(char *mode_string, drmModeModeInfo *mode);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.31.0
