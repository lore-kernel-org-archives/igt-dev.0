Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94ECC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAD310E9EB;
	Thu, 15 Oct 2026 13:22:36 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BAB10E168
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:17:12 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-15354aa70e8so5739216c88.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070232; x=1792675032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YVdu3psf5Fknh68/FV4SzWjfxBWHTG2yKYM1qiW1TYU=;
 b=W1Cu/+khCZmEtnMAH4hwfQlENo43aKoN3erYEER8uMrHfYgZtyANeIwqbjRBzvTHpI
 Q6ah5I2lfv4jL8kLsTK4h34II8mu+hvi2gktxqeSsrpNifd3yeYQaxA7c1dPC9pQd+Wo
 5N2Cw2XmpR1dYIsvDwFwbRqABgfs6GmHCbzER0OBThpRB+1yWUnT5ckudgH1g5VC10LD
 /7/PO6QiLkvZW8Z6rxrpp7G099zWVIJln6Cu5cGK6eYDdhZkBp4ORrCb9puPausRtzEQ
 rSjF9LbPtwXJm6sZylQRF190belhrmNKdbUHn0bwBhM/ShXIvzCdA0PluNATVk6IA911
 iadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070232; x=1792675032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YVdu3psf5Fknh68/FV4SzWjfxBWHTG2yKYM1qiW1TYU=;
 b=a85a9GHg3mAmgfEIkI/H8FZiut/FohnSEx1lgTOlWPh9xSDP1Z1hdqcq1dTY6fly+f
 BuA6NLqoK2Wna2egFgK/2yjRLdV1G2gF8biBewYvWJuHZ5lgDGPHw+N6DBdxupi79TRk
 arDXAeCGjAIjYmnDbtVQzGfczEyOP5Gh3AEA1gnTW68EXYSnrB71CG8oRj5OmwyHb+8k
 KFW9LKbyDTjZPAUiudbE9PDilHwCWFOz6qGrNiEBG9C+jJH/CMtznKYP2zqXuOT9JimN
 /sViApq8P+8CHXhASgjXXUd/9iDxj1TsNBsvkmSyGq62Oj65k6U48krWmrxaKN0kKKlH
 3vXQ==
X-Gm-Message-State: AFq9FYLNJueSSftWDFu8bR+0FbtCllMcEm9QmIHfN789hXe1gJAj+dzg
 /gIN/lusJnt7O9gwGH6niG3JPNndADVE5dVtIO4i6TWU4v45sx6DQOwzYvix3SrLueU=
X-Gm-Gg: AYBFou0/jJGCC8Yrvye4pqvz+JqfFlgXb8/GZgieUss/+XiLgLgIcvcKhKDbMRd/B58
 icEh7rT/bqm44gdU/tuYmnRvlnlXU/meOwPV2oLxxvyei5HVNA1bSOaHX+7x6dkvBvREgqVCHE6
 wXfDrYujgIFfa82pML64wEk+D5eAbBZ4acc4WKQKsXkgeDXnMtWwGYixPqbJPlybFZjCafNS7rd
 Ka5//yCyr+G0NgOXzyslzHagpyLoO3017E04ujB/wtCxF8RGXRZHcuQVIlUlqddI2I02/IZOWog
 U62t6hbyWkIJRnz4w4iB1nu38V27FQ2rkb4Np7hJa5NsuQ/BBewds3poQDpQ3G6mk7n22b8TJMb
 HUZ1wMGt8DP5jZ4EMAv5MeZ7cppFC2YQ6kl6yY2bSYMdiPF+FT9OlVFcmmpyNjFItVcMPyL5y8I
 CihlwoCachxHF5e/zieJXRviaPkDl2mQqKr0kcwbrnARkAFdxucuFTdsp2uzif3vez6Rqr5QaOF
 ZKfONprthsLg5pbkOqPr+OfH7ubruu1lwAktDmsDy0DpA==
X-Received: by 2002:a05:7022:150e:b0:163:bee9:b250 with SMTP id
 a92af1059eb24-16a5ef287c9mr28980839c88.22.1792070231472; 
 Thu, 15 Oct 2026 06:17:11 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a42407e7sm55938049c88.15.2026.10.15.06.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:17:10 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/9] tests/kms_plane_scaling: test overlay plane in
 plane-*-max-crc
Date: Thu, 15 Oct 2026 16:16:15 +0300
Message-ID: <20261015131616.3172918-8-juhapekka.heikkila@gmail.com>
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

After primary plane, put first overlay plane alone in place of primary at
the same scaling limit and check it produces the same crc as the unscaled
reference. If overlay does not accept primary plane limits,
search its own limit and report difference. Overlay is skipped if it does
not support the format, modifier or rotation under test.

With at least two scalers on pipe, also scale primary and overlay at
the same time into adjacent bands and compare against both planes unscaled,
so second scaler on pipe gets crc checked as well.

Each failing step is reported by axis and plane in the final assert.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 160 ++++++++++++++++++++++++++++++--------
 1 file changed, 129 insertions(+), 31 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 336dd46d2..176ab6b65 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -900,7 +900,8 @@ struct scale_axis {
 	bool scale_width;
 	struct igt_fb fb;
 	int dst_w, dst_h, dst_scaled, limit;
-	bool tested, failed;
+	int align, cap;
+	bool tested;
 };
 
 /* 90/270 rotation swaps which source axis lands on the scaled dst axis. */
@@ -1023,6 +1024,50 @@ static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
 	free(lut);
 }
 
+static bool scale_has_headroom(enum scale_dir dir, int limit, int dst)
+{
+	if (limit < 0)
+		return false;
+
+	return dir == SCALE_DOWN ? limit > dst : limit < dst;
+}
+
+static void scale_plane_set(igt_plane_t *plane, struct scale_axis *a,
+			    igt_rotation_t rot, int len, int x, int y)
+{
+	int w, h;
+
+	scale_src_size(a, rot, len, &w, &h);
+	igt_plane_set_fb(plane, &a->fb);
+	igt_plane_set_rotation(plane, rot);
+	igt_fb_set_position(&a->fb, plane, 0, 0);
+	igt_fb_set_size(&a->fb, plane, w, h);
+	igt_plane_set_position(plane, x, y);
+	igt_plane_set_size(plane, a->dst_w, a->dst_h);
+}
+
+static bool scale_try_commit(igt_display_t *display)
+{
+	return igt_display_try_commit_atomic(display,
+					     DRM_MODE_ATOMIC_TEST_ONLY |
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL) == 0;
+}
+
+static void scale_crc_check(const igt_crc_t *ref, const igt_crc_t *crc,
+			    const char *axis, const char *step,
+			    char *failures, size_t len)
+{
+	size_t used = strlen(failures);
+
+	if (igt_check_crc_equal(ref, crc))
+		return;
+
+	igt_critical("CRC mismatch on %s %s\n", axis, step);
+	snprintf(failures + used, len - used, "%s%s %s",
+		 used ? ", " : "", axis, step);
+}
+
 static void
 check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 			uint32_t format, uint64_t modifier, enum scale_dir dir,
@@ -1035,10 +1080,11 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		{ .name = "vertical", .scale_width = false },
 	};
 	igt_pipe_crc_t *pipe_crc;
-	igt_crc_t ref_crc, scaled_crc;
+	igt_crc_t ref_crc, both_ref_crc, crc;
 	drmModeModeInfo mode;
-	igt_plane_t *plane;
-	int halign, valign, dalign;
+	igt_plane_t *plane, *overlay = NULL;
+	int halign, valign, dalign, num_scalers;
+	char failures[256] = "";
 	char limits[128] = "";
 	bool any_tested = false;
 	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
@@ -1066,6 +1112,18 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
 
+	if (igt_crtc_count_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY) > 0)
+		overlay = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY);
+	if (overlay && (!igt_plane_has_format_mod(overlay, format, modifier) ||
+			!igt_plane_has_rotation(overlay, rot))) {
+		igt_debug("Overlay plane skipped, no " IGT_FORMAT_FMT " "
+			  IGT_MODIFIER_FMT " rotation %s support\n",
+			  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+			  igt_plane_rotation_name(rot));
+		overlay = NULL;
+	}
+	num_scalers = igt_crtc_num_scalers(crtc);
+
 	yuv_src_alignment(d, format, rot, &halign, &valign);
 	/* Each dst side is also a source side at 1:1, possibly rotated. */
 	dalign = max(halign, valign);
@@ -1084,6 +1142,8 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		a->dst_scaled = a->scale_width ? a->dst_w : a->dst_h;
 
 		cap = scale_src_cap(d, dir, src_width, a->dst_scaled, align);
+		a->align = align;
+		a->cap = cap;
 
 		/* Every probed and committed source is a crop of this fb. */
 		scale_src_size(a, rot, cap, &w, &h);
@@ -1092,9 +1152,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 		a->limit = find_scale_src_limit(d, plane, &a->fb, dir, a, rot,
 						align, cap);
-		if (a->limit < 0 ||
-		    (dir == SCALE_DOWN ? a->limit <= a->dst_scaled :
-					 a->limit >= a->dst_scaled)) {
+		if (!scale_has_headroom(dir, a->limit, a->dst_scaled)) {
 			igt_debug("No %s %s headroom (limit src %d, dst %d)\n",
 				  a->name, scale_dir_name(dir),
 				  a->limit, a->dst_scaled);
@@ -1131,36 +1189,81 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
 		struct scale_axis *a = &axes[i];
-		int w, h;
+		/* The overlay band sits right next to the primary band. */
+		int ox = a->scale_width ? 0 : a->dst_w;
+		int oy = a->scale_width ? a->dst_h : 0;
+		int ovl_limit;
 
 		if (!a->tested)
 			continue;
 
 		/* Reference: unscaled crop of exactly the destination size. */
-		scale_src_size(a, rot, a->dst_scaled, &w, &h);
-		igt_plane_set_fb(plane, &a->fb);
-		igt_plane_set_rotation(plane, rot);
-		igt_fb_set_position(&a->fb, plane, 0, 0);
-		igt_fb_set_size(&a->fb, plane, w, h);
-		igt_plane_set_position(plane, 0, 0);
-		igt_plane_set_size(plane, a->dst_w, a->dst_h);
+		scale_plane_set(plane, a, rot, a->dst_scaled, 0, 0);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
-		/* Test: limit sized crop scaled into the same rectangle. */
-		scale_src_size(a, rot, a->limit, &w, &h);
-		igt_fb_set_position(&a->fb, plane, 0, 0);
-		igt_fb_set_size(&a->fb, plane, w, h);
+		/* Primary: limit sized crop scaled into the same rectangle. */
+		scale_plane_set(plane, a, rot, a->limit, 0, 0);
 		igt_display_commit2(display, COMMIT_ATOMIC);
-		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		scale_crc_check(&ref_crc, &crc, a->name, "primary",
+				failures, sizeof(failures));
+
+		if (!overlay)
+			continue;
+
+		/* Overlay alone in the primary's place, at primary's limit. */
+		igt_plane_set_fb(plane, NULL);
+		ovl_limit = a->limit;
+		scale_plane_set(overlay, a, rot, ovl_limit, 0, 0);
+		if (!scale_try_commit(display)) {
+			ovl_limit = find_scale_src_limit(d, overlay, &a->fb,
+							 dir, a, rot,
+							 a->align, a->cap);
+			igt_info("Overlay %s %s limit %d, primary %d\n",
+				 a->name, scale_dir_name(dir), ovl_limit,
+				 a->limit);
+			if (!scale_has_headroom(dir, ovl_limit,
+						a->dst_scaled))
+				continue;
+			scale_plane_set(overlay, a, rot, ovl_limit, 0, 0);
+		}
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		scale_crc_check(&ref_crc, &crc, a->name, "overlay",
+				failures, sizeof(failures));
+
+		if (num_scalers < 2) {
+			igt_plane_set_fb(overlay, NULL);
+			continue;
+		}
+
+		/* Both planes scaled at once, each into its own band. */
+		scale_plane_set(plane, a, rot, a->dst_scaled, 0, 0);
+		scale_plane_set(overlay, a, rot, a->dst_scaled, ox, oy);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &both_ref_crc);
+
+		scale_plane_set(plane, a, rot, a->limit, 0, 0);
+		scale_plane_set(overlay, a, rot, ovl_limit, ox, oy);
+		if (scale_try_commit(display)) {
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_pipe_crc_collect_crc(pipe_crc, &crc);
+			scale_crc_check(&both_ref_crc, &crc, a->name,
+					"primary+overlay", failures,
+					sizeof(failures));
+		} else {
+			igt_info("Primary and overlay %s %s at their limits "
+				 "rejected together\n",
+				 a->name, scale_dir_name(dir));
+		}
 
-		a->failed = !igt_check_crc_equal(&ref_crc, &scaled_crc);
-		if (a->failed)
-			igt_critical("CRC mismatch on %s %s\n",
-				     a->name, scale_dir_name(dir));
+		igt_plane_set_fb(overlay, NULL);
 	}
 
 	igt_plane_set_fb(plane, NULL);
+	if (overlay)
+		igt_plane_set_fb(overlay, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
@@ -1172,13 +1275,8 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	if (mask_lut)
 		set_legacy_lut(d, crtc, 0xffff);
 
-	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
-		     igt_skip_crc_compare,
-		     "%s%s%s %s CRC mismatch\n",
-		     axes[0].failed ? axes[0].name : "",
-		     axes[0].failed && axes[1].failed ? " and " : "",
-		     axes[1].failed ? axes[1].name : "",
-		     scale_dir_name(dir));
+	igt_assert_f(!failures[0] || igt_skip_crc_compare,
+		     "%s CRC mismatch on: %s\n", scale_dir_name(dir), failures);
 }
 
 static void
-- 
2.43.0

