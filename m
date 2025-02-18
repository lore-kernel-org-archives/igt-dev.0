Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E21C021B1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505E710E7B9;
	Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pb5pGyv5";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E012F10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:41 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so6357650f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897440; x=1740502240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0L/lEAB1kfaYYmiKJIt6tSLKom+9cn/DDBKu43j2MEA=;
 b=Pb5pGyv5l+sH7Dg+0KbX/S7ZjIhJOYr26qvhImcQPW0SucomC0kcJaYbKx1OlQiZho
 WSNdvPFFsiAMLi3z66z0rRIymLA0MFiF6p8hK81jzEaW9MqbNe/srfDanaEsXihIqX7b
 hENAgVH4iKWjnBVQ9WB5lx0SExbXumoPAJpN2zC+zTHdKfh4mra0z8QESrZLEzCjQXBB
 E34ZRWr2U5ikRO5BO+lwY8HjdsmmecF/4xUERNAU/YYi7J7JTitgcXVJs8+NjFX5X9TQ
 5Hq0n0+au3csU8D+oyL51EhOi7ifJZw6DTvz6oF2L7lDQS4vVboioc7PAjIC03I7H6Sy
 Vygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897440; x=1740502240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0L/lEAB1kfaYYmiKJIt6tSLKom+9cn/DDBKu43j2MEA=;
 b=LQuGcOgAMSXb6iMXnbB6adGHq++fGkmokmFQJpC1gjDnM0piQC9ASWW5SVzjopFCwi
 CDBK+Oly6/6p3AjPpghMHc4zlJXlxSfVYpavKlXyoXT/rcxzHwNDu6l1BEzoXmZKAw03
 kRfeFPaVbgdqQmL1eymsqvGrFcnI7T19V5ldql0vMOFC29LKppMNRz9P/Pu/2RSxWbqh
 1MCR7CMBErt0jEcjKbC4ScvEBnFOsiufQRdiV2Twl/odqk3VR3T6lDcjDwyNr3OSMVuI
 lczbXrAbH02kD36X70q0LiIYwfHYnT0DDqC9aYbU27KPIB1w5lTXD0XGAWPIFdHVhvv7
 RApw==
X-Gm-Message-State: AOJu0YzsWeUu3OCLlD3cRxtd5UawWu2bnlQJAvutdYOgwx5bDW5E4OE9
 4iQZ1nqwJ/LOeEiYi1pb7x51FArMtEouBO/K0IZm5Ss4ctrZAZf+toRUIxZH
X-Gm-Gg: ASbGnct6NvWJX//RHg9Dmn2cl9Rj6nNAKObJQ8jUYBLJl6C7zSyp3IQrdCg4IaeIOU8
 9pu9JyiH7u+kY5/6SGsIufx/6SUtF4lIlwa4tDiYQ8IFDcS/HrLE2AtGCOoQd2iIhxSHW+yFBbo
 j/3tQhzu7KZRqu6PtLpXV6+xlt32WZUp9YUDWOXqwC8+an91EJwThSe1HD3vDbZlkfFRqpMr7gc
 LS6CQfuO8eOv0uvclYS93rRng2SEfrCKtE80OV4oha3SsSNWKCLTLztpXDvbNHVc+8t0zVo3xIc
 P/7lMfFwR4Z0tuPM/Q==
X-Google-Smtp-Source: AGHT+IEdqrQePcDEA50Ea/edGxo0YJ9Ur/kKKF2Q6oBV9qauFvF4DV3Gexa9NtqnOesGV6jh4n7yLA==
X-Received: by 2002:a05:6000:18a9:b0:38f:2990:c091 with SMTP id
 ffacd0b85a97d-38f33f1224bmr14858970f8f.6.1739897439953; 
 Tue, 18 Feb 2025 08:50:39 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 28/39] tests/vkms_configfs: Test enabling a device with
 too many CRTCs
Date: Tue, 18 Feb 2025 17:50:00 +0100
Message-ID: <20250218165011.9123-29-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many CRTCs and test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 59365c91b..eb6ebfba1 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1095,6 +1095,55 @@ static void test_enable_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-crtcs
+ * Description: Try to enable a VKMS device with too many CRTCs and test that it
+ *              fails.
+ */
+
+static void test_enable_too_many_crtcs(void)
+{
+	igt_vkms_t *dev;
+	char crtc_names[VKMS_MAX_PIPELINE_ITEMS][7];
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
+		.crtcs = {},
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
+	for (int n = 0; n < 32; n++) {
+		snprintf(crtc_names[n], sizeof(crtc_names[n]), "crtc%d", n);
+		cfg.crtcs[n] = (igt_vkms_crtc_config_t){
+			.name = crtc_names[n],
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
@@ -1125,6 +1174,7 @@ igt_main
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
+		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

