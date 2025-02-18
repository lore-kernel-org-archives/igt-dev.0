Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6B2C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696610E7A2;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TrI9Ey2g";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1113910E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:43 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso39782305e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897441; x=1740502241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uDHHN5pbMkqZ5Q3GJ12R7LOZiU//dlxqNgLY33VAMs=;
 b=TrI9Ey2g8NvZS1AeDRdGnii9MnBJzDCxvVkGRNRsOfyGuhOFyxOc0Oo4P2U7gsvbWL
 M+O0FfUJVOmRJHCc5z4rMyFZDV3IAFV2MQj3LeViwz0M9z4jJGbAQZ51JmPKlUUcwcmI
 gRY8aaDb/0AE5yELiFj0flzwesmdCi2iSD0mga2CcICeGCjJHi9UNglsXq5OfxwFqAji
 aUIaOJ2uId2LJAx0ajTIrQcd4g22JmHebq6133KeJ7emHb+2MQ1dxdnsSM9tisEY3SxB
 D0mOVmDPZ2CgSuH5fYgjI/aqvbKRMZ6uEQqp702MjnszFkoSuxKIFhXPSUPa8AXVg70I
 HWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897441; x=1740502241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uDHHN5pbMkqZ5Q3GJ12R7LOZiU//dlxqNgLY33VAMs=;
 b=wL3U2OetULaKf1nELpM/5tpmbXQNC3ZzudkB0YjNP0qfGq2xU5+SH1qSLhOruCB0gU
 g8bX0BEbF7PNRTnNF9JtIT2HbwfkHESOjC2ftw1NBY+murnC15VtF45PO634BDapb52v
 UnCJyFB/1lc9i0YciT60rNg8QXqQOezkIwmF4BVAkTTJN72yBu7f15s9VKPbaALrMLXT
 p3+pXIAxcQmwOW5p9DvnKKWAIc70rOf0mXvxX1/gOEO+IqH5ueBHd//UdcaSCde8jOOm
 ZoLIeZe7g9+EUZJJoE77he8rG7XysF7k4yvZH1w/jUG0pBGRAPE962l5p7QCbP1KvfGX
 cmXg==
X-Gm-Message-State: AOJu0Yz7+oY2FJtcu4i5bt9PIo955/9WZxXup6beCCbQkQ7RTR7Bm6We
 YynsKM/zVWvzeHVjSc6nhWXtFP01U+CniLs7AF73icumEs7mlXEEF8AuRGsB
X-Gm-Gg: ASbGncsTxvROAUIOCpneGgA9u0kMCXkhi/yrbg2PGJOZpPwu6V4iM/+GSLmFTLKDlNW
 aI9xD6Yj8Fz5aMXP9+6g762KvaeZ4SyJEuUlq7jt2tejgE651OVGID65F4PW3HgruFZb4bVimsT
 CSPedUdfS6xBLYwaJBUMkdqVvUn35VVxkxCQpTvmXY63fymFvSvPL29E+iBABTMGYE7Gd9z1g46
 WMiXEkI2sY7knvJKnDagmKs1NViTjx97hMVRbA8PeFU0mzE5w4G7u6LzRhtop1J9/DbX+NjBrA8
 7Js59s0qPX2xTZYxEQ==
X-Google-Smtp-Source: AGHT+IHfRsW4Rd97xVgGRq83AW/MvC/RquG2E1wuwOioOIzaGCe9OBJUvTWomqE8jYeW07tJrSRO1g==
X-Received: by 2002:a5d:59a2:0:b0:38d:d9bd:18a6 with SMTP id
 ffacd0b85a97d-38f33f437fdmr13524660f8f.42.1739897441099; 
 Tue, 18 Feb 2025 08:50:41 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:40 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 29/39] tests/vkms_configfs: Test enabling a device
 without encoders
Date: Tue, 18 Feb 2025 17:50:01 +0100
Message-ID: <20250218165011.9123-30-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding encoders and test that it
fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index eb6ebfba1..ffbc3b133 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1144,6 +1144,47 @@ static void test_enable_too_many_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-encoders
+ * Description: Try to enable a VKMS device without adding encoders and test
+ *              that it fails.
+ */
+
+static void test_enable_no_encoders(void)
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
+		.encoders = { {} },
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = {},
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
@@ -1175,6 +1216,7 @@ igt_main
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
+		{ "enable-no-encoders", test_enable_no_encoders },
 	};
 
 	igt_fixture {
-- 
2.48.1

