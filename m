Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2630C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FB110E91B;
	Thu, 13 Mar 2025 17:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cbxDNXxp";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E358810E91B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso8849005e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887235; x=1742492035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDFv8pmMH0IwVZayLG02fFpJfFweB82pjIXToGVdEXY=;
 b=cbxDNXxpGhhxDaEb145tKH6XXOJdyaO8Hhx1pwXucD7FZHngC/BI3NYwa56uVjHJnv
 8vXk9t30IkU5i/EEbo+NkgDc6C3njX61ibuBwwaMzCkMWzFfkQXjt5qhf5KEKaqA/Rva
 dO+5jnXfvcAUm/w3JcNDT0PyM7MkZxBqUMB4/HFB5nTk0I2uv5VcYSxiJrwdXn6b7DuF
 zkEOsHxdmQ8LvcRo+Tr5lHKD+zSuXFb5VhlAd7FeA5T/9FFuLlVrCq+6UX/loX9yyU97
 ghqTUBHXxCFVcbAPOH8W0jIbLqaZqxDoU+wvQqATw89NxGyyDQDayDF3ZueMBxkhlFcl
 32EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887235; x=1742492035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDFv8pmMH0IwVZayLG02fFpJfFweB82pjIXToGVdEXY=;
 b=Rxh8UY5r+kCAxIqkPn14oshlzwLHAbXIl7RVxmom/AH50NO7sSO7k9oRgapSZ/W55M
 zy+/1OMSjD9Kly5utJ6J39C4pG90Wt3tJUpQEP1PElexsFx47E/8bhja6Hy1mrnwveCn
 aZlqB/W2GRNBt0TLfjG3cA8qawbumyPOH1nq80f1Jt0OOqc6q9Q5gdclkm65+gX11and
 IlT0KlmA7ia8e6tBFGRZdK6YPB3/xED0SwDsj5dI0DGKtEYCKZHOPnX3RG/m4o83s/qL
 Y1y2OVfnk8CF1//P8w8gYkMbQzpibiPAvEKgGsxnJepHrtUYPuPZNSSqghW5IsssmUh3
 bLrg==
X-Gm-Message-State: AOJu0YzrbG3VW85ssigMkBSiX548Mv40RyoP7hYo2k7HvFpN90bFyJSy
 0rCGvrEamlj0XZQiiy6wP0ZVQW0y1g7RpMTz2obzKKwhuZb0GP4nHtbWGo+W
X-Gm-Gg: ASbGncvXlT3lXvbV/LQAvXqRJQiUAMKkzhKtzjNxk+DqkXz/Pe+1HDbgCffOtO8oBhp
 ju+0GSplkvfw8sFCXueLQTMp0otCP7BaVPV1cAvW2sLGueXVcTzPS4ItlxEYMqptoOkmyWyoPJi
 aV7WkMUY8rhkyefwmi/zCLH137BLlp3J/5gUnSB4pLefYRLTQI1O9oZ1uHLUCTT4qrnn7UEAowM
 E6luQk28q3r5wcPuSHzphXXPnbwytcyu0yivealwO/mIaM0L7uKpkcnVfFeHrzPAIYt2s7cFrAo
 PQBbFYslaADt1YNq7i93jh25g8JokgXZH2hIe1RMFTCrB22t/jxEEB0=
X-Google-Smtp-Source: AGHT+IHVFDRE7sYY6/sZSKj+rZ7h++xIU/rtunr4GNJr+Kl3Uy28gW1G1UQr6pb4ach+PPp70dGEqg==
X-Received: by 2002:a05:600c:3c89:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-43d1d8b14f9mr5461655e9.13.1741887234537; 
 Thu, 13 Mar 2025 10:33:54 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 33/43] tests/vkms_configfs: Test enabling a device
 without encoders
Date: Thu, 13 Mar 2025 18:33:08 +0100
Message-ID: <20250313173318.5818-34-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding encoders and test that it
fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index be856876b..5be89edef 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1216,6 +1216,47 @@ static void test_enable_too_many_crtcs(void)
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
+		.encoders = { },
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
@@ -1250,6 +1291,7 @@ igt_main
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
+		{ "enable-no-encoders", test_enable_no_encoders },
 	};
 
 	igt_fixture {
-- 
2.48.1

