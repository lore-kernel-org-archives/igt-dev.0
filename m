Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A35CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2260110E565;
	Wed,  6 May 2026 18:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hcM2flyF";
	dkim-atps=neutral
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE07310E562
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:50:21 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-12e332315a8so164747c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 06 May 2026 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778093420; x=1778698220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rHYGgkEyN9JXJdyyZEXF+3ESb0d3MXeqiXibuOiR1o=;
 b=hcM2flyFAiwKsz9K7dv+pqrhUsnFA6zBsw6qAazPXRri308pKVjwM2rKI5lBo5Cfjt
 sMabPz3G1TzIWoEJUZHQkA9P4Wk2cMlhcKlQtXj/TvVXaTb0NDAjREsbnGcVYA184DVF
 /IqtnwXg5WkIZC/shACEIw4k81Cac7kcXR56aqO3Fax0438jibssQT+YffXvtFqdJaUp
 4pECS2rnyzVukq+8c5lApvMiTLf8Ma0Bqq7x+h72W7wL0lfIzIf/s8NQj6DD7v4hiqtR
 YrFy8f17U8IIq9H94C21k27k6PA+ATNXZz6t13HgWSutIr567k9xkydYZWy6uJ4aZl6W
 9Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778093420; x=1778698220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7rHYGgkEyN9JXJdyyZEXF+3ESb0d3MXeqiXibuOiR1o=;
 b=XmgjIbURew+9WXzjsxIgjdrMMUlaPU/DpFdvYsw83JQdoUHJS+s2w/EdlnYV4EFuOR
 Tr8l0XxudhtXk9P+5vtDC1g6TQ7Kl8NPyV7O+XupvefNc3zLuoyOI34P7suWmXS3fW61
 guyfwKwuGDym++qJ4nFtb+zRGQ5z8bajsmE36MKeEd+vph/AV8GC5i2A42XgsFqdXNF/
 ZgQ0Hl/n1E+Y42t9DgYwGMw+K1hY6cYciyYc5zz30gSlwFpiRPxF+TvzYTpoYY0qTqZd
 ZUNOc+0P8UZAKwnggtyx8mE+LjUrdIDZtJ7lZwcMMPbQfQR77SOWZ0iq5pqr1vWGs4ks
 GeEQ==
X-Gm-Message-State: AOJu0YwMFY96rKE3MxpyTkpwQne7VkXHlUOFHB1j9d412Cr4oakCDpra
 i5NZwtn8h7hxBWjKUI9TnsqxPt2BypGLw6EzdaeWLBmOT1rlurwYLmt6PB7m5ssQ
X-Gm-Gg: AeBDietpPqgYHy0qfw9WTPWkXhnv+aw/oT1ljkMss7kijWfTfuPfBvNui2b595WRMQ9
 CdPEa1BT0INN4bdIdj+sohcajpGeYtCVo3YrtdHqs3XNB1jiI03csTZs/d9q0jCN/xEtQAx0Nn/
 SSawipWzCdJs6LdO6+nZDsWzLyQ0W3GfDxxvuhPglyBXebZHS6RI50EISCNmHOzVCtT06B/QvrR
 ESpadKu+GJw/3nU/BoPaCLruxVBhBfKbu62XSYyIBe+VY+lnUCZSJHiun+B4Msr9x31IwAl7Xbg
 kTgmaBAvVfdpDyEcthk/YG6xGgKbe1ur67Qe4XJ5L1KqV/OTt5obFpLksFiCVLaQRanHtz3BZNw
 j1lm9ZLJrZwFt35yK4ODFJYlrrL5SYJ5ATX4SisZhqCTWJlPYGj3MtELBTpbWYDxFJXt2WtazKx
 h4RhyEdAv+4SXoZOlaS71dDm3jx9akmZfOuV2gVUD7MhySCdc3zUsy9U/YkghN/JJ+KzDEBw==
X-Received: by 2002:a05:7022:699b:b0:12d:ea4f:99de with SMTP id
 a92af1059eb24-13173ea2f45mr2751771c88.0.1778093416555; 
 Wed, 06 May 2026 11:50:16 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-131f9789e3dsm4828743c88.8.2026.05.06.11.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 11:50:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_plane: Add test_nv12_tile4_src_y
 planar settings test
Date: Wed,  6 May 2026 21:49:36 +0300
Message-ID: <20260506184936.76492-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506184936.76492-1-juhapekka.heikkila@gmail.com>
References: <20260506184936.76492-1-juhapekka.heikkila@gmail.com>
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

Add Intel specific dynamic subtest test_nv12_tile4_src_y under
planar-pixel-format-settings test. This test target dpt
misconfiguration with specially crafted nv12 framebuffer
with tile4.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 6c08f1de8..983509621 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -61,6 +61,12 @@
  *              matches a reference XRGB8888 blue fill on Intel hardware.
  * Driver requirement: i915, xe
  *
+ * SUBTEST: planar-pixel-format-settings@nv12-tile4-src-y
+ * Description: Verify that an NV12 Tile4 framebuffer with src_y=1 renders
+ *              correctly on Intel hardware.  CRC comparison detects
+ *              corruption.
+ * Driver requirement: xe
+ *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
  *
@@ -1534,6 +1540,88 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
 		     rval, expected_rval);
 }
 
+/*
+ * test_nv12_tile4_src_y - NV12 Tile4 with src_y=1 CRC correctness check.
+ *
+ * If kernel program wrong UV DPT va, hardware read chroma from
+ * an unmapped page, producing incorrect picture and crc mismatch
+ */
+static void
+test_nv12_tile4_src_y(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+{
+	igt_plane_t *primary;
+	struct igt_fb nv12_fb, ref_fb;
+	igt_crc_t crc, crc_ref;
+	drmModeModeInfo *mode;
+
+	/* required size for this test, do not change! */
+	const int fb_w = 1280, fb_h = 768;
+	int ret;
+
+	igt_require_xe(data->drm_fd);
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(output, crtc);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	mode    = igt_output_get_mode(output);
+
+	igt_require_f(igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+					       I915_FORMAT_MOD_4_TILED),
+		      "Primary plane does not support NV12 + Tile4\n");
+
+	igt_require_f(fb_w <= mode->hdisplay && fb_h <= mode->vdisplay,
+		      "Mode %dx%d too small for %dx%d NV12 test FB\n",
+		      mode->hdisplay, mode->vdisplay, fb_w, fb_h);
+
+	igt_create_color_fb(data->drm_fd, fb_w, fb_h,
+			    DRM_FORMAT_NV12, I915_FORMAT_MOD_4_TILED,
+			    0.0, 0.0, 1.0, &nv12_fb);
+
+	/*
+	 * src_y = 1 - this is trigger for dpt uv offset bug
+	 */
+	igt_plane_set_fb(primary, &nv12_fb);
+	igt_fb_set_position(&nv12_fb, primary, 0, 1);
+	igt_fb_set_size(&nv12_fb, primary, fb_w, fb_h - 1);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_size(primary, fb_w, fb_h - 1);
+
+	ret = igt_display_try_commit_atomic(&data->display,
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (ret != 0) {
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(data->drm_fd, &nv12_fb);
+		igt_skip("NV12 Tile4 src_y=1 rejected by kernel (ret=%d)\n", ret);
+	}
+
+	data->pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
+	set_legacy_lut(data, crtc, LUT_MASK);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+
+	/*
+	 * Get reference crc to check above went ok
+	 */
+	igt_create_color_fb(data->drm_fd, fb_w, fb_h - 1,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 1.0, &ref_fb);
+	igt_plane_set_fb(primary, &ref_fb);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
+	set_legacy_lut(data, crtc, 0xffff);
+	igt_pipe_crc_free(data->pipe_crc);
+	data->pipe_crc = NULL;
+
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->drm_fd, &nv12_fb);
+	igt_remove_fb(data->drm_fd, &ref_fb);
+
+	igt_assert_crc_equal(&crc_ref, &crc);
+}
+
 static void test_planar_settings(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -1562,6 +1650,9 @@ static void test_planar_settings(data_t *data)
 
 	igt_dynamic("p016-odd-vertical-pan")
 		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
+
+	igt_dynamic("nv12-tile4-src-y")
+		test_nv12_tile4_src_y(data, crtc, output);
 }
 
 static bool is_pipe_limit_reached(int count)
-- 
2.43.0

