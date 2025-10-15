Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6ADCCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCCC10E770;
	Wed, 15 Oct 2025 10:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZS7AY+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC8F10E770
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522537; x=1792058537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rg27RQQ49LfA6lvXMMh+wMxfeSqaMm4yRxB90BMTRD0=;
 b=PZS7AY+6ZpEcjc5dqDUOmLR4k224UNR1xxW6zvCE2XM8XYRV1sa0Ye9z
 v2p2MhpR3OxvYe7ywXoo+mhIkb6T8LLgqErYOqkucLLWNCE6edsVkxW6l
 NlbEhKfhl0OTAMjALdbmZYi1X8y3ZUw/+e5yJAsW8587vQwy3LWKVPxmY
 63Yy6Gh9KSPv/Xb7i5gvW2OWFkkSoHw7uV0WgVWbmT5g5GN42vQL5ZjZp
 NyzpM/NxM0SnG52TNHRzsqPjHEc/GGTsuIt8pjy/moc0/5SHPzdZzA65H
 uenbqH+SrBRLSMOVAaVAc7cJFSffNueNyU4133TNIzBd7sabbKOJDwzzT Q==;
X-CSE-ConnectionGUID: QXMNok2tS2yYTSNPIJJJpQ==
X-CSE-MsgGUID: 1M6S9UTGTHGOopLX6Ta/nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62590181"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62590181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:02:17 -0700
X-CSE-ConnectionGUID: ymv+518mS724ZgzPRYshYA==
X-CSE-MsgGUID: Ee9laMDTT7SP0QMB3VUyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205835581"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:02:15 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_kms: add helpers for connector type
Date: Wed, 15 Oct 2025 15:47:56 +0530
Message-Id: <20251015101759.3982477-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015101759.3982477-1-kunal1.joshi@intel.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Introduce helpers for checking output
connector type, reuse same mechanism for
output_is_internal_panel.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c                  | 74 ++++++++++++++++++++++++++++------
 lib/igt_kms.h                  |  9 ++++-
 tests/intel/kms_dsc_helper.c   |  2 +-
 tests/intel/kms_pm_backlight.c |  2 +-
 tests/kms_atomic_transition.c  |  4 +-
 tests/kms_hdr.c                |  2 +-
 6 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index eab4cb92f..f29778f2d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3479,22 +3479,70 @@ igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
 }
 
 /**
- * output_is_internal_panel:
+ * igt_output_type_in_mask - test connector type membership
+ * @output: output (may be NULL)
+ * @mask: bitmask where bit N corresponds to DRM_MODE_CONNECTOR_* value N
+ *
+ * Returns: true if @output has a connector and its connector_type bit is set
+ * in @mask. Safe for DRM_MODE_CONNECTOR_Unknown (0). If @output or its
+ * connector is NULL, returns false.
+ */
+bool igt_output_type_in_mask(igt_output_t *output, uint64_t mask)
+{
+	unsigned int type;
+
+	if (!output || !output->config.connector)
+		return false;
+
+	type = output->config.connector->connector_type;
+
+	return (mask & CONNECTOR_TYPE_BIT(type)) != 0;
+}
+
+/**
+ * igt_output_is_dp_family - classify DP/eDP as DP family
+ * @output: output
+ *
+ * Returns: true if @output is DisplayPort or eDP.
+ */
+bool igt_output_is_dp_family(igt_output_t *output)
+{
+	uint64_t mask =
+		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DisplayPort) |
+		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_eDP);
+
+	return igt_output_type_in_mask(output, mask);
+}
+
+/**
+ * igt_output_is_hdmi - classify HDMI connectors
+ * @output: output
+ *
+ * Returns: true if @output is HDMI (A or B).
+ */
+bool igt_output_is_hdmi(igt_output_t *output)
+{
+	uint64_t mask =
+		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_HDMIA) |
+		CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_HDMIB);
+
+	return igt_output_type_in_mask(output, mask);
+}
+
+/**
+ * igt_output_is_internal_panel:
  * @output: Target output
  *
  * Returns: True if the given @output type is internal else False.
  */
-bool output_is_internal_panel(igt_output_t *output)
+bool igt_output_is_internal_panel(igt_output_t *output)
 {
-	switch (output->config.connector->connector_type) {
-	case DRM_MODE_CONNECTOR_LVDS:
-	case DRM_MODE_CONNECTOR_eDP:
-	case DRM_MODE_CONNECTOR_DSI:
-	case DRM_MODE_CONNECTOR_DPI:
-		return true;
-	default:
-		return false;
-	}
+	uint64_t mask = CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_LVDS) |
+			CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_eDP)  |
+			CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DSI)  |
+			CONNECTOR_TYPE_BIT(DRM_MODE_CONNECTOR_DPI);
+
+	return igt_output_type_in_mask(output, mask);
 }
 
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t **chosen_outputs)
@@ -3521,7 +3569,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 			uint32_t pipe_mask = output->config.valid_crtc_idx_mask & full_pipe_mask;
 			bool found = false;
 
-			if (output_is_internal_panel(output)) {
+			if (igt_output_is_internal_panel(output)) {
 				/*
 				 * Internal panel should be assigned to pipe A
 				 * if possible, so make sure they're enumerated
@@ -3549,7 +3597,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 					    * Overwrite internal panel if not assigned,
 					    * external outputs are faster to do modesets
 					    */
-					   output_is_internal_panel(chosen_outputs[j]))
+					   igt_output_is_internal_panel(chosen_outputs[j]))
 					chosen_outputs[j] = output;
 			}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7121ab985..c8d394ea9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -569,7 +569,14 @@ igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
 int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
 igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
 					   int index);
-bool output_is_internal_panel(igt_output_t *output);
+#ifndef CONNECTOR_TYPE_BIT
+#define CONNECTOR_TYPE_BIT(e) (1ULL << (e))
+#endif
+
+bool igt_output_type_in_mask(igt_output_t *output, uint64_t mask);
+bool igt_output_is_dp_family(igt_output_t *output);
+bool igt_output_is_hdmi(igt_output_t *output);
+bool igt_output_is_internal_panel(igt_output_t *output);
 igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe);
 
 void igt_pipe_request_out_fence(igt_pipe_t *pipe);
diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index cea4304e4..4f23c39af 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -74,7 +74,7 @@ bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output)
 		return false;
 	}
 
-	if (!output_is_internal_panel(output) &&
+	if (!igt_output_is_internal_panel(output) &&
 	    !igt_is_fec_supported(drmfd, output->name)) {
 		igt_info("DSC cannot be enabled without FEC on %s\n",
 			  output->name);
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index a0ecf2b0e..27c31d695 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -239,7 +239,7 @@ igt_main
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
 
 		for_each_connected_output(&display, output) {
-			if (!output_is_internal_panel(output))
+			if (!igt_output_is_internal_panel(output))
 				continue;
 
 			if (found)
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a13830965..8e0ed9d08 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1224,11 +1224,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				 * panels with long power cycle delays.
 				 */
 				if ((transition_tests[i].type == TRANSITION_MODESET) &&
-				    output_is_internal_panel(output))
+				    igt_output_is_internal_panel(output))
 					continue;
 
 				if ((transition_tests[i].type == TRANSITION_MODESET_FAST) &&
-				    !output_is_internal_panel(output))
+				    !igt_output_is_internal_panel(output))
 					continue;
 
 				if (pipe_count == 2 * count && !data.extended)
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index efa5964cf..c1c1663a2 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -730,7 +730,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
+		if ((flags & TEST_BRIGHTNESS) && !igt_output_is_internal_panel(output)) {
 			igt_info("%s: Can't run brightness test on non-internal panel.\n",
 				 igt_output_name(output));
 			continue;
-- 
2.25.1

