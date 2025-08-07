Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C498BC87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E0D10E801;
	Thu,  7 Aug 2025 07:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XGmHJZ+m";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44A10E801
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:34 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so326381f8f.1
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552793; x=1755157593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnMN4hdYyZ/rYqpx7rAqxjaVzwE8QkWrzZ2NbFlWxUQ=;
 b=XGmHJZ+m0IO5zgsRCOC7jRhVulUsAUb9y2iIZD31i2G/aEpBp4+9itOOGBJHnCjjef
 e3twB5NDp7W7vcKA3J9qfMFLil5uH9VsxSJh68EcfKHgTams3Jpp5dPlNtO5CJolFVLW
 HG5P2Lb71O8smF6Qui2ZdaBxzwrqRlAKXt/83KR3U3l35LRm8u7XQ1CS/C7I7uxpf9Sm
 sq+kVQqibBy9Z9e7e48MoZoVrU94jHrx8R3e1/duJYRaR3hXKrY1Tb5EjgY8PrlhXOuL
 P8UUCgU6gIpKeu4+V2zma97XiFxuQtUvWkmD9qvtwpetjPuW6X1OQU2X6uu2wWfd+smb
 B2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552793; x=1755157593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnMN4hdYyZ/rYqpx7rAqxjaVzwE8QkWrzZ2NbFlWxUQ=;
 b=RF9odwOH5i4Kl7Eyy0rvm0aqOutP1krtaTDr9uIXzRvKVtO9uq92tZjJYju6yrqfRe
 gj/6DlI1eV+gVUi+yzS8I8qSuaQ6GpOJ0huzOgBLbB5od70tOjMUsF63LtObzly8Bc/R
 ftSLdsnXtMdsjIhiQNCF5RPUUObtgQam6pJccYDvHPOmM4fPWOyYl+jdoNx/AtqXsU3g
 hW2CDjBmPHZXzzpEMi7opdyBk3gI5jY+ZZCp1HmWEmMSA4YII/hLbQI2qzEyOFwjALxD
 Wg9SvoKsSy5gQKk9TnAfxPQWFmEe0ITS3bjffmfBexGr9zRweOvxfT4wvhuyo/gh9ftc
 2iNA==
X-Gm-Message-State: AOJu0YxqC0kXRzgLt8+JeCX8uJgRU+P4ZlUMNQmybhefKdBHX/9+3oNo
 vGeMLFi6VAN5fr6D12S65F8dYpEiozqRDosmxZI7FDcTt442LzuWedcyVOhTKck7
X-Gm-Gg: ASbGncu7TYk/cP5zkHP5nS//ATlBJDyxqoaCwC4jPs/Fx02Mu/KG+KA7+FZ+b8Tfzdv
 BSzJtlxyDfWaqRTAdt1dJlSX9XlgHXE8h62faUHTtloginB7L3xpITz7qAW5saC2Qy6KyzmI/LI
 X6eMrdvHk9s2TdRTd81MjWK89DVP+14LAaSxy8OHDCwd/1yZZ+Sxg+DVMKfG0FyR9YfOBQXS7Fs
 oLXkvFlD0q5/J10fKKt8WBXM0dDwbWECy+zj+KqtAVXQ/LUJdtNdi8TiKMjeMd54sSmQRKRtDfX
 ofyKguje/alvAfCil6JTR6Ey0q8bEZ34SI6Bhm80UOnlVXx6yDFCKkmEQESSslmHscRATc2cQPY
 Wnxg10v2h+VOCq5rDVp8=
X-Google-Smtp-Source: AGHT+IEhSZI4CO6bfdoCocqxwOr0RwyDy2Z+13Gq6CuVDwavMSoa8I151WKWrVyimq4JleNyK8r++Q==
X-Received: by 2002:a05:6000:2011:b0:3b7:940e:6520 with SMTP id
 ffacd0b85a97d-3b8f48e9072mr3854873f8f.18.1754552792652; 
 Thu, 07 Aug 2025 00:46:32 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 27/41] tests/vkms_configfs: Test adding multiple
 cursor planes
Date: Thu,  7 Aug 2025 09:45:36 +0200
Message-ID: <20250807074550.6543-28-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with multiple cursor planes for one of its
CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 87136d32a..0e6ee37e5 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1011,6 +1011,66 @@ static void test_enable_multiple_primary_planes(void)
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
@@ -1041,6 +1101,7 @@ igt_main
 		{ "enable-too-many-planes", test_enable_too_many_planes },
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
+		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 	};
 
 	igt_fixture {
-- 
2.50.1

