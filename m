Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1152C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C22C10E5A9;
	Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b/bKcCBL";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EA810E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso38377585e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575149; x=1753179949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lll+ChjJOr0sMK+SFLReCfniaarAMSbS8y7GxSofVG0=;
 b=b/bKcCBLvhbtE5OhBQQYQJij5a0J1p24shauCA5dWQGoOnkKe2ERIgUoNJyoT++eZt
 ARnGnXEIV260E38Svd0BRsEuzYvtq+mYYEKB2micDeeGWiosxxKUPMP/FZ1Y8sL6AFYG
 tZPMkuWH7AKSYo2SXSc/NhOnkp07OMINz+GV0QoUTgrnY1ocLfVdFMlz0ac96V6sh3r6
 C6cN64ilke7cmk1f9J43+006vZnY87lJhyHcs5TFRZlwXSZkNj4WKLTLKART0QJSeGy0
 TGK41jlu5W7ZH3IHq98PFHAGTaYEpK/maGgRtG3fZVlJEpw0FybsVELlHdkGPpFr4au3
 kFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575149; x=1753179949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lll+ChjJOr0sMK+SFLReCfniaarAMSbS8y7GxSofVG0=;
 b=iqNk7QzHA1Kr2AQ5kKJiYUIjdepXbHfG7KnFM4Lq8Q3QGWmRUHruWaGTN00OMXVWXB
 xcjd74rZXCe1/36urcVgn3k3QMDMvtqTII1UQgnRREw6Ys5vGkmX++Ft0wx0A3d0EjZB
 +9dhzlAVndUlLgHkICkC7IbiSpDmIfzTzmeJ6HVp0/Sj7+Jbm2kNsoOP4X+etmsBhMYZ
 QJdeuYxhb6riZEkDGwL3gLmJHwdactvLYV15h+wxUf6XNyZC+7IReTblUZ14/YqAzAWU
 /6Z4qZlepPbyct3+d6c4asCVLWEeAuELquulK0NScRF/5oqZk2bkT1+VKi7PaEiQUJLE
 52Cg==
X-Gm-Message-State: AOJu0YwoNKDJme6tudc9ZHT5N/x11bsHjJa9hwji6c4UChJwUnOUdweS
 2mXBn3GDWwI1kV/eqYmK3RNpa5wXQYsBs9qcfsqFSHNvgD2iTuCsp8fN/bM3Gg==
X-Gm-Gg: ASbGncu4itcH/gKANCOZP1FyIpweyjFVJ7eSCWEE66KHshqFNIn2j91TcBtK0HacBgA
 sNIPSff/wZH/j1kZu0lt7Jefim1SBqiiuzsfGkqCVgfWY3Pf3sFZdpftbt+WQZvQZE+Lj1yuu1y
 ptaEQzq+QQHPZ0iOoRaGNJHtNdnUmS2/y1Z0GCcJG+AK78a0JBxMe/Rl0BX+Xnyp50t2XVho+ax
 /CAvxx+dPWE4dRrbfQzP/RELGUyhEbm04B7535w7fXZtgXcxILPkMXTC3INDll+xQ2GB7DL3nmK
 ApIlG5E8JvgyEk3+wjl2itGQ7Xpn41IhsV/YBTkRyVro1oKCB6iNBegHPMj7Wvx0ItrkLjmdWn1
 RH3//ayEUUKlQY8DPyw==
X-Google-Smtp-Source: AGHT+IFHmBayrK0FJ6ifhUPCyD6NbC2oe23U4RDt1YEzkE1olt3MXd/5J+msxp48joYM0ME0Z9nrPA==
X-Received: by 2002:a05:600c:3b94:b0:456:d25:e41f with SMTP id
 5b1f17b1804b1-4560d2660c9mr100473075e9.7.1752575149215; 
 Tue, 15 Jul 2025 03:25:49 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 33/41] tests/vkms_configfs: Test adding an encoder
 without possible CRTCs
Date: Tue, 15 Jul 2025 12:25:05 +0200
Message-ID: <20250715102513.5636-34-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with an encoder without possible CRTCs and
test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1885318ad..1743625b4 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1311,6 +1311,49 @@ static void test_enable_too_many_encoders(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-encoder-no-crtcs
+ * Description: Try to enable a VKMS device with an encoder without possible
+ *              CRTCs and test that it fails.
+ */
+
+static void test_enable_encoder_no_crtcs(void)
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
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = {} },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
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
@@ -1347,6 +1390,7 @@ igt_main
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
+		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.0

