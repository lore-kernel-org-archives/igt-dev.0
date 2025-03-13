Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953E6C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE310E91E;
	Thu, 13 Mar 2025 17:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HC+XjbU6";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EB010E918
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so11053615e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887237; x=1742492037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pIHiqDYgJsJcT3Iq+wwhqEOHSsNRPN04mfgrpaBc6k=;
 b=HC+XjbU6VGqzvu+ioEpevo+w48ZNo73ZngaAffYfjPWng3c0ZNipJNjDyyy1pBgSCm
 m5RbRWFEzeO/GxLMbHEBDVUOtkkVbnJ16HtD2FziN3Kgkm/bGSCizouTKcRzzkX1oLcp
 evGDFqqf4CLdvE9VXTuGRE4ly/WLrLvL3Vu+VoXVepV/b6uWjBvSF0tG3NWdER0G8pkU
 gj8bv6DURIs/ML6FwYw1J8uenCQKSaIwND7aRPYxcDRHU7XvD4maX+/qXv91xWIq1UIS
 rGo4KrQ1hMuwC3TPyNR+tDZkrdE+Hmhx8kGbUWT+VtN5gCkDpdPG+nBrSsc3qQph+bGT
 qicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887237; x=1742492037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pIHiqDYgJsJcT3Iq+wwhqEOHSsNRPN04mfgrpaBc6k=;
 b=Y5OJV7ou0bne+6JnLA8IN4QcgGIi66GxSugyDsgQ0IfU5uihrgYculsgUQ1jBOjVfU
 A4W2y3pPNuMLxE1fxfyZ4TQZ5SaUqCaMrzY1jVidjZmIc/FDwQ5qWs9Pk2R49dGW4lVT
 5/fplLXxvhLP1YotMoGiUS9ySeVCzntVl8amGwaO35g3KwCW5drSmwuLBtEpqRa/2RNn
 X1jUPf50CtOOuFQrTZefWHzwqHzO6DHSvDqlpIDgWVhnvXWKAUgnD78QI1RcKIAm74c8
 AxMUB67mLJhlEplSV2y5+G18QgNVdW8T0Vy83LARAkbv1FzgBoJLN6T8pq8OCTWV/P1t
 KaEg==
X-Gm-Message-State: AOJu0YyOMiMnlF0w3gtTJ95a6ndan+jlSNGnFc/FKslpnRZHbj8CXw5C
 1dhzfVa9cleJlD2lurnWcSakoDiEJ/ol1QDu8OMWnXDUVi9Dz/+pqSzQjkIE
X-Gm-Gg: ASbGncu41JGXb6bqzjkz4rqMmJn7u1rHdi5ytbT3kBuDj9I+RuUTi20KBZa5A8hRgNi
 KF1pCkahbj94/A8e+dPejEsAfG67mLq7hNKw4KFFJT40dJhuAkq2iONvivZqf8RSY4LfywMQgQI
 tEtz6GGSBuYv8zuptBXZw/KxQA7Y0NHyysXjjaxEytjYP01GMjHcSCDvx7xVZcz54qsu4RpSyb8
 QMTyKwWvTO5iZLnoXoe1VooHW0u9jMZ+TkdOM44XVLi17pddAiQ5j5FVMAIvB0vgaix/EBds3Kp
 kltkDrxT8QM0jHkYTmXl1UuOU3Th/Ifwv8BPS24l0ZJe
X-Google-Smtp-Source: AGHT+IFw2A3erdoqOt1W0RgNzPPJfAJd/k34jDJaYSXG8FWthJynhP2ApDmZF3pXZHbntPlOzaLD+g==
X-Received: by 2002:a05:600c:1d23:b0:43c:fdbe:43be with SMTP id
 5b1f17b1804b1-43d1d8ed228mr4781645e9.27.1741887236786; 
 Thu, 13 Mar 2025 10:33:56 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:55 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 35/43] tests/vkms_configfs: Test adding an encoder
 without possible CRTCs
Date: Thu, 13 Mar 2025 18:33:10 +0100
Message-ID: <20250313173318.5818-36-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with an encoder without possible CRTCs and
test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1885318ad..1743625b4 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1311,6 +1311,49 @@ static void test_enable_too_many_encoders(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-encoder-no-crtcs
+ * Description: Try to enable a VKMS device with an encoder without possible
+ *              CRTCs and test that it fails.
+ */
+
+static void test_enable_encoder_no_crtcs(void)
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
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = {} },
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
@@ -1347,6 +1390,7 @@ igt_main
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
+		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

