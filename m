Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA793C9832F
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD5610E35C;
	Mon, 19 Jan 2026 04:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoiIy4Sp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1AA10E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798097; x=1800334097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrbIv2y6n0R2boh9jefF7FPt3ueexV9f86tqYktI7yU=;
 b=MoiIy4SpxYih7HjCcbBjMrrL9Ax9hg2vzRMvuiezUCvjZdOxiA3zAITH
 6lMOQ/EwCfdZd891iPNiEjjSAzrvEsnefdK7ZaGoehi9wGiBUm/8Tls2j
 W4SLi+xLv7zjoq7dULeNFN5VMs9INEfNcZqMgZQgJjyWgolveNQ0WRH1T
 rFYqNkHE0CiYKrSIwgycmaerYL2SB8fHixFiArEYoTMBVSeHZ3XGoebGa
 kyaPCMuQYu2YGYne9BTCOd6mNyMFjOaBUCK2+qw/OXXWDFqyKcTaqk3D9
 Cq+yIgcoxQkAiASAQFKKJGSHDNywxv8at8HncxpJuLqa4fm+fBGPAeXLG A==;
X-CSE-ConnectionGUID: lJp4MjJoT/udK1x2L/wcdA==
X-CSE-MsgGUID: qjIAcJcVSSuMS2KMZX8eyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581748"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:16 -0800
X-CSE-ConnectionGUID: 9vUmuEGkQou4H45uytQ4bQ==
X-CSE-MsgGUID: u/z2Mym9QHiHxk9jGYDa7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271125"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:15 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor
 writeback-check-output subtest
Date: Mon, 19 Jan 2026 10:37:31 +0530
Message-ID: <20260119050732.110985-8-sowmiya.s@intel.com>
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

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 57 +++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 0ed86c865..66da5603a 100644
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
++ *             dynamically generates subtests for each supported pixel
++ *             format (e.g., XBGR8888) and configuration.
  *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
@@ -712,7 +711,6 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 						      get_default_fb_format(&display, bpc),
 						      igt_fb_mod_to_tiling(0),
 						      &output_fb);
-
 				igt_skip_on(data.dump_check || data.list_modes);
 				igt_skip_on_f(!(data.supported_colors & (1 << i)),
 					      "DRM_FORMAT_%s is not supported\n",
@@ -724,38 +722,33 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-	igt_subtest("writeback-check-output") {
-		igt_fb_t output_fb;
+	igt_subtest_with_dynamic("writeback-check-output") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
 
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      igt_fb_mod_to_tiling(0),
-				      &output_fb);
-		igt_require(fb_id > 0);
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR8888"))
+					continue;
+			igt_dynamic_f("writeback-check-output-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
+				int bpc = igt_drm_format_get_bpc(test_format);
 
-		writeback_check_output(output, plane, &input_fb, &output_fb, DRM_FORMAT_XRGB8888);
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+						      get_default_fb_format(&display, bpc),
+						      igt_fb_mod_to_tiling(0),
+						      &output_fb);
 
-		igt_remove_fb(display.drm_fd, &output_fb);
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				writeback_check_output(output, plane, (bpc == 8) ? &input_fb :
+						       &input_fb_10bit, &output_fb, test_format);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
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
-	}
 
 	igt_fixture() {
 		cleanup_writeback(&display, output);
-- 
2.43.0

