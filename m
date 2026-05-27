Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EADCD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2E10E97B;
	Wed, 27 May 2026 19:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="R62VRyRb";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0DD10E975
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z51eGqQLgAnYSEvXzFnC1JPIK1PqXp2hCysuqrvIX1M=; b=R62VRyRbvn41PoffPgIQrIiUnK
 4gCCK8FbaWVTALU4VFf8vPX4f3wLZ6oxh5+P64yi5zs4ngie6x4bslXwK/8vB/xcjiFXGPOh/XCTE
 jB+X+kY1WyqrA7Hv2juElP3CZxY4q4zS/7Fqufh3rpqf66scnG+N5qw5og9BYRkkle8lUvzR0PXpR
 8k1KcpM3slqMs0p5X6fQRCM0o1DcpQ314fTSe+K7ALo1El2udxUwHiyzjR5RZvDkNcfdXrI++bbmw
 ij05XOAzR/GF6fL2nKpzTHrozeBu/d+jEnuYYabeW6fAhctXvc14ODaIg0o6NN2ZuVUAQmfHXXYhx
 B3Yzk1+g==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSK3Q-00935c-Tw; Wed, 27 May 2026 21:36:37 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 1/5] [SQUASH] Add writeback changes for intel-supported
 formats
Date: Wed, 27 May 2026 12:36:08 -0700
Message-ID: <20260527193612.651624-2-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527193612.651624-1-John.Harrison@Igalia.com>
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
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

From: Sowmiya S <sowmiya.s@intel.com>

Squash of following patches by Sowmiya S <sowmiya.s@intel.com>:
  tests/kms_writeback: Add support for intel-specific formats
  lib/igt_fb: Validate supported formats for crc calculation
  tests/kms_writeback: Update checks for zero FB ID and empty writeback commit
  lib/igt_fb: Add helper to get bpc from DRM fourcc
  tests/kms_writeback: Refactor format handling in commit_and_dump_fb
  tests/kms_writeback: Remove unused invalid_fb parameter
  tests/kms_writeback: Refactor writeback-fb-id subtest
  tests/kms_writeback: Refactor writeback-check-output subtest
  tests/kms_writeback: Use helper to fetch default FB format
---
 lib/igt_fb.c          |  39 +++++++-
 lib/igt_fb.h          |   1 +
 tests/kms_writeback.c | 211 +++++++++++++++++++++++++-----------------
 3 files changed, 162 insertions(+), 89 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa9220953..104ad74db 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5101,7 +5101,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	if (fb->num_planes != 1)
 		return -EINVAL;
 
-	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010)
+	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
+	    fb->drm_format != DRM_FORMAT_XBGR8888)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -5128,7 +5129,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		for (x = 0; x < fb->width; x++) {
 			uint32_t pixel = le32_to_cpu(line[x]);
 
-			if (fb->drm_format == DRM_FORMAT_XRGB8888)
+			if (fb->drm_format == DRM_FORMAT_XRGB8888 ||
+			    fb->drm_format == DRM_FORMAT_XBGR8888)
 				pixel &= 0x00ffffff;
 			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
 				pixel &= 0x3fffffff;
@@ -5147,6 +5149,39 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	return 0;
 }
 
+/**
+ * igt_drm_format_get_bpc: Return bits-per-channel for a DRM fourcc format
+ * @drm_format: drm fourcc code
+ *
+ * Returns the nominal bits-per-color-channel (BPC) for the given @drm_format.
+ * This helper is intended for RGB formats and currently covers common packed
+ * and planar RGB(A/X) variants. Non-RGB formats are not yet handled.
+ * Extend as needed to cover additional FOURCCs (including YUV) by
+ * adding explicit cases.
+ */
+int igt_drm_format_get_bpc(uint32_t drm_format)
+{
+	switch (drm_format) {
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+		return 8;
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return 10;
+	case DRM_FORMAT_XRGB16161616F:
+	case DRM_FORMAT_XBGR16161616F:
+	case DRM_FORMAT_ARGB16161616F:
+	case DRM_FORMAT_ABGR16161616F:
+		return 16;
+	default:
+		return -1;
+	}
+}
+
 /**
  * igt_format_is_yuv:
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 8e5907dab..844b27ff2 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -222,6 +222,7 @@ int igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
 /* helpers to handle drm fourcc codes */
 uint32_t igt_bpp_depth_to_drm_format(int bpp, int depth);
 uint32_t igt_drm_format_to_bpp(uint32_t drm_format);
+int igt_drm_format_get_bpc(uint32_t drm_format);
 const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 7c30e8ee3..9ff2f973b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -45,14 +45,10 @@
 #include "sw_sync.h"
 
 /**
- * SUBTEST: writeback-check-output-XRGB2101010
- * Description: Check XRGB2101010 writeback output with CRC validation
- *
  * SUBTEST: writeback-check-output
- * Description: Check writeback output with CRC validation
- *
- * SUBTEST: writeback-fb-id-XRGB2101010
- * Description: Validate WRITEBACK_FB_ID with valid and invalid options
+ * Description: Check writeback output with CRC validation.This test
+ *             dynamically generates subtests for each supported pixel
+ *             format (e.g., XBGR8888) and configuration.
  *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
@@ -90,8 +86,37 @@ static data_t data;
 enum {
 	XRGB8888 = 1 << 0,
 	XRGB2101010 = 1 << 1,
+	XBGR8888 = 1 << 2,
+	XBGR2101010 = 1 << 3,
+};
+
+const uint32_t fourcc[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XBGR2101010,
+};
+
+enum bits_per_channel {
+	BPC_8 = 8,
+	BPC_10 = 10,
 };
 
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
@@ -101,11 +126,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	int width, height, ret;
 	uint16_t i;
 
-	const uint32_t fourcc[] = {
-		DRM_FORMAT_XRGB8888,
-		DRM_FORMAT_XRGB2101010,
-	};
-
 	igt_output_override_mode(output, &override_mode);
 
 	width = override_mode.hdisplay;
@@ -274,7 +294,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 	}
 }
 
-static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *invalid_fb)
+static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
 {
 
 	int ret;
@@ -285,7 +305,7 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL : 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
@@ -297,7 +317,10 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 ||
+		   fb->drm_format == DRM_FORMAT_XRGB2101010 ||
+		   fb->drm_format == DRM_FORMAT_XBGR8888 ||
+		   fb->drm_format == DRM_FORMAT_XBGR2101010);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -332,7 +355,8 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 	uint32_t clear_color = 0xffffffff;
 	igt_crc_t cleared_crc, out_expected;
 
-	if (fourcc_color == DRM_FORMAT_XRGB2101010)
+	if (fourcc_color == DRM_FORMAT_XRGB2101010 ||
+	    fourcc_color == DRM_FORMAT_XBGR2101010)
 		in_fb_colors = in_fb_colors_10bits;
 	else
 		in_fb_colors = in_fb_colors_8bits;
@@ -396,7 +420,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(output->display->drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
@@ -418,7 +443,12 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t *in_fb,
 			      igt_fb_t *out_fb)
 {
-	uint32_t in_fb_color = 0xffff0000;
+	uint32_t in_fb_color;
+
+	if (data.format == DRM_FORMAT_XRGB8888 || data.format == DRM_FORMAT_XBGR8888)
+		in_fb_color = 0xffff0000;
+	else
+		in_fb_color = 0x3ff00000;
 
 	fill_fb(in_fb, in_fb_color);
 
@@ -431,7 +461,7 @@ static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t
 }
 
 static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
-			        igt_fb_t *input_fb, drmModeModeInfo *mode)
+				igt_fb_t *input_fb, drmModeModeInfo *mode)
 {
 	cairo_surface_t *fb_surface_out;
 	char filepath_out[PATH_MAX];
@@ -440,12 +470,37 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
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
 
@@ -572,15 +627,16 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
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
@@ -631,7 +687,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
-				      DRM_FORMAT_XRGB8888,
+				      get_default_fb_format(&display, BPC_8),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
@@ -642,78 +698,59 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id") {
-		igt_fb_t output_fb;
-
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888), "DRM_FORMAT_XRGB8888 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &output_fb);
-		igt_require(fb_id > 0);
-
-		writeback_fb_id(output, &input_fb, &output_fb);
-
-		igt_remove_fb(display.drm_fd, &output_fb);
-	}
-
-	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id-XRGB2101010") {
-		igt_fb_t output_fb;
-
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &output_fb);
-		igt_require(fb_id > 0);
-
-		writeback_fb_id(output, &input_fb_10bit, &output_fb);
-
-		igt_remove_fb(display.drm_fd, &output_fb);
+	igt_subtest_with_dynamic_f("writeback-fb-id") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
+
+			if (is_intel_device(display.drm_fd) &&
+			    (!strstr(igt_format_str(test_format), "BGR")))
+				continue;
+			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
+				int bpc = igt_drm_format_get_bpc(test_format);
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				writeback_fb_id(output, (bpc == 8) ? &input_fb : &input_fb_10bit);
+			}
+		}
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-	igt_subtest("writeback-check-output") {
-		igt_fb_t output_fb;
-
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888), "DRM_FORMAT_XRGB8888 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      igt_fb_mod_to_tiling(0),
-				      &output_fb);
-		igt_require(fb_id > 0);
-
-		writeback_check_output(output, plane, &input_fb, &output_fb, DRM_FORMAT_XRGB8888);
-
-		igt_remove_fb(display.drm_fd, &output_fb);
-	}
-
-	igt_describe("Check XRGB2101010 writeback output with CRC validation");
-	igt_subtest("writeback-check-output-XRGB2101010") {
-		igt_fb_t output_fb;
-
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      igt_fb_mod_to_tiling(0),
-				      &output_fb);
-		igt_require(fb_id > 0);
-
-		writeback_check_output(output, plane, &input_fb_10bit, &output_fb, DRM_FORMAT_XRGB2101010);
-
-		igt_remove_fb(display.drm_fd, &output_fb);
+	igt_subtest_with_dynamic("writeback-check-output") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
+
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR8888"))
+					continue;
+			igt_dynamic_f("writeback-check-output-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
+				int bpc = igt_drm_format_get_bpc(test_format);
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+						      get_default_fb_format(&display, bpc),
+						      igt_fb_mod_to_tiling(0),
+						      &output_fb);
+
+				writeback_check_output(output, plane, (bpc == 8) ? &input_fb :
+						&input_fb_10bit, &output_fb, test_format);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_fixture() {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 
-		if (data.supported_colors & XRGB2101010)
+		if (data.supported_colors & XRGB2101010 ||
+		    data.supported_colors & XBGR2101010)
 			igt_remove_fb(display.drm_fd, &input_fb_10bit);
 
 		igt_display_fini(&display);
-- 
2.43.0

