Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263FDC87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FE710E80E;
	Thu,  7 Aug 2025 07:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQqp9Oyw";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FCD10E80A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4589b3e3820so7160575e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552798; x=1755157598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrgZZxwZNIirGZloe01Xs8a3Z4jyXp+JH2PLVt9fLeI=;
 b=VQqp9OywGYEZsDvFoMfq/xUSm5KrF+6B1L7eLjTjIP8PLZk16Fr9dbLKWBr8wwPwHZ
 +tbzgKhYg6CpMK6F5ODFdS0ST5auJ55POrosZN19fx/kZFvJxZkoagj6quwJw6j3AXOw
 21b7ryKDpo1bVyZLtr4KC9xQZ5ATJl5a6F0Y6p5aYgShEnErQyLP7CxPjPYU4oMksV0d
 5xdhO+aGMiln/2fxU4vfhEkiCJvThrgIsMDTjlyU7/0hwRslMfHp6dOSvV4dc8hMKb0J
 7HWK25V8XVM+xj4hf480ByUObLl2PhY1B3X2bro1kf9JOQXpGbrMNsvQhsLlzrtXXXmh
 ZTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552798; x=1755157598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrgZZxwZNIirGZloe01Xs8a3Z4jyXp+JH2PLVt9fLeI=;
 b=c6q9AMAWeYrotfTpkee4pjSUvBnJNmTSQOCtBhabWnkVo6sy0IGlNcFZIL3QSCtQv/
 pF0JdG8HnrOaQmzjdpzuSmJG7MLmed4eFywKqtoxDf7qap5PetdR47LxN/1BnhNkL40u
 Q9eArzOyqezfI06j+DKQIyWgeaIeHwVS0MJXSE08MQPYXFjrA8eQR8sS9G7zvxNK7ckY
 VcoxMaLjXr/p0Kk53iNNqC+MLuXbwzGQ1TE9phYIwla1glJdahTnoZn+tqIhzNJE9c7S
 mlb47OTKWo1Mh2eW+merjfXIZQPwh8EU2o+iPuIbpiAMZN/J4YnlhpzAK/htRhJ+Zkcq
 lgSQ==
X-Gm-Message-State: AOJu0YyNh8ubmKeD/2PERxNvsAlE/j8eO3I37XYAp+qtuA0ppqnsHa9V
 5MvhJbBm18Ed/QYUhSoYQc1aU47gB3jHoxFiIdaZjJFKrILizmh4/iMedZospYy5
X-Gm-Gg: ASbGncuINkCEBAL8egmCs/V6Zq+QBftgsLHV7/s6O8Zopuek/3k/R0q727XY+fvg15E
 qthEhMFI0cozwkiI2ecD//XRuFNfFmFsLVn4O0iNfCkjl2ZxJpUxaZ7i4WZXZqF8ixR/WoJ4SWq
 RJsyMh/v2lonvGs7Ge5puVZIbyyUCAwZ9T/BMiqI1NVjWIo0xn7DlNhi5HEo4LkeCO7ftMA+AXE
 4z/2uLeVk1er8g6t+fsso1TMCjCo2XZ0JUE8aTWq8dJ1B80GYO4rskRRAX88wyf8lDCjfoevMV0
 wvQYRSozECHt2cRxXdnQiailHABK1IEGcV7qv4aCfQcqiHWUgoDRFXlcoimhXGZ0HpW80ScHCWa
 WoKt6obfg2wS7tgLgEpE=
X-Google-Smtp-Source: AGHT+IFa+J/5rs8UiZW2kVJLaRDVJgEzHfNQcAqCrrBFhD4gediF+tGRk+rlXAHa65AazebkSGcAeA==
X-Received: by 2002:a05:6000:3113:b0:3b7:76e8:ba1e with SMTP id
 ffacd0b85a97d-3b8f4160916mr5142106f8f.11.1754552797558; 
 Thu, 07 Aug 2025 00:46:37 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 32/41] tests/vkms_configfs: Test enabling a device
 with too many encoders
Date: Thu,  7 Aug 2025 09:45:41 +0200
Message-ID: <20250807074550.6543-33-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074550.6543-1-jose.exposito89@gmail.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Try to enable a VKMS device with too many encoders and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index fe8b3b650..1e192e3d1 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1256,6 +1256,60 @@ static void test_enable_no_encoders(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-encoders
+ * Description: Try to enable a VKMS device with too many encoders and test that
+ *              it fails.
+ */
+
+static void test_enable_too_many_encoders(void)
+{
+	igt_vkms_t *dev;
+	char encoder_names[VKMS_MAX_PIPELINE_ITEMS][10];
+	int ret;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = {},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(encoder_names[n], sizeof(encoder_names[n]),
+			       "encoder%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(encoder_names[n]));
+
+		cfg.encoders[n] = (igt_vkms_encoder_config_t){
+			.name = encoder_names[n],
+			.possible_crtcs = { "crtc0" }
+		};
+	}
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1291,6 +1345,7 @@ igt_main
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
+		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 	};
 
 	igt_fixture {
-- 
2.50.1

