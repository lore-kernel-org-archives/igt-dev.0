Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22A9C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5C10E903;
	Thu, 13 Mar 2025 17:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dOAOfoEt";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EB010E903
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:34:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so777810f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887243; x=1742492043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sx59Y3zUZlZKpESbEA+ifySLntQl7YJGIop0Rv03A7o=;
 b=dOAOfoEttztKWGMyFv5Nmpimu4W3iq4r4Xir1WCxSTe+o2K/3MWyUfTv7PY1PZ1c5m
 9Vu61UrETOQd4f3TaQNvGywPuH/R108ub+gl+s7r0hK4pN6AvExPW64IjlRW5Lj5hOTz
 KC9zZ+jIMglBVO4hpvTaerGd6phQfBDhCSOxiIoNc+6hxVZfMMp8X80tetmqe3Mmx8F/
 zSEjzxgDE60zlt4BKCZFCFsbI9lD/fz972COzsEQ+9jqCBpi5r8Y+2Prc3UpSnRUr56w
 6w+jWNxkORXVg9Z413rjkVCqA2V6nOyTdfSlzpPmc2eY5I6WN11CiFjpgmpntQici7Nh
 48DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887243; x=1742492043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sx59Y3zUZlZKpESbEA+ifySLntQl7YJGIop0Rv03A7o=;
 b=VX5HKHjQGgf2QlFjApq37utZQYS13udWIjB3nI0vBA1zsQ/lN208TkktsO2QNew+TI
 6kIbNtFe8y++BAvRjfDTAn/cUDZ3jxdd8PP/RZyaEMHYrUDjKM/klGdaK8bphm0/NKEz
 u8LbkhgZwO5hbkkEpG+UbMMqFNevJZIEik4yK98vPGEiqEvom9psBI/mnR+mM6R1pDkB
 ETeLpgWCYO6xQ0g7ZnjtX8w5tffjGE0DMZX16+MRFdpccdmpiaJ21/w159BEw6Vh7qEv
 e2mwBuZG14W8ncvYBfayGqM6PyPBtht2C6yqb2oi9415nSlmzBqKuQESzYEcAp4mxg5d
 awEA==
X-Gm-Message-State: AOJu0YxQHXbg79EXc2dhIMu9WsI5NQe/1+/454VhGXDzd4ZDFJt21Rh4
 1dEb0uDWquITHclyqulkjBDM1yhxjAM6m5InmWzhqwkP7wETPR5hfihNr99Q
X-Gm-Gg: ASbGncve2aHgIs7ZLMEURgW91u2VlWHxJZXq9bqjxBhC7i6GSRzwuLoZbAOtIcYm6i5
 Wix0SWVuvGheB6At8+j3bdhf6LKlc26TGgiuXovqHKAHhBOCEBc0ta4PtdtJGICaHlrDmADOt0O
 d+l358t8wlqsLv/3ptNsAwB7V9ywKYxAcCqFSn0DCjYl+emtqeHH2MaWHcEn/3e4dQht5oI0V8y
 QeN1Z7/nuu+aa3SVtIbswBnikF4CifnLTMZNlPWl9yVckxKaOWRintdhR2h/iEKcN5brjnFAlle
 H1b8+ob8XeQPwWtSry7wVNsVQA/JLuHVzBUkcS5aXHjFylII+REosok=
X-Google-Smtp-Source: AGHT+IEMcQRnmNojaEKIZt2wfdp3rYh2CC+Gf9ahgc23PuW/IjwYY1cBqkIG8Q2CL4kwYTDTVHW7Ug==
X-Received: by 2002:a5d:648d:0:b0:38f:2ffc:1e99 with SMTP id
 ffacd0b85a97d-396c392ddf6mr360805f8f.49.1741887242798; 
 Thu, 13 Mar 2025 10:34:02 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:34:02 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 43/43] tests/vkms_configfs: Test connector hot-plug
Date: Thu, 13 Mar 2025 18:33:18 +0100
Message-ID: <20250313173318.5818-44-jose.exposito89@gmail.com>
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
2.48.1

