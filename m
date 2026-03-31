Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECE310F92EF
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 19:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D110EA6E;
	Tue, 31 Mar 2026 19:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X86bU8mL";
	dkim-atps=neutral
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304210E9D5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 19:04:43 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2c87871133dso933662eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774983883; x=1775588683; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B60BoVVI/rLerUir3XxNguEOhIUwU8x7snz5mrgypOI=;
 b=X86bU8mLabZgI8GBywqzIEpq2DxUgh+vpwVjKBrpZhTmKmZ1gA4r4aFeqOkzA28tRQ
 eUeqzkdxu7aO3xd+26RkecbrtlgZePsjxCCHLNNlQv/irlV0kAGmcBFql+v2d1/71O3z
 nabdENSgINbP9V+PJtNgMp20K80pFPYyWEgnd3tK45ACnfosCAjhz54S7wsE2s8Bqsk9
 1fVzlxadCH05TCfcGz2TEXaM58h50MmIdOmkCQYw8j9iAU53yfVGaUYNf598oGdVkDiT
 gutN6BetUNPbNt/4dFbPu+XabMBSBfU+YbwvPySQnFIXiM4ezMic21JPTwkiuLRtLrkq
 mO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774983883; x=1775588683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B60BoVVI/rLerUir3XxNguEOhIUwU8x7snz5mrgypOI=;
 b=GXI1Q0OYG/WD59vSf6DI/1gQasWrHtrXLtSipo/Dj44cmgec+mKJuqKLfRmsmoI1CC
 IhiHO7wi1UpeM72ohMKVifIen+ZL7arV6wTaCGefUn2Q0Zly8StT1Evk0LtYsSeXLIvL
 ofcjQwZk9paL26KzHGaQ5FbvYJFiy6cbTKmCAXetW3hI8eORyXkRzkxwr6rFiKO3yvZw
 BFRgt21gk2NnU8djQjKMConzGLvoMiTMYdqVJ4kYnZYZr2du1+np646xZiBuOwE2q63u
 oc6L8CQq0Jez1uzFSVb1a2RdgOkqoWysgHYXAIxbhkVMA7pd+/LKt/lNOnOtz7BSLlKD
 MEbA==
X-Gm-Message-State: AOJu0YxqZrXb3Bw0YIa5e5TbhrASm+eGAF17xCfpRL7ohpec/OAa55i+
 uduFDmSHz5B7gGZMZFxMYPUO8mPjZGEdgxf5e+mAuRT9gxf5n1Fged7fim0e2Et8
X-Gm-Gg: ATEYQzzr1XRP+d8jVLApZjjZaVH1wQ3ICxHUr+ilB5dIOJDQOohpb36CyqRnJ9C6Otw
 n3KWxBzndyum1lXssIpOWTN4Hq7vTb5ZZITHHrlCIT914DPQOCXvXsyl3zPtSpBW1ndfyLur3QT
 fhL7126LgQgxa6swoDMdZ1RRz69G0MJIlezk4bWQL8joyt0T+M0dh/o3u++K1TQQ7ZOXNvzEWp0
 90Uhae3I3zEABg0QHfTukkRSRj8/CUcoRknrI1JG2PD2fDujZZvnXjwjqGKMz2xouTm7uGolnwF
 2oAamFvcXrl5n0Gbsrq+4EitPyrzoOoLQwfKCfIh2XwM+Yy8RfIh0mpXLE1hylHIfVVstdCpXfa
 5dRd1s6OAp9W3QEuNvVPsd+ptEoeiC/SQov2x7KLA8LklxN4z+MbFuBgSRqhiJcdjToOMsyVO+R
 xmktjB3Ks6TMLOef+OMcdR61hBatmNpJKte1vocSqCYO1+3PJfY+TV4rAJWho=
X-Received: by 2002:a05:7300:2151:b0:2c1:7afc:df06 with SMTP id
 5a478bee46e88-2c930499056mr285037eec.5.1774983882555; 
 Tue, 31 Mar 2026 12:04:42 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c3c74825a0sm10925278eec.27.2026.03.31.12.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:42 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
Date: Tue, 31 Mar 2026 22:04:10 +0300
Message-ID: <20260331190412.1907571-3-juhapekka.heikkila@gmail.com>
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

refactor to make it look more nice

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_sharpness_filter.c | 108 ++++++++++++++++-------------
 1 file changed, 59 insertions(+), 49 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 029b735bd..ed8d2e48c 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -88,15 +88,6 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
-#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
-		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
-		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
-		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
-#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
-		||  (type == TEST_FILTER_DOWNSCALE) \
-		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
-		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
-		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -327,12 +318,37 @@ static int test_filter_toggle(data_t *data)
 	return ret;
 }
 
-static void test_sharpness_filter(data_t *data,  enum test_type type)
+static bool is_invalid_test(enum test_type type)
+{
+	switch (type) {
+	case TEST_INVALID_FILTER_WITH_SCALER:
+	case TEST_INVALID_FILTER_WITH_PLANE:
+	case TEST_INVALID_PLANE_WITH_FILTER:
+	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool needs_extra_planes(enum test_type type)
+{
+	switch (type) {
+	case TEST_FILTER_UPSCALE:
+	case TEST_FILTER_DOWNSCALE:
+	case TEST_INVALID_FILTER_WITH_SCALER:
+	case TEST_INVALID_FILTER_WITH_PLANE:
+	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static void test_sharpness_filter(data_t *data, enum test_type type)
 {
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
-	int height = mode->hdisplay;
-	int width =  mode->vdisplay;
 	igt_crc_t ref_crc, crc;
 	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
@@ -343,57 +359,31 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		      "No requested format/modifier on pipe %s\n",
 		      igt_crtc_name(data->crtc));
 
-	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
+	setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		 data->format, data->modifier, &data->fb[0]);
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
 
 	if (type == TEST_FILTER_ROTATION) {
-		if (igt_plane_has_rotation(data->plane[0], data->rotation))
-			igt_plane_set_rotation(data->plane[0], data->rotation);
-		else
-			igt_skip("No requested rotation on pipe %s\n",
-				 igt_crtc_name(data->crtc));
+		igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
+						      data->rotation),
+			      "No requested rotation on pipe %s\n",
+			      igt_crtc_name(data->crtc));
+		igt_plane_set_rotation(data->plane[0], data->rotation);
 	}
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
 		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
 
-	if (SET_PLANES)
+	if (needs_extra_planes(type))
 		set_planes(data, type);
 
 	set_filter_strength_on_pipe(data);
 
-	if (!INVALID_TEST && data->filter_strength != 0)
-		igt_debug("Sharpened image should be observed for filter strength > 0\n");
-
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
 		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
 	else
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
-	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		pipe_crc = igt_crtc_crc_new(data->crtc,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
-		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
-	}
-
-	if (type == TEST_FILTER_DPMS) {
-		kmstest_set_connector_dpms(data->drm_fd,
-					   output->config.connector,
-					   DRM_MODE_DPMS_OFF);
-		kmstest_set_connector_dpms(data->drm_fd,
-					   output->config.connector,
-					   DRM_MODE_DPMS_ON);
-	}
-
-	if (type == TEST_FILTER_SUSPEND)
-		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-					      SUSPEND_TEST_NONE);
-
-	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		igt_pipe_crc_collect_crc(pipe_crc, &crc);
-		igt_assert_crc_equal(&crc, &ref_crc);
-	}
-
 	if (type == TEST_FILTER_TOGGLE)
 		ret |= test_filter_toggle(data);
 
@@ -409,13 +399,33 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	}
 
-	if (INVALID_TEST)
+	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
+		pipe_crc = igt_crtc_crc_new(data->crtc,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+		if (type == TEST_FILTER_DPMS) {
+			kmstest_set_connector_dpms(data->drm_fd,
+						   output->config.connector,
+						   DRM_MODE_DPMS_OFF);
+			kmstest_set_connector_dpms(data->drm_fd,
+						   output->config.connector,
+						   DRM_MODE_DPMS_ON);
+		} else {
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+						      SUSPEND_TEST_NONE);
+		}
+
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		igt_assert_crc_equal(&crc, &ref_crc);
+		igt_pipe_crc_free(pipe_crc);
+	}
+
+	if (is_invalid_test(type))
 		igt_assert_eq(ret, -EINVAL);
 	else
 		igt_assert_eq(ret, 0);
 
-	/* clean-up */
-	igt_pipe_crc_free(pipe_crc);
 	cleanup(data);
 }
 
-- 
2.43.0

