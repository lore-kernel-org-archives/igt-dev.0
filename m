Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1D2D1D47C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5130810E357;
	Thu,  8 Jan 2026 15:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYVXZaE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7E010E78D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886103; x=1799422103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j7xlkZKzHujFIW+ixdq6DZm7Na8fDR3WKQJeUCUGRUc=;
 b=AYVXZaE55/dIlQ8G+j5j/02q4G2Ln3L89giRH8PjrALF4EDsVjHSQiux
 vp1VhxF82At7igl8779Q+DTUizzuKADgmeTHkhaImOmZCpYgxy+ATRT0z
 a5uf76bDba7ea3+tPh/okMbLcCK5WqYrYxApQwO857wpZRdVydCMoz53J
 XPMoHww2+le/86W4mEMRAcHPTsoRr1wL8dVBS7mm36CY37ct/L0RD5y5u
 LN3S/+1ZYNIkzryKCp/CL8nT0DQInMNeBrmZZlAyWlRoMFfKaPDRWl6Vv
 IAdt2WJGp/t2LM176011u4jSX5AOuwTPM2ADFwRFrwj8eEeyt+q2S+GE5 g==;
X-CSE-ConnectionGUID: 6oWND12OScaHGt1drFDLBQ==
X-CSE-MsgGUID: K7+KramCQ1KdOrg6EWBVeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80374887"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80374887"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:22 -0800
X-CSE-ConnectionGUID: +WtKQpUuTy6fjWowXLIdLw==
X-CSE-MsgGUID: GsDbwpB0QrOXx4erDZaTuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234402897"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:21 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 5/6] tests/kms_writeback: Refactor writeback-fb-id
 subtest
Date: Thu,  8 Jan 2026 21:18:16 +0530
Message-ID: <20260108154817.48665-6-sowmiya.s@intel.com>
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
writeback-fb-id and introduce dynamic subtest generation
based on the formats supported. Framebuffer creation was
now part of the subtest level based on format.

v4: squashed the FB creation function with this commit (Suraj)
v5: -Update dynamic subtest documentation (Suraj)
    -Rename input_fb to in_fb
    -Set plane to in_fb and remove unused input_fb as an arg to
    writeback-fb-id function.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 87 +++++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index be123adcc..5fff27c2b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -51,11 +51,14 @@
  * SUBTEST: writeback-check-output
  * Description: Check writeback output with CRC validation
  *
- * SUBTEST: writeback-fb-id-XRGB2101010
- * Description: Validate WRITEBACK_FB_ID with valid and invalid options
+ * SUBTEST: writeback-fb-id-%s
+ * Description:  Validate  WRITEBACK_FB_ID with valid and invalid options
+ *               for %arg[1] format
  *
- * SUBTEST: writeback-fb-id
- * Description: Validate WRITEBACK_FB_ID with valid and invalid options
+ * arg[1]:
+ *
+ * @XBGR8888:       XBGR8888
+ * @XBGR2101010:    XBGR2101010
  *
  * SUBTEST: writeback-invalid-parameters
  * Description: Writeback has a couple of parameters linked together(output
@@ -287,7 +290,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 	}
 }
 
-static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *invalid_fb)
+static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
 {
 
 	int ret;
@@ -508,6 +511,25 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
+static void create_fbs(igt_display_t *display, igt_fb_t *in_fb, igt_fb_t *output_fb,
+		       uint32_t format, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      in_fb);
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
@@ -686,37 +708,30 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
+				igt_fb_t in_fb, output_fb;
+
+				igt_skip_on(data.dump_check || data.list_modes);
+				igt_skip_on_f(!(data.supported_colors & (1 << i)),
+					      "DRM_FORMAT_%s is not supported\n",
+					      igt_format_str(test_format));
+				create_fbs(&display, &in_fb, &output_fb, test_format, &mode);
+				igt_plane_set_fb(plane, &in_fb);
+				writeback_fb_id(output, &output_fb);
+				/* cleanup */
+				igt_plane_set_fb(plane, NULL);
+				igt_display_commit2(output->display, COMMIT_ATOMIC);
+				igt_remove_fb(display.drm_fd, &in_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+			}
+		}
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-- 
2.43.0

