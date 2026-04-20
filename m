Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D4F5580B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031CB10E4F4;
	Mon, 20 Apr 2026 11:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ATkmZx7u";
	dkim-atps=neutral
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE910E4E4
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:06:13 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-12c55e3858cso7337991c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776683172; x=1777287972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7M5pIlHgyVWWRUGSinc+xwttsSzUJ4OvuN383j46yE=;
 b=ATkmZx7uGw8cAlPH5ma0Wr8qEgpCzJvFts4ZOFhzX0z2l/JPJ81RqOnFL7O6QLvhss
 PimkcAr1fRf+8gMp3WdZm6pmKUD/G2zuEbuYEKeAylPEV0gkryN98glKN+dkYHoV4kKc
 f58rqMnB9yZaixTA+fhFa/jXYqoQ2CQMZD2Rb/CO9UhqrqhA8o5/eqnfGDA2qmBh4D7o
 TQizC/ZHEr6LrsbZVgAKHYxKl0lKhEp4yuspTlQzd9ysmUJN6SPxP9098c1zLklPtMK1
 /52IkjJuT/1G9vqddtHICavv5YwsExq2r2FnXoMec081b7HM+7usE4V5DVjdpMijKJK8
 qruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776683172; x=1777287972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x7M5pIlHgyVWWRUGSinc+xwttsSzUJ4OvuN383j46yE=;
 b=aFOJPF36e569cLOmoQojDA4HzoF1TwRA3XjqDvwKkL0XbxZ3uTuoI8i0hSOC+bf2jL
 QVUJ+z1h9azIs898u2LVvR7Fvw1/cCa3/86YJmXSEdq9/E1eJUfYZuvKGLP8GYDPU7+A
 VKzDVomCv27syY+gflxTCCfyhon7x7XJuoDlAd4g5Alhvi0Tox/l5LigyHqsuWBAFPrJ
 7McZdSrjAdjB88f5/z7XILsGJ9dSTyOwIItdbfdmYPBiYeqW5CDWbJLV73uUp2l63XpU
 WQCpw95WaPrRUgR20U3k6dImZCU6roQGkyGGKI5mLb/DG559QIjWJdnolpSnsk8LPfca
 BIqg==
X-Gm-Message-State: AOJu0YyTsy5ohf3Frd8juPrqQadzDHoWKmgTQp+dJrZEDKnc580wlZT7
 Zm0aqivSTpMDjrRukRV99zBceT4Y62S5dKYlaQYfMSaV/QMccgJbP7FDZ2LnZQdo
X-Gm-Gg: AeBDieuzMKIPF+3JhIJjAvlWtXrM0zylAu1PRId7OTQt7Kvv7QRKLamfYgTJ99HIzfN
 ndv0JrLPULLgeYZwY4T8EIVR4mkk53IrlIpoyVJnRFCf8qfgi4fDzIdLJdg+gbHez74rv3LPbFa
 kLbNOOjxjCTKQE/Y+9XQGFJ3mPHdBvOcg3cG7Pr1u6v5msbiZ7MBcUO7p/QBuHuD2POv701xVPg
 FQGb0kPWH1TI/H/G2sWW3kGn1cl4NOMIeF2oEQhJyMxO66wP2F+3Sz50Qca+7gYFXmSyZqPmxhs
 5PUdVsnSJuXMuudQRjQ1Wv2LoHEJUQbHE/+O01T73GxkFFiNQGH+u1l+1qm4Wz3ruViMjDPFyR0
 wwP1IbfvFh0SGbwcDieMkUjVAgXr9DNtDkB4lbz9tbYERrAxffkmeG6UZuQXtFJ4LlH/spouFkW
 i0jnsoEpsZmhtIQuwY3oeUKBtjZJDawRe7NIEwmTtgFAFk9syeowvy8Laaj9CLnVxFYPrIkg==
X-Received: by 2002:a05:7022:41aa:b0:128:d34a:320f with SMTP id
 a92af1059eb24-12c73f6fcbcmr7448739c88.12.1776683172043; 
 Mon, 20 Apr 2026 04:06:12 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c749d322csm14022702c88.4.2026.04.20.04.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 04:06:11 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
Date: Mon, 20 Apr 2026 14:05:51 +0300
Message-ID: <20260420110553.478287-3-juhapekka.heikkila@gmail.com>
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

refactor to make it look more nice

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
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

