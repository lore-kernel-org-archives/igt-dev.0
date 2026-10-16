Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EDBCC6B2D
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 05:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D5710E10C;
	Fri, 16 Oct 2026 05:23:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D9B10E1A7
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792128176; x=1823664176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wXbLS0ZnY5UnTouSgA8bei9zOGFbFmwqU2DvavEHQe0=;
 b=KLKSoxv8wf2MpfQpxvDfEaqMWnetrNapZHfA1saM95uU4r5Zv8FDf2Hu
 +zy025DbUZsNDjBEVOU66GiZB2rsTRdsELDKhULJSTYO57UfUL8ZaNv1P
 31EgU6TekAvyE7/hLIyW9R7CVMaii3pvSmmcd7EseEnjAyRuvpqnC8377
 HJvBI5sxGoV15ULPl7nst3Z7ljN31fTeeXXuP6oMxoX54txwUg34CKtlx
 33Vog83txrPHuiu3rSqif4pX3kpSkHcq+w/kYxCZDyvqzSnztUTRdLSZb
 kQ34xZFRBT/VKco/MGVhUxu35mM0D2IlHmSiBM62OXL7PYwLLQkJ/g/Qv g==;
X-CSE-ConnectionGUID: oOk5bLn8TbWx0Ndzmwo8LA==
X-CSE-MsgGUID: qA2Jmgi+Rgus8kmd6FgB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="910529"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="910529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 22:22:55 -0700
X-CSE-ConnectionGUID: GfGMqq+tScqxJZSeL1T+GA==
X-CSE-MsgGUID: +EPwPrgJT5+K5T1cDA52hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1961106"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 22:22:54 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Use a smaller fb on simulation
Date: Fri, 16 Oct 2026 10:52:43 +0530
Message-ID: <20261016052243.633897-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

The test creates, fills and copies full-screen fbs with
the GPU, which is too slow on simulation, and test hits
timeout.

When running in simulation, limit the fbs to 1024x768.
The CRC still covers the whole pipe, and the reference
and test frames have the same layout.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dirtyfb.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 48fcb6c61..4674bd2c8 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -50,11 +50,15 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
 #endif
 
+#define SIM_FB_WIDTH   1024
+#define SIM_FB_HEIGHT  768
+
 typedef struct {
 	int drm_fd, devid;
 	int debugfs_fd;
 	igt_display_t display;
 	drmModeModeInfo *mode;
+	int fb_width, fb_height;
 	uint64_t modifier;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
@@ -106,10 +110,10 @@ static bool check_support(data_t *data)
 		}
 
 		if (!intel_fbc_plane_size_supported(&data->display,
-						    data->mode->hdisplay,
-						    data->mode->vdisplay)) {
+						    data->fb_width,
+						    data->fb_height)) {
 			igt_info("Plane size (%d, %d) not supported as per FBC size restrictions\n",
-				 data->mode->hdisplay, data->mode->vdisplay);
+				 data->fb_width, data->fb_height);
 			return false;
 		}
 		return true;
@@ -234,8 +238,8 @@ static void prepare(data_t *data)
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
-			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, data->fb_width,
+			    data->fb_height, DRM_FORMAT_XRGB8888,
 			    data->modifier, 0.0, 1.0, 0.0,
 			    &data->fbs[0]);
 
@@ -256,8 +260,8 @@ static void prepare(data_t *data)
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
 
-	igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,
-			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, data->fb_width,
+			    data->fb_height, DRM_FORMAT_XRGB8888,
 			    data->modifier, 0.0, 1.0, 0.0,
 			    &data->fbs[1]);
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
@@ -265,8 +269,8 @@ static void prepare(data_t *data)
 			 0, 0, data->fbs[1].width,
 			 data->fbs[1].height, 0xFF);
 
-	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
-			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, data->fb_width,
+			    data->fb_height, DRM_FORMAT_XRGB8888,
 			    data->modifier, 0.0, 1.0, 0.0,
 			    &data->fbs[2]);
 
@@ -382,6 +386,14 @@ int igt_main()
 							      crtc,
 							      data.output) {
 					data.mode = igt_output_get_mode(data.output);
+					data.fb_width = data.mode->hdisplay;
+					data.fb_height = data.mode->vdisplay;
+					if (igt_run_in_simulation()) {
+						data.fb_width = min_t(int, data.fb_width,
+								      SIM_FB_WIDTH);
+						data.fb_height = min_t(int, data.fb_height,
+								       SIM_FB_HEIGHT);
+					}
 
 					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
 						       "FBC isn't supported on BMG\n");
-- 
2.53.0

