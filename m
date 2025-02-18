Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A14C197BF
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0327710E7D7;
	Wed, 19 Feb 2025 09:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z+EsuWR7";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D7010E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso42244985e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897436; x=1740502236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmDD4UjPf+NsYYdikF8451tZVIV2ai2uhPWPiYyzTLU=;
 b=Z+EsuWR7rvRnXnZxSx8VMezepzypYZX7CNgUvVwgxoI9xY7sJY+EYBwdY1gEVQNJKU
 nYvShG/sZ2udNbeO7W7h/1Jav7/KvbURVMfneF7hA1nCa/8EVmGiShLNtq1jVidf0gnV
 ruwWGBy/bPXtfTOXbM+OAj3bCRZPV/kunkuOyZfcqHim1Ux+6nZYGjDA0CQInOOt6gmr
 NE22TIE59PbNKV8UsHp1QjTcX73QcGb9Wnb/eeKnpuBd/Oa8MffCsuPRZhsTrs7PGU+L
 JuIk101hPUylXUmOhImCXSww4DT9jzWN6herzcJnCOhCW3aZZ1+qg/khPMxLWjrJuvEn
 N2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897436; x=1740502236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmDD4UjPf+NsYYdikF8451tZVIV2ai2uhPWPiYyzTLU=;
 b=cIO0WXML5IuUPnh/EPy3ocLr6roz/MkQK/nM4n7P3rwMPD9yRb11aK6JjkEnf7frvo
 WuTv12T3Oik4z7Yho61nVE/ywVAnuu4qf91xjV4gAkgHuw/kiUf3zs0L/MbQYhe8pbm7
 92DUQIJBn3KoSJyt904gt9Rcpl6LsY4g80EMvLWe71pP3aPKkjTTdITa+eD2UvkjcYYA
 JMp/0mqYaMBAC2rEZeudWaZrzN8qYjJx1n6UR2HesGUMwNoabMlVofnrwUNdgbQW2m2E
 p+UlbLxw1HjuHZkvMkk6mZMLwPMlxqhPz1GF67n1MOHQkWHYBcDNZqYy9bSvNoH+ap8f
 kvVA==
X-Gm-Message-State: AOJu0YyiaZoWFl5QdiV9uogQ/kqsAxFz8KqMNSEi9o4aO009QKlSITHZ
 Xpc8bvvD2TbfyAhHcGPWHt5EaT1MvGZbLruid5Zke6qiApJ93pExJa8XIB7J
X-Gm-Gg: ASbGncu0y+M7xJnT1xZBGZO+ZkfK4L7h8wk69zdfu50ejPk0O6cV1rbh6J8ixUdYzp7
 hzzKd/+mU9nILzQRg6fSFeVtQJ8tcTtvQ4pfEn5UNA3fbN+SW18SjFNTtNqfODd6GpSUU4ZtjIP
 zkPJHzm4aVs9t5uLV+iFuCsfppb/4BGcZqCN8qxpX2bgVGZre4Wn9jtrX6bze2y1bIrBVieJv3w
 hWB1/We1a8P7tOzKJ44stKLSvpeCE9zYkY0ZMcIasT118LRpVwzenmv07CwZ+qqwnTykNoyt/FS
 be5QeLecx1LrsYyyDA==
X-Google-Smtp-Source: AGHT+IFOhPQ2sjCJgkyW+p0F1ZyakukAvvpFQKRJ5+CHwA75XymA2IF+W9Uf0Hup/kNt4Fl/aPiL5A==
X-Received: by 2002:a05:6000:400c:b0:38f:2a32:abbb with SMTP id
 ffacd0b85a97d-38f58781d2bmr159812f8f.4.1739897435916; 
 Tue, 18 Feb 2025 08:50:35 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:35 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 24/39] tests/vkms_configfs: Test adding multiple primary
 planes
Date: Tue, 18 Feb 2025 17:49:56 +0100
Message-ID: <20250218165011.9123-25-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with multiple primary planes for one of its
CRTCs and test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index fa20a364f..c93ebadb3 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -889,6 +889,61 @@ static void test_enable_no_primary_plane(void)
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
@@ -915,6 +970,7 @@ igt_main
 		{ "enable-no-planes", test_enable_no_planes },
 		{ "enable-too-many-planes", test_enable_too_many_planes },
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
+		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 	};
 
 	igt_fixture {
-- 
2.48.1

