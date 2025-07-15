Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC362C83F2E
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E48610E5AA;
	Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFtdM7Qo";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DE510E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b5e6bfb427so2732260f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575145; x=1753179945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O46kUKbkpw/XLTexDxhSojKGRY6nYavzEdj4d0s4VXs=;
 b=aFtdM7Qooe3IuM/kRcPZ82rlOCcNlGLQvt3T19eJ/1FvqWf4q8oT6gNaq6hI8iGT/H
 rhNqzsWYLD5dSXU1NEQLUewXn7WJ8VJwiODI+/5FXrlnRx1aj7AR535T4jILie+DztWX
 3PCv59s6ls8Uav5JHq9e+HmW33zcNDtJgIeO//zgrB3Xe9xFp2ns0IsjYsbU+27IB5eR
 AzhfO221VoXy/jm4vbheOcInx8n/qE16a3oyvVBRBlsaTIdz6yblljYodFYrPJxY2tT5
 5xi/IMcBeSmPX2lFtKdrLoDmq1+oFUc+TReEasbl8BqKpni+hHIp8d8PfT81sjZhJSN1
 Dggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575145; x=1753179945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O46kUKbkpw/XLTexDxhSojKGRY6nYavzEdj4d0s4VXs=;
 b=pPVuebCkK3U9F9k233FBBW55PFDHPhdG85wbh6Rq5i7eNljFyew229KbIJ+1uxZjA8
 FyIQ9p+LCpkb5ALLZi5TOH89T/PKn5ohywLvJ8EqQPItEN8AqaX55iG21FzC+lBqLHvf
 n5hASS/lgQF6awmk9P4Z2+iIIP1mR4+fxDU5OGto5jAXjyYU4IsPztL9Y0vFaXQyEuMF
 5Kei4peA1rAVRPog3tN7WQ6z/w8ibUICBHUVhRWjZdzKFAvEHTRBrgDuf+viKvpzQHWz
 PI4mhdofIduVWaekwByF3CMAWYOtnpXaKuj7EzJsOQqioO7DMx3iLn33DI4yshkZMI5k
 xd4g==
X-Gm-Message-State: AOJu0Yw24vnp1922rDkPefzgLeia8SrMnpRdNCmOvWvACRzOzNIdlxxw
 QaXSBazPivLVUU+4m1i/UIkmY8XcS8i31SoKdt5Y5bF2Jhy88PhAdXpMaS9u+A==
X-Gm-Gg: ASbGncuj9mVRKciI9TcYKbrE0JTqsWQ7lwpNYdpCJQ0pWej/E2PmDetXJTQ2tMhj1r2
 pi6HFL7W/tUxwBJS9wJBxNQqHh36V5Xvku3A+BPr3bM2gL7+7VicDjzF7k9hG1OI45cWR+ZBoaQ
 14kY+T5usDIq/Ts7sGpHx6vaoCVwRqbnxrj7li9MMk0upRMr9MrU1OrB5RoXvoR45anALXE5lz1
 jodGM0LjcaZOMJobEd3tcNroe1wBKeBgd27Owl+JXvS0wpMk0+sxv37YgzGds05Y8u/KOSoM1Nn
 +ROUhFE2Lqx8GuVEsY/5HIcnBBEgCl3udvvqiJ20P8MeSDAo/bI1q+YIHzI3p8hneB1teeWti6a
 DuzZjxLcAENNk7nR/nEZozNA3z+FX
X-Google-Smtp-Source: AGHT+IHP4deVNTYIDAClRXbkYcK401Q6G/92oKDwHBFkHYIxIIQvLha8hX9Wb17LvSmPU/OQ5aysDA==
X-Received: by 2002:a05:6000:21c7:b0:3b5:e631:404e with SMTP id
 ffacd0b85a97d-3b5f187b27emr9725142f8f.11.1752575144942; 
 Tue, 15 Jul 2025 03:25:44 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 28/41] tests/vkms_configfs: Test adding a plane
 without possible CRTCs
Date: Tue, 15 Jul 2025 12:25:00 +0200
Message-ID: <20250715102513.5636-29-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715102513.5636-1-jose.exposito89@gmail.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
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
index 41dee9c2d..17f57c063 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1072,6 +1072,56 @@ static void test_enable_multiple_cursor_planes(void)
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
@@ -1103,6 +1153,7 @@ igt_main
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
+		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.0

