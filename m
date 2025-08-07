Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9999EC87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BBB10E7FF;
	Thu,  7 Aug 2025 07:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Snnqrgvb";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603D810E801
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so4153725e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552791; x=1755157591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=II/TdcRjOJHbges23MCU8tnjuoEl1md1kV9HQzeiOCU=;
 b=SnnqrgvbzTFSTfwEq6xK1JqtUkETWVb95X/k5a8UzqIFi37xMrN45TfWTcAd1LlLSg
 FV48M8AqFlKHB94j5Rs0Qe86tKN/VsxG8bo3c+GhZAELrHdzIJ1qPBZ/1gdWZX3ijHbX
 I4FkqX2jSw9W7ktIOXwYy0C8BpPvVmIHLNhTIqGw7utfQrnPLM0+FwmQwb+Pagg5Cdl+
 qNRSDB4yfCtW0Goi2mt4gGzyCHsywr1LsjIi/+zcb6H2R0VXbltItsEnXWnBAC+zOSNA
 7YTuFB5+n+OklPr+Rt8lpfiyEICUShOWbi6yk1SHAjPl2531vi3vEmb17OgJqEHGlTra
 y/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552791; x=1755157591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=II/TdcRjOJHbges23MCU8tnjuoEl1md1kV9HQzeiOCU=;
 b=A5L/7sQ/Tjg1nh9q+jRFSNT5V7lZ5k7H3FQwBNESlmujMz5kwXhnyqnUeMMy1Kx4D0
 23SamJaZBRHzNF8ORHc2uvJHaAix2yaPhknLFx4XXX4y/NKENg0WIzmsuSnYHtx4E/AU
 LzxsK9jD390FMHBmzRdzuBBsRbCGJzLTTKOgmnCChTgKhku0iJnhd83MCLLQNnL9Xs4r
 3lJ1x+Nxh3QSZSu9NlDzuVUNLpEbpejSt398jjabEdnalpWeniAYi6/GpwTr31rcrMwB
 eBQFFvu50XFvfWbt064l6KERqgMdng5LQ0bo6lQUBZNbSSuRIyweFwuFnE2Ee5MFIrz5
 0wFw==
X-Gm-Message-State: AOJu0YwD+Z6UGyVCb8G7/a26bbDZYRPrVXAJJiy9zrKTf2UGyFP0C49P
 SodIa2A1aLYwOto8gXChiOb0vrEUuSuiUbMUAtIwg/LIfH7UmPkxZhQGvZyE8Eg2
X-Gm-Gg: ASbGncsqkfOF28f3GW9E7bTIKhXSLwufR40SVQBdDu8qmGh4dHhXTn4Wvo/F7iPALHy
 lfIT9R64zJklpTP1my11Y28e8LdwWccIil3G1auMmqPoPJ7BT91QLcOv+rBpE6EEkVI6KcHgwg9
 9+b9WB74r1Nqyuz3vrsvpaFIlRO3g3vX/c5shrQVGREPUVcnuJ0H6nLQ4SeG3ImQ3QIgagNSJH8
 LwCNZbyNAd5ATrSTbkcn2TZ5RBswro1M/GAebDOkjv9St66eyf4+xS4Iiy6CssHM90LZ1q4Zqez
 glyhyzprsWrjRrptbaYcbzqJ7kdQe3sS49wcRf9rDT0WmvvrYY/nagYycGyY9deQ3sIsUtGJ+LP
 MvT983bpjqti7YsKKYOQ=
X-Google-Smtp-Source: AGHT+IHDk18Zrypmfj3vs37GPsO3g642qTXmZ3uqvQoXRAjPfjwZUNidFdA0gp6Q7q/86wE0NtMQ+w==
X-Received: by 2002:a05:600c:4e8a:b0:459:dde3:1a55 with SMTP id
 5b1f17b1804b1-459ee8721d9mr15679095e9.24.1754552791535; 
 Thu, 07 Aug 2025 00:46:31 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:30 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 26/41] tests/vkms_configfs: Test adding multiple
 primary planes
Date: Thu,  7 Aug 2025 09:45:35 +0200
Message-ID: <20250807074550.6543-27-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with multiple primary planes for one of its
CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 56fbbd93a..87136d32a 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -956,6 +956,61 @@ static void test_enable_no_primary_plane(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-multiple-primary-planes
+ * Description: Try to enable a VKMS device with multiple primary planes for one
+ *              of its CRTCs and test that it fails.
+ */
+
+static void test_enable_multiple_primary_planes(void)
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
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1" },
+			},
+			{
+				.name = "plane2",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1" },
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
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -985,6 +1040,7 @@ igt_main
 		{ "enable-no-planes", test_enable_no_planes },
 		{ "enable-too-many-planes", test_enable_too_many_planes },
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
+		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 	};
 
 	igt_fixture {
-- 
2.50.1

