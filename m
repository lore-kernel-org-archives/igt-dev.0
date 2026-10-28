Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A36606A31F
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Osraf+Ju
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57B410FD11;
	Wed, 28 Oct 2026 14:55:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7D10FCFF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:52:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-886e61fa30fso536509b3a.1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199171; x=1793803971; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cxa85dQLCDPZUxNptSAE8JizUIOBogvT4oJXm852EbM=;
 b=Osraf+JuO61JQtbLlxsjLjQx5RZiyy1Dgmf4wckUOoXgczN94d5spLpIYk/rGayiNP
 IWr5oSushyFYU6AVsV2O/v1gs7Suv/FGygbVN2if97INct6yMbqagZmNJfWoqThvYS0J
 1JgljW4IP9qI0xLr+g2b1exAxHc3R6NjKYYMhgDvHMpIjpEY1dyUUzQLIkeu6OCeT4i0
 FowcyXPclQj91xT4MMsT098szkj7qKFymLALi01W/7kLh2HnUqB/SY72KjFW5mttF9PT
 6DGVkkzGyQBpmYG+sOCnC+xI2VaU1u2qnKDQVbhKeKNwKo5rMKDKXcNnc0tFC8OEmcDj
 wBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199171; x=1793803971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cxa85dQLCDPZUxNptSAE8JizUIOBogvT4oJXm852EbM=;
 b=Ct/QDqI77glF2AjUcK7zkpixNlW6dCEvLKj4ZZbKbHQGYj58ACbE5ZXZTnRFndS3fq
 vnNePuCeNWPEbOgsY8reqmc8opg+cWn3Q5/NIu2naz/BzSgkkGVJ203UFOLvTL5ya6jz
 o0LuoxqgQ3oOByIv+AfBUSPew+/S2QRiGYxGVuXnhZ8NrJ3hbInOhCiuEhCZbj2OhKpv
 XDxOkOEN3Iu9X9bIX6ubIel7I6UvoLu2g9j6AWLXYKAN0ZxEEL6u0M0ucIOjDQVzAYUw
 fm4U/67zX6fnX44WfmmXQzF+/pFoBrLy5e0ahV9oUdhG33+P6jIF3WpHKjt/0FboONrt
 gjYA==
X-Gm-Message-State: AFq9FYIl2WXsbbYh/qnhjOpPrKTSx+rAPv8VBjFt2ZS9MN5qV3YAbQ42
 YDBuoDc/kG9UHEqX4u7J4QFCAYLoV0pRakzVLvIrVYQ4HwDmOjU+yttP30bLBlCUFos=
X-Gm-Gg: AYBFou3TLoZFfw9V37Di/eHLbdcIVW/AMGG/USL7ZCJ8HT2XhoKTtQiUSzn9lSV+HAD
 tGG48sm0cHD3A+yutqgKkGhM/iDNM+rJdbYp7nAZPBdoEb6kFJDWwABDWSwlcV0tQ0kFTiVrK91
 lzkehgzFRERBpX7c3kZWyuuirczfUPMVRrUyQU+9p6RCYKwBgEHm5wwVCrWGBbVeIEgkUOM4WLP
 zljk+CCzKdlv7eo9p4aan+suImX+xz8nZcQtBVtr4z4RNAAYhfhjsxGAqx1l6oWJkXeiC8K3Bso
 BWHqt+gLOfVQ4CL6DLkOqGFCioNGLhf9PI1Zesec/ZNNuc+6ivUkRl6TwljnTclgr80brdXXCtw
 hiZX+qX46Miso6joTkoDUeoSMtt9VYhTM0vPS2LpMEPY6yF+TYMnwHCi16GggUyop/rXu3ntJYw
 nmkajglUIf2Z/AyBzwESARgrimj0+p8xPNEEpwTrbezd1JlfKvGIrmNvgmoVrchDHzyp5WgnhtW
 LRVb3ev8s2TNI9mt4JUlFfzEINe16aek63bkKpw8a9OeXy5CZXcwURGUsPPgeCoBOKA7gWARuY2
 W6XQmXCgEfrLCcFLzaCyanK0vGhdHopm75bynbygl46PGSny1u1GaDxXuaoRoe/sax0=
X-Received: by 2002:a05:6a00:1896:b0:89e:7bfa:f880 with SMTP id
 d2e1a72fcca58-8a6e65350edmr2017583b3a.11.1793199170671; 
 Wed, 28 Oct 2026 07:52:50 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8a6a3d5e08bsm1325478b3a.5.2026.10.28.07.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:52:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH i-g-t 04/10] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
Date: Wed, 28 Oct 2026 16:51:56 +0200
Message-ID: <20261028145202.3128915-4-juhapekka.heikkila@gmail.com>
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
factor for modifiers for each supported pixel format and verify
downscaled framebuffer renders correctly using crc.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_plane_scaling.c | 381 ++++++++++++++++++++++++++++++--------
 1 file changed, 307 insertions(+), 74 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 2b7a6d632..5b35380f6 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@
 
 #include "igt.h"
 #include "igt_vec.h"
+#include <ctype.h>
 #include <math.h>
 
 /**
@@ -190,10 +191,18 @@
  */
 
 /**
- * SUBTEST: plane-downscale-max-crc
+ * SUBTEST: plane-downscale-max-crc-%s
  * Description: Probe the maximum horizontal and vertical plane downscaling
- *              factor and verify the downscaled framebuffer render correctly
- *              by verifying via crc.
+ *              factor for %arg[1] for each supported pixel format and verify
+ *              the downscaled framebuffer renders correctly via crc.
+ *
+ * arg[1]:
+ *
+ * @linear:     linear
+ * @x-tiled:    X-tiled
+ * @y-tiled:    Y-tiled
+ * @yf-tiled:   Yf-tiled
+ * @4-tiled:    4-tiled
  */
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
@@ -716,6 +725,29 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+static const struct {
+	uint64_t modifier;
+	const char *name;
+} downscale_modifiers[] = {
+	{ DRM_FORMAT_MOD_LINEAR,	"linear" },
+	{ I915_FORMAT_MOD_X_TILED,	"x-tiled" },
+	{ I915_FORMAT_MOD_Y_TILED,	"y-tiled" },
+	{ I915_FORMAT_MOD_Yf_TILED,	"yf-tiled" },
+	{ I915_FORMAT_MOD_4_TILED,	"4-tiled" },
+};
+
+static const char *format_name_lower(uint32_t format, char *buf, size_t len)
+{
+	const char *name = igt_format_str(format);
+	size_t i;
+
+	for (i = 0; i < len - 1 && name[i]; i++)
+		buf[i] = tolower(name[i]);
+	buf[i] = '\0';
+
+	return buf;
+}
+
 static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t rot,
 			      int *halign, int *valign)
 {
@@ -827,93 +859,249 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
 	return best;
 }
 
+static bool downscale_format_wanted(data_t *d, igt_plane_t *plane,
+				    uint32_t format, uint64_t modifier,
+				    struct igt_vec *tested_formats)
+{
+	uint32_t reduced;
+
+	if (!igt_fb_supported_format(format))
+		return false;
+
+	if (!igt_plane_has_format_mod(plane, format, modifier))
+		return false;
+
+	if (!can_scale(d, format))
+		return false;
+
+	/* Test each format "class" only once unless --extended was given. */
+	if (!d->extended) {
+		reduced = igt_reduce_format(format);
+
+		if (igt_vec_index(tested_formats, &reduced) >= 0)
+			return false;
+
+		igt_vec_push(tested_formats, &reduced);
+	}
+
+	return true;
+}
+
+#define LUT_MASK 0xf800
+
+static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
+			   uint16_t mask)
+{
+	drmModeCrtc *drm_crtc;
+	uint16_t *lut;
+	int i, lut_size;
+
+	drm_crtc = drmModeGetCrtc(data->drm_fd, crtc->crtc_id);
+	lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
+
+	/* Skip if legacy LUT is not supported: */
+	if (!lut_size)
+		return;
+
+	lut = malloc(sizeof(uint16_t) * lut_size);
+
+	for (i = 0; i < lut_size; i++)
+		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
+
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, crtc->crtc_id,
+					  lut_size, lut, lut, lut), 0);
+
+	free(lut);
+}
+
+struct scale_axis {
+	const char *name;
+	bool scale_width;
+	int dst_w, dst_h, dst_scaled, limit;
+	bool tested, failed;
+};
+
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       bool scale_width)
+check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			    uint32_t format, uint64_t modifier)
 {
 	igt_display_t *display = &d->display;
-	const uint32_t format = DRM_FORMAT_XRGB8888;
-	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	const int band = 64;
+	struct scale_axis axes[] = {
+		{ .name = "horizontal", .scale_width = true },
+		{ .name = "vertical", .scale_width = false },
+	};
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, scaled_crc;
-	drmModeModeInfo *mode;
-	struct igt_fb ref_fb = {}, src_fb = {};
+	drmModeModeInfo mode;
 	igt_plane_t *plane;
-	int dst_w, dst_h, dst_scaled, max_src;
-	int halign, valign, align;
+	int halign, valign;
+	char limits[128] = "";
+	bool any_tested = false;
+	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
+	bool mask_lut = is_intel_device(d->drm_fd) &&
+			intel_display_ver(d->devid) < 14;
 
 	cleanup_crtc(d);
+	/*
+	 * commit below will significantly slow the test down but is required
+	 * to make the test show all possible expected problems.
+	 */
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_require_pipe_crc(d->drm_fd);
 
 	igt_output_set_crtc(output, crtc);
 
+	if (mask_lut)
+		set_legacy_lut(d, crtc, LUT_MASK);
+
 	/* Preferred mode; the largest advertised one may not be usable. */
-	mode = &output->config.default_mode;
-	igt_output_override_mode(output, mode);
+	mode = output->config.default_mode;
+	igt_output_override_mode(output, &mode);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
 
 	yuv_src_alignment(d, format, IGT_ROTATION_0, &halign, &valign);
-	align = scale_width ? halign : valign;
 
-	/* dst is a thin band spanning the full extent of the scaled axis */
-	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
-	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
-	dst_scaled = scale_width ? dst_w : dst_h;
+	/* Search both axes first so the CRC phase only commits known limits. */
+	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
+		struct scale_axis *a = &axes[i];
+		size_t used;
+
+		/* dst is a thin band spanning the whole scaled axis */
+		a->dst_w = ALIGN(a->scale_width ? mode.hdisplay : band, halign);
+		a->dst_h = ALIGN(a->scale_width ? band : mode.vdisplay, valign);
+		a->dst_scaled = a->scale_width ? a->dst_w : a->dst_h;
+
+		a->limit = find_max_downscale_src_size(d, plane, format,
+						       modifier,
+						       a->scale_width,
+						       a->dst_w, a->dst_h,
+						       a->scale_width ?
+						       halign : valign);
+		if (a->limit < 0 || a->limit <= a->dst_scaled) {
+			igt_debug("No %s downscaling headroom "
+				  "(max src %d, dst %d)\n",
+				  a->name, a->limit, a->dst_scaled);
+			continue;
+		}
+
+		a->tested = true;
+		any_tested = true;
+
+		used = strlen(limits);
+		snprintf(limits + used, sizeof(limits) - used,
+			 "%s%s src %d -> dst %d (%.2fx)", used ? ", " : "",
+			 a->name, a->limit, a->dst_scaled,
+			 (double)a->limit / a->dst_scaled);
+	}
 
-	max_src = find_max_downscale_src_size(d, plane, format, modifier,
-					      scale_width, dst_w, dst_h, align);
-	skip_if_erange_or_einval(max_src);
-	igt_require_f(max_src > dst_scaled,
-		      "No %s downscaling headroom (max src %d, dst %d)\n",
-		      scale_width ? "horizontal" : "vertical",
-		      max_src, dst_scaled);
+	if (!any_tested) {
+		if (mask_lut)
+			set_legacy_lut(d, crtc, 0xffff);
+		igt_skip("No downscaling headroom on either axis for "
+			 IGT_FORMAT_FMT " " IGT_MODIFIER_FMT "\n",
+			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier));
+	}
 
-	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
-		 scale_width ? "horizontal" : "vertical",
-		 max_src, dst_scaled, band);
+	igt_info("Max downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": %s\n", IGT_FORMAT_ARGS(format),
+		 IGT_MODIFIER_ARGS(modifier), limits);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
-	/* Reference: unscaled solid-green framebuffer of the destination size. */
-	igt_create_color_fb(display->drm_fd, dst_w, dst_h, format, modifier,
-			    0.0, 1.0, 0.0, &ref_fb);
-	igt_plane_set_fb(plane, &ref_fb);
-	igt_fb_set_position(&ref_fb, plane, 0, 0);
-	igt_fb_set_size(&ref_fb, plane, dst_w, dst_h);
-	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, dst_w, dst_h);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
-
-	/* Test: larger solid-green source downscaled into dst rectangle. */
-	igt_create_color_fb(display->drm_fd,
-			    scale_width ? max_src : dst_w,
-			    scale_width ? dst_h : max_src,
-			    format, modifier, 0.0, 1.0, 0.0, &src_fb);
-	igt_plane_set_fb(plane, &src_fb);
-	igt_fb_set_position(&src_fb, plane, 0, 0);
-	igt_fb_set_size(&src_fb, plane,
-			scale_width ? max_src : dst_w,
-			scale_width ? dst_h : max_src);
-	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, dst_w, dst_h);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-	igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
+		struct scale_axis *a = &axes[i];
+		struct igt_fb ref_fb = {}, src_fb = {};
+
+		if (!a->tested)
+			continue;
+
+		/* Reference: unscaled solid-green fb of the dst size. */
+		igt_create_color_fb(display->drm_fd, a->dst_w, a->dst_h,
+				    format, modifier, 0.0, 1.0, 0.0, &ref_fb);
+		igt_plane_set_fb(plane, &ref_fb);
+		igt_fb_set_position(&ref_fb, plane, 0, 0);
+		igt_fb_set_size(&ref_fb, plane, a->dst_w, a->dst_h);
+		igt_plane_set_position(plane, 0, 0);
+		igt_plane_set_size(plane, a->dst_w, a->dst_h);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+		/* Test: larger solid-green source downscaled into dst. */
+		igt_create_color_fb(display->drm_fd,
+				    a->scale_width ? a->limit : a->dst_w,
+				    a->scale_width ? a->dst_h : a->limit,
+				    format, modifier, 0.0, 1.0, 0.0, &src_fb);
+		igt_plane_set_fb(plane, &src_fb);
+		igt_fb_set_position(&src_fb, plane, 0, 0);
+		igt_fb_set_size(&src_fb, plane,
+				a->scale_width ? a->limit : a->dst_w,
+				a->scale_width ? a->dst_h : a->limit);
+		igt_plane_set_position(plane, 0, 0);
+		igt_plane_set_size(plane, a->dst_w, a->dst_h);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+
+		igt_plane_set_fb(plane, NULL);
+		igt_remove_fb(display->drm_fd, &ref_fb);
+		igt_remove_fb(display->drm_fd, &src_fb);
+
+		a->failed = !igt_check_crc_equal(&ref_crc, &scaled_crc);
+		if (a->failed)
+			igt_critical("CRC mismatch on %s downscale\n", a->name);
+	}
 
-	igt_plane_set_fb(plane, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
 
 	igt_pipe_crc_free(pipe_crc);
-	igt_remove_fb(display->drm_fd, &ref_fb);
-	igt_remove_fb(display->drm_fd, &src_fb);
 
-	igt_assert_crc_equal(&ref_crc, &scaled_crc);
+	if (mask_lut)
+		set_legacy_lut(d, crtc, 0xffff);
+
+	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
+		     igt_skip_crc_compare,
+		     "%s%s%s downscale CRC mismatch\n",
+		     axes[0].failed ? axes[0].name : "",
+		     axes[0].failed && axes[1].failed ? " and " : "",
+		     axes[1].failed ? axes[1].name : "");
+}
+
+static void
+test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+		       uint64_t modifier)
+{
+	igt_plane_t *plane;
+	struct igt_vec tested_formats;
+	uint32_t format;
+
+	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+	igt_require(plane);
+
+	igt_vec_init(&tested_formats, sizeof(uint32_t));
+
+	for_each_plane_format(plane, format) {
+		char fname[32];
+
+		if (!downscale_format_wanted(d, plane, format, modifier,
+					     &tested_formats))
+			continue;
+
+		format_name_lower(format, fname, sizeof(fname));
+
+		/* Per-format dynamics keep dmesg within the log budget. */
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(output), fname)
+			check_one_downscale_max_crc(d, crtc, output, format,
+						    modifier);
+	}
+
+	igt_vec_fini(&tested_formats);
 }
 
 static uint32_t
@@ -1534,6 +1722,49 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 	return ret;
 }
 
+static bool
+find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
+			    igt_output_t **found_output)
+{
+	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+	uint64_t best_area = 0;
+
+	*found_crtc = NULL;
+	*found_output = NULL;
+
+	for_each_crtc_with_valid_output(display, crtc, output) {
+		drmModeModeInfo *mode;
+		uint64_t area;
+
+		if (!crtc_output_combo_valid(display, crtc, output))
+			continue;
+		if (igt_crtc_num_scalers(crtc) < 1)
+			continue;
+
+		mode = &output->config.default_mode;
+		area = (uint64_t)mode->hdisplay * mode->vdisplay;
+		if (area <= best_area)
+			continue;
+
+		best_area = area;
+		*found_crtc = crtc;
+		*found_output = output;
+	}
+
+	if (!*found_crtc)
+		return false;
+
+	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
+		  "downscale testing\n",
+		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
+		  (*found_output)->config.default_mode.hdisplay,
+		  (*found_output)->config.default_mode.vdisplay);
+
+	return true;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1829,23 +2060,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Probe the maximum horizontal and vertical plane "
-			     "downscaling factor and verify the downscaled output "
-			     "matches an unscaled reference using CRCs.");
-		igt_subtest_with_dynamic("plane-downscale-max-crc") {
-			for_each_crtc_with_valid_output(&data.display, crtc, output) {
-				if (!crtc_output_combo_valid(&data.display, crtc, output))
-					continue;
-				if (igt_crtc_num_scalers(crtc) < 1)
-					continue;
-
-				igt_dynamic_f("pipe-%s-%s-horizontal",
-					      igt_crtc_name(crtc), igt_output_name(output))
-					test_downscale_max_crc(&data, crtc, output, true);
-
-				igt_dynamic_f("pipe-%s-%s-vertical",
-					      igt_crtc_name(crtc), igt_output_name(output))
-					test_downscale_max_crc(&data, crtc, output, false);
+		for (int m = 0; m < ARRAY_SIZE(downscale_modifiers); m++) {
+			uint64_t modifier = downscale_modifiers[m].modifier;
+
+			igt_describe("Probe the maximum horizontal and vertical "
+				     "plane downscaling factor for each supported "
+				     "pixel format and verify the downscaled "
+				     "output matches an unscaled reference using "
+				     "CRCs.");
+			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
+						   downscale_modifiers[m].name) {
+				igt_crtc_t *sel_crtc;
+				igt_output_t *sel_output;
+
+				igt_require(find_native_res_crtc_output(&data,
+									&sel_crtc,
+									&sel_output));
+
+				test_downscale_max_crc(&data, sel_crtc,
+						       sel_output, modifier);
 			}
 		}
 	}
-- 
2.43.0

