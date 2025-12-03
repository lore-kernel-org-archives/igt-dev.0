Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3100FD116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02E410E762;
	Wed,  3 Dec 2025 09:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYACydPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54210E762
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753903; x=1796289903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yTLxXVUfi0GjFjTzodOfyUFLpmgFVdNULL4Zs68+v1s=;
 b=XYACydPsqu1OVgMfwFIk5i8hvmZYWzGjPbd/nq9XpZE0I/sAfv+2aMzX
 fFrC+ZbFZhUwQ2w4OolZt4TgxXBwYIrhZslCq2FORGxTk89f5e92Lc8vF
 asfaikW+PNSLlXJqYXMk6+g8lpT8516JcLzThsAqm3I8TTrqKmJqDVmn2
 i4u8t6HlmEYHTTFEp1mXHWp5dTwedntZDAAZXafBQb121/ZQFnfQ2JJ6C
 QzJq2K/5vn8TbOB8AW2lUsIGUtiWPkUKPbyFhvtu/8gGTO6yFfBIDmsZn
 Af0yoTj0MzEuofMqDLg1ZrwnxMxcW/q4yYOBwWfRP+Rv9+UfAOBPDUDio w==;
X-CSE-ConnectionGUID: Qe8/hv+0TVaPiA2CpRTLfQ==
X-CSE-MsgGUID: KBvoBDhfRY2vOjjW51TNaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783640"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:25:03 -0800
X-CSE-ConnectionGUID: 8FcIiyOIQZGjmi7Oa3XWpw==
X-CSE-MsgGUID: 4ehH6ZcwSz6KyYlEzx2lLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569653"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:25:01 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 6/6] tests/kms_writeback: Refactor
 writeback-check-output subtest
Date: Wed,  3 Dec 2025 15:13:07 +0530
Message-ID: <20251203094307.3187669-7-sowmiya.s@intel.com>
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

Remove individual tests for each format for the test
writeback-check-output and introduce dynamic subtest
generation based on the formats supported.Framebuffer
creation was now part of the subtest level based on
the format and removed from fixture.

v4: create testcase for BGR8888 format only for intel
    platforms.
Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 69 +++++++++++++------------------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index d54d649b2..cc5a8ac32 100644
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
@@ -595,7 +592,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane;
-	igt_fb_t input_fb, input_fb_10bit;
+	igt_fb_t input_fb, in_fb;
 	drmModeModeInfo mode;
 	unsigned int fb_id;
 	int ret;
@@ -636,15 +633,6 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
 		igt_plane_set_fb(plane, &input_fb);
 
 		if (data.list_modes)
@@ -709,7 +697,6 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				if (!strstr(igt_format_str(test_format), "BGR"))
 					continue;
 			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
-				igt_fb_t in_fb;
 				igt_fb_t output_fb;
 
 				igt_skip_on(data.dump_check || data.list_modes);
@@ -718,53 +705,39 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 					      igt_format_str(test_format));
 				create_fbs(&display, &in_fb, &output_fb, test_format, &mode);
 				writeback_fb_id(output, &in_fb, &output_fb);
-				igt_remove_fb(display.drm_fd, &in_fb);
 				igt_remove_fb(display.drm_fd, &output_fb);
 			}
 		}
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
+				igt_fb_t output_fb;
 
-		igt_remove_fb(display.drm_fd, &output_fb);
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				create_fbs(&display, &in_fb, &output_fb, test_format, &mode);
+				igt_plane_set_fb(plane, &in_fb);
+				writeback_check_output(output, plane, &in_fb,
+						       &output_fb, test_format);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_fixture {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
-
-		if (data.supported_colors & XRGB2101010)
-			igt_remove_fb(display.drm_fd, &input_fb_10bit);
-
+		igt_remove_fb(display.drm_fd, &in_fb);
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.43.0

