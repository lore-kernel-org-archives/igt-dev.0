Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EEFF8D753
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A610E90A;
	Thu, 16 Apr 2026 15:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qycUUrnm";
	dkim-atps=neutral
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5C10E8DB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:54:55 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2d8ffdc31d0so10302758eec.0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776354894; x=1776959694; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfyNeHP3SaVvGSOthu3cyOd5Jvtsap82sTUuGaqxtQc=;
 b=qycUUrnmOSLX77wznaOSXAvIZq2gY2KnciZ+egFHo8Su47kbikznqVC9kWUj24V4Pk
 HP9Zv8xTSS9SDst3Wp5Dln3uZiGMusBktS82eaQGoBmMd6rc2x9UKwIDUW3Uc+ylvX9v
 CLEloNX/3fdTBYW24WAVZukDVcWMHRyJt251CPfzt/3LQoJBTxAQ02Vy0WBxmrGhHKk9
 E2hNo2wI66IJ6iCC/CmAsYbCHuM7saQ2pEOf0SJJDw9Rh7xJsqnn5HsXZ6U3UxDxN5Tx
 IqbQX6TZ84+e8F0816gKDlnlaGZGiJkZQ9e8x1YwOr3kCGBoKrq+4hJx5p2S5e6HNMME
 qZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776354894; x=1776959694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sfyNeHP3SaVvGSOthu3cyOd5Jvtsap82sTUuGaqxtQc=;
 b=YTbkSt99XRcp3zukdrAFTjKsx5WnC1kiZB4bQccQpuhBEabz9rzwjdKpnJh+WxkWAL
 3QrbhuqTOWr4Tuw2VHVDrKS/ZdOf6AiONHD+T7Pt61kdYNNhmAq1jSUX1hf7gRMrxG3x
 ue6HnEB/vVcFNAIl8hbHY4HncUXXiF+F7cKBFqrFhoIybvq2x7GgtIsd7zb7vbxnuI6v
 PKj/dfzkfj7a+7uVGdzoRgzeCFlUudUgmtGV7DPGml4AFae1bZN7nkt3Xk3Ae2fgdAnV
 J3rhQx7YMo2tTisqKN+/eaB5IPd/Ah5GzriIu9cIsperXseHabBxDEmn7XwV5KuOOZCB
 fYYg==
X-Gm-Message-State: AOJu0YysENBBWdhsgmyl2xIcT3NK455AqWLld2Dmb1P4dei8GDj2T7Uu
 yFH7hBBExFZHAikTydCnxrv2WbaMAVQjf6O3XDwysiWL6JfbaJa/TvWdH+qqK6gjFac=
X-Gm-Gg: AeBDietPOiSj18KGstfuf3Xh96hoiYjQVJbJ2t77PUwv2hfKqXLNJ25oB/pZaGN4uHI
 sRvx72owKTNVD2vtAB36emo6FEfA9YyNFhWgpR+kLXLl/qUHpZpy2Meg0g/2apH+2tqCf9xBdFb
 rlUwgncq6u4wQVTZ8eenaviNdfCdixzeZYhp/xdJRghhoA9UZcHT2eJRn1ndgXxM+LYAbGd6zeH
 yjPvM9iEvzW7qJebOX1UgCCNBtuAW3uy9flbqYrZxDk+zXflyBHSCd2cYD011yfC90TYBXKqPOW
 YGq3DzeOqATA1CsrzrZpWJ276cBvrdzYsloxijHPeQvAA35Cpyfr2KD/jaeJrzWgiD22MUgH2OI
 cgKXgXA43LkcW01lCjEsr7i/559ecWSIQ3abcW9V6K04BiOy/iLUmzH+B/BmQf6HL1xXwgeRMbD
 lMYw45FeYw6Un0UYzbukh622dlKTIh1qcbsTlWYAq5vQnh8fZRJRNVr9lZ7w4dBAFO41v4dn4=
X-Received: by 2002:a05:7300:df05:b0:2d2:d7b7:5c70 with SMTP id
 5a478bee46e88-2d5881b0358mr17491062eec.15.1776354894327; 
 Thu, 16 Apr 2026 08:54:54 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2de8f65fc42sm7975820eec.23.2026.04.16.08.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 08:54:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
Date: Thu, 16 Apr 2026 18:54:19 +0300
Message-ID: <20260416155421.2000-3-juhapekka.heikkila@gmail.com>
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

refactor to make it look more nice

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_sharpness_filter.c | 108 ++++++++++++++++-------------
 1 file changed, 59 insertions(+), 49 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index baf9bc141..b1c80eecd 100644
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
@@ -326,12 +317,37 @@ static int test_filter_toggle(data_t *data)
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
@@ -342,57 +358,31 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
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
 
@@ -408,13 +398,33 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
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

