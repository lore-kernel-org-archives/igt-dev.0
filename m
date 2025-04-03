Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DF9C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA7B10E004;
	Thu,  3 Apr 2025 10:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmdQKewF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9710E004
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743676675; x=1775212675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p/5OuBwz5MTUiMnnOTHf+Li75in0BPnP2yYk+Qv4IYI=;
 b=nmdQKewFpYzxMJtPLcLrdLqHdG1HN4xBrDKLhXjiWdC/ril4cMql1l4J
 zbQLo/ueNM5tuxDpLRR2m25T9GTIWgn+mcners6bKlw/GEN1oN4d5p/8O
 rDA0Mi/pzjWJi64y5LsgBVl5FjyuDLcdxPmJzydvpUMWhHRaJ0YWHlVKj
 fZ+sWhymjLPmnXlKQ2SPXRjkZunoXf/+gJ0tk355kH8326OLOwCIePkPR
 D2aWqkYELniLMckSPMmABnx355Fqli0/j2wheR1tWbl5t8fsxpCKO8uYd
 NJGFmGm1Ku+S8ojEFjrDXGS0Wy0MWNxl9bUI5a7FqYENwGGqySyISqTjd g==;
X-CSE-ConnectionGUID: gez/e6ljSw69BckjSgGHyQ==
X-CSE-MsgGUID: ahp3/RTWTx6YnvkQOjEYqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45088242"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45088242"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:37:54 -0700
X-CSE-ConnectionGUID: cni6heaSTE21DLqm8xU/aw==
X-CSE-MsgGUID: SXoAPmnqQo232hnpd2yBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131831571"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 03:37:52 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST bandwidth
 constraints
Date: Thu,  3 Apr 2025 16:23:35 +0530
Message-Id: <20250403105335.2034060-1-jeevan.b@intel.com>
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
index 588820170..f2bbfafe2 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
 	mode[0] = igt_output_get_mode(output1);
 	mode[1] = igt_output_get_mode(output2);
 
+	igt_assert(fit_modes_in_bw(display));
+
 	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
 	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 
+	igt_assert(fit_modes_in_bw(display));
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
@@ -158,6 +161,7 @@ static void run_extendedmode_basic(data_t *data,
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
 	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_assert(fit_modes_in_bw(display));
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	/*Compare CRC*/
-- 
2.25.1

