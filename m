Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8DCC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086D310E5B1;
	Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dqg/Qfou";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E28310E5AC
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4561607166aso16744425e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575147; x=1753179947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XY4YUM6gUtQBApd7ARG0trEeY8eXPGUyRozqtzlZTQw=;
 b=Dqg/QfouBx629lqbIXYj95snxIpFXFI4yrHUgoK6JL8ni32GUvaJYgscNkn1Su8MuT
 MlYzkkb+//5kK9VI6cjiB4Xr3yqFt/Nvo5+JhPIzRqHikge6hXEU9tEBe7qxI0I60hAJ
 CsAsP3NLCUriexLGp7+nDuDGknx7h6CcyNLWReruEehhCtRSvWXsGk4AX06ZFDgH4+pa
 q6NPuBvoE/10OZZl43O3n02InmxZdPUO1xTjXgG1L8j3Z9MleIuLj903C49QVSevgY5m
 ghxer05CGjBsNIOWdCWdFlbz5zArv769iWy+gtvluJNE+ruP9gMMGt4Fl7Vp5Ujkebtp
 NEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575147; x=1753179947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XY4YUM6gUtQBApd7ARG0trEeY8eXPGUyRozqtzlZTQw=;
 b=i80b3mSBQ1a3OadJCpk3QXpgPm1FvBxxf+5KVVwvamsIwP4R2LyN80YttkFrrjjMbH
 n7GBHASTPJJo6YbA3sgcWtL3bpL6b0GKfpDspgiX5V0utyHG6IdbaYj+Do2AP1Xc9FDr
 tOqwe7pwRnmoafJpMP8mkCXUU9dA748L/nhYnHpg6IOFZWNFrzzk6mCddlWAkBrdgiFw
 2Dy0REFiCLoIJrbYVHYwePdAEU1MVl7JE39vQFEKEUgW0nSymsoVyDo8rzZqnLXpS8qv
 eFJxDzKSYzUhkr4OIIKBEPELQ3BLpKzWfthNHrxJgYcpv2ckDeMQoO6UK/PMYRrEMu8a
 6lBQ==
X-Gm-Message-State: AOJu0YyAAd+jGacJRmzpNR7VSYwb4cO2dYQXM6mQyU5mpw2or/tflOSZ
 l6Acd0GUt8WF6ynTfiNGfTzWsfv3pLllgYTlYd3umso0JFfymgMXDNS5VqtADQ==
X-Gm-Gg: ASbGnctSwkHnTmB8YCceENr3giAadFz5WKBjLLOM5IysOjCX2M7+5q1W1jxSGyFX57C
 s5YOcKdux+4HYm0a10Uk85MzE8MbogzKXqc32WZVfvgYCi41+fbrApgJPlnfwmb7UFPI5G/xZw0
 mOxV89MEFQYYW1kAsicPzr/hHZWZk3iZS2EsTHglkZuuhi7uxLsPDNiAUCN18ZTjemGSSLCpr5+
 B23do/+fDnYdvdw8blcKkgrH/WlThPxwI1A+Sr9zj+U/JkuVwKzw4BIT1xM+D650mMupUFJlmkz
 WjI18FJYp4l25VuB2XTqxe453I2pf8FsaJ7KSSTwKYNV37MO6nOHnx2/qzhQ72WrSMoDtfRlK6D
 klK2EAd6RK8ErnSMfkQ==
X-Google-Smtp-Source: AGHT+IFtsyYvfA0Xtx1tRtTpTUPNUV1E6CT8m430H2ohJDyz+LTmRNLmUxqDCzfKdq4+9CvkNBbwfg==
X-Received: by 2002:a05:600c:3d8f:b0:43c:fbba:41ba with SMTP id
 5b1f17b1804b1-45565edca7emr118380515e9.28.1752575147119; 
 Tue, 15 Jul 2025 03:25:47 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 30/41] tests/vkms_configfs: Test enabling a device
 with too many CRTCs
Date: Tue, 15 Jul 2025 12:25:02 +0200
Message-ID: <20250715102513.5636-31-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715102513.5636-1-jose.exposito89@gmail.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 22459a547..be856876b 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1163,6 +1163,59 @@ static void test_enable_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-crtcs
+ * Description: Try to enable a VKMS device with too many CRTCs and test that it
+ *              fails.
+ */
+
+static void test_enable_too_many_crtcs(void)
+{
+	igt_vkms_t *dev;
+	char crtc_names[VKMS_MAX_PIPELINE_ITEMS][7];
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
+		.crtcs = {},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(crtc_names[n], sizeof(crtc_names[n]),
+			       "crtc%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(crtc_names[n]));
+
+		cfg.crtcs[n] = (igt_vkms_crtc_config_t){
+			.name = crtc_names[n],
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
@@ -1196,6 +1249,7 @@ igt_main
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
+		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.0

