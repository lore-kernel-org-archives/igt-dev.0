Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F510C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CB910E79B;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B/YbZK74";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2736B10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so6357694f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897442; x=1740502242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8uZvYCwIVv+5QRJaGhRpyxrp/eAXbNVJFrPx7pgYWA=;
 b=B/YbZK74p/stDlfDwYJcfzVkneZSI3HHViqr8MKxCRIcoDvED9RQdx1KOqwcstmOta
 eAni0Yr8wXzpuoEzP3k5UtdrNaeJqrb1qIdgpAjA+GtFeJJLnQHkr6Eip+ktF/YsY+4z
 iEmI5KxG13ZUdgCZxLqIrc4dv1MGuZAUnW1/9nKdybHwyd4sCRukkuHWnMcwGmMaZesd
 CW73DwssOjhb+Nxf/L3pnZWGwNsz4KwEGicCLp/Q/seSW3Vg1VeyKjwzeS/bWzDbr+Tr
 Dks/sl4C9GQ7PKuio6gPg8+J1UUKeTddKZJMBD3Ol2O27sUJezFTkIkc14YDrUDEsy2E
 dSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897442; x=1740502242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8uZvYCwIVv+5QRJaGhRpyxrp/eAXbNVJFrPx7pgYWA=;
 b=QvNjbJOdZYZwJQWeLkYHJvewe6cjCM/bZN/5G2EDaaas+k8GoWc8tIhSaFaPOGLxcz
 IdwE08/tPZOrH69bd6W+23opW8eJjPUGvaDNjuauEuZQhRXdxc7TIneVmYPF1essdTdf
 AKeCkkqjiRS8mYC2LLl4RJnhLHY4gnCuAIE4RDVAIZbYDjsRperO9KRk4IxD7LCsfOf4
 6n5XtdxTC2y3KtTbJZm11Mi9AdsZzkfpYuy7mHH8aJf3NDZbdMItTpSEmxPbNkp/L6il
 ExVF8imT7XNkVYp04cdapF4zN/33yqXWk3XkTjabYN9PTnCF36NONNTUFqzfhKCGMkpX
 cLhg==
X-Gm-Message-State: AOJu0YynBIBmPd7nEJtewYI6Qy3YcpRWqFOeOUaMHsBPFLtIaKgdYXTZ
 rHmEf2vQa6rh0yARcTX0nEfOdxcwjWBBHUQIOpij0e8pYDgearwCmptGmq3Z
X-Gm-Gg: ASbGnctAuqx7YogV2+A9TbLTk0a1N3oAz3fbIA4gz11fsPREdBN0CzFqHGAwpCgX4Kr
 rn+va2olMzBzo72nmj9YhlaQy7ZxWRFTFZBPMTlpcktzNtFW2AUrwWAq3Asl5yhtu3cCAnLKkHx
 XFhnfa9FNqRXOhXOVGugied3OygjfeVZRp+hKSu/JxGUXIIfPaSQL5C/UbI4lAaE58/lUOrU9/D
 5oCx9cqk8bYYLLqsj3m7Ku+OKXVIkbifFhtf750s4PNBy40QCYf4zTUbp8xrMxQMWSH+7IUiH8J
 0jc19OVwG420A75dWw==
X-Google-Smtp-Source: AGHT+IGAbes3S7/LphgQOj63LDSqighA6jVYg5I8It5O9CP0I1xpUMYkqoyp4O1VVbIptPHlZlgoUQ==
X-Received: by 2002:adf:f6c6:0:b0:38d:d371:e01d with SMTP id
 ffacd0b85a97d-38f33f565c1mr11475193f8f.49.1739897442271; 
 Tue, 18 Feb 2025 08:50:42 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:41 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 30/39] tests/vkms_configfs: Test enabling a device with
 too many encoders
Date: Tue, 18 Feb 2025 17:50:02 +0100
Message-ID: <20250218165011.9123-31-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many encoders and test that it
fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index ffbc3b133..8f1f46f90 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1185,6 +1185,56 @@ static void test_enable_no_encoders(void)
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
+		snprintf(encoder_names[n], sizeof(encoder_names[n]), "encoder%d", n);
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
@@ -1217,6 +1267,7 @@ igt_main
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
+		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 	};
 
 	igt_fixture {
-- 
2.48.1

