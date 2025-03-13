Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1D6C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428810E918;
	Thu, 13 Mar 2025 17:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjVxl47G";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9075810E91B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d0a5cfd7dso8614845e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887235; x=1742492035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9flgkCIttDyOckNq2SsidF3S+JV5IPYhHHZ5AK1P94=;
 b=PjVxl47GLLTKwHpRSJccuypRxkO2If952H2tfUBjayKYWies1t/2vtiRt/45ByC+W6
 dyGEXA+INFqeRohTlJv4YPvx2hrkxKcYtYSfZmO7aOepuyj4L5VoWI799+LHrBrYC9qX
 UI7jFncfe5wIAS3Ml+bGZ0KO2vZix1Y1fZq60JMyc8yL/qJEJXApIO1fP58kCb4N/FAE
 igwPISnxUAEMPNmuAa+VBkci4Sx8rF2dLOf/vjwpSiZqM6R0QFJE8Tzow335RkiHJsxr
 rpIDn/V2IC9f5h5baBYe+Sb1fM2XmY9kCa22vQhKgyyYmIQCjyyYlQ42XCSO4x7kzlIE
 zbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887235; x=1742492035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9flgkCIttDyOckNq2SsidF3S+JV5IPYhHHZ5AK1P94=;
 b=XoGsEioTCRGeh2kOHfZC66yjRF7r4mctiWDu+TQlFOq8qFOMFtlxNUQls6qLfInbbB
 0wjGysyI9yhmfJFaqw14Iy7XomNImq4hKUzagwcH53xwTalrAAL1HdSd+M24zZmMOoeo
 xbOAQdIrxIGyhWxUAhpgmHIhUq3KNhctETPrYxJQw8Y7+DFKcpcjfJHCeU+SHmcayqbR
 Er358V0iGe3VLjeIojy2vzT6VBYPN7cqSj201/4RvEpdQFPW+FvxLr8wPm+XK+UWSXwJ
 LVq9adfxN6FcWE6IQsLInwx5M0lzpl2b4q7Id7iumsfGjCWyFZFd9WZlV3103aoXYPSn
 +KVw==
X-Gm-Message-State: AOJu0YybPe4Kbg4mhE2Yq8UJ6wwCtoOgHHTIle3CjcjqfeYqfRhuLb33
 2La0N+BmPpp9KD5ND9mbtz0LnF5QkL0HjD1pFv15AaWozzR7nt6yZVYMbCtC
X-Gm-Gg: ASbGnctRcPCxpZeNBRwj2D5dZClj8pQbS8lTDatP4OE+a9o1nn8L80io6kqhH4B0/pX
 TNRVjSl8Fqx8Ywgz13n8gE0XfxwFTV4MGBdlaSGZlRmRGkgspaX34BwMsp0bFIugZEsVAVYlGVY
 KxMupjLrblsnXHDJt3xgrEdwxzs2+/8KpyyJbu9IPh5iaN7km6OEv8ZW7wzjXfYwaqOI9lifi2d
 RQpY9vJ9Z5ypQgEEWN236Keo5yQPwEr/sIqnXVmRFhqkh3n6ZGKbSUa7K4HyS1yADwpiNpKvoRd
 Sks0Vuo5eB7rBh0+LgI6V2Wd1bg7/pfOcfDYWXjNd0oM
X-Google-Smtp-Source: AGHT+IH8f3fCxpD7GRUarSGqQR7nphG1dzbfw5EUsantC+iBMq4hkgOVY5pY8eU4LOnoFu5Oj/wa9Q==
X-Received: by 2002:a05:600c:1d1a:b0:43c:eea9:f438 with SMTP id
 5b1f17b1804b1-43d1d8c624bmr5058065e9.15.1741887235195; 
 Thu, 13 Mar 2025 10:33:55 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:54 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 34/43] tests/vkms_configfs: Test enabling a device
 with too many encoders
Date: Thu, 13 Mar 2025 18:33:09 +0100
Message-ID: <20250313173318.5818-35-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many encoders and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 5be89edef..1885318ad 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1257,6 +1257,60 @@ static void test_enable_no_encoders(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-encoders
+ * Description: Try to enable a VKMS device with too many encoders and test that
+ *              it fails.
+ */
+
+static void test_enable_too_many_encoders(void)
+{
+	igt_vkms_t *dev;
+	char encoder_names[VKMS_MAX_PIPELINE_ITEMS][10];
+	int ret;
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
+		.encoders = {},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(encoder_names[n], sizeof(encoder_names[n]),
+			       "encoder%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(encoder_names[n]));
+
+		cfg.encoders[n] = (igt_vkms_encoder_config_t){
+			.name = encoder_names[n],
+			.possible_crtcs = { "crtc0" }
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
@@ -1292,6 +1346,7 @@ igt_main
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
+		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 	};
 
 	igt_fixture {
-- 
2.48.1

