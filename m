Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6C0CD5BB3
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 15:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F02F10E262;
	Fri, 22 May 2026 15:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="YTIoqwgr";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B09310E344
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779465420;
 bh=T8dnBOWEAv/dBpXcI3j9D4Rz4A5+uwL35hjpGCet1pA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YTIoqwgrPZiczPvHXclwrkM9Fkh+jzdowctFkwrrrUWBRKRlO2INJv4EhGjCoZHW0
 KQCdbxu4K6I5g90ToUPn2iVhT+DOdONCQF2FGdt9juEj9viS6LwxIRIX1Q+Y5SblN6
 IO71mYsGL8srUa0r/qfG+xA6yES41JnVeZ83uXpB7zk3CLfzthMEzYRhd/iGi10Osa
 brU/0hj4Oq8jHug31vKc5jEQWpaDUJPP9ytD3J8raxWWAHiZtMyVCEQ209eqB4r+DD
 Dpb9IQUmBqQz3LgyN5QIGGQbGS+KKbK0oBbcsjWDVV/FLomSCVLiVdHl48uI99assW
 RsXxPonyHcHKg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 3/3] tests/kms_color: Add background-color subtest to test
 the BACKGROUND_COLOR property
Date: Fri, 22 May 2026 17:56:35 +0200
Message-ID: <20260522155635.1215421-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522155635.1215421-1-dev@lankhorst.se>
References: <20260522155635.1215421-1-dev@lankhorst.se>
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
 tests/kms_color.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc9..64ae844abf 100644
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
@@ -957,6 +961,61 @@ run_deep_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc)
 	test_cleanup(data);
 }
 
+static void
+run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+{
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	uint64_t black = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
+	uint64_t red  = DRM_ARGB64_PREP(0xffff, 0xffff, 0, 0);
+	uint64_t green = DRM_ARGB64_PREP(0xffff, 0, 0xffff, 0);
+	uint64_t blue = DRM_ARGB64_PREP(0xffff, 0, 0, 0xffff);
+	uint64_t colors[] = { black, red, green, blue };
+
+	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR));
+	test_setup(data, crtc);
+
+	mode = igt_output_get_mode(output);
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
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
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_remove_fb(data->drm_fd, &fb);
+	test_cleanup(data);
+}
+
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
@@ -1165,6 +1224,19 @@ run_tests_for_pipe(data_t *data)
 				break;
 		}
 	}
+
+	igt_describe("Verify that the background color is set correctly");
+	igt_subtest_with_dynamic("background-color") {
+		for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+			igt_dynamic_f("pipe-%s-background-color", igt_crtc_name(crtc)) {
+				run_background_color_tests_for_crtc(data, crtc, data->output);
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

