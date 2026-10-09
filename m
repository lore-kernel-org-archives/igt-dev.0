Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A42CA601D
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 16:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AA610E0F4;
	Fri,  9 Oct 2026 16:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nFOHxRIt";
	dkim-atps=neutral
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4008E10E192
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 16:37:56 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2df982e04c1so26623965ad.2
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Oct 2026 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791563876; x=1792168676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l/itvxcCOH3iTGedkYG34zfORTAqpPjqmDj3oW2dPK4=;
 b=nFOHxRIt7rz/p3IN3gTqVyY1ZVr0fTadd2L2a6N+8OuUHR/cI9+FyVo0CGEbZYLSuG
 gqF6bwebrl2q70wbJfQIeYy/TIkKr1DqDzXbEU2ZUSG3ahgnyFJxpiOx+N2MCK5uAMrT
 rj2MJqn+eCdeMZ/t+5cf6+ka6mzg3VMWlb86ESzppDthsF8zC2iauwbzZWJkzRW7IlS1
 WHGcVekIDq7OoF3ZIV8O0MBa6Nv8bdktBl7nYSJEJh8pjHDOiI/BkmUSqKhHE3tBxEaL
 w+EUo19rMykgoJ3SldzuLL6twIg20qtEcWzz7D7f6X5toiqNxGC9glbCFAmv29xhH8jD
 Ur5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791563876; x=1792168676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l/itvxcCOH3iTGedkYG34zfORTAqpPjqmDj3oW2dPK4=;
 b=HuYjTNpR9VjP9U5lN3/J2Zj4OhgYjKgKbQDnITyJZRrdwO+//K4JSjU85HkBKRoYWg
 0CmXxEaqXGcziUxror4IXgpqi1OAzEj9efrhR+FiYM3Aw3SOI6tlEvujrAX26TTvwVb7
 foZAw5/fWhsEkCc+pbAnNKv3JT13/mmpWhvGew6OD8vw86fbkaeEwLHjzaEz0bFip4X0
 J0WPiNSrKt1PMGiUd1NQVz3jCWAyYjmoSDhOPd1ZeR7rkbQhdCcD5zv5D2LftQ1a0L3J
 nDfUDfBgz35GmBX79gafVxWvKG+nr2dgq9E8OQSEdVupDgfnCZANmdUedhwp2lObu8nL
 otpw==
X-Gm-Message-State: AFq9FYLSWSgCtvpTENitZp+SEbuBbwezeZeV+IO4nC7yPs3i7makMtYE
 x8k9aXLTofl1HSCYIrZk5CTzc2BWMXA9GJ6YT8xDpvHay8WkRFwWN/ImQRfM6LRsPMc=
X-Gm-Gg: AYBFou2My1CuMtxLLGVpvRJcHeLzkiblEogft7UgmJzPS0yCSKX0z/ohBF8x3Y//gL9
 7Wrrv1lKEkYLOjTSQT8aKbVP3EozNZ7qAX5OHbDyDGSY4MO2q5V0UEh/5wgvVb9bnZpXCaN6tVO
 Hp3tpVYsqdcaIE75I/U7BStjhBL4cYC7sg1nVRwMkFd/bNgGBcjxEBIG9kAJF4I6lEfyCJ63OkF
 rGZshADRUHJEYxhqkhTjc05ASNlxUndwhOIU3UeVT4JZ9zyKE1uTgaEjn9AdcWvIym9/+Ed1HbP
 zik+fFupG/Ld6I9QAeRo24gx0HEAMXLUoTe9gluZR3h/BVSW7Uc70o0zYxMNDjT9R62myQ/gBXc
 vLX9qZNuSGYWEnGrbbljtXLTDmXFF4wEiKB3uQjr+gLbC02nii95uwbFuuDKoW3jEc48vTcNZKj
 AaTtiu5eUAqBmVxdu9o8FXaO/nRmeYJljvPF7LKvztNdkezQRX/zCmEf3gN9A0YuWVgNi9/a4F3
 I07g5fMXq2Xzpnkixo0kmkoWZPFv9+TVtKcLhTxsMyS8Hs=
X-Received: by 2002:a17:902:ce0a:b0:2e8:486b:1046 with SMTP id
 d9443c01a7336-2e8486b1380mr15599025ad.65.1791563875559; 
 Fri, 09 Oct 2026 09:37:55 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd3d9e39ee4sm1313045a12.19.2026.10.09.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 09:37:55 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/5] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
Date: Fri,  9 Oct 2026 19:37:13 +0300
Message-ID: <20261009163714.3809917-4-juhapekka.heikkila@gmail.com>
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
factor for modifiers for each supported pixel format and verify
downscaled framebuffer renders correctly using crc.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 227 ++++++++++++++++++++++++++++++++------
 1 file changed, 191 insertions(+), 36 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4b5730cd1..00822e2a6 100644
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
@@ -826,31 +858,62 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
 static void
-test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
-		       bool scale_width)
+check_one_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			    uint32_t format, uint64_t modifier, bool scale_width)
 {
 	igt_display_t *display = &d->display;
-	const uint32_t format = DRM_FORMAT_XRGB8888;
-	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	const int band = 64;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, scaled_crc;
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 	struct igt_fb ref_fb = {}, src_fb = {};
 	igt_plane_t *plane;
 	int dst_w, dst_h, dst_scaled, max_src;
 	int halign, valign, align;
 
 	cleanup_crtc(d);
+	/*
+	 * commit below will significantly slow the test down but is required
+	 * to make the test show all possible expected problems.
+	 */
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_require_pipe_crc(d->drm_fd);
 
 	igt_output_set_crtc(output, crtc);
 
 	/* Preferred mode; the largest advertised one may not be usable. */
-	mode = &output->config.default_mode;
-	igt_output_override_mode(output, mode);
+	mode = output->config.default_mode;
+	igt_output_override_mode(output, &mode);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
@@ -859,21 +922,25 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	align = scale_width ? halign : valign;
 
 	/* dst is a thin band spanning the full extent of the scaled axis */
-	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
-	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
+	dst_w = ALIGN(scale_width ? mode.hdisplay : band, halign);
+	dst_h = ALIGN(scale_width ? band : mode.vdisplay, valign);
 	dst_scaled = scale_width ? dst_w : dst_h;
 
 	max_src = find_max_downscale_src_size(d, plane, format, modifier,
 					      scale_width, dst_w, dst_h, align);
-	skip_if_erange_or_einval(max_src);
-	igt_require_f(max_src > dst_scaled,
-		      "No %s downscaling headroom (max src %d, dst %d)\n",
-		      scale_width ? "horizontal" : "vertical",
-		      max_src, dst_scaled);
+	if (max_src == -ERANGE || max_src == -EINVAL || max_src <= dst_scaled) {
+		igt_skip("No %s downscaling headroom for " IGT_FORMAT_FMT
+			 " " IGT_MODIFIER_FMT " (max src %d, dst %d)\n",
+			 scale_width ? "horizontal" : "vertical",
+			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+			 max_src, dst_scaled);
+	}
 
-	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
+	igt_info("Max %s downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": src %d -> dst %d (%.2fx, band %d, align %d)\n",
 		 scale_width ? "horizontal" : "vertical",
-		 max_src, dst_scaled, band);
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 max_src, dst_scaled, (double)max_src / dst_scaled, band, align);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -915,6 +982,49 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	igt_assert_crc_equal(&ref_crc, &scaled_crc);
 }
 
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
+		/*
+		 * One dynamic subtest per format and axis keeps each one's
+		 * log output (incl. dmesg) within the runner's per-dynamic
+		 * subtest disk usage budget.
+		 */
+		for (int axis = 0; axis < 2; axis++) {
+			bool scale_width = (axis == 0);
+
+			igt_dynamic_f("pipe-%s-%s-%s-%s",
+				      igt_crtc_name(crtc),
+				      igt_output_name(output), fname,
+				      scale_width ? "horizontal" : "vertical")
+				check_one_downscale_max_crc(d, crtc, output,
+							    format, modifier,
+							    scale_width);
+		}
+	}
+
+	igt_vec_fini(&tested_formats);
+}
+
 static uint32_t
 test_scaler_with_modifier_crtc(data_t *d,
 			       double sf_plane,
@@ -1533,6 +1643,49 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
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
@@ -1828,23 +1981,25 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

