Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCC4C83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2492E10E5B2;
	Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C7MIuo+E";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582FE10E5A9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so37555395e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575151; x=1753179951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbjF/95uL/yPcpRi1I/eGQniXBYNr4E2PVxbk/oeNt0=;
 b=C7MIuo+Ed4TTDvGqYQjb9M3POy7eDGqzuTAyVKsa+kTzNAvXVNo/g6jKnslg1xS7zq
 0vqTUsAuimzJJd0mGYNH5lJlYGz5t4C0I1PSFZFpksv+1uPSHpgo28mMQHGmQWK3lGXd
 b7g7TaHMdw5MF3K/+Xhk8AMS9+mdHizeCPkIM1wypvQg8Pt4J2IiwWox4ETSrscFwCe4
 5By9QZHG1Exfl0X2rdLnEfx8qtfG57jj9xsXVrkMm+m8P4iOZSxILEj2A55/OZCQiOkr
 SabvRjsL1Spq3NiOcizNO9yZIDVb5ZzKXUMdly/r6Q7Sorr/Jtx5PMEFkKXr7atlz09p
 wgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575151; x=1753179951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbjF/95uL/yPcpRi1I/eGQniXBYNr4E2PVxbk/oeNt0=;
 b=oWk3ZWOFhp/L3vQffbBovXggIOOGPenXkxH9p6F83OcxIp4b03cCU7ehhEq8mEcFKk
 UWjmApz1jsPMe3OYMb/ndaV7XtaVKyWSxcsKJ5HRnLl3m0mzoicbIpyjwVRyeTNIIhsb
 KENreLS+1vTpyz1j9kvg+hGSZ1i0gGAp5Aph4ZlhPpCdlIkGsjcKg+ir4UHSjf15V+dd
 l7//2KbXngUP2tFlLY52En4Gtgwe839tk9S9UE8/iHZ4bLPfoFx9/IVcjY5WtAowNGvM
 ZUcoFYJ/9Nh+Ni94Jr1StopgeiiCugjxgJWIQHkh542ags24cAG5S42oAMDPXajcyfOg
 AsAw==
X-Gm-Message-State: AOJu0Yy7ipm4TEPkWtd5M1PMRwx4Ld+ZIgCOeUt/l3vP34ZGaoY44pq0
 z8mEfN109O+jaINS4zIpf9sbrveK8BoydmJoW4BY9qFboTSO5/W51uJS0aRWUA==
X-Gm-Gg: ASbGncuwWth/NDIXeQIcf0B33PE0RghiS0Q2HBoaP5YIYrRiIH2P3hJlHsTkW3l57LF
 OxrogrZ2xitLKuCh6Sn1MxrK9P9CCnqp/796kHetekf3mUaUrUaguevgyyEX1WVVFRN/PD22X0d
 3zKhD2DP3fC0v1g/8uEm1Jydc0BM3h2FsW89fFB1aX7YJVAP84xYm/5De7IwmudHB/dEONTNwOl
 t/k47S+DltLfb4H4nuh0NXjvYz02UHktH4UeQUIKSPPQVzjk6J5ruJ6GZGeXdxVpgyueg/Geb5B
 kFJRxqk8G9+odZjv1lgnKcaPBVXrMa0Ys5mLFTIr/Z89PtsGndV/032KyK0nbKIdxBiM8XsNIGg
 I3jCgON9fexj0SbxZCA==
X-Google-Smtp-Source: AGHT+IE3aQhTFJHX0fDiRxnueTmVB5MfhMvQVfVvtUrMB+Aek9vgw6vXY9y+mpprkJK6acE71RHTJA==
X-Received: by 2002:a05:600c:138d:b0:453:dbe:7574 with SMTP id
 5b1f17b1804b1-454ec15f7bcmr166183445e9.12.1752575151345; 
 Tue, 15 Jul 2025 03:25:51 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:50 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 36/41] tests/vkms_configfs: Test enabling a device
 with too many connectors
Date: Tue, 15 Jul 2025 12:25:08 +0200
Message-ID: <20250715102513.5636-37-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many connectors and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index a915cb15e..ad5d72481 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1442,6 +1442,57 @@ static void test_enable_no_connectors(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-connectors
+ * Description: Try to enable a VKMS device with too many connectors and test
+ *              that it fails.
+ */
+
+static void test_enable_too_many_connectors(void)
+{
+	igt_vkms_t *dev;
+	char connector_names[VKMS_MAX_PIPELINE_ITEMS][12];
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
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(connector_names[n], sizeof(connector_names[n]),
+			       "connector%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(connector_names[n]));
+
+		cfg.connectors[n] = (igt_vkms_connector_config_t){
+			.name = connector_names[n],
+			.possible_encoders = { "encoder0" }
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
@@ -1481,6 +1532,7 @@ igt_main
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 		{ "enable-no-connectors", test_enable_no_connectors },
+		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 	};
 
 	igt_fixture {
-- 
2.50.0

