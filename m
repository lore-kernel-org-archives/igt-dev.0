Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B59C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB6010E806;
	Thu,  7 Aug 2025 07:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GJ4vH+sf";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B59710E802
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-459e1338565so6387605e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552795; x=1755157595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWTSjTKzsnt+/Tt0RBh7KzSyaT/ZXIqKth6dCAWBrCk=;
 b=GJ4vH+sfPtnZQrLJmKLlbZEfsUjE4R5bT7fghKx5suWQ1LUby+asHR2GaRUWYWvesI
 WpfW+BC0B9MAj7l3oX45T0hf6LA8lrcgMwmI0hksVyXTJ/51QJjSKw6ujNeZLLwq4k7M
 XkI8oT4mY1H0lW/myNwDotVuqoyJD4XCE4r7YlaA2hZ1+SbBhsaR+uh/A2CKugp3E+A1
 RxygiqdKlfCC5GfTMFOZb1ZgdHMrw00/i+KZoTqn59uvhRIvP+iaT0Sb+rFiUREwMqXx
 gScCLxgJebivMk+8/DFpK5eqL1j/kL0jO2UweOCEqqGxsgv/+P04zT5kHYYPXb7RMLjG
 E0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552795; x=1755157595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DWTSjTKzsnt+/Tt0RBh7KzSyaT/ZXIqKth6dCAWBrCk=;
 b=niuGF1TEMd9mNuIU3iXC1TNWOCdPIFlWsB5lBm3w5bfVYcLu0KtclFsPXv3sFId1+Z
 4Rl7WWscSgLo3PF54+980M+B8n2BUr4qztaZ6ycY0mHiH304wz7YY/9KrkinL3JoRdui
 nqLKXyOrnQzHtDUZZ3tMVQtW1a1MOXLRlmO6w3G2xlQqqMut9SOnThRcLemvT5zEBzw9
 xAHgljMzcLwaXO9hiC+xjQr9CSkU06RfOqVz15u7IRQmoYQpngDlfzs86R86hPpyzz6Z
 4HAALDTEnPSzk73LmcUgGbXMIUxOuAvo2fH9oeYYHV+bRHuj93xNzWBb2P6Q8pI4v96q
 n8nw==
X-Gm-Message-State: AOJu0Yxtjm4GRjSGHcM9T/SoptrKVfA/XPv7ZwcEvKm0SjY9wUy+u9pn
 TESPU1My3bPriRseuVe4Y+d/eeNWvw7e0MMqHfOlM4PB9/nEWSNZWDnwyeL7i7Lg
X-Gm-Gg: ASbGncsplz/JMVdC1bnk7sb08e808/SP5PnqCDBhwQfXeereaegWDRel53A9kXQX5hL
 b/2PnJ7l4yjOEgIXnMlPzk0HpDBWQMEJD5eRQjCcz42/MKEFnSBVcF4mKVTqKM+8qOWUSN8G0rz
 0InyLdlcUGA0h/5L235n348mts49oF8WaLEjOqycl6R2SW8o8ny4jTr2ouH8fDvJNpKa7atD+O4
 auTcPDGPiSwqMemhJUI9mietNdIm/Cwthv+uolWBtoAChMzk48xMn/XoefZVghxi49vLUMJEtXX
 u9U7MTBAEnlXVRStRY/CBKDDnX8nK9eKinJG1qSQ2U/sTHD/F+Fu0vXD0Hrt1xtuwQeUxERJ3yw
 pA2OYQWFwP4cBFzyWX0M=
X-Google-Smtp-Source: AGHT+IECSN3L2dR/mOcmPpNDd8IF30Q5/vA5YjEKDzqRG0bbh7I3fcTwmH7dO5n0R5DQxsqDfVA9gw==
X-Received: by 2002:a05:600c:1d02:b0:456:11cc:360d with SMTP id
 5b1f17b1804b1-459eb751fc0mr38527045e9.9.1754552795028; 
 Thu, 07 Aug 2025 00:46:35 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:34 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 29/41] tests/vkms_configfs: Test enabling a device
 without CRTCs
Date: Thu,  7 Aug 2025 09:45:38 +0200
Message-ID: <20250807074550.6543-30-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 943e28afe..919570e71 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1121,6 +1121,47 @@ static void test_enable_plane_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-crtcs
+ * Description: Try to enable a VKMS device without adding CRTCs and test that
+ *              it fails.
+ */
+
+static void test_enable_no_crtcs(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = {},
+			},
+		},
+		.crtcs = { },
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
@@ -1153,6 +1194,7 @@ igt_main
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
+		{ "enable-no-crtcs", test_enable_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.1

