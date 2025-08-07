Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C48C87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4151810E802;
	Thu,  7 Aug 2025 07:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JVJzFc5m";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C366F10E801
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:35 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-458bece40fcso4086915e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552794; x=1755157594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+iz36EcgldeHb3OBmoa0Iy0LP+AhV1x3D3g9dhmwGY=;
 b=JVJzFc5m1vFGhzbsl9bmtZDTwH0RC4h5NxLrAuv34aoZCJODe0XHxQIDg0ebXByc6j
 /OGXKQ/uGJL2muSnQ3V74HxuHklCE4nCDlfLtzeTQokFjj5y1D1UBmPc/r7B+iE19iPw
 PGYtE6v0FK8PRi/A8BE3btFi2qApkbaCnoS0xNzf7STenEVrsZYnjbovfhWbY5K5cn0q
 kXNJNUioNG7lbTlveovXbyYJ5s0m+Qfk4XYK/g68BUP23gWviYBZk852qvMOZHl9Sghp
 DnDl1AVaJQZp9aLmegg0Jhgs8gakyRkG+K95QW5qa9oEinD4yUe3k1KCs2qTsWbPrbhd
 doRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552794; x=1755157594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+iz36EcgldeHb3OBmoa0Iy0LP+AhV1x3D3g9dhmwGY=;
 b=CULtLxw0FVBgxOpFuaeAPCqWyaAEvislhrXkMXWxdEq/ViOpAmODEGBx54BeIaZt9K
 jlLYlYpT6jyEEIzVfonEkgSmNXqXMtLmWiEuBV3EfRgfrt9seVFbbi/VCYlbm9OrT570
 uY4ucODOpce9wn12rsKgtOKCKKcyWo1zbhIZ9SKIL50ee2Hu71OEytt489M+D9T+o4rM
 OicA4ayfk2QJVIh/gQPOSD/cyyj1KEItDdn0MB9AxWDnBM+x1pUPZ9w8SjxTm6ovUoY4
 BVFQYWusjpxXEkxMRbuiidqHiy60D5zwKI+gYP/AD73tloEnqcS3tSzzgifhhL5AFH2p
 0KzA==
X-Gm-Message-State: AOJu0YwNdKNfizTcRjvocZ0YSsjHyflNXQoafvuLN+n84qgvwf3A5R8r
 WvPPRSuqhAEpRUF95QEaqnRXbdvkq+NxjEQbH/lVTy50PTHuOWBPP20mn3jG4ai+
X-Gm-Gg: ASbGncvKDatSDpCdF3UADVVZfbcDl3tH5P4DMiLL2pi16rX1AiTS1bZFtTmUk2ERO4T
 PxvVZFwyQ5PBMuEyJiYFRqiXw69ZiMeB1AlkzSEUSNvIovuEwMIJI5kY6ZmPvruo6gBWpOqQujv
 XQGn2dVPUcqG/ncU9wxqSdhNMwK4XWjN5YiiftDUgeIuREzw6bAnhMxKxjouP8jfjJatsR1uEL2
 KCjpG0hGQHgBTkTd5iZ6qnRfaeppIdJVEuGJ54kTdy1gWH6nPD2UB5940AYQtVmu8I/oP0X3Ouc
 uhDUFnk2STe/IvHfSMmrGwRzejSyCqBhiZnLm1MQlStOqeq9kbPRsbHHABGdgzIIkadq8KUFZP9
 XkJlU9xPmZEzE7ICYURk=
X-Google-Smtp-Source: AGHT+IFkekq84MiljNh2IW3atr2ojbCfSNTTE2ZkLgxg7dcSxmIKJJbt37mgQPXasSWrcZnnJwyYIQ==
X-Received: by 2002:a05:600c:1c9b:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-459ee8171c7mr18284245e9.10.1754552793934; 
 Thu, 07 Aug 2025 00:46:33 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 28/41] tests/vkms_configfs: Test adding a plane
 without possible CRTCs
Date: Thu,  7 Aug 2025 09:45:37 +0200
Message-ID: <20250807074550.6543-29-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with a plane without possible CRTCs and test
that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 0e6ee37e5..943e28afe 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1071,6 +1071,56 @@ static void test_enable_multiple_cursor_planes(void)
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
@@ -1102,6 +1152,7 @@ igt_main
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
+		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.1

