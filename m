Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9F9CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BCE10E800;
	Thu,  7 Aug 2025 07:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nMexBjte";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01510E800
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-459e794b331so3966615e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552790; x=1755157590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZmaOogiHB0QWUODYftG5vF4gYZ53DSSLrm9vxEe2iM=;
 b=nMexBjteSR/lZXFMHUvUK6fjN/HiWoRqq43J182hWaYm7/isHa0MuBdt6LNWJ0DElH
 KZLyaV3brMDskoU9x0dOgYk1sHpvdEylPpttIFm18JqT/ifv/RWjcxQ6KuueMulvEeag
 6DYvMf+Aqq5+Nh6G2oLvWKpJY+2Te5C9AejNRv6wBDeEfeYGfu4CISh0mgeVg55Qo7f6
 j4fQwK/zD/DBVYAqbe1pU/W9ZJLRuBhAP2JHp5raxNFFzv+18nwmsuWmbsX0iewicM3p
 ZI8J13bn2TcgYshorwc89qaq7NICWaKrjgIVqyyWCareUhAmy2IXmJ8mbT3FG0cebVdD
 WBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552790; x=1755157590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZmaOogiHB0QWUODYftG5vF4gYZ53DSSLrm9vxEe2iM=;
 b=qv7Q5okweHbThRBRArjLedsR67V3N/8Pnkj/t1G8uFxJfbux/uMTmay3Xs7fioREVa
 dpDE45TtC5460sZxp+SzdOSyxfsgit1vMCQzv0r/Y0DWU+0pMfW3JEHE/oeA78nIxprf
 pqO2kUp2yRxNVgdUTy9h0aVhOn0MHWpG9+D7ZiV2Gle0RnYMrEhv7GrL8j4P3BgXLXRo
 EfBEgHyz9cG/7n/KVqiHG/ormH4NsJrtrzP9PM3Yb5V3ihgypYxcmf5PZuaMv4QPkSJm
 /HWmB2YF8fmKRmSWxhIVQRukzisZRadB+MkWHaIPA4H+FSKN9OK6IM1Jzg7l06BRYn2v
 oSpA==
X-Gm-Message-State: AOJu0Yy7WvhlmWtfJOd2erK9xjpQhJXXgtFzkRnUqh1NflrPr1XOT0Jc
 ou6NgWLpwx87LqpsgWpGdI9cmL8tUTibsTuuL+bod1gi9f9hhBFTejCL3r0lATXk
X-Gm-Gg: ASbGncuI0lsnKkOajjDYvu4WWwOzlfnpxeBIv0rx+Y9CJERfMmCTkqvxk3ozXW3/Jla
 qTWE0wq/yNkHrZSmkooMEWYXNdZl3/F3ZUFDDmSfKyaKx29jjps8+WNwnuQJlv5nerQ0hh4Cwb6
 zV1f70cqT7dayrnM7rVn1JLa05MTivq63a4Jap7UhzhGIlCgWBomOZ3yNwsgNudB7ixW54Z2D0E
 ov/coMRU/xWgPs1Dx86gbBtgp/STZq0wjr1O7Mxy0Ud7WRcAo7forYjSIRYw1PGBSXZEwe3DBH7
 XxzwZ7coPE8U5Eb7gVtJgpSqZLJhBKitqHkluAUAOnDJmedHDn1HCnm7m54tq467FJI8K+opwIZ
 Z5xDFFoLylqBm+EzkLSk=
X-Google-Smtp-Source: AGHT+IEqdHWadDNknECljY5nMdVTX7KYXmMkUGakudCB+8MjurjObQX+UZVS7pQ8PJJXlYe28rvTjg==
X-Received: by 2002:a05:600c:35d4:b0:43d:abd:ad1c with SMTP id
 5b1f17b1804b1-459e7440902mr44213185e9.6.1754552790386; 
 Thu, 07 Aug 2025 00:46:30 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 25/41] tests/vkms_configfs: Test not adding a primary
 plane
Date: Thu,  7 Aug 2025 09:45:34 +0200
Message-ID: <20250807074550.6543-26-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without a primary plane for one of its
CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 6937373d8..56fbbd93a 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -906,6 +906,56 @@ static void test_enable_too_many_planes(void)
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
@@ -934,6 +984,7 @@ igt_main
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
 		{ "enable-too-many-planes", test_enable_too_many_planes },
+		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 	};
 
 	igt_fixture {
-- 
2.50.1

