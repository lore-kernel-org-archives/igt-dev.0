Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8CAC021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E621910E7AB;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZvRvhyJ";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C851610E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso34806855e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897435; x=1740502235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZYTgJNTLeKxJVudIX8TH4XmxHbEf49Nr1HppMAcLic=;
 b=BZvRvhyJZ/97lC1gB/V+CDaKUvqFEKEs1YMZy85TZujTGj1L1c5s3yq8zb6CPa8Hjl
 G6qcILrSFNihZfGIoeX0XPvkR2qdYbvx1T5IKQwYH0RXcGa9G0UXrjsp7MZTbCAtJc/F
 SuBZ9vlWooFenni+ODH1ouKn5IVgtB1cCUV0trnR4KYxgZ/eb6SkyllV5rOcBVjPpgBw
 0yxBJmL8AK1pz3TdsnllRQXctVPRkb4JVEL40KzZnhBt3S3WD6ZO4o6Yn1Pd8skpn7v3
 YWGaDzu+P28sbpslwDnyYIZp/DeHBe2OHGknRT9UPfopKoJzHNVKcH9tOJ6RRO/S8azR
 EgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897435; x=1740502235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZYTgJNTLeKxJVudIX8TH4XmxHbEf49Nr1HppMAcLic=;
 b=RhVSy/wmaN8Qfz0dm3pNo8s2k1nLODPJ6is4DNYOwczN89wK/4F2Ad9YxVEBOtdzam
 cn0uLQlHFyTzRjG4i6xRLQZR453RLp5pFD6s7qT/yNMmNN0HTwQtXJ0OMtdrAjEuzGeE
 Jivp8BmQAwVb+w3AxUPOBN+oQhY9VUL+RqzWdukMSZnDq50nqQU8HzOd7BPmnwPl/Pu9
 gabv+imRsxB3KgEyKs27z90FYv+Fwv6pkXLeoM1YGkNJexFCYn+QtasWZ08g12Vpaf2R
 2zVJtdX3TQhuTkaSyobB4n+wjfzjLMRc4sO1ckQQIhYOu9DfIZl4Tmin8RAQi9xrqV0X
 D5GQ==
X-Gm-Message-State: AOJu0YyNC8lvv98hfvpc1INb8VC4HuMZz6hQbbUeSNU58T6s1To3VLLu
 fyxkjZG/S5LOSbydGIi0hQVyVWiiuJY20OdEJc3G+FIrNclC1BD//zZQMlcY
X-Gm-Gg: ASbGncs5Bii6a3AQiGjwy8FPIsczShTdrEB6Kjm39jStQWemMLwP5eFq8AzUZY6NgOr
 gBHenCsQvns4DIOdu9mvtjHs20atu2/YZvDZGw4PlxXGseJ3WsMuzCCLh/R8e3iaXfztvhujtT0
 hYvMOKAxvHmtieewtLWwyM469rRehxO912Mm1C/cTQyYYzmrh1g9hPpkNzkVnCvS45w+uDXciPo
 F/cr638yStCjWB06n23ewrfB8AJDlMmawa+pz8mDGKbuaI1GGkowOI2uz1xoHDaQkZJUIskGN/X
 SOCeum5BnUlUJPjH8Q==
X-Google-Smtp-Source: AGHT+IGPCwRlvyUs0wtFZBaHimULjUNMPN5cspQ5zn+bcLEbUVI9oCTeHRAvy1bXtTYjh9696E74Uw==
X-Received: by 2002:a05:600c:378c:b0:439:8439:de7e with SMTP id
 5b1f17b1804b1-43999c96479mr4745555e9.15.1739897434910; 
 Tue, 18 Feb 2025 08:50:34 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:34 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 23/39] tests/vkms_configfs: Test not adding a primary
 plane
Date: Tue, 18 Feb 2025 17:49:55 +0100
Message-ID: <20250218165011.9123-24-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without a primary plane for one of its
CRTCs and test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 7df9bda01..fa20a364f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -839,6 +839,56 @@ static void test_enable_too_many_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-primary-plane
+ * Description: Try to enable a VKMS device without a primary plane for one of
+ *              its CRTCs and test that it fails.
+ */
+
+static void test_enable_no_primary_plane(void)
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
+				.type = DRM_PLANE_TYPE_CURSOR,
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
@@ -864,6 +914,7 @@ igt_main
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
 		{ "enable-too-many-planes", test_enable_too_many_planes },
+		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 	};
 
 	igt_fixture {
-- 
2.48.1

