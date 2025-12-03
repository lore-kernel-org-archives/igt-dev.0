Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD26D12691
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8DB10E5C2;
	Wed,  3 Dec 2025 09:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEbZ1x0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77ED10E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753901; x=1796289901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ghoWpgAlMHjmNjZgR7x7dV6eJWhmkb0sNDkS8LWmw+8=;
 b=HEbZ1x0t+VcsBjkxCsA+1wkKAL8oqGbE8CJfaXI/lwATgF/+P9jPvRc3
 rqeBlWy+L0ygIKCiseaHwQSnXRo2oZ7BEOpUnDzG4L87tXdRewWLIx+9S
 G9ctaMjr0xJOfj0w8fbrPu4Ckn1eQO1hxGdjGRdqRxB1g5FAgDuVH+V1D
 EOEfxsifI5TUTTkm3ndjzYPiWpX3wYQZDPjNg5iJ06+cYXlsXgQDY+8Yd
 +suevFQj/1pjW4HbBxKi0HmKru0IIXpBA6hKBo7J4vKRlmwlTg35S++s0
 e9LyCs/C7Zlr129zI/YdJ6pKS+sIG0g9okHUWk9YiU+p6S+rjeY/uoLIc w==;
X-CSE-ConnectionGUID: lM0KdOs2To2AXXt3kRKRZg==
X-CSE-MsgGUID: xQWdMaa3TK2uu7CBBUimYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783635"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783635"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:25:01 -0800
X-CSE-ConnectionGUID: KbXD688ERQmngG+cfcP4mg==
X-CSE-MsgGUID: DDmj9qRmT8y05Nl6fAifzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569616"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:25:00 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 5/6] tests/kms_writeback: Refactor writeback-fb-id
 subtest
Date: Wed,  3 Dec 2025 15:13:06 +0530
Message-ID: <20251203094307.3187669-6-sowmiya.s@intel.com>
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
writeback-fb-id and introduce dynamic subtest generation
based on the formats supported. Framebuffer creation was
now part of the subtest level based on format.

v4: squashed the FB creation function with this commit

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 74 +++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 6725f5ea3..d54d649b2 100644
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
@@ -507,6 +504,25 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
+static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_fb_t *output_fb,
+		       uint32_t format, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      input_fb);
+	igt_assert(fb_id >= 0);
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      output_fb);
+	igt_assert(fb_id >= 0);
+}
+
 static igt_output_t *list_writeback_modes(igt_display_t *display)
 {
 	for (int i = 0; i < display->n_outputs; i++) {
@@ -685,37 +701,27 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR"))
+					continue;
+			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
+				igt_fb_t in_fb;
+				igt_fb_t output_fb;
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				create_fbs(&display, &in_fb, &output_fb, test_format, &mode);
+				writeback_fb_id(output, &in_fb, &output_fb);
+				igt_remove_fb(display.drm_fd, &in_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-- 
2.43.0

