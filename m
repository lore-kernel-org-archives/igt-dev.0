Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8956C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AE310E808;
	Thu,  7 Aug 2025 07:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJfobD3R";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06D610E808
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-459e1338565so6389025e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552805; x=1755157605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zm9X/RGfVEqSZlGC6/fjQdrzZbeloyhJZIx/OfgseHc=;
 b=EJfobD3RNnWJby5WeMJYccBlIdajdGWaD8BiB3893vhSwUX+cy+yPS2fB+sP+amlTK
 O2M0lBDw9hvX++eO+r264qnL9BVOJBPnl6JbRkNkz1JU8uB15PUfmZo0ZeFe8v6AeXnl
 1ZQeAijtBlGacmE0up+bYp1kHtFizc80XS3ySS5O9nbCgUnUfPGOYFhwQJ8CE3SI2cUY
 GzGhhIWTC2o+W/QhEOmELx4cXbXCY75kY4PstLM8jMsl55txbeJ15eJ5Dcf0LbdIGDIY
 8WEK2OXVNBWb6JbCVgLJt7BRO0wpbg44/LhibAOjl9CCv8myFMO7CqpFEyrTh6v7rGc4
 tERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552805; x=1755157605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zm9X/RGfVEqSZlGC6/fjQdrzZbeloyhJZIx/OfgseHc=;
 b=L6VWNBYlShXPkBx3x6DP0/XId6AzN3racoLADbkivtlRzI2HsRzaCkgnqBF7Aq/JHK
 x+RWvT+WOi3m0Tkqrw8zr++c7HnesOekOzu+B8BYbJSUfsHjqPJGLgKqaxX+b6HwLo5e
 2fJ1mmuXXqLRsJtfiq62BaqqrvJ6lVVHpTM1PfhVlLGtLcOpjvZpoR+Q9iD5LFGx8GFO
 G52fPHSMDQxpmG/qn5Que+zhKA9oXRbqFVfU1JnCtWnarCzJLNVQ/RLozQO4kStSjQNW
 lo3WPqFlae5IA2vzy+VsdZC/hZ88R+xsTsNyun+Eic9ZxsE0LGcRIKtAZXWSazT9lFvC
 xxXQ==
X-Gm-Message-State: AOJu0YyXpPXqURWtkPxc5ifszihse33zugMZXyZLMU8Pm3BfuBWvHZmf
 iOcwR6ReIvyRKnBnFNCDZWUHS/wM/yreUY0BTTmwyjKFNvUYXngzSnJwryprdTlM
X-Gm-Gg: ASbGncuPnHTSfHnywLAUlcIJZEjxoTxbNmTp/Su3KHaIA7gQ1DKRb4Wx0mos1x1/FtO
 OxKgZ2HUXWmE+usemFDwPawC0LLT+db96a3i0mM7imZ95/PB31a9KlSXBHygmPQ4CunRHM832OZ
 f3+LmH9DG5ofRSfz5hQIoH7LCSMfJfYx9+QmdI5GS5gVv0QUnQZAW6kk4whY/O7tO80azJ1fQ36
 /cpRTpsn8L1gvs1jkEuSSprOcM2m5xW2ElDO3BlAx8UzLSDPGJ8TgURFxFZnMZw+Y/vwS7baM/7
 sMapzPb5NCbSRJs20+w4oWnKhFbpFfzwxQZAqGA29BBHOrcbj8PU2iaojWzmO0tR+eIMSLgH+dJ
 Eq3TBiKXKTgSyV6+2o2E=
X-Google-Smtp-Source: AGHT+IGlVOAi2BkTuY21o+iXwmKYPzO6LleIL1fQsSjZh9BUB9N3oaz+DkKOfgoEEKk6Wrd0XtC/Aw==
X-Received: by 2002:a05:600c:1c22:b0:456:1d93:4365 with SMTP id
 5b1f17b1804b1-459e95af9b4mr44570055e9.5.1754552804892; 
 Thu, 07 Aug 2025 00:46:44 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 41/41] tests/vkms_configfs: Test connector hot-plug
Date: Thu,  7 Aug 2025 09:45:50 +0200
Message-ID: <20250807074550.6543-42-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the connectors can be
hot-plugged and hot-unplugged.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 0f498a630..04a86de43 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1812,6 +1812,89 @@ static void test_enabled_connector_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-connector-hot-plug
+ * Description: Test that, once a VKMS device is enabled, the connectors can be
+ *              hot-plugged and unplugged.
+ */
+
+static void test_enabled_connector_hot_plug(void)
+{
+	igt_vkms_t *dev;
+	drmModeConnection status;
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
+			{ .name = "crtc0", .writeback = true },
+			{ .name = "crtc1", .writeback = true },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.status = DRM_MODE_DISCONNECTED,
+				.possible_encoders = { "encoder0" },
+			},
+			{
+				.name = "connector1",
+				.status = DRM_MODE_DISCONNECTED,
+				.possible_encoders = { "encoder1" },
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
+	/* Connect both connectors */
+	cfg.connectors[0].status = DRM_MODE_CONNECTED;
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_CONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector0");
+	igt_assert_eq(status, DRM_MODE_CONNECTED);
+	assert_device_config(&cfg);
+
+	cfg.connectors[1].status = DRM_MODE_CONNECTED;
+	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_CONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector1");
+	igt_assert_eq(status, DRM_MODE_CONNECTED);
+	assert_device_config(&cfg);
+
+	/* Set one to unknown connection and disconnect the other one */
+	cfg.connectors[0].status = DRM_MODE_UNKNOWNCONNECTION;
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_UNKNOWNCONNECTION);
+	status = igt_vkms_connector_get_status(dev, "connector0");
+	igt_assert_eq(status, DRM_MODE_UNKNOWNCONNECTION);
+	assert_device_config(&cfg);
+
+	cfg.connectors[1].status = DRM_MODE_DISCONNECTED;
+	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_DISCONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector1");
+	igt_assert_eq(status, DRM_MODE_DISCONNECTED);
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1856,6 +1939,7 @@ igt_main
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
 		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
+		{ "enabled-connector-hot-plug", test_enabled_connector_hot_plug },
 	};
 
 	igt_fixture {
-- 
2.50.1

