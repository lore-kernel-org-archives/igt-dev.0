Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ACFCFA475
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF76010E058;
	Fri, 21 Nov 2025 05:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFC89uVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6710E071
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703658; x=1795239658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPE80CpXa1o0DDP5tcJ2AetDS9rcaOIQ6h//9FxFrD4=;
 b=XFC89uVump71OXK9djErui64rl6Gm9/6/O2l6XYH/bXNm0Zj+rDQp31D
 KUSh72KxLAB8Qu1Zp5/iPMpaedgpM5taCIgrGEGHUyMuamaUT0W9fVFiv
 QeIWHPuhOCTWLihnth5pTn4rz6MVUGYE6itD/1r1UsecugcLCGNH1vMXL
 aZuN0piKoRKgDuSzL6L0FHGkbnix+vjPFI7hKI7zv69VVUnrZ9jIZIP+i
 GUiofvu3Cc391mPoV6guWAbSOL2dBmU4PRkfv/r2ylrRZ+elouX/9T7EX
 S/BNfL4BPRQZp1FyJoiHoWpXuZ0keos+M6onxcRHdDN7tcx4Hfsi1UAve w==;
X-CSE-ConnectionGUID: 1EclWCadSu6h7VYtgdmNgg==
X-CSE-MsgGUID: VwaQ6PBZTK+T4z+14+g6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658149"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:58 -0800
X-CSE-ConnectionGUID: UJFXe2E/ThCwxNgpXaXCLw==
X-CSE-MsgGUID: 0dUtLQUbQjCBbEfJWdK0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961818"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:57 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 05/12] tests/kms_writeback: Refactor format handling
 in commit_and_dump_fb
Date: Fri, 21 Nov 2025 11:28:32 +0530
Message-ID: <20251121055839.3116906-6-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121055839.3116906-1-sowmiya.s@intel.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
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

Modified commit_and_dump_fb to select supported
formats if provided; defaults are applied based
on the platform when none are specified.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 45 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index b6d38ab28..46fada8b8 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -444,7 +444,7 @@ static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t
 }
 
 static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
-			        igt_fb_t *input_fb, drmModeModeInfo *mode)
+				drmModeModeInfo *mode)
 {
 	cairo_surface_t *fb_surface_out;
 	char filepath_out[PATH_MAX];
@@ -452,17 +452,51 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	char *path_name;
 	char *file_name;
 	unsigned int fb_id;
-	igt_fb_t output_fb;
+	igt_fb_t input_fb, output_fb;
+	uint32_t format;
 
 	path_name = getenv("IGT_FRAME_DUMP_PATH");
 	file_name = getenv("FRAME_PNG_FILE_NAME");
 
+	if (!data.wb_fmt && is_intel_device(display->drm_fd)) {
+		format = DRM_FORMAT_XBGR8888;
+	} else if (!data.wb_fmt && !is_intel_device(display->drm_fd)) {
+		format = DRM_FORMAT_XRGB8888;
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
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &input_fb);
+	igt_assert(fb_id >= 0);
+	igt_plane_set_fb(plane, &input_fb);
+
 	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-			      data.wb_fmt ? data.format : DRM_FORMAT_XRGB8888,
+			      format,
 			      igt_fb_mod_to_tiling(0), &output_fb);
 	igt_require(fb_id > 0);
 
-	do_single_commit(output, plane, input_fb, &output_fb);
+	do_single_commit(output, plane, &input_fb, &output_fb);
 
 	fb_surface_out = igt_get_cairo_surface(display->drm_fd, &output_fb);
 	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
@@ -470,6 +504,7 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(fb_surface_out);
 
+	igt_remove_fb(display->drm_fd, &input_fb);
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
@@ -599,7 +634,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		if (data.list_modes)
 			list_writeback_modes(&display);
 		if (data.dump_check)
-			commit_and_dump_fb(&display, output, plane, &input_fb, &mode);
+			commit_and_dump_fb(&display, output, plane, &mode);
 	}
 	/*
 	 * When dump_check or list_modes flag is high, then the following subtests will be skipped
-- 
2.43.0

