Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F6CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 09:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76FA10E065;
	Thu, 14 May 2026 09:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+lgDlAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6FE10E065
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778751682; x=1810287682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EITl30lmh4GPNEYMWAKrzPO+gx1Q35Hi/D44g8eitks=;
 b=l+lgDlAhLzSLnVHYN5C1YR9JnWKCfSjJfygZEz7n8qTsFYZnDmSi9bHL
 hYculrGG+RuZFoFl2j38plpayHsPoHtNzXvZxYhRU6HPoYWs3E0qFZ6l8
 NJlvmWEeTBA+JVQwsz7nnoInckKt6Mucfj/GmBncNMWbslX90ChiC3kSw
 KasIXG6mOhPZrrMsrTIY7F86L7Xz8BHG6ks0EwMBwOST1qz3Ja+EZ5IqX
 edipm+9zN/oqwWhjeipYynT5eVQ7w+7MnycdLokY5/AwBVmJjFKmtzIe7
 wUaeXDa6T3r3wEMVo5wBS/R0RoLsFCS7mf9+AyYWXksP5OQAOSBrXw4wj A==;
X-CSE-ConnectionGUID: gbfY6hv1QbyFtppuDsktYA==
X-CSE-MsgGUID: vgDJoBewT6mlMGG0whAMTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83560540"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83560540"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:41:22 -0700
X-CSE-ConnectionGUID: Lg03o9WKTXeydpImwdYAkQ==
X-CSE-MsgGUID: 9ujpgVZQSVSMt+zuP35bLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237475579"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 02:41:19 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 3/3] Revert "tests/kms_content_protection: Add
 per-CRTC framebuffer infrastructure"
Date: Thu, 14 May 2026 15:05:10 +0530
Message-Id: <20260514093510.688396-4-santhosh.reddy.guddati@intel.com>
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

This reverts commit 925b14d430a42386e5d33a4be36ef84161ec9b80.

cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
cc: Fei Shao <fshao@chromium.org>
cc: Manasi Navare <navaremanasi@google.com>
cc: Suraj Kandpal <suraj.kandpal@intel.com>
cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
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

