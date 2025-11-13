Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9ADCCFA18
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE9510E34C;
	Thu, 13 Nov 2025 07:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwohTY6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579FC10E34C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763020752; x=1794556752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d8cdiLyiEtSpuCLfnqvYXkHtSyvTquMnpwsO3v3gCC0=;
 b=PwohTY6wpGmFcckJQ1cSMq+61CKmgUMoVGxf32OXiXYmCp214XPbxeak
 kTjhQ11d4blK+gQsHSrKyRlQ7MOANfE3g7FDgR8EL91YYPBMTGeH27g/K
 yEBujzOOj7AmFdHMZ5Ma3KuqxgNCoDM60ZUkC8vWuXGZMeKHIQ/d2gMeV
 YxxZnZBnxohRjRi7WeCzaiUdZvxXnFQQESBcg6BeD8/z/gxAEZ63vBIB7
 Deyh3vnjLcDMTsyptSZAh3w3rfRvKS2T2dJDYgJtMbkk9z5ATwRxFbkVM
 iCQ/dg6RABtDx0PTC/xjOC3bnYyigr7S0wLxc+01svHvwwd6AmqBOvRFl g==;
X-CSE-ConnectionGUID: n+3vzF1YT0WGUP6LLeFKjA==
X-CSE-MsgGUID: i7ZUHg0kQ7ycWIIXRL3R+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64298444"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64298444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:59:12 -0800
X-CSE-ConnectionGUID: k03pwdSuRYSdEmmNl7fSHg==
X-CSE-MsgGUID: sGXGuOzRRpyVbtWFMI+37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189230462"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:59:11 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 9/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Date: Thu, 13 Nov 2025 13:45:23 +0530
Message-ID: <20251113081523.3088787-10-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113081523.3088787-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113081523.3088787-1-sowmiya.s@intel.com>
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

