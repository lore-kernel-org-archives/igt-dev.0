Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731A1CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C69310EBD0;
	Thu, 15 Oct 2026 13:19:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41C010E168
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:16:44 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-cd61a2dfd7aso730906a12.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070204; x=1792675004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yqzgQRhtLUgBvyE6Tv5C6cvJrsB2XzN26MuAATp8E0Y=;
 b=Bc9fkHJBprYh+zIbW+Wy16mb0x7rYwghzyP0yROdfFnbK7HHXDkYFqrnwzWTW8xbUV
 YvPSyBmx6n01lHv9gYPzMGCDLntRvGdPcgQgJVK8bf4ROGYckSjKRIJUdb34EOQTysX1
 o8YI3G8ErAKQTFkt23vXwHjRfByLvSeij5bwA32ff55zJawKBc8PF6qBKn/LEaSbk0ow
 lptS/11iOfEbPnwayMflRurc3DgvWUX4njOHOyosWV1F55i3tzjf5cDZB0qz/7c0UhsK
 6JmF02cqpMiMn6FBH72d9L4sQ/bLOSOZPPrEid8KKixpbd2sDzOpOABnARceIS+oJy/j
 Ce0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070204; x=1792675004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yqzgQRhtLUgBvyE6Tv5C6cvJrsB2XzN26MuAATp8E0Y=;
 b=f0mRwcAiS+sJMl8WLiZFwQqn98gNGbRWySKUCgXu948ZKC/gQer4VM9zKROUBGaLEk
 lTu/xWFWun8ZboH/u0YAlX1qC/S4oAaNEB7rwdqDDthsEdkT/v/4po2r9iaik1g7B8Xa
 PABPQn8bCIw//4UqkuOJ/pqDuZkkPjmZRye+BVtKxt1eIUS2XPS9wv8Wu6oYOyjK1qH1
 nAEzBO1QqhaXaUoDo624we6UMl2STArRiy/y7xd+34IfjlGbgCXubhir7BtDFAdLXlbN
 HyGuHm7bwzg/k/U90ov7iTBQQsjqJZXi4Bjz4yPoJ4FPKpr/pQdvWbVkbs2R3hmfRv8w
 PSNA==
X-Gm-Message-State: AFq9FYK7LMpBDVnEVMVfeOIgDfWus++90Owv/2B1OLVoWDWv+XGu5HiG
 6ptpppZRo92pezN7ZO6JyYaRg0jEe5IrJMzXjk8GajHxsdQCUJ21uEBXfMqq8A==
X-Gm-Gg: AYBFou30LfH3Bg5+vgwpjLvErNibhlxOpG/Cv9h8B1KFdUP8wYmKcmlg2Oz2NoWhNOv
 kS+CF9exwRZWQj8fDKpPFDC0+hVyMv0jsjFFKKX1smdUmbxuREmlAv5R9yfzEqRCZPrxSDnP726
 R99BQczsVawzWR9emiYnxPcFbJYRhivwCrU7is3fLUhFrLTZ0/14TH2Ad13YnwTLy7JyxkwE6aA
 m1yRffGsUlPhdj61XkB0g7E1pm2IrfzLqjWy/4+gL1aO/51ypKcEujwke3ScjYyM/uD1Ksoa2nk
 leczuQ0BN1/G4g6CjQUXT0yurvBElCTKTH5tykk7lgTKEzidHR+3Z8W5vYeJpHO0xxNCDpcCTPd
 sM5cD3HfMGnSDA4QHHP86W3T5KQ39Zj9F+ReAkNh57242lOQVwlmmULTB5XgqbPZeis3lCnagQ7
 AOPmO8xcoZFsFsZAEzGe+jLBC+c1oHTFeiSr2TeOH5r8uKodJgTF/P1Lut56n5OEdymXQLsKUK+
 U2UWn5trw3E7WLt02NPaAtONkciykEDIS1/
X-Received: by 2002:a17:90a:d44d:b0:3a0:b312:1fbe with SMTP id
 98e67ed59e1d1-3ab3a911731mr14952919a91.23.1792070204147; 
 Thu, 15 Oct 2026 06:16:44 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac94792925sm4381853a91.13.2026.10.15.06.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:16:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/9] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
Date: Thu, 15 Oct 2026 16:16:10 +0300
Message-ID: <20261015131616.3172918-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
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

