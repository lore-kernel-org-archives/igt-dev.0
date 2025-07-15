Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0E4C83F2E
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E45210E5AE;
	Tue, 15 Jul 2025 10:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hMSk3CNY";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000CC10E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:51 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so48573725e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575150; x=1753179950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fN7RR9iKOgu/ekfDu1nZ8nJxvgjo3bbsX3VYAcwqHSs=;
 b=hMSk3CNY5iknCmazbBv6fsxeVuex/1EtaO3pDF61EKG7Y29p+tzQ01MF9SH5zLXhTK
 kvtUAt85y2TvAl8njNO9Akkc0Qr2kGxnJcsTneMk/WIW6pVi/1aA44koTL8IHjoBM3LM
 r7ZC9xPUhwysiCFASUwppqMxRbmvkjbF/5ril+6PuGD8GVHAb1XTTIx7hg6TUNLAnq4d
 eofsb2dlRWgp+Uf+nJ8ktE8CS4nE7X8hHOC7i4Xr+5itRNdnWoPV3GRAainqb90n+Sfz
 I+8TTnUmCAROCaoXX6SVRMTgDQvCNrvMBJWemaD0u3TGFI6KZr0ut5Lr1KaSyF4DqZQU
 4+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575150; x=1753179950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fN7RR9iKOgu/ekfDu1nZ8nJxvgjo3bbsX3VYAcwqHSs=;
 b=pBOKN2fZsCTskmvKlKQLVmZvHFfm0mkSCnEp4d/Vi5WcwH8yn1z7Lt7jSeMgaKO9oM
 8wPj5jV0qEGM40AWwRnnPRQc37gs34aLHutePPKdUlzUY1x6MhkHapH9L/Y1lfbSpnR8
 rsbljDK7o0YQpR1BZfgK/ToUDUen1XKp0e/wdTIlVO+6oCQtBjzffa23zW7ptVz7wdp8
 o/2btG8QXd0jfiYpc51z0KkMg1OFrg9fHX05NWv5CZ2hgusyDoObm7wjpcs79IpPSB1q
 R1bWbA26QEW2JWcuDdB36Pc5xlYOwoSATrG/kNnyq04GBEDzYnaiwhBBaHKrPTcTO4C7
 cK+A==
X-Gm-Message-State: AOJu0YzH19bL2HV3xUYm4OQlAgTsOhYDz+cf/9/6WdhOeLU2NL0buqvE
 6CGSazAHaMXMFZi79hEvI5dDoKDPowb01+oIMaYXhTq1o0f3Xm6dX0gyRnsTag==
X-Gm-Gg: ASbGncunNJkOUyCQeVQVEMAxu06dxGFginnObS/cVVFnrxfC+Z013flBZcyQCSieY80
 psiOtouiHF+mLcziz0WmUcdEG6UDx4h1cv+mipQYD+JVMLNYPOGcL+KWoEiocyMqGLwPcdhm+Kx
 1kIYW2msnh1uFBsPje57enxMbWStEWMKkssJFJW8HDNC3iOhQCTUOYDrO0TmvvkYCIQaP9/5ozw
 X8Ku8KKf/hDIMoHXYsGxyE2q81O6jKSOyvQxgb6cRs1jn+V3bD8gFQgmn5uIuhTJf4awSSeJcs+
 3BC3yplNc6SGJRzBoAYWbbHUd+NCkN0pCwV8Ot734FszzKgk4AXZJfIdth3SpgE9lEkz5TlHpe0
 E5aPNmb2DV5Z57QDSrDbYeNwaC3uP
X-Google-Smtp-Source: AGHT+IFyU1J0KV8kWFfaWqId6tH7P1eX0oZuhoALQDwRq2YH23gNqdQknogZWmrVWWdoSqnGoEBmmA==
X-Received: by 2002:a05:600c:3155:b0:441:ac58:eb31 with SMTP id
 5b1f17b1804b1-454f4257e83mr123739645e9.20.1752575149922; 
 Tue, 15 Jul 2025 03:25:49 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 34/41] tests/vkms_configfs: Test adding a CRTC
 without encoders
Date: Tue, 15 Jul 2025 12:25:06 +0200
Message-ID: <20250715102513.5636-35-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with a CRTC without encoders and test that
it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1743625b4..8fb5f9569 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1354,6 +1354,56 @@ static void test_enable_encoder_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-crtc-no-encoder
+ * Description: Try to enable a VKMS device with a CRTC without encoders and
+ *              test that it fails.
+ */
+
+static void test_enable_crtc_no_encoder(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0", "encoder1" },
+			},
+		},
+	};
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
@@ -1391,6 +1441,7 @@ igt_main
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
+		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 	};
 
 	igt_fixture {
-- 
2.50.0

