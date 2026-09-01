Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B70C624D3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B7710E40C;
	Tue,  1 Sep 2026 17:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KZL3qQh1";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6B510EDED
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 17:07:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2ceab75934dso15415ad.2
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Sep 2026 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788282479; x=1788887279; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5M1ZkL1K57o8fy0y7BH71wmqdDpOhOWrfX7+5QNOpMY=;
 b=KZL3qQh1QHxKi/3iwIz3iMvhbbuhlG5uLuBayiJEeaVjcRZFxC42ua4DPt6sNG2qKT
 zrCIoxk5WKPiZSnTDx4wpdf3LV5D9AohBnYFrlebtdFKvG/UuYp0N07kT2ge77PlDkvw
 /Mim4Kgo9VgB+NgZJshFQHQBAkAhD3A9y6UAt1cVK5D6oWoOB2d7G7Jm+wIyptV2ncQA
 MuUQE8z5qT0p9ubB70Nq7B65vjsuTThbsGAPjTQlhfAhd9OfbX30ePg4IQxP+0HYBL83
 mt6zT22FZEb0wZRFQR9vrfLBF8LFAkL2atzg4FQG3LQr2Hs0fI0pBDKswGvkqiY6XzUT
 ZeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282479; x=1788887279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5M1ZkL1K57o8fy0y7BH71wmqdDpOhOWrfX7+5QNOpMY=;
 b=syfvjExneO1xOXVl0plA7bYUeqa0Qg/H3RS4DI3cVghlO88gCM26cutnMDogSaHL2o
 CwI8u9f8cCqYHIR3gDTi5WOfPQdBUvnJK581tVoiWO6MSsVbmTZguf9Su8QF4SyA2SBv
 QJ1GF18zfyuAEkvABHRHJyMLnreHGuChN4T11C7srv5f4Y+xkE5G9kvnKR8FFlC7uEBl
 nlq4uJLr0vIBfbMVbhV4NQiFL6YrS3KX5gM/o0zCHrH3F2qaNKJHUUznCzUzIZQCP7/a
 4vpL2ekMkL/QoXZ8n5FTQm6gseSClbs0B2SLD+WfQ5j6f8Adp3R4TCRJTqFiqHzm5qSc
 ++Eg==
X-Gm-Message-State: AFuF++mSCbC7qtUUMe+ElXtHugl/rc7qEqtHL9lOSXvjh+f8Jj4b4txN
 +dOJ00T+zbgm6a3dSwgmfj9B7qyMkBZ1B3LM4Uch/tRasUnyEDbm01v/W4xzecOO3+LSJA==
X-Gm-Gg: AYBFou0Q38D0BZP2VZv9q9KRiHFx6nj/7NRcvNe6b/BS88/KnEbm+LZ6flZj3S9Dpb5
 nmBR2pWHFa+cEDhKJvN3BmQiH1etWyNJJsKtBKmLZOIQBBFB182bwLYDqxgtu98gIDyrmIzNxEq
 o31hRnNZsz0gPQTljbQje3Z1KCAGqQSLoNom7wpspJqeGzzeE5EJwQhMKr1AJdbLP8geJ/0fHq8
 yYX2cC1T6ZJsCevsZu/OnoIfrrOVqFldhCZ+WwsZgMSYSCT3lfnkhfYtrugN6Axna4bX+Xzrxi5
 W3GvNiUJeX7T+6QFWP+A9D3+4UjICDNmIzU0A4XW6hgh6j2+unF4Noz7nUIV6a9RZZF+GPvO9Lq
 SBv2FrYyB3122x4bq36b4lKqqfUYxIirFHa+HX2h3c2J6OYj0j4t3pYY/glhlM+TmS3C9LiZTGF
 j8pNBqhA6kqST9VkomjffsBx3UpthFaK2USEdJ8Ez6QHYreUcoFfDnPBmMnXb6JGNKkOuJ4oFgL
 axcpFTpl86RVGpTRxb5wmRz+Ko=
X-Received: by 2002:a17:902:c946:b0:2d8:d4d0:792f with SMTP id
 d9443c01a7336-2d8d4d079bdmr303954325ad.19.1788282478233; 
 Tue, 01 Sep 2026 10:07:58 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dadd4885c7sm1710155ad.50.2026.09.01.10.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 10:07:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/5] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
Date: Tue,  1 Sep 2026 20:07:38 +0300
Message-ID: <20260901170740.1079715-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
References: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
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
index b7980d6f8..59ec309ba 100644
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
+	mode = igt_output_get_highres_mode(output);
+	igt_require(mode);
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

