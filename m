Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB165C19F2E
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4BC10E7D8;
	Wed, 19 Feb 2025 09:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O27QVroX";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623F010E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so9994875e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897445; x=1740502245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Liq5PKwecjMKByILT03eKK34HI6CAf+dZkNEofzxOA=;
 b=O27QVroXhqbARGi5kE2uxmhiCEic6sTFda2Y7JoIL++8hms8dJJPle9/1nfSHcQ5Hc
 TshzPufjU90JFZfBOE7/0rIc9pysWw7r22FHcKSSRuusd//50R+5aNILWKtxera0yHFi
 TomlW4TUjOIp85FviyGZQnEdXrhgHXKOS1Vd51iElRiQCWUviUSgbYaulZfeMD7eCsQQ
 ueVA6zp/ZGCKDigirs66se7Z0Xb8U5Xr8wHZ5EIi024VidhB+khkzkFc+6wSihsPflrr
 4zaxPUM0TxrJem7qKi5wMJHORulXF9Wbc9gFmnouUihxZCLZiuAklyXKgfVfyf+lu4Xc
 k1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897445; x=1740502245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Liq5PKwecjMKByILT03eKK34HI6CAf+dZkNEofzxOA=;
 b=CZGH54KNTMdrrJw1nYzHdHPSecHO+1BmMLrJdVUyP8ZwJXc71qV8lgKzvtm7BRT8Rj
 tzZKr8bnYUwwhK+wn844dQofTKJ4GD2nMRsY8awCxcK8GP/n9XyIE2+1ZH/gkkbKWDAy
 WbL7SVUeEkdbpMF18CR2/umkSd0hY+VCRymvk8asV9Gv9nyoSAEh2vI3LEK+uxoCpn/u
 QWajQ9rj/IgO+fN8uLFjTDSoSHXBMJph5Sbip8ZlOAl20u0zLAYjC09cmSN6G9/hfTWt
 qTiJcQgYzv1aRziqXhmqFaJMH2aa9QIThp02Gn0TlRLeoR2Yoc2zvx65ueyjvY7Xy6D+
 QBzg==
X-Gm-Message-State: AOJu0YwbP4UMmEhF8RSZapS2hABdw2erKCVD9ApyIDbQ5unPUViJBnua
 h1/dL2PuJldmbrKBbrElV/UkFE/KdrXooy/9pU920MgWmzpN/G0rqmyAD9Cc
X-Gm-Gg: ASbGnctVx9huWOFWLPkrf2upEOzj04Fx4+GcMiUuGJdFaUlnxlVPfTzFGgpnEFW0q5b
 Ns0dcjokTHrcv1Ape7bp3CKGzLk489xncbP6m2z5tG/hbRxVbX0wmv3JDa/KJfRXT8LhvsVbOsy
 265RvQMWHDaOTG7cNcIlzSA7SVKCYyJt/KdtbJ9IJk+QenI0tAHn1z/FYKN6t0n/CqUw+SEQOZn
 TGZEambfw5/2+5w71/AwssQa1OyZEtIZE66FcJEZJnEN5SrUNdU7jX/IJlK0YxZDs491CNPp9mN
 eh1V3LQWEVOWnGYgjQ==
X-Google-Smtp-Source: AGHT+IE7Qf6AGxUx9LJ7o7feWvDqejVieACQIq2SWej4dGRh3D6EZugcraM+Bdlq2Mwv1aknL6gzwQ==
X-Received: by 2002:a05:6000:144f:b0:38d:c73d:e52c with SMTP id
 ffacd0b85a97d-38f57d19affmr522114f8f.14.1739897445462; 
 Tue, 18 Feb 2025 08:50:45 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:44 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 33/39] tests/vkms_configfs: Test enabling a device
 without connectors
Date: Tue, 18 Feb 2025 17:50:05 +0100
Message-ID: <20250218165011.9123-34-jose.exposito89@gmail.com>
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

Enable a VKMS device without adding connectors and test that it is
created with the specified configuration.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index e003e0ca0..3ad3df584 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1328,6 +1328,44 @@ static void test_enable_crtc_no_encoder(void)
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
@@ -1363,6 +1401,7 @@ igt_main
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
+		{ "enable-no-connectors", test_enable_no_connectors },
 	};
 
 	igt_fixture {
-- 
2.48.1

