Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0A606A320
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EC3Vut7L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558A410FD13;
	Wed, 28 Oct 2026 14:54:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE4110E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:52:46 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2e9ae391a05so7695655ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199166; x=1793803966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S0zoAHCav+uT2XOlKI2tDsHetBQs4o+p5jjAd3BgXNM=;
 b=EC3Vut7L/4Vp510x7y/cZ0bRpby0YdI8itge5IWGCT9rEN57rn2LdAneK2P4EI57/e
 j2XxfPvSv9DM67YykLH4WyRjH/AfEE7081sf7ihGFok7CpR1ctpkHDdvhkys9P7rxTFD
 rTEGE2h/LDnf0kENsMO61BTYGXC4feA4oe9RSWvoi1djAv1LywJJJ5wEj+Mj9STsy5ZG
 hBUeoVBtp5sgnMQS5W+ya0l26yjusc0dMtkfsUGWsNZqYlrPMSnIag/K0I22FZSN/YAv
 OSdLqfO3R/cPoPqtfmfppx802GPDpkfLWfUi5C9sI1VbwoRT9WyJIYOD1QvdcCtN5Dz5
 lSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199166; x=1793803966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=S0zoAHCav+uT2XOlKI2tDsHetBQs4o+p5jjAd3BgXNM=;
 b=bwWmj+nQuXDj3uf88b5A9W7mY9Q7BiRo53S1pVSO3YhixLDyLcAzexM55vIyBqoHIt
 6zSTXO1rZjJ8YUMeI5jp/fWHq2gzQ8ExyhLjEv7m4Bmrf9xu0AF+VY4U0cG+uidijBnl
 JsfdWSr67cNiuOO9qnFXN0MC56rdcFxp2ZAlZjzhGsWazyMcYdzbKiq8GjL2uvGOpvLI
 cKIo5U8pQLkGvkZX1VkXxS3DV7JEsLAbHJa6lUbT9z9AFGREVSSh8PVPFF1a7mEAhKik
 kskoqtVfpIxckiVl+Ins8+gfdPx+2csVUl2L5uepLxf2xiktafJIj9K362J+kAsRpz3m
 MCCg==
X-Gm-Message-State: AFq9FYK9vlJ3qWM0WMSJjyRS8DfQe8lQHWJACG/QExFncOYszGLRc6J+
 rt7q829sQhoEJRe4BvZZZbe047wDIJa15ByB8WVoKRqlok3DQHZKrf/h+1e2Q2iLHeY=
X-Gm-Gg: AYBFou1llfRR0hjX9K7zkystpW2Nu+1o5g2MPNsEMPKGXKCu0WDLOjGPxVwJPpv98B2
 OGTshG4duQKYpn5o1he+bCHvoJoHKZPMLzGNIwMecsjWwzid0XXodR81XVsXJk02rBy9LRJdxfU
 zXryhh1vOg4gW9hTNss1qmHXoZmryGmvsVerHX+m0QsU0v9frm+AF0CLZogR67TIZ2J4cnbVunf
 O3EXcobTZjcGmuQt8EDHrz+LVH0D6F69AHNufJx2wnLJ/QPHLN1N6ElYJ+seVhb85SPz9N4VCZM
 i/E0+kHUx6fMl6hkgA+OtSy4im2gj0v2JdOMjbl9HHz+6k2KwoM7dcqdanLADkUH2XZ3GsuNCGx
 eNN6Hry1fbAQMMETo7lYAMXgijkiLppzinWg7xqdfr5fdln0RsfsgdK10Q9xIvHlQ3rbOCQHx8v
 YeZzQ+C0ea1hxX8SKj1TggBnCzmj8I/CR+DyKw22lWe68hm5GXLoU0gMJtyUUwSwpJL7lizepv5
 zbs5WbQr3BSsTnyr42HbmIPD0GL0erUX/M/retYNd3yFAMYqSBMZe1rf8era2G8wKapY2e6b77e
 wIrGU5XdxqZJpJZz8FzpCO2GIjb9lUaYxll8XK2oH11omM+Ygb5LmoHYfQlj7HgsYoo=
X-Received: by 2002:a17:902:ef48:b0:2df:b004:df28 with SMTP id
 d9443c01a7336-2eb074f964bmr9922955ad.35.1793199166146; 
 Wed, 28 Oct 2026 07:52:46 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2eae6c9d2cesm23417765ad.65.2026.10.28.07.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:52:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 03/10] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
Date: Wed, 28 Oct 2026 16:51:55 +0200
Message-ID: <20261028145202.3128915-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Probe the maximum horizontal and vertical plane downscaling
factor and verify the downscaled framebuffer render correctly
by verifying via crc.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 146 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 41f56a5ed..2b7a6d632 100644
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
@@ -709,6 +716,36 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
+			      int *halign, int *valign)
+{
+	int disp_ver = is_intel_device(d->drm_fd) ?
+		       intel_display_ver(d->devid) : 0;
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
+	if (disp_ver >= 20 && igt_format_is_yuv_semiplanar(format)) {
+		/* The kernel applies this to display version 35 only. */
+		if (disp_ver == 35)
+			*valign = 2;
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
@@ -790,6 +827,95 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
@@ -1702,6 +1828,26 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

