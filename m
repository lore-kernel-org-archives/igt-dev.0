Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B049C369B1
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 09:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186EC10E8AA;
	Wed, 16 Apr 2025 09:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSNh89Ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2600F10E8AA
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744795896; x=1776331896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u731nChm2fzoQpzHOBbDcfJTKkpQhDHFYGvbmIF7vTQ=;
 b=aSNh89EjwSjWI/rFFbeiXmSvlUJeF/fWWdlCc5IddhWj48W3JgU/7twU
 w1Fn/wkvYLOvj8ACHI29JGGcx4+5EMy0D0lWb/YalhT2b0s8uBM/1Stge
 eZn7KUYcHD9npj/6WoccaAXqsRUyPSXvFZGvuyHf9wyWEm9OBNrA9tnVT
 nUK6LmHD1Qw2pUynH+kEfgoj1gBcrhAT0JTCbL7gur/yFBgRgLnBz0owP
 J4/CbDm3QIKfIqtWOhhdAlkL3/CXQcZUuUOOHqqj/Uw7mfV2qDu9oPjzc
 MAemCtKlSdpZPDiYwaQcxhWg83FxZE25e9tqkesYYvpKMVn5A9cmwFhXp w==;
X-CSE-ConnectionGUID: Q/BaFhjXQ1mw+0sazMz4Rw==
X-CSE-MsgGUID: JrtXAmV0SGCFqr3bHFVmWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68823845"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="68823845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:31:36 -0700
X-CSE-ConnectionGUID: OkgGl8emT/W4EBOgFEwKWA==
X-CSE-MsgGUID: T4mZhZ26Sg22bRAO9zTc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130711845"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:31:33 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST bandwidth
 constraints
Date: Wed, 16 Apr 2025 15:17:18 +0530
Message-Id: <20250416094718.3114024-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Instead of checking only the current modes, find a combination of
modes in the MST topology that can be accommodated within the
available link bandwidth.

v2: move fit_modes_in_bw to lib/igt_kms
v3: update tag from fixes to closes
v4: remove igt_assert from fit_modes_in_bw call.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c                           | 24 ++++++++++++++++++++++++
 lib/igt_kms.h                           |  1 +
 tests/intel/kms_dp_link_training.c      | 24 +-----------------------
 tests/intel/kms_dp_linktrain_fallback.c | 18 +-----------------
 tests/kms_display_modes.c               |  4 ++++
 5 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99c8707c7..f8274f49a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5046,6 +5046,30 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
 	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, 0);
 }
 
+/*
+ * fit_modes_in_bw :
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Tries atomic TEST_ONLY commit; if it fails, overrides
+ * output modes to fit bandwidth.
+ */
+bool fit_modes_in_bw(igt_display_t *display)
+{
+	bool found;
+	int ret;
+
+	ret = igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (ret != 0) {
+		found = igt_override_all_active_output_modes_to_fit_bw(display);
+		igt_require_f(found,
+			      "No valid mode combo found for modeset\n");
+	}
+
+	return true;
+}
+
 /**
  * igt_pipe_refresh:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0381c82ad..fe01eaf3f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool fit_modes_in_bw(igt_display_t *display);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 9e9b1e6db..9b6248c6f 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
 	}
 }
 
-/*
- * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
- * output modes to fit bandwidth.
- */
-static bool fit_modes_in_bw(data_t *data)
-{
-	int ret;
-
-	ret = igt_display_try_commit_atomic(&data->display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET,
-					    NULL);
-	if (ret != 0) {
-		bool found;
-
-		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
-		igt_require_f(found, "No valid mode combo found for modeset\n");
-	}
-
-	return true;
-}
-
 static void do_modeset(data_t *data, bool mst)
 {
 	uint32_t master_pipes_mask = 0;
@@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
 						  "Unable to assign pipes for outputs\n");
 
 	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
-	fit_modes_in_bw(data);
+	fit_modes_in_bw(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 6a872efd2..64f21ec6f 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *data, igt_output_t *outputs[]
 							  DRM_MODE_LINK_STATUS_GOOD);
 }
 
-static bool fit_modes_in_bw(data_t *data)
-{
-	bool found;
-	int ret;
-
-	ret = igt_display_try_commit_atomic(&data->display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (ret != 0) {
-		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
-		igt_require_f(found,
-			      "No valid mode combo found for modeset\n");
-	}
-	return true;
-}
-
 static bool validate_modeset_for_outputs(data_t *data,
 					igt_output_t *outputs[],
 					int *output_count,
@@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data,
 {
 	igt_require_f(*output_count > 0, "Require at least 1 output\n");
 	setup_pipe_on_outputs(data, outputs, output_count);
-	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
+	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes in bw\n");
 	setup_modeset_on_outputs(data, outputs,
 				 output_count,
 				 mode, fb, primary);
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 588820170..ccfdce0bd 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
 	mode[0] = igt_output_get_mode(output1);
 	mode[1] = igt_output_get_mode(output2);
 
+	fit_modes_in_bw(display);
+
 	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
 	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 
+	fit_modes_in_bw(display);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
@@ -158,6 +161,7 @@ static void run_extendedmode_basic(data_t *data,
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
 	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	fit_modes_in_bw(display);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	/*Compare CRC*/
-- 
2.25.1

