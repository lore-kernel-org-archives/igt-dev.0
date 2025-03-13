Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F88C35FF6
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C5D10E908;
	Thu, 13 Mar 2025 17:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BfyY5VmG";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B3810E908
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:35 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso8320595e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887213; x=1742492013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dr1eejbDiy+fvKOAbAt9Yi3mtO59Ydwj5yBnQ0J650Y=;
 b=BfyY5VmGt103tELNANF5EcmdvnwCwXPdKtEj+fll0y8n2m/8gP7N3arYrdGu9tpN9j
 5rGXiAYk+2lrq6/TrmDr1+BbFeU3zSHen/MX0367I2xth/CbdMqk8TbmYjfFARddrFt3
 eGyTwakHV9eZVXDc0uRgPgl6VBS5IbM6FTQa4ODJMqef1zd7OrRfQpUMaTXVts08ODS/
 LwEI0nIT3c7CUuWihObYAUajTThfBcN1CiN9M6fxuTzh+Pj7ga0xNS1FGhWSdpcAyeFj
 7OT8adwoyy2+uAzARyGelX88tzLE8BnTVDZEkZSAPWK5WqeA4zKix57D74yivEHX+V0m
 A5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887213; x=1742492013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dr1eejbDiy+fvKOAbAt9Yi3mtO59Ydwj5yBnQ0J650Y=;
 b=V39+4uQknWcTYXSFiCDnPYgq9uduL6037gKVp5XDqygvNzSuUtmAO8JFKpmATZjMdH
 xzFV/GZTx3zmWU4A53yzyknH483m6ifEz4+l9QWa2Sq3ewW/UobyTZRCiWNJIFaSS0O5
 XMJg34rRQCPYzqOnSH6IvHULacIL/16UOq6FxceI9AQ4g+wv3jZcQrGxB1Kr4ph8X6yy
 DaSioURTq2NvF894lg5/9ZHSheauiycboBj5puyQdSFUtSHAZAqMVE5MVhQjJPYQJgBc
 +5BHUkArTFiUARSfcuIZ0dWVk9O/nxN/yArU2xwfeAkLOMwi9Aan4ihovV6xtrWU2VOc
 FXoA==
X-Gm-Message-State: AOJu0YyXltpbLwtXZKFWvDBfgrPzaJxBEvNgn551JoPw747cQDzrrxs9
 vKlMkwvDbnSP1feurLd2MCh7bOCZJ8gEGaqZwJuGGGwZexHQ3n11YEIWmkbI
X-Gm-Gg: ASbGncvhqtULGHZNF77+ANe1VTuBub8UqiorD2s7oWQkMVnafkzH1oPjTY/XsA66WTN
 8MMYbWwWNTRCKrx+Bw4x4YefxSuGRKmeHhVvY04EnL5eJXIteeVA2HUimlnS6+JTG+nPe8x8Kyf
 moZsl3YcJC/WsUfkuTvKl+cnJkITRTuA3+ImMNd2u94QxQVfttPsue+kAnQH7JeC+tdihSg+BR8
 DfNQd5DAuTUHNIb6tWxm1uxTsycZK1lmkdH4tEnT+sawENJ3yKszCR5128cdx9CPWWLdPaHs5Kk
 ayiH6GmP7o8l4HAsjZsl+OwLHrzZeNxg0g+wxBpBq1vb
X-Google-Smtp-Source: AGHT+IGLmJ3t1KCVrpSGm0idbZaACaDhA0+LZUVDaLqZmLSZmshNfnZTUTrVV2CehCHO1dQ+6NbacA==
X-Received: by 2002:a05:600c:3108:b0:43b:cb12:ba6d with SMTP id
 5b1f17b1804b1-43d01bd1affmr120366055e9.3.1741887212728; 
 Thu, 13 Mar 2025 10:33:32 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:32 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 10/43] tests/vkms_configfs: Test plane valid values
Date: Thu, 13 Mar 2025 18:32:45 +0100
Message-ID: <20250313173318.5818-11-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
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
2.48.1

