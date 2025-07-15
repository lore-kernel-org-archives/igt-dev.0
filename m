Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0904DC83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8A310E5B0;
	Tue, 15 Jul 2025 10:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gy/C4Krk";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB610E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45610582d07so17561915e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575155; x=1753179955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzHWQapIrW6BjH0tqQs1pVP7Fe1HGGzfqnqNf8f42ng=;
 b=Gy/C4Krk1Ak5WLNq2f1mybHA72YwTz3PgGhtljfZdwyZIbZxF/5nlEK+CgWUJ0zAyq
 yVFgAVjSzDhOM28kOP5V21KrNlEntJEmrPJYQ5F5Ds2EhW4MSQDAD1xBCkIZdm0o/RTg
 aHqEczwpCfeJakx+To9UPYqxp7tyAgnxBIYXOcmfDzaTlbJi939mdfPMoFzQWP1bGyOS
 Bqf+gw/sesJ0wEWloVQ9vm45amXYlkBbRm05GRdFU+N4EC71uyGIJ5QfyQMFGXMUXjkc
 /kmYFqF8yI3tRzzvDauu9LP5IMWIeqG0hDJeQuduVklJyjzziNkFgdnQFVI4CCm3Nh6K
 BRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575155; x=1753179955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tzHWQapIrW6BjH0tqQs1pVP7Fe1HGGzfqnqNf8f42ng=;
 b=d4eH5ev4HvvGrazRDaFFBHf4QrzBu1kXgJgIPnEkzwjQhxbenMp63aG85BHXKclWXU
 A0RWXF1IiNS5s8HGKLnqNGHODl/MsMjk7hqMGtCWec20kJEbow7EVhvktHgb9qL+uZKs
 f3RmtZY9ig4w6ZByyZTHon9DYlvZoNlKj2zIoK2zhZrAqVLdHnhUq7tkxG3FW6l7aNDX
 xSl2mRa4UVkLWMD4Prg64OtVpookCfEq4O1s91s4n9kU46nxCuzZUFIfimiTocLVfcOy
 irGS7vlHo6qz4acJE2XmeEhJuv7Xd0nuEPRTsnOA8Mo+YpwEz8zS/NNxLIQ1duhNup9Y
 /KpQ==
X-Gm-Message-State: AOJu0YzuPmJcqJNbLD0DCXy/+7Zm1DlCH4uFE1GPJUxyBU3VHda/dr8H
 7y+CJx/3J8BgVaupQ59Shs2CUCVBwXAmxyETbfwNfdQX4t91hAeNqoXJce94fA==
X-Gm-Gg: ASbGncuuApC5/TEreh+8HtQ0CpHs9Lp6f2Ueb5qZZ1Nen944ebkcv9t1cxUwYcGW257
 kampzpTpM+ZbRNfj628iItDmEobBrfFabBkf/33sj/2Y2w71h8/zVQym7WdzPCguywxp9pdx7rk
 64Ui2OWqzQZjD8B7hqGekysHvrqmEMemrthSuSvC3/9oVIgv3iYxBJ7v8KQS2feK+aZpNsyJoik
 lHUfWcOBUrppEIG9kOxcKj/dCArI5VERUY3uoCS5pX1ayH3ji/P5eZ7d/bOM1Y+z1BY1W2Q9vWD
 JfJsNbyweWgg4AQDtjEPnrJPH0/on3TVK67ylYGhVV3k0iIDYybkgrovWdv0REV3h9UoLARvaoj
 pgBiZ6zQ01mdQOxwFBnMyVE7VjFvV
X-Google-Smtp-Source: AGHT+IHFx8CsRne+yMpskdWlIGD6phLW3ctAfX8d88Ny2X3txK6iwt/AUecic2EBW5nNA5fyqgrvBA==
X-Received: by 2002:a05:600c:8b2e:b0:456:285b:db3c with SMTP id
 5b1f17b1804b1-456285bdd90mr20372845e9.3.1752575155270; 
 Tue, 15 Jul 2025 03:25:55 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:54 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 41/41] tests/vkms_configfs: Test connector hot-plug
Date: Tue, 15 Jul 2025 12:25:13 +0200
Message-ID: <20250715102513.5636-42-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the connectors can be
hot-plugged and hot-unplugged.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 71f2f9694..46f2ddd7f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1813,6 +1813,89 @@ static void test_enabled_connector_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-connector-hot-plug
+ * Description: Test that, once a VKMS device is enabled, the connectors can be
+ *              hot-plugged and unplugged.
+ */
+
+static void test_enabled_connector_hot_plug(void)
+{
+	igt_vkms_t *dev;
+	drmModeConnection status;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0"},
+			},
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0", .writeback = true },
+			{ .name = "crtc1", .writeback = true },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.status = DRM_MODE_DISCONNECTED,
+				.possible_encoders = { "encoder0" },
+			},
+			{
+				.name = "connector1",
+				.status = DRM_MODE_DISCONNECTED,
+				.possible_encoders = { "encoder1" },
+			},
+		},
+	};
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Connect both connectors */
+	cfg.connectors[0].status = DRM_MODE_CONNECTED;
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_CONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector0");
+	igt_assert_eq(status, DRM_MODE_CONNECTED);
+	assert_device_config(&cfg);
+
+	cfg.connectors[1].status = DRM_MODE_CONNECTED;
+	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_CONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector1");
+	igt_assert_eq(status, DRM_MODE_CONNECTED);
+	assert_device_config(&cfg);
+
+	/* Set one to unknown connection and disconnect the other one */
+	cfg.connectors[0].status = DRM_MODE_UNKNOWNCONNECTION;
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_UNKNOWNCONNECTION);
+	status = igt_vkms_connector_get_status(dev, "connector0");
+	igt_assert_eq(status, DRM_MODE_UNKNOWNCONNECTION);
+	assert_device_config(&cfg);
+
+	cfg.connectors[1].status = DRM_MODE_DISCONNECTED;
+	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_DISCONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector1");
+	igt_assert_eq(status, DRM_MODE_DISCONNECTED);
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1857,6 +1940,7 @@ igt_main
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
 		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
+		{ "enabled-connector-hot-plug", test_enabled_connector_hot_plug },
 	};
 
 	igt_fixture {
-- 
2.50.0

