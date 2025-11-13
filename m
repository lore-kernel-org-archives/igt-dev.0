Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12753CD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B383510E34C;
	Thu, 13 Nov 2025 08:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NO0fSWg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB5A10E5E7
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021905; x=1794557905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d8cdiLyiEtSpuCLfnqvYXkHtSyvTquMnpwsO3v3gCC0=;
 b=NO0fSWg2jj5tjJZSpQZx1rAzGAZtYcsC88zsjj3iK/YFKh8dRmyVYVca
 t83oPzzZiJHBv1fK0sLoMSUh9McadOGzKHHuCJPgqneAiEveMz9YVVyWV
 ttR9Uk/pepHhvrvpzHLgvnPV6W8lg6zZn5ldxT8+LkQ/wdSwy/LE8ySpm
 lQgbEBAa+L/6k1XQ0NVvQNucavZhXE6PuO9lIJgnBZgqM5asAuTw/zxmz
 tUf19zYLMTFyxGG51nx7kQBbx0MZLEi2KqWVRh/KGPwRvXZQqkBqOoeq7
 6wR6sgBNohM8zlGEI2DVDPV2tGKuA8ce31KCrULvjQJLXIO2yTY9k8l6y A==;
X-CSE-ConnectionGUID: uy79986STlu5rGIYDeINTg==
X-CSE-MsgGUID: /jw5Pe/cQLCONSJq9l9o0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000544"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:25 -0800
X-CSE-ConnectionGUID: lLWgXMYXSMCqtQ7T0uW2vw==
X-CSE-MsgGUID: x339T6YBTfOtnBP5WP3flg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822432"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:24 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 9/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Date: Thu, 13 Nov 2025 14:05:55 +0530
Message-ID: <20251113083555.3088873-10-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113083555.3088873-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113083555.3088873-1-sowmiya.s@intel.com>
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

Removed individual tests for each format for the test
writeback-check-output and introduced dynamic subtest
generation based on the formats supported.Framebuffer
creation was now part of the subtest level based on
the format and removed from fixture.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 69 +++++++++++++------------------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 530915ea1..581963fe6 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -45,9 +45,6 @@
 #include "sw_sync.h"
 
 /**
- * SUBTEST: writeback-check-output-XRGB2101010
- * Description: Check XRGB2101010 writeback output with CRC validation
- *
  * SUBTEST: writeback-check-output
  * Description: Check writeback output with CRC validation
  *
@@ -596,9 +593,8 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane;
-	igt_fb_t input_fb, input_fb_10bit;
+	igt_fb_t input_fb;
 	drmModeModeInfo mode;
-	unsigned int fb_id;
 	int ret;
 
 	memset(&display, 0, sizeof(display));
@@ -631,22 +627,6 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_assert(plane);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb);
-		igt_assert(fb_id >= 0);
-
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb_10bit);
-		igt_assert(fb_id >= 0);
-
-		igt_plane_set_fb(plane, &input_fb);
-
 		if (data.list_modes)
 			list_writeback_modes(&display);
 		if (data.dump_check)
@@ -686,6 +666,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		     "the combination of possible bad options");
 	igt_subtest("writeback-invalid-parameters") {
 		uint32_t format;
+		unsigned int fb_id;
 		igt_fb_t invalid_output_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
@@ -738,43 +719,35 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
+	igt_subtest_with_dynamic_f("writeback-check-output") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
 
-		igt_remove_fb(display.drm_fd, &output_fb);
-	}
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR"))
+					continue;
+			igt_dynamic_f("writeback-check-output-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
 
-	igt_describe("Check XRGB2101010 writeback output with CRC validation");
-	igt_subtest("writeback-check-output-XRGB2101010") {
-		igt_fb_t output_fb;
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
 
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      igt_fb_mod_to_tiling(0),
-				      &output_fb);
-		igt_require(fb_id > 0);
+				create_fbs(&display, &input_fb, &output_fb, test_format, &mode);
+				igt_plane_set_fb(plane, &input_fb);
 
-		writeback_check_output(output, plane, &input_fb_10bit, &output_fb, DRM_FORMAT_XRGB2101010);
+				writeback_check_output(output, plane, &input_fb,
+						       &output_fb, test_format);
 
-		igt_remove_fb(display.drm_fd, &output_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_fixture {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
-		igt_remove_fb(display.drm_fd, &input_fb_10bit);
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.43.0

