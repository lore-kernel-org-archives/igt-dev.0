Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CC9CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 09:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CF910E065;
	Thu, 14 May 2026 09:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsMrkuNu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055C010E065
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778751676; x=1810287676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m/MPuLdMcr1962F18rG6MYfl6g4CZLiI+GnHnxnPlpo=;
 b=hsMrkuNuMx1PKNq+NFevxjfwvyK68qom0ahr9GQga9u4Y7bw9XjcJ0kA
 aOG3Pl0LLYiBeMPUNDL42z85UXD9DJ5KD3fENFBqpB0cqugGAV76zFbiA
 MyZYVRl4iRhTqG9afm1x3e2e+GgUcnVOwvpNFZMtwZ7PG+qJJ6tiu6WIO
 ocvmHr2j4JbvuQned+CPcvLXbYhd7z4DLjAvo4qpmAAuDWDt/+8xg34PP
 KkX3MTmmzJ5o2uRofwIf3xPU67zaVq/HI3gBs5Hv5zHrnHNY3eYwUGjE+
 hzOIU/S+iZfbDj2dGRe5kCd0vbAnD86wJVm8gbNKMHZ5nu0UD0pune4eN g==;
X-CSE-ConnectionGUID: ggCKbnitSiSYKQmhYfjjfQ==
X-CSE-MsgGUID: xGQkk8XDSoK5hovLMLdK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83560530"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83560530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:41:16 -0700
X-CSE-ConnectionGUID: kWSf69wBRT67EwkbIJLzyg==
X-CSE-MsgGUID: 93B6syLGRR6RRIt/xKh1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237475572"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 02:41:13 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/3] Revert "tests/kms_content_protection: Add FB
 cleanup for MST tests"
Date: Thu, 14 May 2026 15:05:08 +0530
Message-Id: <20260514093510.688396-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
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

cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
cc: Fei Shao <fshao@chromium.org>
cc: Manasi Navare <navaremanasi@google.com>
cc: Suraj Kandpal <suraj.kandpal@intel.com>
cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
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

