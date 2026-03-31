Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB0710F92EF
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 19:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ACB10EA08;
	Tue, 31 Mar 2026 19:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dii/xlkM";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F2610EA6E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 19:04:38 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12a74039dc6so4890017c88.0
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 12:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774983878; x=1775588678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82unMYmgHilcef9nM3/CCRiXMmweDKcU0WigcOXe6vc=;
 b=Dii/xlkMR0Isrerkf/48EXCfpJ4A6DIteVsqgAmkExOIEvGTTkUNG5BEGlw7lHJVB3
 829nzrzcqD7oFo//vcFEEjhV5icqTYJp0GZ+BA36dJW9DfEAcB2yWboSCBobqBCpHdX6
 +yUvYf0Zzc/69DtDhP5rh1MPzrCiF00pOf1nAFM1wvEzcRbe/H+Dc1LKBe9gmO2p6EzY
 xl31UPUp7wVWLa6oVPiwaFX369UbJY30t2kB6LWtCgzge+Q2JsqqgbjaHgHPYrfO9Dg1
 Fndi5aZX8ogtcisUt0n9QwRAKly8bmAq3s0ZnbGNGp/YYnPnnNKBCtl0Dd0HV3y/v8Tj
 /GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774983878; x=1775588678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=82unMYmgHilcef9nM3/CCRiXMmweDKcU0WigcOXe6vc=;
 b=s8DDN/CjEyAxc41cEiAIpfhbWiFCJ0iZxJRmT8c4JVkyn7dQ1ptRelVsa0ow1pGAeH
 YPNY57wEHvxfcvnUmzdR4iWsbKV2trRKTwO2GhQ2CNbHsr4vtf6M4+m9w/cyiTZc362n
 ZXaWt2cFUI55tFieFaiwX/fro6BMi5xuFctLBsHt7Sw2HfZiFFfDWlr4/dPtcWRRitN0
 OnrOGuzj0vwYlVfLic3rE+PNg3pl8zJGw0K0ThmME6uqy9V2KGCfFcINVO5L4zIshCtg
 o543QyBJy1i/KB2njsx6/Bl4ynvFezkaQUflXulas7LwYd0M264EmBGhclb1wjxT8SRA
 3oEA==
X-Gm-Message-State: AOJu0YzLwi0mJ+VqKF5ZAISbPOpsjLUcdC233KHvGhBW/vp5aQSRp5V6
 Jv8cfuGQUnjNbS/i5P4XHjuAa8fy3Z8fqcc2XBxrTsuTio5+iFiL7R2urpD830+I
X-Gm-Gg: ATEYQzzYiCKgheZaF1QX7PX4CDkhFNnxfMzSyro9qM9x8Mw6PU22Ov2L67u93l2J5MG
 QTcrz1eRThSdr6PfGVU/3MEo0Xtry1BrbmMraIFlEvJNfeSYutoTqndqM5Anqyxl30CIRq7SvZT
 slqpDQZOzpBMpk30FoIWZLxQHpFB28gZ/IirZWKNOsM2vT3Ft5+nafMgMQuD9mzFXThctTBSnYq
 KZpbjkThWHoh0xIQ6UT1NyE6ZYDb+pJbVko07itz9Mbd0zvaQ0MX408GTtgT07G+Pho07rCo9bQ
 Jabpah1b8PC/oS4KSQQUJug2jHCFB8Brz7ZGg+itc/K5qXijFfv387LzDy7pIAzAD0YMUnf3zYa
 meyUn1P/BKzUZV4kjCub6aCRLHYsP4kEWM67952fnp/+OeYiwnoYej98jjOrRa5p9SM9Ma2zSu7
 8nR1ey5v9pHLp5Y7oPd7Lo/OgNGUYGilCKM5yND25nn6wC6qWAmwCpbGKY/1Kz4kK/as2DkQ==
X-Received: by 2002:a05:7022:127:b0:128:ceac:6da6 with SMTP id
 a92af1059eb24-12be6590b83mr367432c88.30.1774983877701; 
 Tue, 31 Mar 2026 12:04:37 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c3c79722e0sm11697878eec.31.2026.03.31.12.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:37 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/4] tests/intel/kms_sharpness_filter: sanitize subtest
 init
Date: Tue, 31 Mar 2026 22:04:09 +0300
Message-ID: <20260331190412.1907571-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
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
---
 tests/intel/kms_sharpness_filter.c | 204 ++++++++++++-----------------
 1 file changed, 87 insertions(+), 117 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index c9fc191fd..029b735bd 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -424,6 +424,56 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
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
+			       char *name, size_t len)
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
@@ -447,7 +497,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			 * Until then, run on non-joiner mode in joiner configuration.
 			 */
 			if (is_joiner_mode(data->drm_fd, data->output)) {
-				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
+				data->mode = igt_get_non_joiner_mode(data->drm_fd,
+								     data->output);
 				if (!data->mode) {
 					igt_info("No non-joiner mode found on output %s\n",
 						 igt_output_name(data->output));
@@ -477,9 +528,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			if (type == TEST_FILTER_TAP) {
 				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
-				int num_taps = ARRAY_SIZE(filter_tap_list);
-
-				igt_assert(num_taps == 3);
 
 				get_modes_for_filter_taps(output, modes);
 				for (int i = 0; i < 3; i++) {
@@ -487,11 +535,16 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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
@@ -500,59 +553,13 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
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
 
@@ -562,6 +569,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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
@@ -596,20 +612,14 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 
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
@@ -621,9 +631,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify content adaptive sharpness filter with "
 		     "varying modifiers.");
 	igt_subtest_with_dynamic("filter-modifiers") {
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 			data.modifier = modifiers[i].modifier;
@@ -636,9 +644,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify content adaptive sharpness filter with "
 		     "varying rotations.");
 	igt_subtest_with_dynamic("filter-rotations") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
 			data.rotation = rotations[i];
@@ -650,9 +656,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify content adaptive sharpness filter with "
 		     "varying formats.");
 	igt_subtest_with_dynamic("filter-formats") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.filter_strength = MID_FILTER_STRENGTH;
+		set_data_defaults(&data);
 
 		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
 			data.format = formats[i];
@@ -664,10 +668,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
@@ -675,55 +676,35 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
 
@@ -731,11 +712,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
 
@@ -743,10 +720,8 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
@@ -755,10 +730,8 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
@@ -767,10 +740,7 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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

