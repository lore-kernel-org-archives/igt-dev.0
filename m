Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A97D2127D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7210E319;
	Thu, 17 Oct 2024 11:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5aiHjqk";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664E510E319
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:23:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-20cbcd71012so7816915ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729164227; x=1729769027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvG6fK+O3voJbtVzMyr8icNMZrXvwMCzGUkbwaPIx8I=;
 b=G5aiHjqkHXtADukV9qMI9MvsdH0QVFWfSnragusuIPZCxleRI3HMFKrt05LVsRe4hz
 M/CvRi04AphfciPTw+UBF42ahceZ5TlkR4d1VXziC4IqjOJNONnH8WyO34UilvXtMguU
 WpYOVv00SsB83H+CkQQXnUkW3HjPMM6AutEpZSs9gkOjbAam72pW5eCxIl4gWhx+Ybzr
 0VYpwydQpKr4Yv6+IB9PgVRVQUQne2oHo0fH/cEd3VY9T/qSJGROA7DBBo01ejN7MUhI
 VoPhtCrDfwc95HVrxgGk0vS7tyNr1vYMf33p9go0kKmfX+rvblBtCCO7Nm5g/oijPWFB
 38cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729164227; x=1729769027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvG6fK+O3voJbtVzMyr8icNMZrXvwMCzGUkbwaPIx8I=;
 b=I/n+0TkF5vbdyHVLVi0M+VzdtoAA2ZfUp1BlX3/9gvjUWH+mU3xzxDh52a4Gk6Lq47
 LcbiF92HeXtLoq745sMOJ6vulFOxb37Mb+MeLQIykmFEO2s0pz4bBnppj2Opy6AYQjIy
 76bm6y1IOkfOrxz5NgYAEWUrIuv3cgBqTNPrFK9t3UmD+s9R2MEgsQ30t5jMzinsRTrG
 GioWFzbvSKj/Clb0pSRJRCZ+NJRnxzZlW64kQ7OedzgYzxF6ygz3k1h+k1fgh7G2c2hU
 DTgSgOwuuCDuZFo8g2nehAovmr0GBHBKV0pzd+N2DuWe4fGHfQGJVppXwqRwC3S5zHyP
 HP4g==
X-Gm-Message-State: AOJu0YxldLjYNq5E05NZd/udYd8pVlb2QDkXExw7wagSOC/dZH9Diadt
 mfUZHBGQ/hMQ7Dm4CyAjoeBqq9DteXJ/erm+4FXp0VTr+9f2TJQz8oTXzIuq6dw=
X-Google-Smtp-Source: AGHT+IGvbDJYxJ87reBiQqvMuOYBCk8sYlQhAIX7DKZ+R8LsJ0M/M4EU3Nar5p8tJ+Z4i4jysSek/w==
X-Received: by 2002:a17:902:e80d:b0:206:c486:4c4c with SMTP id
 d9443c01a7336-20cbb2abe0dmr286282085ad.57.1729164227320; 
 Thu, 17 Oct 2024 04:23:47 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ea9c6ba29bsm4725971a12.16.2024.10.17.04.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 04:23:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/kms_ccs: recycle framebuffers
Date: Thu, 17 Oct 2024 14:27:26 +0300
Message-ID: <20241017112728.3503205-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
References: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/kms_ccs.c | 178 +++++++++++++++++++++++++++++-------------
 1 file changed, 125 insertions(+), 53 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 49c8828d2..cd65ba7b4 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -186,6 +186,15 @@ typedef struct {
 	uint64_t ccs_modifier;
 	unsigned int seed;
 	bool user_seed;
+	enum igt_commit_style commit;
+	int fb_list_length;
+	struct {
+		struct igt_fb fb;
+		int width, height;
+		double r, g, b;
+		u64 modifier;
+		u32 format;
+	} *fb_list;
 } data_t;
 
 static const struct {
@@ -750,13 +759,57 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
 	access_flat_ccs_surface(fb, true);
 }
 
+static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
+			     double b, int width, int height, u32 format,
+			     int *goodfb)
+{
+	for (int i = 0; i < data->fb_list_length; i++) {
+		if (data->fb_list[i].width == width &&
+		    data->fb_list[i].height == height &&
+		    data->fb_list[i].modifier == modifier &&
+		    data->fb_list[i].format == format &&
+		    data->fb_list[i].r == r && data->fb_list[i].g == g &&
+		    data->fb_list[i].b == b) {
+			if (goodfb)
+				*goodfb = true;
+
+			return &data->fb_list[i].fb;
+		}
+	}
+
+	data->fb_list = realloc(data->fb_list, sizeof(*data->fb_list) *
+				(data->fb_list_length + 1));
+	data->fb_list[data->fb_list_length].width = width;
+	data->fb_list[data->fb_list_length].height = height;
+	data->fb_list[data->fb_list_length].r = r;
+	data->fb_list[data->fb_list_length].g = g;
+	data->fb_list[data->fb_list_length].b = b;
+	data->fb_list[data->fb_list_length].modifier = modifier;
+	data->fb_list[data->fb_list_length].format = format;
+
+	if (r + g + b == 0)
+		igt_create_pattern_fb(data->drm_fd, width, height, format,
+				      modifier,
+				      &data->fb_list[data->fb_list_length].fb);
+	else
+		igt_create_color_fb(data->drm_fd, width, height, format,
+				    modifier, r, g, b,
+				    &data->fb_list[data->fb_list_length].fb);
+
+	return &data->fb_list[data->fb_list_length++].fb;
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
@@ -772,48 +825,46 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
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
+			temp_fb = get_fb(data, modifier,
+					colors[c].r, colors[c].g, colors[c].b,
+					width, height, data->format, &goodfb);
+		else
+			temp_fb = get_fb(data, modifier, 0.0, 0.0, 0.0,
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
-			if (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
-			    modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
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
-				if (do_solid_fill)
-					igt_paint_color(cr, 0, 0, width, height,
-							colors[c].r, colors[c].g, colors[c].b);
-				else
-					igt_paint_test_pattern(cr, width, height);
-
-				igt_put_cairo_ctx(cr);
-			}
+		} else if (!goodfb &&
+			  (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
+			   modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS)) {
+			if (do_solid_fill)
+				temp_fb = get_fb(data, I915_FORMAT_MOD_4_TILED,
+						 colors[c].r,
+						 colors[c].g,
+						 colors[c].b,
+						 width, height,
+						 data->format, NULL);
+			else
+				temp_fb = get_fb(data, I915_FORMAT_MOD_4_TILED,
+						 0.0, 0.0, 0.0,
+						 width, height,
+						 data->format, NULL);
+
+			xe2_ccs_blit(data, fb, temp_fb);
 		}
 	}
 
@@ -856,16 +907,10 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	igt_plane_t *primary = compatible_main_plane(data);
 	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
 	int fb_width = drm_mode->hdisplay;
-	enum igt_commit_style commit;
 	struct igt_fb fb = {};
 	struct igt_fb fb_sprite = {};
 	int ret;
 
-	if (data->display.is_atomic)
-		commit = COMMIT_ATOMIC;
-	else
-		commit = COMMIT_UNIVERSAL;
-
 	if (primary == data->plane)
 		return false;
 
@@ -922,7 +967,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	if (data->flags & TEST_BAD_ROTATION_90)
 		igt_plane_set_rotation(primary, IGT_ROTATION_90);
 
-	ret = igt_display_try_commit2(display, commit);
+	ret = igt_display_try_commit2(display, data->commit);
 
 	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc)
 		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
@@ -937,10 +982,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_rotation(primary, IGT_ROTATION_0);
-	igt_display_commit2(display, commit);
 
-	igt_remove_fb(data->drm_fd, &fb_sprite);
-	igt_remove_fb(data->drm_fd, &fb);
+	if (data->flags & TEST_RANDOM) {
+		igt_display_commit2(display, data->commit);
+		igt_remove_fb(data->drm_fd, &fb);
+	}
 
 	igt_assert_eq(ret, data->flags & TEST_BAD_ROTATION_90 ? -EINVAL : 0);
 
@@ -1006,6 +1052,27 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	return index != 0 && index != 3 && index != 5;
 }
 
+static bool valid_modifier_test(u64 modifier, const enum test_flags flags)
+{
+	switch (modifier) {
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+		if (flags & TEST_BAD_CCS_PLANE)
+			return false;
+		break;
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+		if (flags & TEST_FAIL_ON_ADDFB2)
+			return false;
+		break;
+	default:
+		break;
+	}
+
+	return true;
+}
+
 static void test_output(data_t *data, const int testnum)
 {
 	uint16_t dev_id;
@@ -1016,13 +1083,8 @@ static void test_output(data_t *data, const int testnum)
 	data->flags = tests[testnum].flags;
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
-		if (((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
-		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
-		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
-		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
-		    (tests[testnum].flags & TEST_FAIL_ON_ADDFB2 &&
-		    (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
-		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS)))
+		if (!valid_modifier_test(ccs_modifiers[i].modifier,
+					 data->flags))
 			continue;
 
 		data->ccs_modifier = ccs_modifiers[i].modifier;
@@ -1123,12 +1185,22 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 
 		if (!data.user_seed)
 			data.seed = time(NULL);
+
+		data.commit = data.display.is_atomic ? COMMIT_ATOMIC :
+			COMMIT_UNIVERSAL;
+
+		data.fb_list_length = 0;
 	}
 
 	for (int c = 0; c < ARRAY_SIZE(tests); c++)
 		test_output(&data, c);
 
 	igt_fixture {
+		igt_display_commit2(&data.display, data.commit);
+		for (int i = 0; i < data.fb_list_length; i++)
+			igt_remove_fb(data.drm_fd, &data.fb_list[i].fb);
+		free(data.fb_list);
+
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.45.2

