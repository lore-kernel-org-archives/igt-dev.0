Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5968C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943010E5AF;
	Tue, 15 Jul 2025 10:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDCf47N1";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E2110E5AF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so3017181f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575155; x=1753179955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu2Pu7Q3t5yDrgus+ZmtnWOH0vSzuDgZdzBZzAM/0p4=;
 b=UDCf47N12yLxyOYS0l9NvCzPsRXr3AkZM5H1RF3ewTdP4ksYSvphdWTEJEL0kkHY3S
 b6W3yN/6PRXN6YUr13yesmfDb/vNGSIMOcbx7FQkFclXazzzh6zqaElpZ2wYSZF6hg4A
 hH4DtHgPAL4WLVgUZEk+0DyGQpsKbU0d/TxQ0QbNwAI1U4DZBdauYAuL06yRodQ5Gw7m
 qs09NNkfvH6DvsZLNyDH2dsKITNRV66KHA6ND9VdH72dp9YmhWIAmDG7yr7/1cIX/6x2
 rx9srzrLxbondP1SVjbvgGse0RHsRkA2MLqhVkYNc4wnIfT1VTZSjTZEqzmD8aQFgtny
 QxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575155; x=1753179955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu2Pu7Q3t5yDrgus+ZmtnWOH0vSzuDgZdzBZzAM/0p4=;
 b=kkEizs1Wo7Y1R3y6IR8lCgwIlbtEopNQqXJmsxkweBrYw+OPtwkKBXzTRWb8REppaO
 u9NBxcmx2BpuP63yr7mkOpEEZVBWnHyku6KkgEzf4hwVjUB1cnDSTb+We3P7YakqS4pO
 Pt60BxOFRvmPR7BOFZSNIbWY52yIKzRkr9lxTSUyl0IO5UV+G02LBJkNLIDM5Thvgry3
 5v7zJrzUynULHR7yvFTwrPm41+KLMAKPBTaSzxM658nhcscz6hjx+bL3JjaFThQx6CgP
 Bleh9BcxQoLSiqNoVicTM0l9tea9CSsc/kilD7V7kHYL4ZoH8H4D5l3QAWZs0o7iZxzq
 rleA==
X-Gm-Message-State: AOJu0Yw/c+3hXNIBRYSOFPwroeqlMtY715qM9TxxtDmOTQo1CPmqGLKZ
 UAfieIq9XPDsN5zq2gCjcdZmNgUVk3o0yRPhyeOMUb0whN0b/Ki+CGMdtrARZw==
X-Gm-Gg: ASbGncvU8qTp5DBNp2vg7QmizxXAoy6+T6qwU6hV8Mtt+KIrT2U2FnCR+SYTlCSVDEq
 I1dsUeCXiK+PjIkXnVPXR8nrO2iQUJj4Pbetr7aTd1pUpvU919Ev9AOgPzm383OgSdwT7CfgBYr
 4qY9EvRawnyWIzK08hj/3JnIoPWLsL+HWyLpAOTap4cBh4Us7RqCsqbKZIfOzagtqfzYUsqVdA2
 NEKTFZE9MRXUK63chgpXNgWc7s1N8DrN3FNAx/OfhUvz6/etvL8iWHg3Y599pkhehRvIpCR/WzQ
 tGMg25x3TaqptfhoRddXyLbr2J+myhMVn9vlNScxDdmmEVEyULZQErL2awidwz2Ouch68epkJWq
 pnbM3Zovkfljj5yKl2Q==
X-Google-Smtp-Source: AGHT+IGUvI+0JqXUqnouUObXezjTjhrQ2PO9NzGv+aPR6j0NNWBKFzgta6rDskG/w+drlPNkz1Iegw==
X-Received: by 2002:a5d:5d87:0:b0:3aa:c95b:d1d9 with SMTP id
 ffacd0b85a97d-3b5f351ecaemr12427165f8f.6.1752575154608; 
 Tue, 15 Jul 2025 03:25:54 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:54 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 40/41] lib/vkms: Test changing enabled device
 connectors
Date: Tue, 15 Jul 2025 12:25:12 +0200
Message-ID: <20250715102513.5636-41-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the connector values, with
the exception of status, can't change and that deleting it or the
attached encoders doesn't change the VKMS device.

Connector hot-plug/unplug is not covered by this test.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 +++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 64 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index c42b96b11..5133a44a7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -917,6 +917,18 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
 }
 
+/**
+ * igt_vkms_device_remove_connector:
+ * @dev: Device to remove the connector from
+ * @name: Connector name
+ *
+ * Remove an existing connector from the VKMS device.
+ */
+bool igt_vkms_device_remove_connector(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
+}
+
 /**
  * igt_vkms_connector_get_status:
  * @dev: Device the connector belongs to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 3081addad..787da601b 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -118,6 +118,7 @@ bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
 				  const char *crtc_name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
 void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 				   int status);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 747b057fe..71f2f9694 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1750,6 +1750,69 @@ static void test_enabled_encoder_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-connector-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the connector values,
+ *              with the exception of status, can't change and that deleting it
+ *              or the attached encoders doesn't change the VKMS device.
+ *              Connector hot-plug/unplug is not covered by this test.
+ */
+
+static void test_enabled_connector_cannot_change(void)
+{
+	igt_vkms_t *dev;
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
+				.status = DRM_MODE_CONNECTED,
+				.possible_encoders = { "encoder0" },
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
+	/* Try to change values */
+	igt_assert(!igt_vkms_connector_attach_encoder(dev, "connector0",
+						      "encoder1"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_connector_detach_encoder(dev, "connector0",
+						     "encoder0"));
+	igt_assert(igt_vkms_device_remove_connector(dev, "connector0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1793,6 +1856,7 @@ igt_main
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
+		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.0

