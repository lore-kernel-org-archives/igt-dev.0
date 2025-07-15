Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19311C83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1C810E5AC;
	Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dPGOwYs4";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542D10E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45622a1829eso5492505e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575151; x=1753179951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DTHBsT2qFzzvPGKJ14wB8QVGaxacFry3yPHc3t5dro=;
 b=dPGOwYs4uYhdHap8byKYvGq+bAAzYyum/PUna8xn3hAcGaiS8Hzkns5iNdAUZ9jbCc
 XJ4WOxYVi4ny/sjJazr1cBj0ye0D/wCXCPXP99JQfewFGCb4swXv68yt475+6xBr0Kk4
 16Pzmbul157RYA0RoTZBZl89QlpCuqXmfQRkQP6mqWMaAbO55zhjJPSKApsg654twnrM
 yFOvfN+GBIiBYhRgSuTRYcEV8D7AIQ4VBA5yACwDLj4cISsUnp95THBsqnr+aYc8OAbr
 nbmpcPs6JW2JSLt5V5Rfb6pPGu6rQ6mdpZEaywRu7OZkTVSwZ0BZnPYovgmsPrOszs7+
 k5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575151; x=1753179951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8DTHBsT2qFzzvPGKJ14wB8QVGaxacFry3yPHc3t5dro=;
 b=FqRwHopzUOIBsYJaiLawSXxaSFFcnCfeII/2LqsL/C7HO488iECjwoLXF0fY9+usrn
 0+KHg99tNrFP2T4GAw+tK2WhJAJJ0uYRC6BfXj1W+F8SPBJtZB5sXHPJBzkYy9KehnMC
 CJrfGyA6Oj5xKGq3h+988Z2Kw5O4UAGCXCODcDEb/0CmJbbyk8uL+n2EN9hvYJHhhXPc
 Zu6RqRoiJb9neNmwjKZc2yYAcGqRJRdzspUi2Iz6Z2Yo90C5/SMwhq5jTMFzDQNqfe6v
 imoSt8UCB1MC89S0uaPp2qYT82zkTFVQLWRleNYvtgEC1ORle3NYcyHokYfrLEBq2QAA
 X7Pw==
X-Gm-Message-State: AOJu0YynNB5Ge1oeitPbv1RGzdJS9CfM9iyNclBm8LTE+OEFHqRWHUJ+
 h/25zzf8J7YvpiINTjolV4RaaE7ocU1zaNkbqKhLlsRy1l8OmmKN+Eo0bzHhOg==
X-Gm-Gg: ASbGncsExzaptyOz+bHGXvVw4NJiAeKD5SoCAmmYRgjrPzGIuUo+GOt6Xbt1R5oy9hr
 1aArfRMnImGsS3WXXLFn/S56xqgFqc7q8nlaxLPeoKXj1JStKr71EgpdgoFTRO2ZbMbdv5SbH+W
 EZ36+lcyR5iDmYXef0u9xhhLRtY4vrqvrs1TSTu0mryDBPfGogzfQG9398kdPfXs6tUZOduYjvN
 cPglJv1CnyP9iAuaxsHAacoGgyFJrk58doDzLKSoTxnP2FZs5wFnJO7Wi7dPiAo0/EuG8TBkk+Z
 GMd766YpOF4QjfLvbfU18g2u0sKU+Hy1TiTekWOvkusjyqpsnT6UKje18jQNLhklxmMwdc6UpvN
 6Wq5hgY6Rn2XIdF7ieQ==
X-Google-Smtp-Source: AGHT+IHIH5pofEucclQwJBpsvwpYj3IhHp4aY3iTSDbaXYFHS7uYWGUtgeJuBSn5WuO/njBLXcvaCw==
X-Received: by 2002:a05:600c:1382:b0:453:7713:546a with SMTP id
 5b1f17b1804b1-454ec16cd4bmr166019975e9.14.1752575150644; 
 Tue, 15 Jul 2025 03:25:50 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:50 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 35/41] tests/vkms_configfs: Test enabling a device
 without connectors
Date: Tue, 15 Jul 2025 12:25:07 +0200
Message-ID: <20250715102513.5636-36-jose.exposito89@gmail.com>
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

Enable a VKMS device without adding connectors and test that it is
created with the specified configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 8fb5f9569..a915cb15e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1404,6 +1404,44 @@ static void test_enable_crtc_no_encoder(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-connectors
+ * Description: Try to enable a VKMS device without adding connectors and test
+ *              that it fails.
+ */
+
+static void test_enable_no_connectors(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = { },
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
@@ -1442,6 +1480,7 @@ igt_main
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
+		{ "enable-no-connectors", test_enable_no_connectors },
 	};
 
 	igt_fixture {
-- 
2.50.0

