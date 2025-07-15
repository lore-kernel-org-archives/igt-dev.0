Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C8C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF63E10E598;
	Tue, 15 Jul 2025 10:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YUSgcxq0";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4B310E5AC
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so3944899f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575148; x=1753179948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jM6SbO4ZPnMBRyH/+HonbWE61LW3Z8f5+MvzZBiorRg=;
 b=YUSgcxq0YVHReynR+5fDItbQaLzD+Kefszcqj8TITharFWBrxcC36QkO6V2/ZyCeJg
 3QYfBA+4aVcBmOYlrYlydQm+dfzgbcjcvXTGivwyRSFrVwC3WvVPsGADgf4P+kUo6Ccv
 +ihUYEV7OjX3T+37mXu3/P2oEWQQYdt5UpdoMC04qF0hB3YE3mwA3tq7fVNSVBeqlMRE
 6RIbiRmtOdzcQwnbmogoH9C2rxNkNDk82MuW7ieNaVtCgwI6Trn1SPUAZh/YaEQ/yL0O
 ve//PaWA7meuui1AYfYfswoG6qILHRvlaeGBQD5xd5Ql4mqM2Dxh3MCNzeWfEJa02wMK
 O7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575148; x=1753179948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jM6SbO4ZPnMBRyH/+HonbWE61LW3Z8f5+MvzZBiorRg=;
 b=kGIqzklNvDZWoeMSjrl6L8sCCwHEgsiCiyJPaEcfCWEBUc7U3K+GhN73mkb6bKHZ3e
 5wuphQDXBVTddRI28JYYbjGeEdLQVvAG/rP5U1Mxrcb3Wqh/h1o2atL4td4ad8ADbOgR
 XowsuLwbr9Um0Nwx6eI6Kxir+NlO8pssfAw/0yLxyvRQ/W4V8xTRa5Ahdjl3B6X2wU1M
 H/gPvwDLwcKB9velLM3AfJRSTiC+7Ei317ZaHZZfx3ZX7r9zlrZV3N8X7wKQET1CaSvp
 gJeT9ClQ52mBJtwIh0g1LZSWTW4bI5xvhqki4/Swt4Ue9pXRLkIcKwlO+iVl/GgdAEd+
 XFAQ==
X-Gm-Message-State: AOJu0Yzt1rpJr5bEXzXt4FMlLH+nusGfqRkh2iN8/YJIBdfbrFMLbeGQ
 LVduLfWIBoq7X5zndssGE7Q+2Tc/Qf9AvfP8M3sVXLOrdi7Nhw/4qH9019HpWA==
X-Gm-Gg: ASbGnctCplPj1B+02fM+Wx+HXGJ5AQXe9uJM1mjzQoY9EDB+0TAHNXNA7AZEIFst7uD
 HT+Uli7A8qwkR3bq/zVe3tfZeotcm4U3FnNiwD2ukvnrOAkRNFoLpR8mkX7SuWqyu2splOIVYwD
 LvtA6LS4o29iIk30hLNBItahY2Tn9hovMylkOK1b2D+jShBiUSwH4ysxam7Mn4fu+5Y+yhVQ9Tq
 sr1dfB87VMwb0bdIPozIlOY//Nnjj9qPg3VnSOK3NmfVO792Cpnz99SiQke43myfLv3mv+P/Bzv
 ER1M3Y+sTSHxLXGf4ndF052s0LAyWX7kcMVI03y5PL8rctjoVztNk2nyxc5uzhy56fNY/htDhyE
 QYDDmz0A2LQs41kiEbg==
X-Google-Smtp-Source: AGHT+IG/7asH9ntaAC9XEmGNAhpTSiHfNe0cuQ02hRQc8S/yMZY4QLtOI0QJNRu9L6+hndpjUpL0GA==
X-Received: by 2002:a5d:5f88:0:b0:3a4:dd8e:e16d with SMTP id
 ffacd0b85a97d-3b5f2dc2ad0mr12178259f8f.15.1752575148512; 
 Tue, 15 Jul 2025 03:25:48 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 32/41] tests/vkms_configfs: Test enabling a device
 with too many encoders
Date: Tue, 15 Jul 2025 12:25:04 +0200
Message-ID: <20250715102513.5636-33-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many encoders and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 5be89edef..1885318ad 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1257,6 +1257,60 @@ static void test_enable_no_encoders(void)
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
@@ -1292,6 +1346,7 @@ igt_main
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
+		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 	};
 
 	igt_fixture {
-- 
2.50.0

