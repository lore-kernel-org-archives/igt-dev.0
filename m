Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C34BCA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 15:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6D10E45C;
	Thu,  8 Oct 2026 15:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rUfsqs5X";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38C910E45C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 15:16:22 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2e836252e1dso605305ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Oct 2026 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791472582; x=1792077382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=obwUT2Jf86mHcrlFAAGHQei2x6lh9L3mdqgJTif2K1A=;
 b=rUfsqs5XxEzHi/khZ9ay4T3qRIrZ8wjUJwLJgWDuI3KfR/ANCri0Q1HoTu64gwJfNs
 xM4fvDBUpQUvI9ytSqx+I540p5jdR15rEf3cKIvnmeH9+wXyZ+6nXV7LHCZl2XDnaC/k
 J9r4rSFWzUe+T5pGmeha4qsaWAS4pDh3D+RQixn2R+bbO2Sr+fG4a/tXfab+IYUScd2u
 mt3mY4Rjj/8ro4AoCz4H8iTmopduxuOfwV06TztP5nkPNnNjAXN4cu3KgwMyQMJ6pCHb
 +XlJdWEUVO+d4lq9OV1GSB7wNkCNoe+DjeLK6GC+ANRKNTrLugqXk6i46TDIrqczgszg
 Z9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791472582; x=1792077382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=obwUT2Jf86mHcrlFAAGHQei2x6lh9L3mdqgJTif2K1A=;
 b=S2mjgE0GBO5eelxvK89UOchfXfQAdtXSL1/jXh2BxI/7Cq6+nzHRAz2jbadmQKkGoh
 LV3rZJbHwDTrb6ArmvZGuc+hrAGOAJqAHz+LMCRLnUtBtYSA7PKgPEnyR2tgLSI037lp
 VatMeRKDTzzkijvW7FORZ0sudX3MLs1BTd69yCFmqqOsX/YX+f9cvDh9dHHHspcZFZmJ
 /tiOxMl8ddNOy+6yY6+dOZhESqRYK5becV5iztpQanK4aCkIsqpdwEKunAz9GjG67x7m
 O9r04SIqQ0rH48y5Bg4Q9h6nRfeRBYMpLwyDiCbuk8kGqwEJxmz7GjuTv6gzN74sxMsp
 c+xA==
X-Gm-Message-State: AFq9FYLeKyZ2CsLkR0T1DRsIQCGBat1AWW9jQcnxE6hFU5au0jnt57Mn
 RsCqlChWlEl/5jzSuslVER6iozd4H7d05xI/lqc/FabN1Lv+DG0yB+wxSbW0lSzmAm0=
X-Gm-Gg: AYBFou3M8foh+XyepSHqVvo2vuAvKbdF3ggtkdAW5KL4niFAllsYGui0G2ysMSL3N3p
 iV3TB7tTEgc6Qx0pKFZxcin31P1kHzrAtH4SElD8sdXAwqfo3HYgXb2YzcyIY/69pQAwgTuf7bA
 IKZI/f8qS4j/ih4ULVooL3YFUQ6Rew9XRM/g333CQPsvObBazVgbDnMBNELRLENmSPJtmo//XwX
 mzpFPAX5lWpjw45LojeGlP8dK9k1oJf15Gw8Rya0e7khXYnztLg341+XUnMuinUpYdEjtQuCnSm
 AXCoSUxdoJ9kpPGKdnwT8LrV38JRK9q/wXQnxAtV7o61fZAN9dMnwNWCGoCq3nS9bFw1ou0PKAh
 Ev5xGJH9NS+4uY02gss0YzTaKhdOh/oOPtMP2zVKm2b6XxMPXixdHgdX4+hKWY3HTxXXCwmMt6i
 YfqA38DHkiawUslf3mKUrzmXS7kGlQoJMSDYHDK6HvE3WPJ8PQd3UejUl/mW+rFHwIi365X0MJX
 pqLJYQHRcczqd8YgPYa3FjOvBBI3y3yZkgu
X-Received: by 2002:a17:902:f550:b0:2dd:9b53:f9ba with SMTP id
 d9443c01a7336-2e5ffabc105mr53515725ad.1.1791472582137; 
 Thu, 08 Oct 2026 08:16:22 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e604720106sm26812425ad.31.2026.10.08.08.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 08:16:21 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/5] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
Date: Thu,  8 Oct 2026 18:16:02 +0300
Message-ID: <20261008151604.2657835-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
References: <20261008151604.2657835-1-juhapekka.heikkila@gmail.com>
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
index 41f56a5ed..8ca8ba496 100644
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

