Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBA5C021BF
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5820210E7B1;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AYs34qxs";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB2F10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43964e79314so53201755e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897437; x=1740502237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODTkEdk2GxUY5X+4Y7aIYGHVo2yF3bLwZZEmceVb47c=;
 b=AYs34qxsXo+bMWEuiVKY3azCoL024J8j9lgAvCL+QhYxfyl0iXQW+/FCwpqUBwMylX
 EqsqBPbCSkZFwVtmbaCzD8jBT77uCyjGL44GiwesogbxbKh3WukTmPpb5lkQ+cqSitSQ
 J+raPF7VqQ4cmlhUH4Kp//jbXAxo3mvSSRFtPR9jzKnamAv17NjliM1wdki7Mr6gWR4n
 EpbekYJ8vgb6wAnlhZW+xnqGGvsBGoe+Lkwr1j7n40+z4qiEVdJMG7VqsHDM4NennGRe
 4hjnJiKsqlv4WA6OJ8KA1HmPgVk9z8u+hkfZnSEVG0MYFaxghir4NpxNwvT98I0sIhuM
 c3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897437; x=1740502237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODTkEdk2GxUY5X+4Y7aIYGHVo2yF3bLwZZEmceVb47c=;
 b=nGR/diHL0K6nWIEYFMO1HLPcP+ItVZNSY69bOX9/mWU9c5dP6KmJdMP6xiziSt/1Ll
 xguUuvfNXiyEhjhsTILCPpLbU9M6btLxAw/xW8G01779tlZNU5mKHU32eTzmlrEMzWQW
 /iO69xgDeoYdukS/d307lsYp7NjvVCI3sgooWf+5RVPz56WeqESwfJDozDSoxTZHSkbt
 EJBlEtbvnwF8Wq+vRRH7A892MNqbXcdresq1caEPOgL4ATbHaEoMMNXBH0BDhLfYxfmX
 d3RWjXdkNykmkmy3RubMRMusmkE5yFWJMwhRIZ1OeA1HfRWeMBgUDK/hwddmQ9+QwHoD
 CTYw==
X-Gm-Message-State: AOJu0YzAmOLXhO6bbQMnPcWPvi9X6FBcE/uZaNrcUYqVSil9nXUuh/Lt
 o8wjPojPwCip3jEO18H19Gg7BqDHwzrjuaBlxf+I4ReBqR8RfSNzbIokylcN
X-Gm-Gg: ASbGncs31d8LTmGW8j41JfCGdrKgtYViJsrL62KtsoRXN8ftBEm1KGnNzAfCs9FMS2b
 M+Far38q+w9iYNvn+W8jLbtkumSzPULShWELA/uAXCsm6se+LuqUV3IB5xVey9ug+PgfMp5GIRd
 aDEzvXdCzrsGVkvHXiQynok2m7uDJf0PoxfapXv2l1JHXmAl1joXH1nnYcW1dbck19Onv7R076z
 7QWDeL1XP9rOCZdsVC6CAcfA5MbdAYsT99igdNdZSB1YrTcpXbxz0kGbqWoWke69yuHqg1kOdfi
 x/yTAPn55/UV/V1lrQ==
X-Google-Smtp-Source: AGHT+IHx+iZn7nJRpQ6bBJpA5rc4TU7Y4IaSBi8jlUhSDb6iZTgn2OWQ+mwBARPKi+WElKPf6iBgEA==
X-Received: by 2002:a05:600c:4f94:b0:439:4706:ae04 with SMTP id
 5b1f17b1804b1-4396e7171b4mr156634265e9.16.1739897436631; 
 Tue, 18 Feb 2025 08:50:36 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:36 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 25/39] tests/vkms_configfs: Test adding multiple cursor
 planes
Date: Tue, 18 Feb 2025 17:49:57 +0100
Message-ID: <20250218165011.9123-26-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with multiple cursor planes for one of its
CRTCs and test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c93ebadb3..dcd0bb5ec 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -944,6 +944,66 @@ static void test_enable_multiple_primary_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-multiple-cursor-planes
+ * Description: Try to enable a VKMS device with multiple cursor planes for one
+ *              of its CRTCs and test that it fails.
+ */
+
+static void test_enable_multiple_cursor_planes(void)
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
+				.type = DRM_PLANE_TYPE_CURSOR,
+				.possible_crtcs = { "crtc1" },
+			},
+			{
+				.name = "plane3",
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
@@ -971,6 +1031,7 @@ igt_main
 		{ "enable-too-many-planes", test_enable_too_many_planes },
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
+		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 	};
 
 	igt_fixture {
-- 
2.48.1

