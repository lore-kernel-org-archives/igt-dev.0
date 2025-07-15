Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA71C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77E310E59B;
	Tue, 15 Jul 2025 10:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/tsS6m6";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F32E10E599
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:31 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45610582d07so17558985e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575129; x=1753179929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5uKpTNZK8xQb75Jwd2pQrdenBn5/PvVlsbCrc9S3nI=;
 b=A/tsS6m6DkzkilLUBvYSuD3CjeRJmz2GnXhSyN/taoKE+s9Vx3L71nIiTXQirr27fU
 iylMcTzar0bTKDP6teoR1rNz6wcC/+bulMOHvu+5I0J3iLbQz9br9OIN5KPs/QdvsxLd
 3fsQcSy5RTg/ljjwr2/jB6nNEQwoSOEuFdreNzpkTbbc5voAKnGMH9cjMIWgonqv9sFM
 sDmkgYlCI1+wpC/g8sqHkAxKgb2w4n8DjV8GUmBJscQ9d0BaEWmQMTmo3ocqwpTNAX4C
 7Fx/6QoS99AF57xakiDqPiXv2rmKXy8ZG9aIFEzrJttPulmh/xdQCn2GeBar+qQqdXjG
 t0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575129; x=1753179929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5uKpTNZK8xQb75Jwd2pQrdenBn5/PvVlsbCrc9S3nI=;
 b=lKSqt1KMecnNZUIqIy2kGokR5JyFos8OZ6qCw600YYwsGHDIwejf2BkNolBvX3DkSU
 EEZR6kGRBpw+CAWp2SRaUzJw4fo7n7LV7Z/VMoM/OgYPVT1usVCZ0XC3WxWscDacvRUW
 X013rwZbRQ8xV79T5n8HU1wJgMZ3ATxIyuoPyttAUxEuc1tuKcpUHz+VTN0F1h1a1U8n
 MU8eFKA2Y/03JAGzW1cWTkP3wm8BsN6usixpwJ2K1MXib4lenLZ0CyP62uaAzEEeeo3D
 tMcMptCeNECfXIaA3mTKa8m0eblswjppgMUdgySuuF5Ha/z3VJhqNGnNaONl8u34FwZr
 Iw8w==
X-Gm-Message-State: AOJu0YyWRm64dbKNKcbvUsI6lL90/0jbFZDjBhxgMfeMmetQCN64HdxU
 OhqsTRh7ZyGmk5I5XpkxlUBPfKvT1eOK7E6StFgn+sUbFS4flTDzVGUvIjkOGw==
X-Gm-Gg: ASbGnctyI9cBZdV+9pPC8IZsN2CzHRTwWY2GSvVi55JP69PhNBzC9Bh0WCz6XgmsivT
 s9T7OMVOI6XHVoSjNfyo8UaXdppYlhF5+BknduH4svMatQR7IkUjpfuPxnV/lzNlXvYCqQNK5jz
 +tgeuASbQZecDPsGFiW/zzqTSpaBSzFBjfcwxtBGe536r6r1tts+B9wp4VU4FuE6PrMQzmYS24b
 SqlQVagVg7WwwwX15/zJIkGGB3LISaoncb23xYU6PNLEbEkR84VMCuuuC/l01V57h9LovyDeeEf
 ++lhHof7Nn1qPf2SmUHRpO01sy+1GeEuJCz0+Q7vrP2CmHqyugu4/I2CJZnksQummgxpmdDSzVG
 4PpUNffNDd3j9vbeB4w==
X-Google-Smtp-Source: AGHT+IEyIl+BGmD9khmV6D6F+eKgP3Q1RcjyQZlC7R+YcSVecO+ZdGSHaHXMWbW5pi4U8mSiaRmZnA==
X-Received: by 2002:a05:600c:4f8f:b0:43d:fa58:700e with SMTP id
 5b1f17b1804b1-454fe10f1c8mr125818465e9.33.1752575129014; 
 Tue, 15 Jul 2025 03:25:29 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 08/41] tests/vkms_configfs: Test plane valid values
Date: Tue, 15 Jul 2025 12:24:40 +0200
Message-ID: <20250715102513.5636-9-jose.exposito89@gmail.com>
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

Test that all valid values for the plane "type" work and that it
changes accordingly.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index bb9c53f34..76aa6e432 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -280,6 +280,36 @@ static void test_plane_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-valid-values
+ * Description: Check that setting valid values works.
+ */
+
+static void test_plane_valid_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+
+	/* Test valid values for "type" */
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_OVERLAY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_OVERLAY);
+
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_PRIMARY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_CURSOR);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_CURSOR);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -292,6 +322,7 @@ igt_main
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
+		{ "plane-valid-values", test_plane_valid_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

