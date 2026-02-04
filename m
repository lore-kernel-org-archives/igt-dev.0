Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2926CE9D41A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98CA10E6F5;
	Wed,  4 Feb 2026 16:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTmOk4Kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF90210E6F5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770224296; x=1801760296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VDAXyWl/mk3PH82vdlAFPMQG4ftZ0WZxrm1nHMi+1SI=;
 b=MTmOk4Kta7mm5yyihO1lhKZRTfz+PaJY2r/iqCvBKz3Uve8aMQwsnGnp
 UHRyu1Y9raWNplQ7GGojGgg1b/eSs9SrDtQ8ldJgBznCIpGEZtI+k6tYn
 dgVR80I4ayhuYyQXgHwaSOx/U+vw7yU0M72JjvLbLOwTLVzxzKVkbxvZ7
 72sQNQ96PpjPTOxTsdtaFJhU0ECnsVwws8iqZ1qI+EODXPq+kgXvVcd9D
 RM7ridPQynqmsmsg/aSKq9mvEz214S8J7HRlio4QweYrSPsObe9aSbmc2
 EiglZ90jE+Xdbem0fTblYCymd3PoO6xFhYMqFm2h3SDg8qa6/OXOSQZmn A==;
X-CSE-ConnectionGUID: FOVRx5peQxGWy8dpLhxybw==
X-CSE-MsgGUID: Tb3vsvCmTdymyV/z4ifIHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71580103"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71580103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:58 -0800
X-CSE-ConnectionGUID: SCmEhVjNRrWFFzA7Dguo6Q==
X-CSE-MsgGUID: wLH4PdfyR6KJCvzcQC0FJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210253040"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:57 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v8 8/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Date: Wed,  4 Feb 2026 22:48:17 +0530
Message-ID: <20260204171819.292327-9-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204171819.292327-1-sowmiya.s@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
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
v6: -Remove in_fb inside subtest and reuse input_fb from
     fixture (Suraj)
v7: -Join nested-if conditions (Suraj)
v8: -Move FB creation after igt_skip checks (Bilal)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 59 +++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index d17e2df47..1892ddc47 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -45,11 +45,10 @@
 #include "sw_sync.h"
 
 /**
- * SUBTEST: writeback-check-output-XRGB2101010
- * Description: Check XRGB2101010 writeback output with CRC validation
- *
  * SUBTEST: writeback-check-output
- * Description: Check writeback output with CRC validation
+ * Description: Check writeback output with CRC validation.This test
+ *             dynamically generates subtests for each supported pixel
+ *             format (e.g., XBGR8888) and configuration.
  *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
@@ -717,37 +716,31 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
+	igt_subtest_with_dynamic("writeback-check-output") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
 
-		writeback_check_output(output, plane, &input_fb_10bit, &output_fb, DRM_FORMAT_XRGB2101010);
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR8888"))
+					continue;
+			igt_dynamic_f("writeback-check-output-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
+				int bpc = igt_drm_format_get_bpc(test_format);
 
-		igt_remove_fb(display.drm_fd, &output_fb);
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
-- 
2.43.0

