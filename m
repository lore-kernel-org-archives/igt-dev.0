Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A247CFD346
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EE610E321;
	Mon, 24 Nov 2025 18:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klnSnmtR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5064B10E321
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764008909; x=1795544909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2RGy0mn0NfaehRd6idYESBS0rBgUUR5EOELrDlqT1sw=;
 b=klnSnmtR55GjylyT9g5OZaptk2mqm31ARdq4K/1VTwahw2n+dpEmlUfS
 Kd8Txg3AKWYQNXRXTEk2tJWDmRoT0Kb8DzuH5jb6jxdQCm2dTQCkfePpm
 a/1PfAPlk1z7CIMt1aHuccwwE9jqA9S6oashHsMzC6j0IloLZhXykRamf
 po3pBDZTQvUu8gE9BR2pqmkn1lIup1lr+FXudd4hUiYSCDYFGy7RiR/8T
 vatk3kX6xmSfRmYZ6g3aUMUEfIs06GIcqdDnumJVX3rtle6roseMGgCfh
 +bctfPoY2WMbeSglaiCGO9COgJ4Up1uvD4atjXi+kOmKAKvMiqkalkEnv Q==;
X-CSE-ConnectionGUID: dzSZGxloTmu4F+3NnAPD2w==
X-CSE-MsgGUID: ZDMtfHqfRtKrNNHmvaXt7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66055381"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66055381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:28:29 -0800
X-CSE-ConnectionGUID: fr6XG+NJQPm7zPEjjz8wog==
X-CSE-MsgGUID: Jnrm5D0ETp+o/ZRLsMGWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="215747190"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:28:29 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	suraj.kandpal@intel.com
Subject: [PATCH i-g-t 3/6] lib/igt_kms: add helpers for connector type
Date: Mon, 24 Nov 2025 23:57:53 +0530
Message-ID: <20251124182804.2095722-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124182804.2095722-1-jeevan.b@intel.com>
References: <20251124182804.2095722-1-jeevan.b@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

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
index 8973ffdb2..c03cfed09 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3501,22 +3501,70 @@ igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
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
@@ -3543,7 +3591,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 			uint32_t pipe_mask = output->config.valid_crtc_idx_mask & full_pipe_mask;
 			bool found = false;
 
-			if (output_is_internal_panel(output)) {
+			if (igt_output_is_internal_panel(output)) {
 				/*
 				 * Internal panel should be assigned to pipe A
 				 * if possible, so make sure they're enumerated
@@ -3571,7 +3619,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 					    * Overwrite internal panel if not assigned,
 					    * external outputs are faster to do modesets
 					    */
-					   output_is_internal_panel(chosen_outputs[j]))
+					   igt_output_is_internal_panel(chosen_outputs[j]))
 					chosen_outputs[j] = output;
 			}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f7ff0b17e..cd9f6840a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -578,7 +578,14 @@ igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
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
index 419afe4dd..f97fc000d 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1225,11 +1225,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
index 40187275b..3a931ac9e 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -734,7 +734,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
+		if ((flags & TEST_BRIGHTNESS) && !igt_output_is_internal_panel(output)) {
 			igt_info("%s: Can't run brightness test on non-internal panel.\n",
 				 igt_output_name(output));
 			continue;
-- 
2.43.0

