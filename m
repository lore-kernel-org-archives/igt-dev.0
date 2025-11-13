Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2095CD4F57
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829E710E09A;
	Thu, 13 Nov 2025 08:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gf5nsIAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0038210E5E2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021904; x=1794557904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WpTz3w5VAE62ZgOrkmdaYrm43yyuj3AJoGaQkO8tLgg=;
 b=gf5nsIAwXnsGdnLSeY4YACrpo+9pcKXCEZgYvCI9T3QujK/Z7iLyMtss
 405SLWoYNC2X8iRuoj/UqSFExD46ytctjSExgc2vFjxAEl7fZh6I7KCn4
 B+1H10YTyWDouKMXuJkVPLhW8Yuw/ou3R/jLvqfatD1dK/3FByHQiIxTn
 3w74dDRf/CP8fu5gLwPf9cn30sp+Qfc6ZWgLOOPKo6Z5QtF6jGi++oKOg
 HLpJ0l0c3iSMmbUw55SDs7qsp1MZsC6JT1hhgDdchUoMWusesdk3ylz+4
 D8zCX7Wdq8Dzh1ABgGpFZia6qGVL6k7q4XgAALmzTbRsjdKUaEcWF7rLY w==;
X-CSE-ConnectionGUID: aFjc7cvrRVmCmu5X85r8ag==
X-CSE-MsgGUID: cl4lUSCZRPGm/FFiHo/I0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000540"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:24 -0800
X-CSE-ConnectionGUID: LThX5YEhTZmJ6d5nFbCxdQ==
X-CSE-MsgGUID: B7JE3VgiTuOqeQV+ovlc5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822426"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:23 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 8/9] tests/kms_writeback: Refactor writeback-fb-id
 subtest
Date: Thu, 13 Nov 2025 14:05:54 +0530
Message-ID: <20251113083555.3088873-9-sowmiya.s@intel.com>
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
writeback-fb-id and introduced dynamic subtest generation
based on the formats supported. framebuffer creation was
now part of the subtest level based on format.
This logic was previously part of the fixture

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 47 ++++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index f724cd33f..530915ea1 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -51,9 +51,6 @@
  * SUBTEST: writeback-check-output
  * Description: Check writeback output with CRC validation
  *
- * SUBTEST: writeback-fb-id-XRGB2101010
- * Description: Validate WRITEBACK_FB_ID with valid and invalid options
- *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
  *
@@ -717,37 +714,27 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id") {
-		igt_fb_t output_fb;
-
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
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
+	igt_subtest_with_dynamic_f("writeback-fb-id") {
+		for (int i = 0; i < ARRAY_SIZE(fourcc); i++) {
+			uint32_t test_format = fourcc[i];
 
-	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and invalid options");
-	igt_subtest("writeback-fb-id-XRGB2101010") {
-		igt_fb_t output_fb;
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR"))
+					continue;
+			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &output_fb);
-		igt_require(fb_id > 0);
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
 
-		writeback_fb_id(output, &input_fb_10bit, &output_fb);
+				create_fbs(&display, &input_fb, &output_fb, test_format, &mode);
+				writeback_fb_id(output, &input_fb, &output_fb);
 
-		igt_remove_fb(display.drm_fd, &output_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-- 
2.43.0

