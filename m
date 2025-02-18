Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EAEC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541D10E7AE;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L3WhFIpY";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC4310E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so39919155e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897438; x=1740502238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TACyZqDqW2drv5NgrkFEQoCeY+KBrW37CsdA5U17IkA=;
 b=L3WhFIpYsibEiGdJ+/xtZh2iIhSzdUrwCEGQ6JAVH1DKKuVDlUv2+wru7voYHIhgqL
 uplzGAmPKu7rxS8jiZOTzieMaGyaXwcmaED1wdISpGlsEcQZdiXBt5Trai3GUE1w56vn
 004zr1DA9IRBEj/wUmBoWeESJvHsu+mI4iiKVuEz6fcpfJxmBwBlwd/YFGfO8yOo0TBr
 JRVlgBZ9VgbPNFuM0z3PDASk0xJT3jxrb17wMRzJGSelCcIsAQRR+lnC33YLcPRvQiEI
 jofoRlcr95XxR6jjylb09t1BekXwy6DzjZuN5yI0y3R47bXWg7qn97afwlKFfA5qtx2r
 ipTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897438; x=1740502238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TACyZqDqW2drv5NgrkFEQoCeY+KBrW37CsdA5U17IkA=;
 b=oHniitlEnyCUCtyxYtUMRqU6s/KtQJ4mCNtYf8TwSmTsR3JUl0t1NbQv+0Bi8ksPQH
 J1v8roxC+jBP4IvnykBWASg/7FYop1NdgMNycAEMNIKchxL1XWuy60u7ZcLIi2ec5f23
 sMRe6nydCJQk4dAYAGU4zHZ9XPMFn+Vd1HfePubp4AxVM6z7lmOfKT4U2J1qPRwJR65u
 ForFNy50NaIYmjt5ImbR08LxjzQloYeaUHCUjj7BlKSylQVvz01FJQpTd7tl+U9ru34P
 LVf8kdqlvhXGB/Jm32RFKgyhoXifqep2muM7a4itMROujH0skIZbQ4a5G5Q5rJLNktvA
 164w==
X-Gm-Message-State: AOJu0Yxeabs5/ps/4y5P4RSLCnKaTpYiWBLCmyxptb+2T5OfpDawgLUD
 eK2vrnqrcsSsscCW+3MzZbpdDhfdoAjzNvYzSmeq1Z6tmdwTdCKWDCY7DJim
X-Gm-Gg: ASbGncuL0JUxOb9wEg7UPXOTR25Hd181EFfyZQZDYe46XjSAJoLvVqSw9Xv1YBA+tOE
 +o5ZF0/VupMYFD8Al/SDmO3GdscHBbl/6nLg9b93BUZlExsX/eqyacGIXg8EQV/khwiqUdZ5R34
 AXnLyO8TmZnck+CYIQecQpuVNGsmy4Pi3wO/Ah8x/S/CIvSaQDl2CoDH+fP/XcH4N4Ot41OdgZU
 U6z0BJhS01SvRyB53yo+m8gzPy1zK92kPBT7wHn/yLWN8pFVZq8NL+dz6yOFf5+D+e+uqc9cMts
 Z+P3XtuLUbbbkp2zzw==
X-Google-Smtp-Source: AGHT+IGDqmDxBtSFFhmjNTBO0LsVvfhknYUgwJcSJF136tbsveZDdjtvsP8XZFGBcUlRfjRGUzHQPw==
X-Received: by 2002:a5d:5f45:0:b0:38d:dffc:c133 with SMTP id
 ffacd0b85a97d-38f33f4b882mr14793080f8f.44.1739897437679; 
 Tue, 18 Feb 2025 08:50:37 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:36 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 26/39] tests/vkms_configfs: Test adding a plane without
 possible CRTCs
Date: Tue, 18 Feb 2025 17:49:58 +0100
Message-ID: <20250218165011.9123-27-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with a plane without possible CRTCs and test
that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index dcd0bb5ec..7d6437c87 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1004,6 +1004,56 @@ static void test_enable_multiple_cursor_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-plane-no-crtcs
+ * Description: Try to enable a VKMS device with a plane without possible CRTCs
+ *              and test that it fails.
+ */
+
+static void test_enable_plane_no_crtcs(void)
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
+				.possible_crtcs = {},
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
@@ -1032,6 +1082,7 @@ igt_main
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
+		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

