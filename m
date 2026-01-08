Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975D0D1D47C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC8210E35D;
	Thu,  8 Jan 2026 15:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byYP6bKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E470010E78D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886101; x=1799422101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1axJDASL4jisE43nreKjDp1X2bydzTDDHfui9/4gWT0=;
 b=byYP6bKr7j2gu6yI5p4VkDOe9ssGwocTJ3UaxqwAlsTugqIg55KJY18k
 8GqJxkGEcg9+XNWyBgGMhQFEC4ZEGZYpUDoAUr87I6TDfQemDUxuZtqLx
 SIWPSaERViCG6Y+vcBuoWFCqiZ5txDCGjdWm7D5OX96prmMFuuTQ1glot
 Pg99XDGSxc1witsTunxW00Kwx4brPA3CQTRvgU3/GPM+O1/ezS+fTFc9V
 TOqCmMqlqMEIbfVbDWQhXYP/Zg4GavU1C2LJJ2ryHgiVQxiJC2svepFxC
 m6Y2W8Ne/zVpBRgVIO2ERCn9UOijYpcckhEzgIKQwu7+tVTAk4r0+UeLx g==;
X-CSE-ConnectionGUID: qgLq7kxPTO+M3ZxrN0vWAw==
X-CSE-MsgGUID: JasrrLCARPqMdvX1pU27JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80374886"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80374886"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:21 -0800
X-CSE-ConnectionGUID: nd+/iLvTRNuNqMEH/NSuYw==
X-CSE-MsgGUID: yhZIQFGcSkK1l1oyjG9Oeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234402893"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:19 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 4/6] tests/kms_writeback: Refactor format handling in
 commit_and_dump_fb
Date: Thu,  8 Jan 2026 21:18:15 +0530
Message-ID: <20260108154817.48665-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108154817.48665-1-sowmiya.s@intel.com>
References: <20260108154817.48665-1-sowmiya.s@intel.com>
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

Modify commit_and_dump_fb to select supported
formats if provided; Apply default format based
on the platform when none are specified.

v4: Add get format function to assign format
    based on vendor type as a default format.
v5: Change function name more descriptive

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index defe43686..be123adcc 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -101,6 +101,13 @@ const uint32_t fourcc[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+static uint32_t get_default_format_by_vendor(igt_display_t *display)
+{
+	if (is_intel_device(display->drm_fd))
+		return DRM_FORMAT_XBGR8888;
+	return DRM_FORMAT_XRGB8888;
+}
+
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode)
 {
@@ -447,7 +454,7 @@ static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t
 }
 
 static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
-			        igt_fb_t *input_fb, drmModeModeInfo *mode)
+				igt_fb_t *input_fb, drmModeModeInfo *mode)
 {
 	cairo_surface_t *fb_surface_out;
 	char filepath_out[PATH_MAX];
@@ -456,12 +463,37 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	char *file_name;
 	unsigned int fb_id;
 	igt_fb_t output_fb;
+	uint32_t format;
 
 	path_name = getenv("IGT_FRAME_DUMP_PATH");
 	file_name = getenv("FRAME_PNG_FILE_NAME");
 
+	if (!data.wb_fmt) {
+		format = get_default_format_by_vendor(display);
+	} else {
+		drmModePropertyBlobRes *formats_blob;
+
+		formats_blob = igt_get_writeback_formats_blob(output);
+		igt_assert_f(formats_blob, "No writeback pixel formats\n");
+		igt_assert(!(formats_blob->length % 4));
+		for (int i = 0; i < formats_blob->length; i++) {
+			format = ((uint32_t *)formats_blob->data)[i];
+			// Skip zero or unknown formats
+			if (format == 0 || strcmp(igt_format_str(format), "invalid") == 0) {
+				format = 0;
+				continue;
+			}
+			igt_debug("Supported writeback format: %s\n", igt_format_str(format));
+			if (format == data.format)
+				break;
+			format = 0;
+		}
+		drmModeFreePropertyBlob(formats_blob);
+	}
+	igt_assert_f(format, "Given format not supported\n");
+
 	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-			      data.wb_fmt ? data.format : DRM_FORMAT_XRGB8888,
+			      format,
 			      igt_fb_mod_to_tiling(0), &output_fb);
 	igt_require(fb_id > 0);
 
@@ -584,7 +616,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
 				      mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      get_default_format_by_vendor(&display),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &input_fb);
 		igt_assert(fb_id >= 0);
-- 
2.43.0

