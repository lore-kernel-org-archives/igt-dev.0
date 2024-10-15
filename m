Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB6CD1D88B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 16:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B0110E0D3;
	Tue, 15 Oct 2024 16:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="crJDBKV6";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D31F10E0D3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 16:22:53 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2e2ad9825a7so3852565a91.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729009372; x=1729614172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EK1TuD18/nexsnDMazAwW64OS8Psu6Y8rkShMaWu0/8=;
 b=crJDBKV6Esbn26+I956KcylSkQBeb4OJHm0LNQ1fAwXtvtiDBKypGwMS6VcFSw+w7X
 6NY9VcSMNiCHfww1fOlZQjgzVYF0lzaElaoNGGv5GrkmVNzrz6lWsoGpjHe1KRzgUVtn
 k66R1JWSeXXskqTI5cVJhyoSPe8ENsNsdEJKNOeXFJyUk3suLe4d/Mjidadm7roghqyY
 Mh0vtdT/x6oy+Ppll1S4ZOHi+c1Rc5i8WqywYs+DtE38XuLWuzEmv/8NsB9fk9U9KD2h
 lXA+wM4z8QfF4+D8wwZZuFa0b8XK3OiVrfVB78+2jAIk155eRQpb9OaRYy2qsJ/KVCAI
 voUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729009372; x=1729614172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EK1TuD18/nexsnDMazAwW64OS8Psu6Y8rkShMaWu0/8=;
 b=XceJ385MfZlYdfx5sEGZkqM5zzKZPYh7SyPpQCDlYiOVpAaQZvppzM9iOJkKrnLYQ+
 Tgmd4GbfOFs/etK6EFueJhfrKFNCMrOThRhK9Jy+hujOfTqluKhhQFW3D0E2Oe44kS6r
 o3wrLxRPca6bVSuO+PqlFJBvSq88jnusNUSMF2kpHP58bGvAxGYz1H/SUt0vgHwYedt3
 X7opw4FCjHkv1Aa1rvcDTDYBnvWTh0Uis2EnyRLeQmRCKPNKEr97nJ1wgfjZgqaM2mrp
 b2DihFd9OlMCfGrYZoZWcxStO6zuK/SA2nLWrpbvebo6/Nr3u2f+VGx4r1D+jTv/sDEg
 BfEA==
X-Gm-Message-State: AOJu0Yze3HMGJg3MVWjjrgAuIRiFneniQE/RjVt5KTpz2TnGzRO/u12G
 0woJiRLu1RM2kpkT22IY19OmRDfLsv+4L3xL2PbvgF+VCcq89Csw7zU5aGP/zMg=
X-Google-Smtp-Source: AGHT+IGybtlh8JRZtGmhnsIlk4rSEHlFWPYfhJtNAY7K602GSMKcG3dN6GmOqt4LYpPv3SmqeAMDIw==
X-Received: by 2002:a17:90a:c094:b0:2c9:a3ca:cc98 with SMTP id
 98e67ed59e1d1-2e3ab7c788dmr888811a91.7.1729009372422; 
 Tue, 15 Oct 2024 09:22:52 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1804b73fsm13857805ad.220.2024.10.15.09.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 09:22:52 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: recycle framebuffers
Date: Tue, 15 Oct 2024 19:26:36 +0300
Message-ID: <20241015162636.2678542-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

framebuffers used in tests don't need to be recreated for each
rendering pipe. Here all framebuffers are buffered and recycled.
This cut execution time of crc tests to roughtly half when running
on discrete graphics.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 117 ++++++++++++++++++++++++++++++------------
 1 file changed, 85 insertions(+), 32 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 49c8828d2..a2be1c47e 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -188,6 +188,16 @@ typedef struct {
 	bool user_seed;
 } data_t;
 
+int fb_list_length;
+struct {
+	struct igt_fb fb;
+	int width, height;
+	double r, g, b;
+	u64 modifier;
+	u32 format;
+} *fb_list;
+
+
 static const struct {
 	double r;
 	double g;
@@ -750,13 +760,50 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
 	access_flat_ccs_surface(fb, true);
 }
 
+static struct igt_fb *get_fb(int fd, u64 modifier, double r, double g, double b,
+			     int width, int height, u32 format, int *goodfb)
+{
+	for (int i = 0; i < fb_list_length; i++) {
+		if (fb_list[i].width == width && fb_list[i].height == height &&
+		    fb_list[i].modifier == modifier && fb_list[i].format == format &&
+		    fb_list[i].r == r && fb_list[i].g == g && fb_list[i].b == b) {
+			if (goodfb)
+				*goodfb = true;
+
+			return &fb_list[i].fb;
+		}
+	}
+
+	fb_list = realloc(fb_list, sizeof(*fb_list) * (fb_list_length + 1));
+	fb_list[fb_list_length].width = width;
+	fb_list[fb_list_length].height = height;
+	fb_list[fb_list_length].r = r;
+	fb_list[fb_list_length].g = g;
+	fb_list[fb_list_length].b = b;
+	fb_list[fb_list_length].modifier = modifier;
+	fb_list[fb_list_length].format = format;
+
+	if (r + g + b == 0)
+		igt_create_pattern_fb(fd, width, height, format, modifier,
+				      &fb_list[fb_list_length].fb);
+	else
+		igt_create_color_fb(fd, width, height, format, modifier, r, g, b,
+				    &fb_list[fb_list_length].fb);
+
+	return &fb_list[fb_list_length++].fb;
+}
+
 static void generate_fb(data_t *data, struct igt_fb *fb,
 			int width, int height,
 			enum test_fb_flags fb_flags)
 {
 	struct drm_mode_fb_cmd2 f = {0};
 	uint64_t modifier;
-	cairo_t *cr;
+	struct igt_fb *temp_fb;
+	bool do_fast_clear = igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier);
+	bool do_solid_fill = do_fast_clear || data->plane;
+	int c = !!data->plane;
+	int goodfb = false;
 	const float cc_color[4] = {colors[!!data->plane].r,
 				   colors[!!data->plane].g,
 				   colors[!!data->plane].b,
@@ -772,47 +819,48 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	else
 		modifier = DRM_FORMAT_MOD_LINEAR;
 
-	create_fb_prepare_add(data->drm_fd, width, height,
-			      data->format, modifier,
-			      fb, &f);
+	if (data->flags & TEST_RANDOM) {
+		create_fb_prepare_add(data->drm_fd, width, height,
+				data->format, modifier,
+				fb, &f);
+	} else {
+		if (do_solid_fill)
+			temp_fb = get_fb(data->drm_fd, modifier,
+					colors[c].r, colors[c].g, colors[c].b,
+					width, height, data->format, &goodfb);
+		else
+			temp_fb = get_fb(data->drm_fd, modifier, 0.0, 0.0, 0.0,
+					width, height, data->format, &goodfb);
+
+		*fb = *temp_fb;
+		addfb_init(fb, &f);
+	}
 
 	if (data->flags & TEST_RANDOM) {
 		srand(data->seed);
 		fill_fb_random(data->drm_fd, fb);
 	} else {
-		bool do_fast_clear = igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier);
-		bool do_solid_fill = do_fast_clear || data->plane;
-		int c = !!data->plane;
-
 		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
 			fast_clear_fb(data->drm_fd, fb, cc_color);
-		} else {
+		} else if (!goodfb) {
 			if (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
 			    modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
-				struct igt_fb temp_fb;
-				// non compressed temporary pattern image
-				if (do_solid_fill)
-					igt_create_color_fb(data->drm_fd, width, height,
-						fb->drm_format, I915_FORMAT_MOD_4_TILED,
-						colors[c].r, colors[c].g, colors[c].b,
-						&temp_fb);
-				else
-					igt_create_pattern_fb(data->drm_fd, width, height,
-							fb->drm_format, I915_FORMAT_MOD_4_TILED,
-							&temp_fb);
-
-				xe2_ccs_blit(data, fb, &temp_fb);
-				igt_remove_fb(data->drm_fd, &temp_fb);
-			} else {
-				cr = igt_get_cairo_ctx(data->drm_fd, fb);
-
 				if (do_solid_fill)
-					igt_paint_color(cr, 0, 0, width, height,
-							colors[c].r, colors[c].g, colors[c].b);
+					temp_fb = get_fb(data->drm_fd,
+							 I915_FORMAT_MOD_4_TILED,
+							 colors[c].r,
+							 colors[c].g,
+							 colors[c].b,
+							 width, height,
+							 data->format, NULL);
 				else
-					igt_paint_test_pattern(cr, width, height);
+					temp_fb = get_fb(data->drm_fd,
+							 I915_FORMAT_MOD_4_TILED,
+							 0.0, 0.0, 0.0,
+							 width, height,
+							 data->format, NULL);
 
-				igt_put_cairo_ctx(cr);
+				xe2_ccs_blit(data, fb, temp_fb);
 			}
 		}
 	}
@@ -939,8 +987,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	igt_plane_set_rotation(primary, IGT_ROTATION_0);
 	igt_display_commit2(display, commit);
 
-	igt_remove_fb(data->drm_fd, &fb_sprite);
-	igt_remove_fb(data->drm_fd, &fb);
+	if (data->flags & TEST_RANDOM)
+		igt_remove_fb(data->drm_fd, &fb);
 
 	igt_assert_eq(ret, data->flags & TEST_BAD_ROTATION_90 ? -EINVAL : 0);
 
@@ -1123,12 +1171,17 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 
 		if (!data.user_seed)
 			data.seed = time(NULL);
+
+		fb_list_length = 0;
 	}
 
 	for (int c = 0; c < ARRAY_SIZE(tests); c++)
 		test_output(&data, c);
 
 	igt_fixture {
+		for (int i = 0; i < fb_list_length; i++)
+			igt_remove_fb(data.drm_fd, &fb_list[i].fb);
+
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.45.2

