Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD802CA601D
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 16:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AB310EA76;
	Fri,  9 Oct 2026 16:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LSP9I+YL";
	dkim-atps=neutral
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5752610E192
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 16:37:51 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-cc147d86bebso1385791a12.0
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Oct 2026 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791563871; x=1792168671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yqzgQRhtLUgBvyE6Tv5C6cvJrsB2XzN26MuAATp8E0Y=;
 b=LSP9I+YLuLedt2MBC4m1K7Gbkt1PFiXu2T/qdwX/ijvN7OIm6R/0sqpAvQhPyI1MfA
 +nwFcdyaGxFJocsJv9Lc+zNWU7j8R5NtAjwo/5YRx/EBazfPgqwR3MDs8V6MsFK+wnQb
 xbFM8hVeGzVeCJytYYUDlLg0T1FSBU7YAAJds5qykTRttvbBtAOwn/gDLhCDQGDB1ihN
 JsA9/BNOoOg3k7UdIReRLgAPFjkErlOCJgLpHtjPn99f1MxYvTuLJII490sALJl1xNjv
 HIF68ysqIA7Xug2cXpKCkU1EpcovsDgqMXeCyK2vldWQAzdclftdbMYWq+YYVqfKqOU9
 qWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791563871; x=1792168671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yqzgQRhtLUgBvyE6Tv5C6cvJrsB2XzN26MuAATp8E0Y=;
 b=BIIEBBu2zmJoh1z7VGtQM2Gx29Cy20BNoKWMvwPbBPrCYCVZAnIbEGtTtOZbRp0eZF
 kGfYoxbxpvkuvUE8ErOVxbHO+rNFUAvfsJEFpRsDJRvj3YHdYssXAq/ygMQAAbiqcPHN
 k1u8zuE9ybY3lRThwTJkIoFQ5FyCBeAQXgGtDsiTXoaDv9OeM6Kd7ZIWq4tyQz66Kr+C
 N6VXO8+4+nc0G4bnRFb0rf0IchBACpg4f2cGyUwJcPeVGZtEMkqOq/ov93m29eQ5ThxH
 UnPokRooaKeeiBhQmZlnMclTnpnb5yo/Jpyv5+1WDbSHTl041JLq0en2h+P79bBXVAvl
 eZaw==
X-Gm-Message-State: AFuF++lZ34bzs8filKz1eG/X838qT0lusHzbryyqkZ6AKG3u96wC5LS8
 wuV/iQtvRlXmZurrgUIu+IfvFpqahn9x8LM8JNWp6AP0Mz7OKci6emlWM2sZjKEH+DY=
X-Gm-Gg: AYBFou0pk9PbKKyuHSo4USG+AIWFiDsCpVVseXexcwI0SywG5B7uHx7tVN2lm4toSk5
 X+TcAckYGgf8hw6rTVT4syvl8C3IX5ZMofdPkQKOZmiLfjci6K8T8YqGr5Wgf6oXx/xvcXRFQwJ
 jyI4dvW6fhDr1B9FhURYX6HjVvSU2u0yhAHeEfJ24Gm1u1SaYEO05DzcNHTB4/OTceR0q/nusNx
 BeumUabXn0QRZb37ofq3uDbXRUClqHaDZOnMy+F46jEmx7G1SoKvjYsDEczojpj/2fNydz6Uv7z
 VV8QijOXsYA+6Lt+5xF+RHyozQ2yrWFHMtgrmbjOc3XfdGQBXFWcwuooHEctb+tnPGRZrfqf0QO
 wIVg/oIPmJ3mtek1BSjEqKRSQfQ0J1zjk0u0T3271hSZKvnrPkl2lmB0mnhtw+fshmm0LpBcHI7
 esn1pZOzRnTqFb38ADNDW3vM/XL2p9uuFGUVu2wy8OrEbLhNS7/NHKYF+B790dfbL1g30MAD4m4
 hc0an+ZCDJPgPGD677kdvBCeNKY+J6UyouMONMFwo4vmMw=
X-Received: by 2002:a05:6a21:1f89:b0:3e0:da23:8743 with SMTP id
 adf61e73a8af0-3e16bdc13f9mr1590818637.23.1791563870617; 
 Fri, 09 Oct 2026 09:37:50 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-896c3106de6sm1390590b3a.14.2026.10.09.09.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 09:37:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/5] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
Date: Fri,  9 Oct 2026 19:37:12 +0300
Message-ID: <20261009163714.3809917-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
References: <20261009163714.3809917-1-juhapekka.heikkila@gmail.com>
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

