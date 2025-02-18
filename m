Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AB6C021B1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646D110E7A2;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nS/0TB9q";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF41B10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43996e95114so5765445e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897447; x=1740502247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/gf/zi4sVHSL5P5Yu6DzwXq1xSkDFHK6GhCOcGj/jU=;
 b=nS/0TB9qBoTInLmmII1cr80v15c05JQkGI0pz5gpdBNNJDJxpWbQDlL4oEsyd4ie08
 P+rMrC47/cTvt+vL0sAIcjdRkzHB3lucvd6Ma/atUrjxghPq7GFYYf46tlV34niO6N+P
 LTzMoMBhsirw14pyhyPKuptyKFsB16WZ0V9ZeOptNGscl/ugJTrbDZvQDivVnCOFeE3D
 v/ugviJ6vGX6tSeZpUJtHZRQfgb8UaU6joj6GlC/O7iHOJrxJjzuGHspe4E0DCVeqVwl
 Bh3smEQFr/2XRHs3MLDtr+j7L0gn6d3Nh7JMaBuvUCm7WAR2ZBb46PtE1dJZuQULmpnw
 mFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897447; x=1740502247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/gf/zi4sVHSL5P5Yu6DzwXq1xSkDFHK6GhCOcGj/jU=;
 b=GZyMen+w/UaWisiqYJlaQaB2LSNyZsRsQKnjYpgojgbb6le40kXOA6efHBksdImm4Q
 sIe+5MwPP3yk+puD2enJBgZTs4aj+dv3jvyzmRpsIj8XyJt2uqKEUdb7YpBHu7Q0/mXQ
 TzZAjFpluZ0JgCwvjMVq/s2sBCB3jd+Mxfcsdj4VyM4iqoWm3N2eN6/NNKOK59iNiG7V
 R48v6AW6mggUHKysONiIfbbzK6M2BJ3haYuKWL8LQAFb4IswsIpnH99LaYCcwq7ixkcY
 b9IEmgYP3RDJlPS1DbUx2U+pGDRS85r4Yy6ZIvbdoMr13aM895/etyv7SY1tDU6n8Ten
 Wg9Q==
X-Gm-Message-State: AOJu0YwsE87+zQSr6qKCKkrzHu4NcqQjgNoOJ4lZrtCGNCcj3BaKhYYl
 JEThCWGjeGviKqiCG9bB5bkEZq/RhLyP2o7S44KcCFoN5vHkmRN9lAtoJkKR
X-Gm-Gg: ASbGncsFLrLAhYcUPtLbzsnFVEl9NnIgrre43V18f8xWR/UChrDa/jl9NqbmoUMwjaV
 MNzljpC53OSPB1XeC9fQfMAjd9P0nq0F/VzKfzATVFJ66tQKjJlsQq2XovLG/F18MCFmL3GRp3J
 rEi8EKuOqgHS8Or3AzstE5Uji+EYUHOyDzSmGRHlNQO2BjuRaReMHGOmmvbXLaRHh2A00MYPICI
 a65lnsn7zQj19oqgWzWqADOUxgGIcGb1T66RatChHWN7Vdj59n4LfB5vAy8saD3u8jEBGXLgN+V
 EhjmtANLT4ZHTeCDKw==
X-Google-Smtp-Source: AGHT+IFXUM7ehVPyTzn4FtZ9G7BfMpVvYYjvVZwqwV5BpWxDB1XCqpILykPzNKLjAksXoBdDwQFC5w==
X-Received: by 2002:a05:600c:4f0b:b0:439:8e3e:b0d6 with SMTP id
 5b1f17b1804b1-4398e3eb2efmr51215885e9.13.1739897446673; 
 Tue, 18 Feb 2025 08:50:46 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:45 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 34/39] tests/vkms_configfs: Test enabling a device with
 too many connectors
Date: Tue, 18 Feb 2025 17:50:06 +0100
Message-ID: <20250218165011.9123-35-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many connectors and test that it
fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 3ad3df584..5a5f85ef3 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1366,6 +1366,54 @@ static void test_enable_no_connectors(void)
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
+		snprintf(connector_names[n], sizeof(connector_names[n]),
+			 "connector%d", n);
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
@@ -1402,6 +1450,7 @@ igt_main
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 		{ "enable-no-connectors", test_enable_no_connectors },
+		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 	};
 
 	igt_fixture {
-- 
2.48.1

