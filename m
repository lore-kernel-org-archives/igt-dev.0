Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76B7C98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A3C10E359;
	Mon, 19 Jan 2026 04:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlJ8JfxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D45F10E359
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798093; x=1800334093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmotoqOC5IyY6PqcQevwRWhsCkqSbzhl2bgB3X3+D54=;
 b=VlJ8JfxBPmEkaINj7osjC2kvOFAjbI2EUXeM3luORNnB2UiqdIfe8dty
 SG8gTFYt5fEwqokxjslj14St+lD4mgJGf5Czd4rmU+eYEQxCuf1B2PhgA
 UBljVm87Rf525d/a44t4K8TiNCpWfX08PbNonSU6OdkGKbyMLdJHwxIl2
 pqkNhUWwKb3+gxe3y5W1YzuCaRhCGBDybz1QerL7DxrVjA9PfDuPlD3sY
 rfkl/WKCDSTdId6PQuP63K262AV2UvWBZB668PrxQIDPUkYmzT5MZ8hNO
 Cmv9iYBBuUm0V2C6p4i5hsk3Hv+gXaAOfOJH//VLnsys+zvqKQ/JTFzqX g==;
X-CSE-ConnectionGUID: OzV5vZxlQc+JaiBPbdP7eg==
X-CSE-MsgGUID: oj96kb37SYeKwDLByuDDdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581738"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581738"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:12 -0800
X-CSE-ConnectionGUID: nCfVs2r5R4SlPJYjfl3XoA==
X-CSE-MsgGUID: DyrEAveTQ2e4lWKBnIsCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271096"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:11 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 5/8] tests/kms_writeback: Refactor format handling in
 commit_and_dump_fb
Date: Mon, 19 Jan 2026 10:37:29 +0530
Message-ID: <20260119050732.110985-6-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119050732.110985-1-sowmiya.s@intel.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
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
    based on vendor type as a default format. (Suraj)
v5: Change function name more descriptive (Suraj)
v6: Revise function name (Suraj)
    Refactor get format function based on BPC

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 59 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index defe43686..63917bf4f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -101,6 +101,26 @@ const uint32_t fourcc[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+enum bits_per_channel {
+	BPC_8 = 8,
+	BPC_10 = 10,
+};
+
+static uint32_t get_default_fb_format(igt_display_t *display, enum bits_per_channel bpc)
+{
+	/* Fail loudly if the enum is out of range */
+	igt_assert(bpc == BPC_8 || bpc == BPC_10);
+
+	if (bpc == BPC_8)
+		return is_intel_device(display->drm_fd) ?
+			DRM_FORMAT_XBGR8888 : DRM_FORMAT_XRGB8888;
+
+	if (bpc == BPC_10)
+		return is_intel_device(display->drm_fd) ?
+			DRM_FORMAT_XBGR2101010 : DRM_FORMAT_XRGB2101010;
+	return -1;
+}
+
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode)
 {
@@ -447,7 +467,7 @@ static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t
 }
 
 static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
-			        igt_fb_t *input_fb, drmModeModeInfo *mode)
+				igt_fb_t *input_fb, drmModeModeInfo *mode)
 {
 	cairo_surface_t *fb_surface_out;
 	char filepath_out[PATH_MAX];
@@ -456,12 +476,37 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	char *file_name;
 	unsigned int fb_id;
 	igt_fb_t output_fb;
+	uint32_t format;
 
 	path_name = getenv("IGT_FRAME_DUMP_PATH");
 	file_name = getenv("FRAME_PNG_FILE_NAME");
 
+	if (!data.wb_fmt) {
+		format = get_default_fb_format(display, BPC_8);
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
 
@@ -584,15 +629,16 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
 				      mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      get_default_fb_format(&display, BPC_8),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		if (data.supported_colors & XRGB2101010) {
+		if (data.supported_colors & XRGB2101010 ||
+		    data.supported_colors & XBGR2101010) {
 			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
 					      mode.vdisplay,
-					      DRM_FORMAT_XRGB2101010,
+					      get_default_fb_format(&display, BPC_10),
 					      DRM_FORMAT_MOD_LINEAR,
 					      &input_fb_10bit);
 			igt_assert(fb_id >= 0);
@@ -725,7 +771,8 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 
-		if (data.supported_colors & XRGB2101010)
+		if (data.supported_colors & XRGB2101010 ||
+		    data.supported_colors & XBGR2101010)
 			igt_remove_fb(display.drm_fd, &input_fb_10bit);
 
 		igt_display_fini(&display);
-- 
2.43.0

