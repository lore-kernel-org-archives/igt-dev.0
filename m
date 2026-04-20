Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A3BF5580C
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912E10E4E4;
	Mon, 20 Apr 2026 11:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H0XjAbER";
	dkim-atps=neutral
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4184310E4E4
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:06:08 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-12c726ef332so3349387c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776683167; x=1777287967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+UvGuE/w67bB4dGCjEPBrxu4Fuzy73GN+IiG25LDl8=;
 b=H0XjAbERyrh+popaGFzsuLo7m6gbnE9yYhlglAgUayZxRr/GxZK/go0+XiPG/LEvNu
 bAv8DIloIqbPR1VOsPbu4dn/MYBxPR0Om47cs/UuxMqSj0hjBi1H44REhmYVbQAd7OTO
 W3CVVBHtUcYADdaWuFeO0RKiw62GzrWbIL5Z1FQg32wqiPY/xhUu7EKMMzCSaOYG3KM2
 hV6L/RpRbzhOv8wzYkAn6DsNZevon1Izth5iEFV3k97A4/jAVT/XXj2KI/XcCZt6JFYG
 lfL8GdU3psLlscNtSl9gx+leX5L3pTEw9JygLpvj0mVy1e5dIFrFXKWhpbuCD+XFjZ98
 ldHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776683167; x=1777287967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/+UvGuE/w67bB4dGCjEPBrxu4Fuzy73GN+IiG25LDl8=;
 b=sYipilEhJz6pEpUZPpvLFzbDDo2lEtoV6PT0onzxe66g1KMQV5gMgh1LbiGzG3DPr7
 9S4u5ELboDh2ixdlE0/bW4np/C6BMQwmrns5rjA5P/2eVd9BbjShhs2D61u2AGG17JD9
 tr3njpLzsf7D7/iLlr1eu/cYyz+7pGdSPjOiAcc1nrexn1DbDEGD3YJDJKGQvFsgaz8X
 MAjC/ZImq8sOqu8KylZsQvo/RONv/VxQup54L5J8CbwKQdK+TfQwv4t9rDRPNHrXlDLM
 v+kw0HVCplscCuQo2Wq/lQMlawdogtTfBP1xQmx2t+yQHpO5jnoM6iG+I8BqOaa1H57p
 74vw==
X-Gm-Message-State: AOJu0Yyzve2vV8Z2AmdQYOIfmEnrF4LIdyrEV5v2obNoxXXUGjsDJ0jY
 OMER7GrLUKWhXHqbX6Q34WL/3f3KHaR6SAn5Qrr7bpIre1qUVL3XDxvsXHDG9xJB
X-Gm-Gg: AeBDiesXU/sv2bets999/3EOjJY+xkTHDp+S7mDOZ1pkIEmWR2v14l/IRsZ53gGM9jK
 GW9FuDQ4aV0wiWT771vJAQQEnvWO4E8wP/Xt9B4pUGXGVaKjZlahxD6lO+xgN+M0+wHHoEjhlgv
 IynE0acbd6/aJ75u0BMhm8lco+qkYW05Xnc970gfYju6ASEgh8G3sK7pi011DVq5qPsvwoOAng+
 gGUohKxcssZ6+LsZkmhGsfXVfCy/xlD694yNlrVAGCVyAY3B89+aEMUKmLrEqd5TjAvEXl7EoMI
 bhh4UU7G4rbKnAXp59LJc//6jKd5ze7b2dyJyc3ELc/Vrkjp392gmVm4eZcdkFoq4AjYcB+R1qr
 prS9flum0A8aWS8/5X4jNEyL8NZB6OgWyrl5hXnZmJJtqgzmhyzHKUsKu6Mx9xK8cjtPAnPEwRO
 p8vrT0+nLtg+SDbEcghzo5eC2i0vnrsYfHSyd/t2C3WNO2H/LhM9MniUAJ5KBlqTglShkZcw==
X-Received: by 2002:a05:7022:4583:b0:128:df80:1852 with SMTP id
 a92af1059eb24-12c73f75b29mr6034899c88.9.1776683166814; 
 Mon, 20 Apr 2026 04:06:06 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c74a18a2bsm20597697c88.10.2026.04.20.04.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 04:06:06 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 1/4] tests/intel/kms_sharpness_filter: sanitize
 subtest init
Date: Mon, 20 Apr 2026 14:05:50 +0300
Message-ID: <20260420110553.478287-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
References: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
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

reset flags to defaults in one place as well as table test names.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 204 ++++++++++++-----------------
 1 file changed, 87 insertions(+), 117 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index bdfdf1d08..baf9bc141 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -423,6 +423,56 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
 	return igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH);
 }
 
+static const char * const test_type_names[] = {
+	[TEST_FILTER_BASIC]                     = "basic",
+	[TEST_FILTER_MODIFIERS]                 = NULL,
+	[TEST_FILTER_ROTATION]                  = NULL,
+	[TEST_FILTER_FORMATS]                   = NULL,
+	[TEST_FILTER_STRENGTH]                  = NULL,
+	[TEST_FILTER_TOGGLE]                    = "toggle",
+	[TEST_FILTER_TAP]                       = NULL,
+	[TEST_FILTER_DPMS]                      = "dpms",
+	[TEST_FILTER_SUSPEND]                   = "suspend",
+	[TEST_FILTER_UPSCALE]                   = "upscale",
+	[TEST_FILTER_DOWNSCALE]                 = "downscale",
+	[TEST_INVALID_FILTER_WITH_SCALER]       = "invalid-filter-with-scaler",
+	[TEST_INVALID_FILTER_WITH_PLANE]        = "invalid-filter-with-plane",
+	[TEST_INVALID_PLANE_WITH_FILTER]        = "invalid-plane-with-filter",
+	[TEST_INVALID_FILTER_WITH_SCALING_MODE] = NULL,
+};
+
+static void build_test_suffix(data_t *data, enum test_type type,
+			      char *name, size_t len)
+{
+	if (test_type_names[type]) {
+		snprintf(name, len, "-%s", test_type_names[type]);
+		return;
+	}
+
+	/* suffix depends on the current test parameters */
+	switch (type) {
+	case TEST_FILTER_MODIFIERS:
+		snprintf(name, len, "-%s", data->modifier_name);
+		break;
+	case TEST_FILTER_ROTATION:
+		snprintf(name, len, "-%srot",
+			 igt_plane_rotation_name(data->rotation));
+		break;
+	case TEST_FILTER_FORMATS:
+		snprintf(name, len, "-%s", igt_format_str(data->format));
+		break;
+	case TEST_FILTER_STRENGTH:
+		snprintf(name, len, "-strength-%d", data->filter_strength);
+		break;
+	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
+		snprintf(name, len, "-invalid-filter-with-scaling-mode-%s",
+			 kmstest_scaling_mode_str(data->scaling_mode));
+		break;
+	default:
+		igt_assert_f(false, "Unhandled test type %d\n", type);
+	}
+}
+
 static void
 run_sharpness_filter_test(data_t *data, enum test_type type)
 {
@@ -446,7 +496,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			 * Until then, run on non-joiner mode in joiner configuration.
 			 */
 			if (is_joiner_mode(data->drm_fd, data->output)) {
-				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
+				data->mode = igt_get_non_joiner_mode(data->drm_fd,
+								     data->output);
 				if (!data->mode) {
 					igt_info("No non-joiner mode found on output %s\n",
 						 igt_output_name(data->output));
@@ -476,9 +527,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			if (type == TEST_FILTER_TAP) {
 				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
-				int num_taps = ARRAY_SIZE(filter_tap_list);
-
-				igt_assert(num_taps == 3);
 
 				get_modes_for_filter_taps(output, modes);
 				for (int i = 0; i < 3; i++) {
@@ -486,11 +534,16 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 					if (!modes[i])
 						continue;
 					data->mode = modes[i];
-				        igt_info("Mode %dx%d@%d on output %s\n", data->mode->hdisplay, data->mode->vdisplay,
-						  data->mode->vrefresh, igt_output_name(data->output));
-					igt_output_override_mode(data->output, data->mode);
+					igt_info("Mode %dx%d@%d on output %s\n",
+						 data->mode->hdisplay,
+						 data->mode->vdisplay,
+						 data->mode->vrefresh,
+						 igt_output_name(data->output));
+					igt_output_override_mode(data->output,
+								 data->mode);
 
-					snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
+					snprintf(name, sizeof(name), "-tap-%d",
+						 data->filter_tap);
 					igt_dynamic_f("pipe-%s-%s%s",
 						       igt_crtc_name(data->crtc),
 						       data->output->name, name)
@@ -499,59 +552,13 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 				if (data->limited)
 					break;
-
 				continue;
 			}
 
-			switch (type) {
-			case TEST_FILTER_BASIC:
-				snprintf(name, sizeof(name), "-basic");
-				break;
-			case TEST_FILTER_MODIFIERS:
-				snprintf(name, sizeof(name), "-%s", data->modifier_name);
-				break;
-			case TEST_FILTER_ROTATION:
-				snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
-				break;
-			case TEST_FILTER_FORMATS:
-				snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
-				break;
-			case TEST_FILTER_STRENGTH:
-				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
-				break;
-			case TEST_FILTER_TOGGLE:
-				snprintf(name, sizeof(name), "-toggle");
-				break;
-			case TEST_FILTER_DPMS:
-				snprintf(name, sizeof(name), "-dpms");
-				break;
-			case TEST_FILTER_SUSPEND:
-				snprintf(name, sizeof(name), "-suspend");
-				break;
-			case TEST_FILTER_UPSCALE:
-				snprintf(name, sizeof(name), "-upscale");
-				break;
-			case TEST_FILTER_DOWNSCALE:
-				snprintf(name, sizeof(name), "-downscale");
-				break;
-			case TEST_INVALID_FILTER_WITH_SCALER:
-				snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
-				break;
-			case TEST_INVALID_FILTER_WITH_PLANE:
-				snprintf(name, sizeof(name), "-invalid-filter-with-plane");
-				break;
-			case TEST_INVALID_PLANE_WITH_FILTER:
-				snprintf(name, sizeof(name), "-invalid-plane-with-filter");
-				break;
-			case TEST_INVALID_FILTER_WITH_SCALING_MODE:
-				snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
-				break;
-			default:
-				igt_assert(0);
-			}
+			build_test_suffix(data, type, name, sizeof(name));
 
 			igt_dynamic_f("pipe-%s-%s%s",
-				        igt_crtc_name(data->crtc),
+				      igt_crtc_name(data->crtc),
 				      data->output->name, name)
 				test_sharpness_filter(data, type);
 
@@ -561,6 +568,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 	}
 }
 
+static void set_data_defaults(data_t *data)
+{
+	data->modifier        = DRM_FORMAT_MOD_LINEAR;
+	data->modifier_name   = modifiers[0].name;
+	data->rotation        = IGT_ROTATION_0;
+	data->format          = DRM_FORMAT_XRGB8888;
+	data->filter_strength = MID_FILTER_STRENGTH;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -595,20 +611,14 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 
 	igt_describe("Verify basic content adaptive sharpness filter.");
 	igt_subtest_with_dynamic("filter-basic") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
 	}
 
 	igt_describe("Verify that varying strength(0-255), affects "
 		     "the degree of sharpeness applied.");
 	igt_subtest_with_dynamic("filter-strength") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(filter_strength_list); i++) {
 			data.filter_strength = filter_strength_list[i];
@@ -620,9 +630,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify content adaptive sharpness filter with "
 		     "varying modifiers.");
 	igt_subtest_with_dynamic("filter-modifiers") {
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 			data.modifier = modifiers[i].modifier;
@@ -635,9 +643,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify content adaptive sharpness filter with "
 		     "varying rotations.");
 	igt_subtest_with_dynamic("filter-rotations") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
 			data.rotation = rotations[i];
@@ -649,9 +655,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify content adaptive sharpness filter with "
 		     "varying formats.");
 	igt_subtest_with_dynamic("filter-formats") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
 			data.format = formats[i];
@@ -663,10 +667,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify toggling between enabling and disabling "
 		     "content adaptive sharpness filter.");
 	igt_subtest_with_dynamic("filter-toggle") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-
+		set_data_defaults(&data);
 		data.filter_strength = MAX_FILTER_STRENGTH;
 		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
 	}
@@ -674,55 +675,35 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify that following a resolution change, "
 		     "distict taps are selected.");
 	igt_subtest_with_dynamic("filter-tap") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
 	}
 
 	igt_describe("Verify content adaptive sharpness filter "
 		     "with DPMS.");
 	igt_subtest_with_dynamic("filter-dpms") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
 	}
 
 	igt_describe("Verify content adaptive sharpness filter "
 		     "with suspend.");
 	igt_subtest_with_dynamic("filter-suspend") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
 	}
 
 	igt_describe("Verify content adaptive sharpness filter "
 		     "with 1 plane scaler enabled.");
 	igt_subtest_with_dynamic("filter-scaler-upscale") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
 	}
 
 	igt_describe("Verify content adaptive sharpness filter "
 		     "with 1 plane scaler enabled.");
 	igt_subtest_with_dynamic("filter-scaler-downscale") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
 	}
 
@@ -730,11 +711,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "when 2 plane scalers have already been enabled and "
 		     "attempt is made to enable sharpness filter.");
 	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
+		set_data_defaults(&data);
 		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
 	}
 
@@ -742,10 +719,8 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "when 2 NV12 planes have already been enabled and attempt is "
 		     "made to enable the sharpness filter.");
 	igt_subtest_with_dynamic("invalid-filter-with-plane") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
+		set_data_defaults(&data);
 		data.format = DRM_FORMAT_NV12;
-		data.filter_strength = MID_FILTER_STRENGTH;
 
 		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
 	}
@@ -754,10 +729,8 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "when 1 NV12 plane and sharpness filter have already been enabled "
 		     "and attempt is made to enable the second NV12 plane.");
 	igt_subtest_with_dynamic("invalid-plane-with-filter") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
+		set_data_defaults(&data);
 		data.format = DRM_FORMAT_NV12;
-		data.filter_strength = MID_FILTER_STRENGTH;
 
 		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
 	}
@@ -766,10 +739,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		     "when scaling mode is already enabled and attempt is made "
 		     "to enable sharpness filter.");
 	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
 			data.scaling_mode = scaling_modes[k];
-- 
2.43.0

