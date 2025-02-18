Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0843BC021B3
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE5910E7D0;
	Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iqXdHurE";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4888D10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so1080573f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897444; x=1740502244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EZXHMbWsyyxpaxn/UFT7mjSxTphODTVukYNphnQzic=;
 b=iqXdHurEMdQPisxP6v6TREtKj/JDUkfeP2LBlF8tHx2h0I/obxjlpl5HJte8qQr3Y4
 qsy6jbeS9xIQr+texG8+LbzB+qsitTafE9dzjO4ngMENwMSF4uZ8SiEnVCMl45bAEf2b
 k5cCqEgGv//u3nZ7YjI9+1t3CS4xfuFFvQjPBVsJf/HxlA0U06Du8f5ABsoPF/hJih09
 pRmkkt54MG0I43d0b5f564B0GWFOPVUdJPZw4b6JBCmc3k0qWi3E2pNVbay/B8HesJ/c
 QmqhWbAf/iSLexqrbnU2rWNf4WDmPZ8vgAcAyBMheiOOAHbdHTIMlpeHbCae6wabzBna
 bLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897444; x=1740502244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EZXHMbWsyyxpaxn/UFT7mjSxTphODTVukYNphnQzic=;
 b=vX9zlJ7fYjPGGXN9TlM/l1EKzjntwMopfEf6rRY/Oc5ZtygyAKgKc0F0U90G7y6ecT
 tsoQ6+ZK2MPQf+qVJvKktBEyr93ISDp7c3hugNtMTnp+Cje+uI3slFQrMZ6U7lNh4TEs
 /q4Y8QXWdv2XC7IceY91EGfmzCM0Y0OhJCUZWTwCL4Mfu0OrKMJDRZOyGidCqkBDm8U2
 nIhN9P8lgv+Bavxxv0gktK5KiRSFz9xe9fPXMYJobgyPQ61QZ0J0oBplNwb5EBXr6/T0
 7jDxCPgG1KeJQUSSTgQGWjoYnvz83SmuHCkr22Ic3ol4IkiUS6v+fEMSNLQWqbp93C9q
 3b5A==
X-Gm-Message-State: AOJu0YwS4wE7DUX2WSRwUkJgUoDIh+zte+VwVh/RaYU6RUiByOLn/urQ
 dumjkxVTkMPZZdulavB7FEKloxXGNAFjdzP27wE7tXUSvsAxZLJMQFq79g4t
X-Gm-Gg: ASbGnctA9YjxNAyfif4B/p2t3VXMJ8H37brBkN+0mXY19d1sZPN7jPPpT+ivjE0rc/x
 8UuQsgi/fILwPpK/OHWKkzW6IGosKLQpnjrVCG/kyQzizJaq2Ihxqkl49BBILtw/Pp0ECczQUeV
 OSkCZ1zMRR9ffsCa3g57UzOT0mW4BH1DHqmYLFEF0CJUKcMT5MbcNuPxHCztbB8/p003NdJywWU
 ub68WsffAHerOdIMnk307hqoCE09XcpTsWbaRIdIn5JRJdFszu46u0pl9l6X61USyDEyTi+qnEw
 4q4L8GXcVO1PPDHZ9A==
X-Google-Smtp-Source: AGHT+IFepOijBvHCj1YBSPptkmT7nDz8CPgYH4T4Is+xUEqGGgnLgXf4xKUy5W8w9z5K2M4ASvr70g==
X-Received: by 2002:a05:6000:1f87:b0:38f:3073:708 with SMTP id
 ffacd0b85a97d-38f33f11888mr13595540f8f.3.1739897444432; 
 Tue, 18 Feb 2025 08:50:44 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:43 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 32/39] tests/vkms_configfs: Test adding a CRTC without
 encoders
Date: Tue, 18 Feb 2025 17:50:04 +0100
Message-ID: <20250218165011.9123-33-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 11ed6dbcb..e003e0ca0 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1278,6 +1278,56 @@ static void test_enable_encoder_no_crtcs(void)
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
@@ -1312,6 +1362,7 @@ igt_main
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
+		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 	};
 
 	igt_fixture {
-- 
2.48.1

