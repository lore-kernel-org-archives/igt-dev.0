Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D324FD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8741510E357;
	Mon, 19 Jan 2026 04:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADuCJJ7Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9EB10E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798095; x=1800334095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oehB2+AbjzDzWjn3MmnDRjr73sziEIm8Vw2MtZ2/Gek=;
 b=ADuCJJ7Z1gNGpQUZj9Ti7sx4TR3HFVQvlZ2v2pEoAOTN9FXzf4KrFJs+
 PcCrspf3etN3VlxBOSl23yfDCjDcMZqrUT/xmcbi9IQh85w1Z38ZSImLc
 hRmMWU5y90t/1vJMzZQiRitWgHc3wH5pHRHZV299usvVhbJ1aPKXYaZ3r
 cqUENheg4nzoIx+mhZw81QkdQRn4CXe2sqBvExlldv13fM8bpDbVNQ+gl
 YQUH/+oKlWmrmkLo3fXFAvqwONMq1l6ODSz/DQhRtO7xMD9suN/oz1NXJ
 +euXW3HNi1L/BOj5gXLFGf3lAIW4VNNQp9UXA/g2nyq5l2GeHQKtSmHxk w==;
X-CSE-ConnectionGUID: 8Js0RrMuTsappAeHo6KoPg==
X-CSE-MsgGUID: uOOplAFsQKOLnL6SxJeYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581743"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:14 -0800
X-CSE-ConnectionGUID: Kuq2K5KjThi4TeKx2mhMbA==
X-CSE-MsgGUID: MkvITvrGTsO7c5tGef/HAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271104"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:13 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback-fb-id
 subtest
Date: Mon, 19 Jan 2026 10:37:30 +0530
Message-ID: <20260119050732.110985-7-sowmiya.s@intel.com>
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
writeback-fb-id and introduce dynamic subtest generation
based on the formats supported. Framebuffer creation was
now part of the subtest level based on format.

v4: squashed the FB creation function with this commit (Suraj)
v5: -Update dynamic subtest documentation (Suraj)
    -Rename input_fb to in_fb
    -Set plane to in_fb and remove unused input_fb as an arg to
     writeback-fb-id function.
v6: -Remove in_fb inside subtest and reuse input_fb from
     fixture (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 60 ++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 35 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 63917bf4f..0ed86c865 100644
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
@@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 	}
 }
 
-static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *invalid_fb)
+static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
 {
 
 	int ret;
@@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
+			int bpc = igt_drm_format_get_bpc(test_format);
+
+			if (is_intel_device(display.drm_fd))
+				if (!strstr(igt_format_str(test_format), "BGR"))
+					continue;
+			igt_dynamic_f("writeback-fb-id-%s", igt_format_str(test_format)) {
+				igt_fb_t output_fb;
+
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+						      get_default_fb_format(&display, bpc),
+						      igt_fb_mod_to_tiling(0),
+						      &output_fb);
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				writeback_fb_id(output, &output_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-- 
2.43.0

