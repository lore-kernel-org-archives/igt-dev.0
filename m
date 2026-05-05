Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F4DCD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 19:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA17410EC09;
	Tue,  5 May 2026 19:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="neuc9vNp";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B4310E484
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1778010261;
 bh=+91zWzsMiOHLUi++HmzUMwrEQ2ZltE4rNFZGf7mt0rY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=neuc9vNpJgwR8yIooNaXZ8FmNVspo6zaZQnnJIRvHWyxKfQO2S9edgL/OWTigyAXY
 GkncUd1Hfa2isIBrszckCfUkFWT/aNdNEVlPTCyZQKdIaoKYuuSy/8Wp6+xRWw2CRp
 nB9R5nNO/AvltChgJ5uudQCMvj2Yp8Lu6fJMWKLRisifxO4npKsU1/1YSTYx0mCdYX
 NIC8NYFPIISnqygjhZ0TPxjJSzN73vL+JuwDVhXgkuPsppp47f8FUHZKlcgrFOCkpY
 VVqhzAb/SajXCV8oFWK86XYVmJwQ9TGnRjrSZ4UtFWpdJen0KulMsr8mqRLCngR1je
 IBBSN4szhJn3w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t 4/4] tests/kms_color: Add background-color subtest to
 test the BACKGROUND_COLOR property
Date: Tue,  5 May 2026 21:44:23 +0200
Message-ID: <20260505194419.500600-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505194419.500600-5-dev@lankhorst.se>
References: <20260505194419.500600-5-dev@lankhorst.se>
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

The BACKGROUND_COLOR crtc property has recently been added.
Add some intel CRC tests to verify this property.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 tests/kms_color.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc9..e445c8b002 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -46,6 +46,10 @@
  * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
  *              set through GAMMA_LUT property
  *
+ * SUBTEST: background-color
+ * Description: Verify that a 8-bit background color has the same CRC
+ * as a 8-bit primary plane in the same color.
+ *
  * SUBTEST: ctm-%s
  * Description: Check the color transformation %arg[1]
  *
@@ -957,6 +961,68 @@ run_deep_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc)
 	test_cleanup(data);
 }
 
+static void
+run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc)
+{
+	igt_output_t *output;
+	struct igt_fb fb;
+	typeof(data->mode) mode;
+	uint64_t black = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
+	uint64_t red  = DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);
+	uint64_t green = DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);
+	uint64_t blue = DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);
+	uint64_t colors[] = { black, red, green, blue };
+
+	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR));
+	test_setup(data, crtc);
+
+	output = igt_get_single_output_for_crtc(crtc);
+	igt_require(output);
+
+	mode = igt_output_get_mode(output);
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->output = output;
+	data->mode = NULL;
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      data->drm_format, DRM_FORMAT_MOD_LINEAR, &fb);
+
+	igt_output_set_crtc(output, crtc);
+
+	for (unsigned long i = 0; i < ARRAY_SIZE(colors); i++) {
+		igt_crc_t plane_crc, bg_crc;
+
+		uint64_t color = colors[i];
+		uint32_t xrgb =
+			(DRM_ARGB64_GETA_BPCS(color, 8) << 24) |
+			(DRM_ARGB64_GETR_BPCS(color, 8) << 16) |
+			(DRM_ARGB64_GETG_BPCS(color, 8) << 8) |
+			(DRM_ARGB64_GETB_BPCS(color, 8));
+
+		/*
+		 * Set a different background color and  a fully opaque plane
+		 * with the correct color.
+		 */
+		igt_draw_fill_fb(data->drm_fd, &fb, xrgb);
+		igt_plane_set_fb(data->primary, &fb);
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR, colors[i ^ 1]);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &plane_crc);
+
+		igt_plane_set_fb(data->primary, NULL);
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR, color);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &bg_crc);
+
+		igt_assert_crc_equal(&plane_crc, &bg_crc);
+	}
+
+
+	test_cleanup(data);
+}
+
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
@@ -1165,6 +1231,19 @@ run_tests_for_pipe(data_t *data)
 				break;
 		}
 	}
+
+	igt_describe("Verify that the background color is set correctly");
+	igt_subtest_with_dynamic("background-color") {
+		for_each_crtc(&data->display, crtc) {
+			igt_dynamic_f("pipe-%s-background-color", igt_crtc_name(crtc)) {
+				run_background_color_tests_for_crtc(data, crtc);
+
+				if (igt_run_in_simulation())
+					break;
+			}
+
+		}
+	}
 }
 
 int igt_main()
-- 
2.53.0

