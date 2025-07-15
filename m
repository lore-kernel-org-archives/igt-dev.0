Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796BAC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B3B10E5A4;
	Tue, 15 Jul 2025 10:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3OPSZGR";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2849910E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:44 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2873829f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575142; x=1753179942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OU2G1f8/UI1DgdrFVtcyx/SlVPRcUnNdxwTYlodWYyw=;
 b=T3OPSZGRCYVEO3oz9xbmZZnWjH2e65jwdxx1I7TVmNT6+cYL16rdUggtacm8mGYkt1
 WGSdQX1JAbg0dekxtWgblCmwXDe07wwpFoxb0Y132+ALQLbSXLySHnUC9hc2e4rwQPri
 Y5hLgucsQ2+doMV8pPDi5TSPCXT8bE2bf6qg/o1T2PZ4uLkXy6SPzr1XheIqxo5Arvz6
 0kkj6P6UUXfNeKU1m1OPE3RTRdB5EC79F2KVEwzEIyG09934glUZHOj4MIrDLThLnN+v
 4WXcJRMBYzZc6iJwGvRmkvD3Qf+P5FxA0ZZNP8+BNqIFji8nai9XxeMsVT+K0bnAwVCX
 tLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575142; x=1753179942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OU2G1f8/UI1DgdrFVtcyx/SlVPRcUnNdxwTYlodWYyw=;
 b=auba0R9pHwZrOBAtsa2oKM6/mnt9ciGUW3VgDOM8+DMTz8zbv96SOep1aNBFiCzd/x
 13X0dWkBKs1UV0X8b6gl/MtGkgbTBNdWUR3wbfk7X7OG21n/e0xEi6O1WGT/YUPSQHbf
 DEzCJjTWvR4iCmoHrsvT3OKRyHpQazGslEUOheDkV0ENDUMyMl7zrwF0YzhvtnWwN9hg
 KZ1Izia1tKnDg4jNJrk542+3pGXG/evgetr4yo+iw6MR/N7W1YQbj8Bp14oLBf2Oq4gJ
 9S4vYVH5Xz1QmN873Qhc/jLevyOGOtlcZFTnBpP89coA0k9q82ImT+LvM9yg4wr/vnhu
 ONuQ==
X-Gm-Message-State: AOJu0Yy6tRYWBu6zyesgMPdLxgc9n1K1CBhEVBg7+wUri7XW39heqRIB
 8xWfCgE+e4iH/gmq4MU/Hv+B3FpvVNXWSFyPMWwB+y+AzqJaONypqnzVgL1HDw==
X-Gm-Gg: ASbGncsepr/tm5NsHTnlgV9R7KIUY1MDYCWwmDFzlBmcDEfzODZIPqi1opDe0grMaFx
 d9moavHvscEHqqNZq7Lg8PFPYpHcnaMOByHQtK8p5JES19iTfQo2fHfxO3hkvi2MP0hITGMCHir
 eJ0zzWQcmFW1sjSjQSybhbqcrnXMe8wlLYxgdjP9YaimaEv/vPKkre4Red54vMRceVCYXci3yIv
 /Wl3I+IGK3uiTKggaT1YDN+mTRDmjjIBx/kCyI2GG+oNZBnsM/JZPFF5MChs8x88wYat/y2zMJ5
 ev+ri8pd/ZnF4HW7KElHx9VPIvxdH54Zjhk6Vk8oODFxNOdaykpyr4ED8irTz1ZuE8JxF8yv22M
 bhM5OPU2LLrA9mLzw4Q==
X-Google-Smtp-Source: AGHT+IG+oiJ3cCBoSLzUDUNLM1h7TUchDx6YZyW8vnnITny5EqpMa2/ux1XbYs+VLswbQZj1y/lWXg==
X-Received: by 2002:a5d:5f8f:0:b0:3b3:9c75:bb0e with SMTP id
 ffacd0b85a97d-3b5f351e6c9mr13445087f8f.11.1752575142140; 
 Tue, 15 Jul 2025 03:25:42 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 24/41] tests/vkms_configfs: Test adding too many
 planes
Date: Tue, 15 Jul 2025 12:24:56 +0200
Message-ID: <20250715102513.5636-25-jose.exposito89@gmail.com>
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

The kernel references pipeline items with 32 bit bitmaks, therefore,
adding more than 31 items causes an overflow.

Make sure that this limit is handled correctly.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 355f8b72a..c40c8b11e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -851,6 +851,62 @@ static void test_enable_no_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-planes
+ * Description: Try to enable a VKMS device with too many planes and test that
+ *              it fails.
+ */
+
+static void test_enable_too_many_planes(void)
+{
+	igt_vkms_t *dev;
+	char plane_names[VKMS_MAX_PIPELINE_ITEMS][8];
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
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	for (int n = 1; n < 32; n++) {
+		ret = snprintf(plane_names[n], sizeof(plane_names[n]),
+			       "plane%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(plane_names[n]));
+
+		cfg.planes[n] = (igt_vkms_plane_config_t){
+			.name = plane_names[n],
+			.possible_crtcs = { "crtc0" },
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
@@ -878,6 +934,7 @@ igt_main
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
+		{ "enable-too-many-planes", test_enable_too_many_planes },
 	};
 
 	igt_fixture {
-- 
2.50.0

