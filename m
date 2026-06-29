Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6ACC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 18:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEB10E0D3;
	Mon, 29 Jun 2026 18:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHqM7pJq";
	dkim-atps=neutral
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BA810E0C7
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 18:00:48 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-30bc871ecdfso4812777eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782756048; x=1783360848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CCz1yvhdHqCmDpgQNMBXQWKbiF3LdezWnIahzx+R+5g=;
 b=iHqM7pJqmPcHStLKYtZCx0/VYhHLqcbQRDw46VO1OGaPb+dcjZAPBLENZ40JsA6hjl
 aMVx/7I6yMEj6c9hIhOnbbk9PUId/g50tlINxBpRd2wr0bdisISMPpk6GRaYtPcY1RMe
 LpjTi3b+Kq7zvk1bYw06Qrk0dJDiO4Sb6fwK7eOaT9JXqE7MaQB+9l6QDp/SsH4OIaDF
 RTj8FJmcyWNkYlstpwHRNfzbcPBmpan3yNrP1l+5yd9jqBkzGLQ1NuYPnknB+jfaMDhR
 eb2XERzHmU12HoUOMRlNUwnv38QyJZDgGayG+P1ZxtCxTG3CHoMg23a+SjWPzLWOIVgz
 HUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782756048; x=1783360848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CCz1yvhdHqCmDpgQNMBXQWKbiF3LdezWnIahzx+R+5g=;
 b=tVP2O/p9VYjLb/Qy7geR9RfCrsRe6Qbb60X9seey64NVmkhhRT+BzRxcEOjvva6111
 SxnmPu7WmGQk4WSmrMVt732SioHtZr3ZvItXs4W5hrE4n9hRvg/yiBG3577oAWB7DDpw
 QrnDJkuT9lP94xADZxNoUgCIRQliHWsbWKTWt4DUDDY2Gtjim4tyUgfUlvPK1RlLQUZS
 HhkcFbREiLuiaXyjxiY1Hj+aTacFiibHRnE7MXbk0fycRqtKYGZIrTfCEJQaj6fEEh6s
 ltRKVAepvGOmnvDqzI0giINWCn3rXg9oKzJLkLlfEUIXJBGXuFm/Yp0cjM5JA/c9BYN9
 Mh5Q==
X-Gm-Message-State: AOJu0YyZeFi543ICMSNYJoJabuQcGDsRky9AYlVDeaAm/T2J+c+A42jA
 KvUa2WpHJRkpG2fk1OQIbe74+CAPjiDj/DleKoiegqazm7RwSNOkvLBapC9++tKUB1U=
X-Gm-Gg: AfdE7cnoNm++DgHVOaMsge4ysdi0ijfletD5xY+EJmsm9ZKnSMGJZS2t2ELq/wEC+VO
 MKTw6w4j4jXFjJcqOKbmU7u344wUi8tjfa09e1eEZC57SrH2Qnq9jPN3gDessQfYm3e28y8UVtP
 7HAJ5vBL7cdkOcQ8JQWG9yyl/81tLkG8+1V9ox6dyXICLvS8CTR0FsA9B9CiKp0BehT7fuVrehh
 Pi0Ze0HVHtK3tm9JDsiExMx/vgniEoy+/KTarI8sVn+dy5xj3b7R6w6JYK60ef9QqEoiL86wByD
 2cJppA+g2Cm1kvHW64Iku0ZE+9RT5SfAyRgsKHZm48/mDYWg0tkY+ocYdlaJ2YKEV8I/dYOETpE
 ezpzz4HQTe93jMboysEpAewujZVuhbFHUoeWof//YzMeKkkF2+jG7TdOCg2YByYe9BdLx7+ke4F
 zEdk8oesmgNeIEqOa/Nz7YlbyILH8KvMzrD0xIT/hBjzEYxbP+
X-Received: by 2002:a05:7300:a994:b0:30e:cda8:e37 with SMTP id
 5a478bee46e88-30ee146e061mr290838eec.20.1782756047961; 
 Mon, 29 Jun 2026 11:00:47 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c944999adsm42656184eec.24.2026.06.29.11.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:00:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/4] tests/kms_plane_scaling: change
 plane-downscale-max-crc to do variations
Date: Mon, 29 Jun 2026 21:00:03 +0300
Message-ID: <20260629180003.3215052-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
References: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
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
downscaled framebuffer renders correctly via. Each pixel
format and axis is a separate dynamic subtest, probed with its
own modeset to verify first-flip-after-modeset work.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 175 +++++++++++++++++++++++++++++++-------
 1 file changed, 143 insertions(+), 32 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 59ec309ba..3f636fe5e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@
 
 #include "igt.h"
 #include "igt_vec.h"
+#include <ctype.h>
 #include <math.h>
 
 /**
@@ -190,10 +191,20 @@
  */
 
 /**
- * SUBTEST: plane-downscale-max-crc
+ * SUBTEST: plane-downscale-max-crc-%s
  * Description: Probe the maximum horizontal and vertical plane downscaling
- *              factor and verify the downscaled framebuffer render correctly
- *              by verifying via crc.
+ *              factor for %arg[1] for each supported pixel format and verify
+ *              the downscaled framebuffer renders correctly via crc. Each pixel
+ *              format and axis is a separate dynamic subtest, probed with
+ *              own modeset to catch first-flip-after-modeset scaling bugs.
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
@@ -716,6 +727,29 @@ static const uint64_t modifiers[] = {
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
@@ -826,31 +860,63 @@ find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
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
+test_downscale_max_crc_one(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
+			   uint32_t format, uint64_t modifier, bool scale_width)
 {
 	igt_display_t *display = &d->display;
-	const uint32_t format = DRM_FORMAT_XRGB8888;
-	const uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	const int band = 64;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, scaled_crc;
-	drmModeModeInfo *mode;
+	drmModeModeInfo *highres, mode;
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
 
-	mode = igt_output_get_highres_mode(output);
-	igt_require(mode);
-	igt_output_override_mode(output, mode);
+	highres = igt_output_get_highres_mode(output);
+	igt_require(highres);
+	mode = *highres;
+	igt_output_override_mode(output, &mode);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
@@ -859,21 +925,24 @@ test_downscale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	align = scale_width ? halign : valign;
 
 	/* dst is a thin band spanning the full extent of the scaled axis */
-	dst_w = ALIGN(scale_width ? mode->hdisplay : band, halign);
-	dst_h = ALIGN(scale_width ? band : mode->vdisplay, valign);
+	dst_w = ALIGN(scale_width ? mode.hdisplay : band, halign);
+	dst_h = ALIGN(scale_width ? band : mode.vdisplay, valign);
 	dst_scaled = scale_width ? dst_w : dst_h;
 
 	max_src = find_max_downscale_src_size(d, plane, format, modifier,
 					      scale_width, dst_w, dst_h, align);
 	skip_if_erange_or_einval(max_src);
 	igt_require_f(max_src > dst_scaled,
-		      "No %s downscaling headroom (max src %d, dst %d)\n",
+		      "No %s downscaling headroom for " IGT_FORMAT_FMT
+		      " (max src %d, dst %d)\n",
 		      scale_width ? "horizontal" : "vertical",
-		      max_src, dst_scaled);
+		      IGT_FORMAT_ARGS(format), max_src, dst_scaled);
 
-	igt_info("Max %s downscale: src %d -> dst %d (band %d)\n",
+	igt_info("Max %s downscale for " IGT_FORMAT_FMT " " IGT_MODIFIER_FMT
+		 ": src %d -> dst %d (%.2fx, band %d, align %d)\n",
 		 scale_width ? "horizontal" : "vertical",
-		 max_src, dst_scaled, band);
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 max_src, dst_scaled, (double)max_src / dst_scaled, band, align);
 
 	pipe_crc = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -1828,23 +1897,65 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+				for_each_crtc_with_valid_output(&data.display, crtc, output) {
+					struct igt_vec tested_formats;
+					igt_plane_t *plane;
+					uint32_t format;
+
+					if (!crtc_output_combo_valid(&data.display, crtc, output))
+						continue;
+					if (igt_crtc_num_scalers(crtc) < 1)
+						continue;
 
-				igt_dynamic_f("pipe-%s-%s-horizontal",
-					      igt_crtc_name(crtc), igt_output_name(output))
-					test_downscale_max_crc(&data, crtc, output, true);
+					plane = igt_crtc_get_plane_type(crtc,
+									DRM_PLANE_TYPE_PRIMARY);
+					if (!plane)
+						continue;
 
-				igt_dynamic_f("pipe-%s-%s-vertical",
-					      igt_crtc_name(crtc), igt_output_name(output))
-					test_downscale_max_crc(&data, crtc, output, false);
+					igt_vec_init(&tested_formats, sizeof(uint32_t));
+
+					for_each_plane_format(plane, format) {
+						char fname[32];
+
+						if (!downscale_format_wanted(&data, plane,
+									     format, modifier,
+									     &tested_formats))
+							continue;
+
+						format_name_lower(format, fname,
+								  sizeof(fname));
+
+						igt_dynamic_f("pipe-%s-%s-%s-horizontal",
+							      igt_crtc_name(crtc),
+							      igt_output_name(output),
+							      fname)
+							test_downscale_max_crc_one(&data,
+										   crtc, output,
+										   format, modifier,
+										   true);
+
+						igt_dynamic_f("pipe-%s-%s-%s-vertical",
+							      igt_crtc_name(crtc),
+							      igt_output_name(output),
+							      fname)
+							test_downscale_max_crc_one(&data,
+										   crtc, output,
+										   format, modifier,
+										   false);
+					}
+
+					igt_vec_fini(&tested_formats);
+				}
 			}
 		}
 	}
-- 
2.43.0

