Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CFEC83F2F
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A582010E5AB;
	Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D/zKs2nI";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9C410E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso60837095e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575144; x=1753179944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2SX0LCl41Ftcs3tL8zJvip7i9V8+i7yXNms/eFiEsk=;
 b=D/zKs2nIpfkWMCG2YxgFuaSth1cV4/5nIuCg1a834mDDHiaDHp4ADYE4qk9gIbwA8u
 VbF4IDeE9Bx7B/Ei+jUOGFKyXNcJDB/uRADPUBe6J0Q3DNxmQcuor44yhCKWCsrwCJId
 ULgNVnFY9lUSWuphg7n8kTTYPBiWxd7cjljYbdN+nlOWISKzFH1wdvhR3NuuwpWdV8U7
 tBq5Ev+SewqFHJo3TPtLAmWOWWqNFQkAs1s8epLXyuzM8ZIq2LSjQFizc3IXj66ZNEWX
 JZzznlGhSQCekJ7OaFUHRvnwzNc9kTZc/7SaCZISe+CMIaIhYgLELglJSVNokKr1vXtB
 2BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575144; x=1753179944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2SX0LCl41Ftcs3tL8zJvip7i9V8+i7yXNms/eFiEsk=;
 b=sP1V5cUel3D/9flbsgxLPAe0OKvwjTZ2WRph+0N01utE3xVVhiosQNjQuaphyEYEFU
 YPgHBMzY5ipn1qV/8Z5gWe+ASJ0th6v/aMIZqg2/z3BxNFsUpG/2taAjWWoWi4I9u2rw
 MSMS48YkfrMfreukO+O5P8JOK6JxwtULrqYDORxGjmo8IHrw/eLqkp4SNS5w38pOPm8F
 EL6ICqEb3vnaMY03ppUQLSXGFLG/2Q6kB5tfTjtHqBQ6VivobSTHHD67L0G8mjGIbvtq
 7xE+QD2qflYU/7Lq7mNuc1itwQOXJsNjrr+qdXQN4kerCXdcmq9K7x8zKBX8i7C1Q9eQ
 ZvIQ==
X-Gm-Message-State: AOJu0Yy7exsTGP0u2K7AMsXWLoh05V8hz2dX7hUGDadenmH71n4T4XRZ
 Wj1D10LyJBiU7/RpA5T/8Ca33BiSbjKJneXTbW9B/JG2D1FBzJeAWyPYLz+vgg==
X-Gm-Gg: ASbGncufBhRZeofAVIFZI35EU+sjeC2TdNKgYqrgA9ZcaRTjYvp+fcBx9TyKeIHc0rO
 fmaupqvc/dehOhJJTloKVAA/8sr5OqK2qUXJiFCTnXQhxavvYPwBc2+TdvuPXGgp2KdQ+6UOMBV
 /YHt4CGObNt55+gjRa8LxQlKxdColY1QQ+3nDh4IzjTZ6Szav92pLTea2sOJ1V0G0pSNbBw03TS
 4po8tqgTfPWL9qotz+4KNjFLjWB7LVBMbp+mPyWjj/bUextvMneXsLs4kvYHaL28tFuh52MrdKx
 KbxiPt1oPYIib1GRriQs3z9NZU37XGqufYvWbNsgg/XYFPyDfSvxxTZwl+1x5xAywdbOIb2G/+I
 JtmCJAHAGkSghKy4gKg==
X-Google-Smtp-Source: AGHT+IGs8jwX4SNNIs8JOZ0zO2cQAwQ5zG6NZUZ0cKe3lB/L8qAcX+yPtl4/SUBNQuaBSxPfMDiSSw==
X-Received: by 2002:a05:600c:4fc9:b0:441:b698:3431 with SMTP id
 5b1f17b1804b1-455e7b6538cmr121627845e9.28.1752575144265; 
 Tue, 15 Jul 2025 03:25:44 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 27/41] tests/vkms_configfs: Test adding multiple
 cursor planes
Date: Tue, 15 Jul 2025 12:24:59 +0200
Message-ID: <20250715102513.5636-28-jose.exposito89@gmail.com>
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
2.50.0

