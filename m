Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767BCCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10710F498;
	Fri, 15 May 2026 08:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0IOmMsa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DEE10F498
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778835343; x=1810371343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I7QRqtFk+bYvz7wv7rSuZi+Q7aMl3AnBi4cn7XIugLE=;
 b=L0IOmMsa4rqqjXXmfeH6V8BS6by6lFxhkSD3ERzeEdusSeHxYc+WB6jm
 3L1Fz5CGDb7KURJtYAAg4xM0LBmguWnhLtKByBDSSoior8t1+H+ZMAjel
 3eHc0hp5LWxuvvHq6SzwhlPpyiEWjqcpL3RkgWVU7J+llFzG2HWcYFuad
 bu3KVhJgK4vIqoPn42JIqRkC4+8j5Oc6L0zJ/PlFh0j1TkTcTz0/K5Gii
 Q+oVdwJVaF3vXBUc2a6cbrx1diVKlGoPMFt3KTpv3i34gmeXDjD+O4gp1
 3kYJC5IxxCPlyDVZeNxcgSDhD8B9xnvn+LBi16GnbS+uJcJH3v5llVeGY A==;
X-CSE-ConnectionGUID: Q1FWs9EfR9m2O//kktqcog==
X-CSE-MsgGUID: T6fA0F+CQYK1T17ROg32pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102463710"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="102463710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:55:43 -0700
X-CSE-ConnectionGUID: SKA87FXeSJeCzfO5EPXaoA==
X-CSE-MsgGUID: FaIarQtQQU+bWAo7cvhvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="262159772"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:55:40 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/3] Revert "tests/kms_content_protection: Add FB
 cleanup for MST tests"
Date: Fri, 15 May 2026 14:19:33 +0530
Message-Id: <20260515084935.697125-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515084935.697125-1-santhosh.reddy.guddati@intel.com>
References: <20260515084935.697125-1-santhosh.reddy.guddati@intel.com>
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

This reverts commit b4036b1a0f1944b6149e479629ef0b10ec9bd520.

The MST subtests are skipping when subtests are executed with "--r
dp-mst*" , as the MST changes introduced did not clean up properly
across subtests.

v2: Add commit message explaining revert (Jani)

cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
cc: Fei Shao <fshao@chromium.org>
cc: Manasi Navare <navaremanasi@google.com>
cc: Suraj Kandpal <suraj.kandpal@intel.com>
cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 44 +++-------------------------------
 1 file changed, 3 insertions(+), 41 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 36879c192..cddb0b6da 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -945,33 +945,9 @@ test_content_protection_mst(int content_type)
 		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
-		/* Detach planes before removing framebuffers */
-		for (count = 0; count < valid_outputs; count++) {
-			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
-			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
-		}
-		igt_display_commit2(display, COMMIT_ATOMIC);
-
-		/* Need to re-prepare after mode override */
-		for (count = 0; count < valid_outputs; count++) {
-			drmModeModeInfo *mode;
-
-			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
-
-			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
-			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
-
-			mode = igt_output_get_mode(hdcp_mst_output[count]);
-
-			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
-					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
-			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
-					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
+		for (count = 0; count < valid_outputs; count++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
 
-			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
-		}
 		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
 	}
@@ -997,9 +973,8 @@ test_content_protection_mst(int content_type)
 	/*
 	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
 	 */
-	crtc = igt_output_get_driving_crtc(hdcp_mst_output[0]);
 	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
-	test_cp_disable(hdcp_mst_output[0], crtc, COMMIT_ATOMIC);
+	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
 
 	/* CP is expected to be still enabled on other outputs*/
 	for (i = 1; i < valid_outputs; i++) {
@@ -1010,19 +985,6 @@ test_content_protection_mst(int content_type)
 
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
-
-	/* Detach planes before removing framebuffers */
-	for (count = 0; count < valid_outputs; count++) {
-		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
-		prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
-	}
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	for (count = 0; count < valid_outputs; count++) {
-		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
-		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
-		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
-	}
 }
 
 
-- 
2.34.1

