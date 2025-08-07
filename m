Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61742C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC4E10E800;
	Thu,  7 Aug 2025 07:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GaZ5MyW2";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937F710E808
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:45 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso3924145e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552804; x=1755157604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YE+aPaxme39UAeWdxg2PmS9FynL9JTCZ20TJJtP0/nU=;
 b=GaZ5MyW2jWtu7ECLubYYFRQxSQTl8WwyAJPqxYLu+auXH0w5PRmdnscQKSWx++GhJc
 UODWJ01TDZF5RjpVWS7T1AUIdR6ewMLqh4aZ/xFOij+7l5uMKFOQ2I29JyAe155YyLX5
 tfV9yrpjigYZOlnlDbN9R1wlHncV5hOLo0Fq54IHEvlLuUqM1IQSEk94fe+OoFJed4A0
 LnLl7sCkWR9EDUi1zJG4r2aSqgKvBvTNKG16q4MyCo253FLjBy3kz6G2CnS4ULRWC+qe
 dSUMhf/c+7G+UCJmVpBqf4HyzvD9S1TjpykSHco5LUjfSk+Nlwh+UJwEzrgdL+55lVsB
 PUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552804; x=1755157604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YE+aPaxme39UAeWdxg2PmS9FynL9JTCZ20TJJtP0/nU=;
 b=mtbNL1wfqLMEccXZQiVgWx3WG2NfmHIimmh1zDeNDuIKyo0IKRdputw0nfpoLbk79d
 DpRFoLdZyfEeNBLjmfhepY70ApXQmxxKn5IZW9nHQNkSa92kSTxAxYxpWCYoSjrvySBm
 vm24z6oVjhS3s6u9BANQ+IT1pCpFd/x53LeH6JdTYcelN6szWkSYowZigGgxZ267GVjk
 5IAVJfw7w7NJB7TJwmhhHRJ3Zh4N6dBYybTJM58a80/zRb/JqLYp/giXeRTrKHxe/8nI
 NuJjXb7pmHvXcOHxe+0DKHzGWu2U7ZzGF35Qzv0G84KXO1QRUpqOBaytkbMcJSg+koud
 4oGg==
X-Gm-Message-State: AOJu0Yx5piGj1PTfaqONyYWU7DKwgrk+/cVh+e62RoAHbNLa4HG1ExcO
 OdZIJmYqHofgSHtW6T6B8qUlEPUgrJWwkz/3H3YMWw0WwmgZ+NZzDAqwdOJtLnme
X-Gm-Gg: ASbGncsVVNa2qr54c6O3kT6Z8HSNTkQ46rM0RX6CeZ+gIEqcSX8PJa6GQSHh5FrFSMD
 4zsWzPr9TgWONpcMGXnd8nY82UWXKGAuE5UhYvVuU2olro3ofaWIwrsqYAn3F5nBf9dvtjxtHDC
 WFbZEvHBJ+90dI4lUL4MSLDZwBJphX0HJo3kSmiadfcnRqghwKsXI5gzi6I3KH+ijeqhVbS77oy
 1PCg6ZKZqInK3mzGjVAj0HYe4iZ5iQoYfMnUS4VVzj6QjqNcP97fsH9KeWsB9SzpzBUtWf1G/Fo
 FeCkZY1lhIorD3eqC1tboGl0VnH4tjlEAlXLL3S+ACYvjdtafHSu+52Tzz2M2OiInxTQJhjSn4l
 cPLUts0O6fjaQMWNZrww=
X-Google-Smtp-Source: AGHT+IFeml5fXlrTDppeMkn5Yr8vidfQmifRoiyW0jjXKTUgD4PHuylsInV5IFULvcmSLRT2FjOnyg==
X-Received: by 2002:a05:600c:3512:b0:459:aa0a:db2d with SMTP id
 5b1f17b1804b1-459e70ea693mr43055835e9.28.1754552803471; 
 Thu, 07 Aug 2025 00:46:43 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 39/41] lib/vkms: Test changing enabled device encoders
Date: Thu,  7 Aug 2025 09:45:48 +0200
Message-ID: <20250807074550.6543-40-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the encoder values can't
change and that deleting it or the attached CRTCs doesn't change the
VKMS device.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 ++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 62 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 06cd3e52e..e37d92b78 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -861,6 +861,18 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
 }
 
+/**
+ * igt_vkms_device_remove_encoder:
+ * @dev: Device to remove the encoder from
+ * @name: Encoder name
+ *
+ * Remove an existing encoder from the VKMS device.
+ */
+bool igt_vkms_device_remove_encoder(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
+}
+
 /**
  * igt_vkms_encoder_attach_crtc:
  * @dev: Target device
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 66d10074a..cc03f9ef3 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -111,6 +111,7 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_encoder(igt_vkms_t *dev, const char *name);
 bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
 				  const char *crtc_name);
 bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index f8f78144f..194624c17 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1688,6 +1688,67 @@ static void test_enabled_crtc_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-encoder-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the encoder values
+ *              can't change and that deleting it or the attached CRTCs doesn't
+ *              change the VKMS device.
+ */
+
+static void test_enabled_encoder_cannot_change(void)
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
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
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
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Try to change values */
+	igt_assert(!igt_vkms_encoder_attach_crtc(dev, "encoder0", "crtc1"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_encoder_detach_crtc(dev, "encoder0", "crtc0"));
+	igt_assert(igt_vkms_connector_detach_encoder(dev, "connector0",
+						     "encoder0"));
+	igt_assert(igt_vkms_device_remove_encoder(dev, "encoder0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1730,6 +1791,7 @@ igt_main
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
+		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.1

