Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E64DD116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887910E2D5;
	Wed,  3 Dec 2025 09:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LovQESoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37710E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753900; x=1796289900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aL6EIonnOTOhpR5afperOsWzp+4AUMuTVKkJ6NjhC0o=;
 b=LovQESoUexI/1VICMSMCtY2NfYihV10aZj+D1cevDwIgTVzLmaRtDJJP
 XudZgd9sEIttiUJED96dABWMGaHOHS0iCQVn5Wg5GWSCLCc8RtVdZPR6Q
 EZqIk6JsR8BGSqttqhEwvnyiZYWR6wakAkB3NzODDV+njfh28QGSndTNt
 4lfQca8M8buKG+m4uUlnqJN2N7oysD7swsvO1nu0975buxPTeaZ9UNX5x
 BrQRh/5QXBlzTe3KAjW0A/CBMa75cuBIabyJSFbqNh2iZz230d3yITczk
 RKYuesHPRG+74EaPlod2BLHp9+YQxXZJB5tBaQPZQsbeQzuoGh+POzjCV A==;
X-CSE-ConnectionGUID: Lgt11HZoTF6Yhd6TIdjbrg==
X-CSE-MsgGUID: Ut0VXbyATh21Fr2Fallr2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783634"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783634"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:25:00 -0800
X-CSE-ConnectionGUID: SK4R2qHwS/ifx8JUtN+7tw==
X-CSE-MsgGUID: f4ZPb4DwSHeY7g/qSoDGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569607"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:58 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 4/6] tests/kms_writeback: Refactor format handling in
 commit_and_dump_fb
Date: Wed,  3 Dec 2025 15:13:05 +0530
Message-ID: <20251203094307.3187669-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203094307.3187669-1-sowmiya.s@intel.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
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

v4: Add get_format to assign format based on platforms

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 473f6c58c..6725f5ea3 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -101,6 +101,13 @@ const uint32_t fourcc[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+static uint32_t get_format(igt_display_t *display)
+{
+	if (is_intel_device(display->drm_fd))
+		return DRM_FORMAT_XBGR8888;
+	return DRM_FORMAT_XRGB8888;
+}
+
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode)
 {
@@ -446,7 +453,7 @@ static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t
 }
 
 static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
-			        igt_fb_t *input_fb, drmModeModeInfo *mode)
+				igt_fb_t *input_fb, drmModeModeInfo *mode)
 {
 	cairo_surface_t *fb_surface_out;
 	char filepath_out[PATH_MAX];
@@ -455,12 +462,37 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	char *file_name;
 	unsigned int fb_id;
 	igt_fb_t output_fb;
+	uint32_t format;
 
 	path_name = getenv("IGT_FRAME_DUMP_PATH");
 	file_name = getenv("FRAME_PNG_FILE_NAME");
 
+	if (!data.wb_fmt) {
+		format = get_format(display);
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
 
@@ -583,7 +615,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
 				      mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      get_format(&display),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &input_fb);
 		igt_assert(fb_id >= 0);
-- 
2.43.0

