Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C60CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CE410F498;
	Fri, 15 May 2026 08:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="max6C9N1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE7410F498
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778835348; x=1810371348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSR1aJ5CI2FNrpjoP1jxB91spFbDyUonl8OaR4XIyKA=;
 b=max6C9N1eUb4WhQtwyjSfQaB3gsmEtITYi3jtTpBPgkSG3jjR8/elpSH
 gSVaSLscOqaZX79J6+nhXSaEJzlVjO7Hd1/M5Gv3I4xN1WAvcg7irQYMh
 BxM6H5ELRWTLAwV3pmQ8JZmpbpCg6pQRYEt6p2zFqJxUu6FwgSII9fWxb
 EprMIoya0F8f0Fc0Qx9mF+lLL3wpYZlwBHTxM73EYnPhxtugzC0hpJn2q
 NwQagX58rmdTeH1ely2a6ZHdK2ujCN9eJW91SjTkPG0ftTE0Ib5vtDNUn
 8wYY6ZyIisHjEKpEvEfyfBlGFzu7BU8rClGcvW75OVNb6jyglQwnPD+rZ w==;
X-CSE-ConnectionGUID: B5e79M43QxuEBLjG5cjJag==
X-CSE-MsgGUID: wPq5XUedSWiPNDlo9hwXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102463721"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="102463721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:55:48 -0700
X-CSE-ConnectionGUID: 3PbOvMN2Rae41eTIY3GItQ==
X-CSE-MsgGUID: Pc34n2i4RJmNuEulE2JqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="262159783"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:55:45 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 3/3] Revert "tests/kms_content_protection: Add
 per-CRTC framebuffer infrastructure"
Date: Fri, 15 May 2026 14:19:35 +0530
Message-Id: <20260515084935.697125-4-santhosh.reddy.guddati@intel.com>
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

This reverts commit 925b14d430a42386e5d33a4be36ef84161ec9b80.

The per-CRTC fb introduced in the commits caused regression especially
when the eDP panel is connected with 2 4k Panels connected through a
DP-MST hub with "-ENOSPC" and all the content protection tests are
failing.

The create_fbs() now iterated through all crtcs and eDP (2k) claims the 
first crtc before the larger output and fb is created with smaller size.
Later when DP-4 maps to the smae CRTC (it has differnt fb dimensions
now 2k fb than the mode required), the kernel rejects the commits 
with ENOSPC because of invalid coordinates.

V2: Update commit message explaining revert (Jani)

cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
cc: Fei Shao <fshao@chromium.org>
cc: Manasi Navare <navaremanasi@google.com>
cc: Suraj Kandpal <suraj.kandpal@intel.com>
cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 50 +++++++++-------------------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 47ccf61d7..c59441f11 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -107,15 +107,10 @@
 
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
 
-struct hdcp_test_fbs {
-	struct igt_fb red;
-	struct igt_fb green;
-};
-
 struct data {
 	int drm_fd;
 	igt_display_t display;
-	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
+	struct igt_fb red, green;
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
 	bool is_force_hdcp14;
@@ -996,49 +991,31 @@ static void test_content_protection_cleanup(void)
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
 		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
+
+	igt_remove_fb(data.drm_fd, &data.red);
+	igt_remove_fb(data.drm_fd, &data.green);
 }
 
 static void create_fbs(void)
 {
+	uint16_t width = 0, height = 0;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
-	igt_crtc_t *crtc;
 
-	/* Create framebuffers for each connected output's pipe */
 	for_each_connected_output(&data.display, output) {
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		/* Find a valid crtc for this output */
-		for_each_crtc(&data.display, crtc) {
-			if (!igt_crtc_connector_valid(crtc, output))
-				continue;
-
-			/* Skip if already created for this crtc */
-			if (data.fbs[crtc->crtc_index].red.fb_id)
-				continue;
-
-			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
-					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
-			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
-					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
-			break;
-		}
+		width = max(width, mode->hdisplay);
+		height = max(height, mode->vdisplay);
 	}
-}
 
-static void remove_fbs(void)
-{
-	igt_crtc_t *crtc;
-
-	for_each_crtc(&data.display, crtc) {
-		if (data.fbs[crtc->crtc_index].red.fb_id)
-			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
-		if (data.fbs[crtc->crtc_index].green.fb_id)
-			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
-	}
+	igt_create_color_fb(data.drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.f, 0.f, 0.f, &data.red);
+	igt_create_color_fb(data.drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.f, 1.f, 0.f, &data.green);
 }
 
 static const struct {
@@ -1264,7 +1241,6 @@ int igt_main()
 
 	igt_fixture() {
 		test_content_protection_cleanup();
-		remove_fbs();
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.34.1

