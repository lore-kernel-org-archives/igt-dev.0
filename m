Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A885FC87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572BE10E80B;
	Thu,  7 Aug 2025 07:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iyq/NBTF";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3310E80A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso4553075e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552797; x=1755157597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1BqzUVaejZ3Qgixp5mMmGsedFlG8gDkx84q2MAZQkc=;
 b=Iyq/NBTFP3j33BVNAZ18DTD9jGVN7eDFL3TFB23v3b/AveocZhFBVfZFpnwGPBbzL8
 IVBYCmlSUgbLtuqd6sR00jAGfyxkIXcTThFw+WqbOAvD77+IU6Lwhms3A47+RrT9uFBC
 bBnbH/UONhgYsBYA4ElrJoBrWf94cudmir6BU5A/Lw+AkvA66L+UN/7y42E9iXH3iD7R
 AnXp6M8LAwmoTpZ9oymHU3/zjIWlZ0efmOW3WFEN9HKFlhW3wyilMe4jKanEI0xVKMqW
 x9nCW5Pblg8cEfPIfKli06a/tZnD405/1oo3U584BhcV3+aqfnv582hIv4ARCYZNS/BW
 C3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552797; x=1755157597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1BqzUVaejZ3Qgixp5mMmGsedFlG8gDkx84q2MAZQkc=;
 b=DUK+59Cb11Q4ch/t2uwuJH+8+KQaO6w/RvsvPhOi7B1oqQ0QYlRYf0qBhDPsa4h0Pv
 xj/1DQR+vt7R7pGLjBFwK09m7euprkgwxyOXA0P7HnsAXn9ASYP5e9qXaD1DsmusBgIq
 mY4Ba3mJGGgZTQ05/BxK+/6vYUIWEJtIP60lrBmN13uuk5mJBH6HQIucfqCke168Z/1d
 irxdJ58Eu30xUGVBrSuzqcNPqZ5yklDU/GbFcsQYeFg84U1FP2mveiTWG5SbpUieg2s8
 cW/mQEgcKDvvxiY4AstCmTGOh+hUhO9ce8pDlrfKCuFfzDKuyVSESCjsWOV1I/JPAncp
 o2aw==
X-Gm-Message-State: AOJu0YyCoy1iB9apWn/1QAc6ZToQbyl9SqmNYznUfgsMXGXI2s7Q5D/d
 3p35ZpEnCgoiIO+2NtnoC87BzNaWyu12xAeCgFMTjp66pYY507mVaJLSQ1iNL98q
X-Gm-Gg: ASbGncvUcyBZa3hSYL1CQtA+E7FcrQgRezYJoqAbSyo07PDUES7Xo/jyXvWIVfu/pcS
 2+UMZb4odqKZPNHMwv7b2ch3Io8Ja4uLbCqQm5qvBzEDbPhg+m+c+vGKyyz/+e2Nrm4iKjjU1qa
 VQ1ARznKsC4QUYuON/bFKtKrHzNx8U/juaw/2X+ZULs4HAw3l5x1A7Mq9nlueLh2Wb+39zZ/QOz
 KTax+foEad9CqmkU0L1vxnT4Cp6ha40wpIymOUpWXXvoI68eCM1en9eM9fIXY7iYWOHu7+8DuXw
 rEUFNjgvL5jo3v7Vhq+bESBZFxhMKhjFVjF8gzvd5tPCn/IaPuuynYgwWuCRwjbjpiz3t08WEbR
 gc5SgqfYk3jp8WCvNj/db5mbP3Xs5EA==
X-Google-Smtp-Source: AGHT+IGP8oJuz9ironffom7rraw39I+6oLkAou4QH4Xxp5CGIOQba+cQ0XkJxeQbIAGhTYWgSML/vQ==
X-Received: by 2002:a05:600c:c04b:10b0:455:bd8a:7e7 with SMTP id
 5b1f17b1804b1-459f0dcb1bdmr4459405e9.9.1754552796895; 
 Thu, 07 Aug 2025 00:46:36 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:36 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 31/41] tests/vkms_configfs: Test enabling a device
 without encoders
Date: Thu,  7 Aug 2025 09:45:40 +0200
Message-ID: <20250807074550.6543-32-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding encoders and test that it
fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 89b0c8f5e..fe8b3b650 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1215,6 +1215,47 @@ static void test_enable_too_many_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-encoders
+ * Description: Try to enable a VKMS device without adding encoders and test
+ *              that it fails.
+ */
+
+static void test_enable_no_encoders(void)
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
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = { },
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = {},
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
@@ -1249,6 +1290,7 @@ igt_main
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
+		{ "enable-no-encoders", test_enable_no_encoders },
 	};
 
 	igt_fixture {
-- 
2.50.1

