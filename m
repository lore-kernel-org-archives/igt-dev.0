Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE73C35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5DF10E921;
	Thu, 13 Mar 2025 17:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nJU3FCOp";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DEE10E91E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:34:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so11999515e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887239; x=1742492039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9HtTUgVjj8SoGzuiteWHKpPBPk+Yc+mhorZH7igpDU=;
 b=nJU3FCOpEXJeTM1+I9O2HYqX8FjVkrXm6Hgish6IqUtEif4D5OPk5DvolETHoxH38C
 Tj8kYuIGbKpoZfFrwJ/bEasCwxNFYN8p0TmRm7nFhYg4SLs5fTRt9X06nzCGENbP46l3
 2QO1xIKlLQJ+R0t44U4HteXgmTVOi2gNzPEO/nq2mx1hEYPcWUO/qchtk7EbXwbwuTfm
 DPK63Ujt8fOBoPqeCMCVytOWMMyJh8gUEj9jppvAI5jeGST5fYUOZr7dDJa0zdbdI709
 KhngfrtUhEHr6RF7V4lalXTbcti+EJ3VphXfpGYKI81Zmqc6J8KXRqGQJtczBZ/kuuLE
 if4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887239; x=1742492039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9HtTUgVjj8SoGzuiteWHKpPBPk+Yc+mhorZH7igpDU=;
 b=gu3L3sAmXLQppZqGlKhiE18LWjcZEar0sSCaEwqBm4nIqpkde4Hx0GBtaxYJnPBkjq
 VG3fSZcDV+Pi5iHTTUEca5PnAegcdZCBcgQcS2+ptkFwUvGrXMyqNYFaVcYXWQkxIC0U
 1wtWCBo1sB06a35PXGKTk9VlQVbFmStrZL/EY6QBy60sdMJuU3wNXGtpd7TWUwfiiXln
 bNlJ8CbAq8+IBAuoEOj+gbGs/8MCDGGFEUwzjUGM6fubPo2etLtuFt+2aDEZOB1pVRYd
 6HHkXTK4h3fp9tiVP5oNvifxwIMlqCfmBBxH0J9ghZ4Mqdze2AinDfZvn6KFE6CMtQJQ
 A4Hw==
X-Gm-Message-State: AOJu0Yx9rO5WFeumJ5GC0B7ugsSugk2sYYy2V4xDYJmKZpsdlIyFSEGV
 +lAh8/NCajgHn2jjFjhRoY3Gn+/TQNOhnORKgBde5E58K84xulDKh8XPdozB
X-Gm-Gg: ASbGncuZUOhQcr4nO3gYpWV/uptg04ZnShJTzqiTshR4qqrjEot7T5z3iRV6983L1fZ
 zkOalRVSc6k9DEqNjcOGZ0zqq2B/f/VJPYI8coCwf5E/3t+GiWiC71adKM3kU9e0ASQdiylEs/k
 0C3EtWMjO1MSDwEHFWa9ot1/tQhHajbzik8CrBYI3H7CLnNZfA80ZO5GtyMfe1RnNCN7dNsZZ8g
 MhVQDwOszaHrCuHgOJobOZTZI03Lk1i2M2oNH9P8g/n53qvYzff8md6V95UGoerLH8L6+YQ48KM
 2FvetEOm9bLsiq3v8QwlojGvIbS1br6u+n64t08PQQzs
X-Google-Smtp-Source: AGHT+IG29uFph8WYEj2lJYhPVrWZqEcPUTfizeTkh5nKciYJYujIYigGYxjzoLL0h4xt+/JTQwfMnw==
X-Received: by 2002:a05:600c:3b9f:b0:43d:1b74:e89a with SMTP id
 5b1f17b1804b1-43d1d8977b7mr4741235e9.9.1741887238674; 
 Thu, 13 Mar 2025 10:33:58 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:58 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 38/43] tests/vkms_configfs: Test enabling a device
 with too many connectors
Date: Thu, 13 Mar 2025 18:33:13 +0100
Message-ID: <20250313173318.5818-39-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many connectors and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index a915cb15e..ad5d72481 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1442,6 +1442,57 @@ static void test_enable_no_connectors(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-connectors
+ * Description: Try to enable a VKMS device with too many connectors and test
+ *              that it fails.
+ */
+
+static void test_enable_too_many_connectors(void)
+{
+	igt_vkms_t *dev;
+	char connector_names[VKMS_MAX_PIPELINE_ITEMS][12];
+	int ret;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {},
+	};
+
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(connector_names[n], sizeof(connector_names[n]),
+			       "connector%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(connector_names[n]));
+
+		cfg.connectors[n] = (igt_vkms_connector_config_t){
+			.name = connector_names[n],
+			.possible_encoders = { "encoder0" }
+		};
+	}
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
@@ -1481,6 +1532,7 @@ igt_main
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 		{ "enable-no-connectors", test_enable_no_connectors },
+		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 	};
 
 	igt_fixture {
-- 
2.48.1

