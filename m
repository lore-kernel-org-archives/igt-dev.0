Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43378C021BD
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239110E7AD;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FPtYaFjg";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9CD10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so38814315e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897434; x=1740502234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uItSDfGD9eRy7CHh2F85ujBj87SV7O4Qwk836YbZEww=;
 b=FPtYaFjg5FOJlFiqMhF5/Er20rjktKdmVOxiw7iPCaf1Pv0k2wkounWnP3MtYSoYDc
 H5BZMkIS/jhe1ip6ZrcG6I8/RaW8c3rBXIACZUSdb3awoNGeTfROkKocG2bnQDYVjMwd
 g4GCQMk+qsB217RNEWPAJlldxUr+8O8plJW2y2U3SLbhUebFRkJLcdrxr4zPU2Cxm4RV
 vWbvJN0n+BpsHTojcCs4GMKuLru81YQmtGPGHRMRk4kO9daIx4FjIFr6Bo9yUkssdrv/
 GsiIPxzZt3QInwzid/+v8YvYhjOTZKLGJNGGcyPZ6AHijESxOKHC7EaBvXvhQnIC7VGR
 mp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897434; x=1740502234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uItSDfGD9eRy7CHh2F85ujBj87SV7O4Qwk836YbZEww=;
 b=NvfetprEFDJD8sJh8Wj944YjafQ/ELe7q0UnyykZ8rtIEPIRqT19MpO1FsWaY5oz55
 trWzxb3o2NBUXhb3pkG0oB//i+AutlcClBW6l8m7ZjDFXg2/Xl7J5b7f0RkXoBvsBDDI
 4rQgBwm5SkMxewgwNfmnoGExySmho359LexpQD+hZttBGk2LAj78g0i6MIwgSVZchj5e
 yMj/rE8pap9zRJeqxzYEpUuafrpr+LTVOXdLCC99LTe3q4vRrkeGGoL16mI9QAQFHY8c
 dR8ydxWpHYqIowiD+DtEIjA0WHmu74PMLO1mazp0PcFGxkqPYYmsXDqQQSEbupbu9dOt
 qYRw==
X-Gm-Message-State: AOJu0YwUQzJfjTqx5Ji7mg7+qHhGuRwb1MFKvgsKJxHTdZ75rEtQ45PU
 G4kmR6vLO7AR7sIJDs3EqB4fEPSeIKaFur8WFcibWBOK7oxsc13UEYUDh6QQ
X-Gm-Gg: ASbGncs1uPRY9hMPmokQLDRCPiRavb40pDcLN3QdzdvxqVczVfRjTcGloFhzRFS7G8I
 zaQiSUB3qn2KShvwzmQ4KHX+NYpnzR5/cG0xQ+g+Nif3sS+kMw/OiC2iV3Xej1zPlMW+EwRoVJQ
 frR4sVsYlpFcMLc4vAYsTLQVgZMOtZh4i2E8KLxyZZeWIoKOhU6LLdicWl4ut35hE33NDx2x0pP
 40e1eEqxcOXxg7QiEtafCNKUT+KyP9ePP2qs8B60T9YWTWMzki+LV47crkMSw4RbttF/gTTWuRJ
 AbU4WScQFf/0g9TnQw==
X-Google-Smtp-Source: AGHT+IFcemxRxnpWALgzYFa//6+k6i+Gvhps7s4k0y6YQPrAUwEkOaddAVwMPm4Zjwz04Kg5zoSyOA==
X-Received: by 2002:a05:600c:3b1a:b0:439:9274:81ed with SMTP id
 5b1f17b1804b1-439927483e2mr30985365e9.1.1739897433908; 
 Tue, 18 Feb 2025 08:50:33 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:33 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 22/39] tests/vkms_configfs: Test adding too many planes
Date: Tue, 18 Feb 2025 17:49:54 +0100
Message-ID: <20250218165011.9123-23-jose.exposito89@gmail.com>
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

The kernel references pipeline items with 32 bit bitmaks, therefore,
adding more than 31 items causes an overflow.

Make sure that this limit is handled correctly.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 47cfa475f..7df9bda01 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -787,6 +787,58 @@ static void test_enable_no_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-planes
+ * Description: Try to enable a VKMS device with too many planes and test that
+ *              it fails.
+ */
+
+static void test_enable_too_many_planes(void)
+{
+	igt_vkms_t *dev;
+	char plane_names[VKMS_MAX_PIPELINE_ITEMS][8];
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
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	for (int n = 1; n < 32; n++) {
+		snprintf(plane_names[n], sizeof(plane_names[n]), "plane%d", n);
+		cfg.planes[n] = (igt_vkms_plane_config_t){
+			.name = plane_names[n],
+			.possible_crtcs = { "crtc0" },
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
@@ -811,6 +863,7 @@ igt_main
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
+		{ "enable-too-many-planes", test_enable_too_many_planes },
 	};
 
 	igt_fixture {
-- 
2.48.1

