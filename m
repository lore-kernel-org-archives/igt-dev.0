Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1682CA9EC5
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 12:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CAA10EF66;
	Mon, 12 Oct 2026 12:32:15 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBE210F077
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 12:29:57 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-3115c4451c8so1939515eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791808197; x=1792412997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yqzgQRhtLUgBvyE6Tv5C6cvJrsB2XzN26MuAATp8E0Y=;
 b=L7Gt2H+AGas/50KtrYZPwN3b/6te5Iylww+AwYF3FY+6B8H2Q7Nfp+X/WeCuCQW5D5
 jOOZL0BAvg8clEe5rBUHiS7qke2UzOEjBnQaluu2tld0w5wUOyRY0DQAOEYsWFxF32gn
 Lh54CcbCWBRAFnn1NQnsYHubcKmflROtX405TT6ykFolY/aRHEHXANe8Q9n8SWqIJlj8
 PBPt0T2c5iMdNp11URKr0McMewAbCgBgpWBtftXK/VlNs4UytMdf2NsDYE6HziZmNAWu
 J743gljEDfApAEiI0BzmyG6iQXZ256D137A5pYi6ZXXz/FZ1SJgpx6Uz/oH4/0acT0VJ
 n5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791808197; x=1792412997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yqzgQRhtLUgBvyE6Tv5C6cvJrsB2XzN26MuAATp8E0Y=;
 b=aidHaeO1D/x/uUo2o49V8Fysc6ss7WOPwR82IAE1PTsKwFJFSjAtlkEg158p/5sCjr
 5fXhabSuLP5DWywE8AgXg/763mHej8eCF4YZ2lLEjGs8CC/ZQlMNpZZRV9uMhtqH7Mb0
 Jz9GYe+gBo2AgwH33JYOA4ZnFsM/mFHqLzhfdQmOjxf0nQnQnF/e5+iur/hzkQG2ZZZx
 eosEpLBMLya/F5pR8iy/actsxYjEiWxRvlOWo2aoFeggmQDRvvul+NQJkjz9AZl6FzZm
 B7QzwMnDbx1sio+YBi/5TG/UqwZuz64tqK0uEHfvyAyeBW4b8ausAH5ES0LszUXTFJuy
 KGWA==
X-Gm-Message-State: AFq9FYIXYq8yoKjam83rhRhG7p1Rtt2FzWfig/K3EYVNcmu8fB+XN814
 4NLU5/m6Ng9VB8MiBcudhJjmpErSuP16fsSX2K40LM4Boxu8zeaxxbd3BlepA9aEFQk=
X-Gm-Gg: AYBFou136C2AtQ/KbBnYxaXQ9u0uQpKZqUxisGSdlAriGdDk/WpIwXQQMY0QYgStIRG
 N4tPlWYfA4OOBgCkeJqXObTbQdFn33S+5qvG4iXX4LPCu7hHc3QWF6Gr7Y5Ws27hagWRbd0s/oc
 C4N3B//LzAD0bg6bTQl8DMErZigQTvBXr1ey5Viy13JZQsh8bPPri6YsWmDSjGQSuZiLmL3giNR
 n5hHFLMW9gVV7cnzw5c+/ovOTjCVTG/wCj2cpFRQDlWKZDjzKG/r83su7IGAU7vm894J4Iw0dvB
 RMr6AnS/dXx2+GJW7JyPkZBNK3aYuLmISETGtCu/nRKj7MN6roQ9lDS1h7NjUCLFc/19h61McZw
 jVYbF9RuDqlt7BuRGuEnkHPWajV26aNVmuS87rdzR95+P3qEHvTCirWvnOXEPrZbgLaYg2Hwq5j
 jNcQax1YCEcQMI1KsRKjik1S5Zu4UVhhLhGZOlItfGlr1S6OAonSIhfTE+c9odq2Xvxm9KP2WDo
 wjyPFiqL66rsalO7wLuqQOWHJH0aKIuUZ9H
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id
 5a478bee46e88-3536c53930dmr14957236eec.13.1791808196715; 
 Mon, 12 Oct 2026 05:29:56 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3537ca7133asm40280401eec.14.2026.10.12.05.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 05:29:56 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/5] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
Date: Mon, 12 Oct 2026 15:29:37 +0300
Message-ID: <20261012122939.233749-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
References: <20261012122939.233749-1-juhapekka.heikkila@gmail.com>
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

Probe the maximum horizontal and vertical plane downscaling
factor and verify the downscaled framebuffer render correctly
by verifying via crc.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 145 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 41f56a5ed..4b5730cd1 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -189,6 +189,13 @@
  * Description: Test for validating max source size.
  */
 
+/**
+ * SUBTEST: plane-downscale-max-crc
+ * Description: Probe the maximum horizontal and vertical plane downscaling
+ *              factor and verify the downscaled framebuffer render correctly
+ *              by verifying via crc.
+ */
+
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -709,6 +716,35 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
+			      int *halign, int *valign)
+{
+	bool intel = is_intel_device(d->drm_fd);
+	int disp_ver = intel ? intel_display_ver(d->devid) : 0;
+	int hsub, vsub;
+
+	*halign = 1;
+	*valign = 1;
+
+	if (!igt_format_is_yuv(format))
+		return;
+
+	igt_format_get_subsampling(format, &hsub, &vsub);
+
+	/*
+	 * these must match to intel_plane_check_src_coordinates() in
+	 * i915/Xe driver
+	 */
+	if (intel && disp_ver >= 20 && igt_format_is_yuv_semiplanar(format)) {
+		*halign = 1;
+		*valign = (disp_ver == 35) ? 2 : 1;
+		return;
+	}
+
+	*halign = hsub;
+	*valign = vsub;
+}
+
 static int
 find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 			    uint32_t format, uint64_t modifier,
@@ -790,6 +826,95 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 	return best;
 }
 
+static void
+test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		       bool scale_width)
+{
+	igt_display_t *display = &d->display;
+	const uint32_t format = DRM_FORMAT_XRGB8888;
+	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
+	const int band = 64;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc, scaled_crc;
+	drmModeModeInfo *mode;
+	struct igt_fb ref_fb = {}, src_fb = {};
+	igt_plane_t *plane;
+	int dst_w, dst_h, dst_scaled, max_src;
+	int halign, valign, align;
+
+	cleanup_crtc(d);
+
+	igt_require_pipe_crc(d->drm_fd);
+
+	igt_output_set_crtc(output, crtc);
+
+	/* Preferred mode; the largest advertised one may not be usable. */
+	mode = &output->config.default_mode;
+	igt_output_override_mode(output, mode);
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_require(plane);
+
+	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
+	align = scale_width ? halign : valign;
+
+	/* dst is a thin band spanning the full extent of the scaled axis */
+	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
+	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
+	dst_scaled = scale_width ? dst_w : dst_h;
+
+	max_src = find_max_downscale_src_size(d, plane, format, modifier,
+					      scale_width, dst_w, dst_h, align);
+	skip_if_erange_or_einval(max_src);
+	igt_require_f(max_src > dst_scaled,
+		      "No %s downscaling headroom (max src %d, dst %d)\n",
+		      scale_width ? "horizontal" : "vertical",
+		      max_src, dst_scaled);
+
+	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
+		 scale_width ? "horizontal" : "vertical",
+		 max_src, dst_scaled, band);
+
+	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
+
+	/* Reference: unscaled solid-green framebuffer of the destination size. */
+	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
+			    0.0, 1.0, 0.0, &ref_fb);
+	igt_plane_set_fb(plane, &ref_fb);
+	igt_fb_set_position(&ref_fb, plane, 0, 0);
+	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, dst_w, dst_h);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+	/* Test: larger solid-green source downscaled into dst rectangle. */
+	igt_create_color_fb(display->drm_fd,
+			    scale_width ? max_src : dst_w,
+			    scale_width ? dst_h : max_src,
+			    format, modifier, 0.0, 1.0, 0.0, &src_fb);
+	igt_plane_set_fb(plane, &src_fb);
+	igt_fb_set_position(&src_fb, plane, 0, 0);
+	igt_fb_set_size(&src_fb, plane,
+			scale_width ? max_src : dst_w,
+			scale_width ? dst_h : max_src);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, dst_w, dst_h);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_reset_fifo_underrun_reporting(display->drm_fd);
+
+	igt_pipe_crc_free(pipe_crc);
+	igt_remove_fb(display->drm_fd, &ref_fb);
+	igt_remove_fb(display->drm_fd, &src_fb);
+
+	igt_assert_crc_equal(&ref_crc, &scaled_crc);
+}
+
 static uint32_t
 test_scaler_with_modifier_crtc(data_t *d,
 			       double sf_plane,
@@ -1702,6 +1827,26 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 output);
 			}
 		}
+
+		igt_describe("Probe the maximum horizontal and vertical plane "
+			     "downscaling factor and verify the downscaled output "
+			     "matches an unscaled reference using CRCs.");
+		igt_subtest_with_dynamic("plane-downscale-max-crc") {
+			for_each_crtc_with_valid_output(&data.display, crtc, output) {
+				if (!crtc_output_combo_valid(&data.display, crtc, output))
+					continue;
+				if (igt_crtc_num_scalers(crtc) < 1)
+					continue;
+
+				igt_dynamic_f("pipe-%s-%s-horizontal",
+					      igt_crtc_name(crtc), igt_output_name(output))
+					test_downscale_max_crc(&data, crtc, output, true);
+
+				igt_dynamic_f("pipe-%s-%s-vertical",
+					      igt_crtc_name(crtc), igt_output_name(output))
+					test_downscale_max_crc(&data, crtc, output, false);
+			}
+		}
 	}
 
 	igt_subtest_group()
-- 
2.43.0

