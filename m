Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8876DFED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3981B10E2E5;
	Fri, 24 Apr 2026 17:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFLR0sN/";
	dkim-atps=neutral
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFB410E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 17:11:47 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2d832f2f44cso7093933eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777050706; x=1777655506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7rEFfgqqecMz9EdkYAB5S5V3OA+w42QdL9q7FGS95k=;
 b=VFLR0sN/PqALLfSifrOTc7lKwnkloyyUGF9hgVe5tTgIFZO5kQOw1gBxVkFdQVWt60
 BR5CVbLRoHi7qNzW4r+p8JCLigxT89AihnqvbhY32R9JrvjbXFimeY/KbJkGMjkBduox
 gi17IhRdtUy4wFnnzsMFUWOAsjmETrkbAyYAwQJf3JNNZmQ50ce2YRG6bRM5NPNQ1Y2J
 J/+7LftEp6Sl1ImvgnctwM/rBOQOMap4bLz6UzheGDiwyoYrQbIaBlp7rZFB1Wvl20ux
 haGUJvph68XDhSx/ACu7AsDv6GzRwl95Psee+Lt57jF/OImrceOAl6xZpHq7UZHAPh6d
 ACzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777050706; x=1777655506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d7rEFfgqqecMz9EdkYAB5S5V3OA+w42QdL9q7FGS95k=;
 b=OVyimbNLk0SFPuCQ9uj7HenDCXPr9EMdkwf6Bvo2fU277aYxhc/0K91Gdg4LXmvt0V
 7SKU1imK+VLFZPtklPQwrjff7pLtQodvrAr12xN/+4FJVqxw910dU0A8bzdQh/8cwkFO
 z5z2aTSuKTwojuJhkc5ONT0LnRLEbp+tmUnAzQqtNrMtK7HTxek3L9+p9R4fm7dFNJp/
 FuWz+S5Uks2LTyBlwrFgTBXowLSenXYlp6tlOaS+kv64hhvj67cO5f4HCNptjhfiLqxO
 obuv823qoJsSLQVHciaVgcGqCLNz9TDwdxq9Yhdvp3vGpoHmMKfc7rbDpLgW58P59Rex
 vxJQ==
X-Gm-Message-State: AOJu0YxQ4CO/eeBMAosQGTtUXV0XuJsmEoUBYb8XWG2TOGaQ7rf4Cstk
 6Ff92qV9eJbK/bzuDJxDvH/tgg2fGMJ2Lkv04k1vZSNCGaO30CLqhFoq5gqLfBQF
X-Gm-Gg: AeBDieurHUzpjh5HWSQkQMjPRhpeaEPJQee1DN9jw9fVbtCvYEARm1RQxiuqZYvbn6/
 47s+HOSVe++poqkxQ7K8Yow1GqPogvtjsGH8cXPesW4LJTbj1Q9Gn4t3AGT7Q3vtLLCz58Gmgxp
 FKBhwicDpK4Hk3g0VMpd12hq4o4BBnWQYESC3XV155/HSaSqgU0AnjuHOi6hMPqHKcJy0sKzxfl
 kS6/FRNjkh83p8yVVYgpJk3f9kZH8AxZeCb5sXFwdXgpIq5ZAx53clRfmtlfRiw6J5g1j/2Rg24
 /Ac2v/W7C3yIBfr/EMlMFCsV8TtQV9qynNKuwRhbKyiRdpQjEnUGyNd7ujUOQ/3Sd3FYCBZHgDF
 zsTUcfUcArvq3V6NIljt/SMipXhH+WlfukdBQsUi9vOPZAKlTDngk11qy373GEDWcsghRftEXIb
 wNWNOvdA54sep1J6IGBodOLe1P+e3jnuk+GZlJGVAs/XCHHdz5TOkswCthd4Nc1JFPH4OtIw==
X-Received: by 2002:a05:693c:2b08:b0:2d3:2983:c87c with SMTP id
 5a478bee46e88-2e464ea4f80mr18229479eec.1.1777050705909; 
 Fri, 24 Apr 2026 10:11:45 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2e53a4a64e5sm32563634eec.7.2026.04.24.10.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 10:11:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/2] tests/kms_plane: Add test_nv12_tile4_src_y planar
 settings test
Date: Fri, 24 Apr 2026 20:11:23 +0300
Message-ID: <20260424171123.3963793-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
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
---
 tests/kms_plane.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 6c08f1de8..303bd333f 100644
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
@@ -1534,6 +1540,92 @@ test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
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
+	igt_fb_set_position(&ref_fb, primary, 0, 0);
+	igt_fb_set_size(&ref_fb, primary, fb_w, fb_h - 1);
+	igt_plane_set_position(primary, 0, 0);
+	igt_plane_set_size(primary, fb_w, fb_h - 1);
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
@@ -1562,6 +1654,9 @@ static void test_planar_settings(data_t *data)
 
 	igt_dynamic("p016-odd-vertical-pan")
 		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
+
+	igt_dynamic("nv12-tile4-src-y")
+		test_nv12_tile4_src_y(data, crtc, output);
 }
 
 static bool is_pipe_limit_reached(int count)
-- 
2.43.0

