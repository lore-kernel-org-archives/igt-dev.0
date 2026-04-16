Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB09F8D753
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8A510E8DB;
	Thu, 16 Apr 2026 15:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gJh4H8Jv";
	dkim-atps=neutral
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7215910E8DB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:54:50 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-12c6df0b9bbso1573984c88.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776354889; x=1776959689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+UvGuE/w67bB4dGCjEPBrxu4Fuzy73GN+IiG25LDl8=;
 b=gJh4H8JvV2OdUSk393d98v6e3nLb0Qgl10HZdyvCwQMIbiiZQEhsYfi5igFwM6f62p
 rA8MFYgzdJuG1PVii92ibR8VysBV/SfR+DQDyU9uvzJoa3eghuQMRUOn2SzMYG8DTPFA
 L1awGm/cWIWrjFVx9dc1BVzeAfLuCGYDAJxxR0x6+rF76ZLEk71kCRVbytLgmH1uFRPv
 StfOOiWSLDntT+z/qOuobrH8RgpMGSPS6ZUC+eHftce9tihoAwG7niodAVCuRyufSc6S
 Ph+p/LqmBIKHD1f6pAM24oiSqptv4THx7bJ/lCWirrQSC65p+a744aZd3vM2fhBI6JuA
 mVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776354889; x=1776959689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/+UvGuE/w67bB4dGCjEPBrxu4Fuzy73GN+IiG25LDl8=;
 b=RYahm7aBEcuRe4AfmDpiT5Eu1ePLvB3I8YNcmXBa0PvmpF73enqfulnWyYyO60GW9R
 mBmQF7eEuOPcaM40NtrNetBUmOYpUXwKfJ3vEyf6XgsjTdz2bTysGLTPCOrQ0s5mIwZs
 kfTqI2+HoDz9SaSEkf/DlUhW7THOW6dHqEP+XyVjr+sY8t/phgL68f/ZL8PSTtnmHFI9
 OZYaLM9UoTaqT6fC6cRqk0k6zR1/MU/1YEq848CqKAka0M2Gib7MGj4qSpk35QoYCdxn
 E1Js8K7I8HlZb69oHS3vp7ruz+bokZp5jdfHGcxKws+eHCd4lSQW2c6hPG4xKw+wTcGH
 vpNA==
X-Gm-Message-State: AOJu0Yyjxwu1WzvBwvSVKKPRRcoMg4B5fYKR5/MbQwjpZUV1dRL2xFbj
 IOKBZzjFqpkIc+Qozsyjdtm8Wsr76IiYbt8YyMUBZ4kZS+msqNDzhBJ3kIt2xP+04m4=
X-Gm-Gg: AeBDieu6wEvUDJlXQPJWgVOWAKvivZkeMRTor142GqEvlYFa0PdFO0H2V3/UCv14Lwl
 GiceGJrmmi0j+fqGkju3D484DB4hYaw1i3W9zd1zc95dT/Vrxq6bUd/T9sgPXtdngGDRAc6Gtky
 gJ5vPe4WxzfupSslMnfsdDDDAR9S1Zu28yGUK3EzNmxVEQ22CPXUYA8mIe7hrs5wb33Y7z/zuBt
 x/N1uW6vIogWruOnqeKb/8e0N9Us4NGLFsq69tTnmJC/NspiYQALkJPrYhiIUZoTGcKCG5IGGAK
 QF3nd/V7X2aHWAfFzSlm/miZsyvQMci1xy77hHrpPt+2zOTewVj65LX6b8Pzwvdi+o7DhvrUBUv
 X71hvHYlT8stvnqlj/nplj8VANH31z2AY2ymaURmWyX9n93+ipvivq4tXf6bbVzE6TkI5vLJGQ2
 3MtJqvX3KelWkDvPuvFVsfCV4G5Ys3FfjR/uQT5WGSulHuMctQiYjKJbnCbLkSe5Q0NnGKII8=
X-Received: by 2002:a05:7300:3247:b0:2c7:2c0b:f33b with SMTP id
 5a478bee46e88-2d5899a3bafmr15781336eec.20.1776354889455; 
 Thu, 16 Apr 2026 08:54:49 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2de8f6615d5sm9694943eec.24.2026.04.16.08.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 08:54:49 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/intel/kms_sharpness_filter: sanitize
 subtest init
Date: Thu, 16 Apr 2026 18:54:18 +0300
Message-ID: <20260416155421.2000-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
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

