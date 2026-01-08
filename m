Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F6AD1D478
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790DC10E78D;
	Thu,  8 Jan 2026 15:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gnk1QGct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4F410E783
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886104; x=1799422104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/m+tKGfgn5huno4xQU9XY2rz+LKE2YiUviXmMHPZlQ=;
 b=Gnk1QGctabSyQCcdYyqEs7F+f8NRW03Y9l/XvAutsuKn5xj275wczsPF
 bjN9c2cj8gKa6oMmA9LVSU8SOnVtCy3HuheeJAmtMCLAmiIATFendqhev
 dk7jJznfM3RxxqEsI7IJPwiSvbZvf+Bmp9e5ISJkLYsM42eqmfMVaNO3f
 f4bUaMGjxHIgAkFAmZ2w6uiv9bfeyKtsjOnxVIJygpXHQyGEedxc7c8Le
 RAIhTf6DPhxe1R8lrmpG7AY90erkkvpEzQX6NjidO8VFQ6+gctUmWjXaK
 UC/bcAHmQOvGVyA5Q2lsi0CRa7V30D27eLkvtnkIX1uTRFGZQAjac5edk A==;
X-CSE-ConnectionGUID: DTCFx2yARZW8wynodDHXvQ==
X-CSE-MsgGUID: ojUh4tsjRk6tA2ziDpwfTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80374889"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80374889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:24 -0800
X-CSE-ConnectionGUID: V8H6Q6MRRGaMBGrIlFToqA==
X-CSE-MsgGUID: KrvB40yaSXacBH314CzJ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234402900"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:23 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 6/6] tests/kms_writeback: Refactor
 writeback-check-output subtest
Date: Thu,  8 Jan 2026 21:18:17 +0530
Message-ID: <20260108154817.48665-7-sowmiya.s@intel.com>
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

Remove individual tests for each format for the test
writeback-check-output and introduce dynamic subtest
generation based on the formats supported.Framebuffer
creation was now part of the subtest level based on
the format and removed from fixture.

v4: -create testcase for BGR8888 format only for intel
    platforms.(Suraj)
v5: -update the documentation for dynamic subtest
    -update version info (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 78 +++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 5fff27c2b..8f5548f33 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -48,8 +48,13 @@
  * SUBTEST: writeback-check-output-XRGB2101010
  * Description: Check XRGB2101010 writeback output with CRC validation
  *
- * SUBTEST: writeback-check-output
- * Description: Check writeback output with CRC validation
+ * SUBTEST: writeback-check-output-%s
+ * Description: Check writeback output with CRC validation for
+ *              %arg[1] format
+ *
+ * arg[1]:
+ *
+ * @XBGR8888:       XBGR8888
  *
  * SUBTEST: writeback-fb-id-%s
  * Description:  Validate  WRITEBACK_FB_ID with valid and invalid options
@@ -494,7 +499,6 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 		drmModeFreePropertyBlob(formats_blob);
 	}
 	igt_assert_f(format, "Given format not supported\n");
-
 	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
 			      format,
 			      igt_fb_mod_to_tiling(0), &output_fb);
@@ -602,7 +606,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane;
-	igt_fb_t input_fb, input_fb_10bit;
+	igt_fb_t input_fb;
 	drmModeModeInfo mode;
 	unsigned int fb_id;
 	int ret;
@@ -643,17 +647,6 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		if (data.supported_colors & XRGB2101010) {
-			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-					      mode.vdisplay,
-					      DRM_FORMAT_XRGB2101010,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &input_fb_10bit);
-			igt_assert(fb_id >= 0);
-		}
-
-		igt_plane_set_fb(plane, &input_fb);
-
 		if (data.list_modes)
 			list_writeback_modes(&display);
 		if (data.dump_check)
@@ -735,46 +728,35 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-	igt_subtest("writeback-check-output") {
-		igt_fb_t output_fb;
-
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
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
+	igt_subtest_with_dynamic_f("writeback-check-output") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
 
-		writeback_check_output(output, plane, &input_fb_10bit, &output_fb, DRM_FORMAT_XRGB2101010);
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR8888"))
+					continue;
+			igt_dynamic_f("writeback-check-output-%s", igt_format_str(test_format)) {
+				igt_fb_t in_fb, output_fb;
 
-		igt_remove_fb(display.drm_fd, &output_fb);
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				create_fbs(&display, &in_fb, &output_fb, test_format, &mode);
+				writeback_check_output(output, plane, &in_fb,
+						       &output_fb, test_format);
+				/* cleanup */
+				igt_plane_set_fb(plane, NULL);
+				igt_display_commit2(output->display, COMMIT_ATOMIC);
+				igt_remove_fb(display.drm_fd, &output_fb);
+				igt_remove_fb(display.drm_fd, &in_fb);
+			}
+		}
 	}
 
 	igt_fixture() {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
-
-		if (data.supported_colors & XRGB2101010)
-			igt_remove_fb(display.drm_fd, &input_fb_10bit);
-
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.43.0

