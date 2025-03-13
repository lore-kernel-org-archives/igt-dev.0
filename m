Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4160C35FF6
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665C610E91D;
	Thu, 13 Mar 2025 17:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NjqVgGHz";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA86810E919
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:52 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so11030385e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887231; x=1742492031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUUcJMnQsg22nT6YHJQtGsfkFLmI3forrZoBVT4ga8o=;
 b=NjqVgGHzud+lxgepLV56uuSfmkVIVjn7zPwZu7wVkoekD4fqkp3bqcUGw78qTYcQBu
 21NCEijS46rgX9sZOWetBlDAQMDoXK0XYFHdNiB/4hL3Ec1193K0m0bxqtPvLPSlgVYS
 DGMBEqIPG01fQ6avgotHoLh7xtVmmHOsVoWYxX3fs1yXseFnN91xUetBRdxJCMzYWpQI
 76Vj8H01C3xfvwp2CnqQ5SPMFBx6xYmMQmeCv5DKLcfdc8sQs4l2sCUfq6548+dE1v3c
 jPSdGu2yKvvM1ereGBCFmwbI3vFV3F8vPQ075Sqwil/+97nqoCq660KvRDskrIhJgQFL
 TesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887231; x=1742492031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUUcJMnQsg22nT6YHJQtGsfkFLmI3forrZoBVT4ga8o=;
 b=bdvdCPhtLSBMU+IG1fuvxsXAyu/i6BIoX9pII/uM1UqPpOqbfeA5jxNU/67kbp5cym
 MoxiqSew87JXIgAwgf8BV7lDrzN8zRsTrWIQqB/RhnOcpa8hYWZSO7rJB5I8BHDsbH6N
 so/vEPdEUSlkGJ2FzHbG5QYZvEXsJ/riPTznT5QsJvjUmGJM/yBVHZ9uXlfJIjHyzqNb
 Abban2vk+SydykPGhnJDwn0R0d9pQQo6FDI6B8Hoey0I5uFZlGUOC0EEM3iIslssyX3R
 mfAjz24U6Ii6C9dFuOjCy03mK+z3CnL+b7JAzx2pNse7HRjfXkyB3PNvTsIrIQzydWPJ
 kNWA==
X-Gm-Message-State: AOJu0YxiLg7A7HZivdjB3orum6C3u7P6HA5Q/vvyVoLytzeIRcV6+EoY
 4+XkLUP+2FczaVmgrEZ/tsIB0W0r1yJhUkR+l7etDwwT7qJk9QrshBrHXiUU
X-Gm-Gg: ASbGncsEap84OF2Y4tIRnfE5tKByQLlt+kFCt6tG3t6KQmT8+s7FB5XODUcVeOETzL6
 bRBgnGP3RPhlk+pOIv2fe4pwhib9Ya5tG7glR0Z6YCEEQLdHgY8G1tIONEOgAGutwobw117qTLa
 MkpLJ5MiQnlzeXx6jVZH7NCPmnS0eq7BZcEg4G3Iyr1bA0wYHbv3MHwFK+XLkUpb8eaVoBgoLXT
 gkYxS0NisBRR+uHvVQ/vSoCu7Fi+iXEZBr/EHbbDIFaftrywM+kyWjolSUxwlO32fdl1TIopGL9
 hJkJ99CWfu+SajYhfzvp3lrWqRy2Hnu5Ncg7l4Y+mkpB
X-Google-Smtp-Source: AGHT+IGyrPv6H5hoJRrBbiETJTBkDca6D7QOz4pVEBBtkNWU+swSHzBfzUBh4Tumzdl+2/2hRbqu7Q==
X-Received: by 2002:a05:600c:3c89:b0:43c:f4df:4870 with SMTP id
 5b1f17b1804b1-43d1d8ecdc6mr4259395e9.25.1741887231037; 
 Thu, 13 Mar 2025 10:33:51 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:50 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 29/43] tests/vkms_configfs: Test adding multiple
 cursor planes
Date: Thu, 13 Mar 2025 18:33:04 +0100
Message-ID: <20250313173318.5818-30-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with multiple cursor planes for one of its
CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 413be4a46..41dee9c2d 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1012,6 +1012,66 @@ static void test_enable_multiple_primary_planes(void)
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
@@ -1042,6 +1102,7 @@ igt_main
 		{ "enable-too-many-planes", test_enable_too_many_planes },
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
+		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 	};
 
 	igt_fixture {
-- 
2.48.1

