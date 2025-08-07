Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28389CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54C210E80D;
	Thu,  7 Aug 2025 07:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSdhptfA";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71F710E80C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so3426475e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552799; x=1755157599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/37jMK6Wc3LNPRsSFi+WmnxGUZGxZaemx3+5GFoDrU=;
 b=KSdhptfAmOkADrsdsVtRWp4Awa2OStUVtR4Qy/EgwVuYm5bJuXFwMmoUMaSr0iFElu
 hu1fAxg3xYqnXHfbvNWUeGbiYJwoezBnhqlHUVgWvNdwMVzbWnBlNfCnIBE38p3FHi3w
 xEbvHsQhpL2gO9wdC37q4ipYCCRnvzVX8WY3bzQkWo7w4ZEv/R0+RULCtQM2haBWof08
 fPgaUK6Q8L3lZdVxKOV0yu4QZMekb/4uJ3VZRG3+ah1+RTPKkk49KZTu9CCGT80zPAyL
 C+ch0L3icVyPbJsG7rBCx3b9MTrh6dmT9VtrqdHcV+kfCl4vuAljRpaUIkttZtejnk7R
 K7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552799; x=1755157599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/37jMK6Wc3LNPRsSFi+WmnxGUZGxZaemx3+5GFoDrU=;
 b=OxUDy82atZ4ZlwAGxCIkoRoCidif2CY/C5rvKOXxQ3I6XZkJRQ5IJ7NDD6kbbpThVw
 MbGoztn+Ybg2AxwZQtQayAs5QPguOOZPlx6zN1y9VtjEBmaKpUC7aJQjkujiUuLUDJPx
 BPcg5R/+5bGqHzrxvqixP58o3RNp1kSZ6PFoynFaMRhk4ka1OsgDxuE8YyyHzaOUmuXB
 7BN4onFd5Z1UNbNLtCovKtEAodfbfnKIb5M9Ix9yzMY1Oe05Mp6SL9OCOLxgZFw/hRqh
 Jqr2/Wz/WIkouVp7aWhe0JkFPus7G106lt+czNsokFbvMpOUTed14aFLqAbHPtocrxeI
 cgVw==
X-Gm-Message-State: AOJu0YxDZb3vimbt6pMsAdYYA6yFRtzwYuBhSZ+6LxYW/YzEombSJQ6g
 WlcNJnYEd+jP0k+6IjFhnqDKRBdYBDQLHwpAJeZCoOqiG8nrTHqEUv0K2Kdal09x
X-Gm-Gg: ASbGnct885QGqR/QT6jFYS3Q+h4OV8W2hxBf47TCsCw3h8OyoCsq41Nlv6ZWLsKJGyK
 qkTmOORrVwCDVGa0+zdnX9mLPEz6DKp0lLavCfVcHDqapORMcAPXl1vKuhdK7bZCn2dEiWLUlY8
 eVAZvRLLOqSwAdE4A7BjKWmR+PKWVSgV4aonHhPR2b6Odyayyce9ruTLOZbdFLOxNDXWaBl1tBi
 p7ytyM4aiFDUbMPY+/CAuTYhqTZrrej4iNJRjRx54B29W4AtB13lv5McEboS1DJsmZRbBs2G7gq
 jmG7gA7hAfymt2cHwFyCXJBFc8hbzCL/dBfoZ1CsAlO5BhnTYbf5ynnlOVgWIiYMbVVV7ZmPUwH
 eMFzywcxMnYNuzqvDD0U=
X-Google-Smtp-Source: AGHT+IEo0sy2nCBVLT0SWFoNGWyojdzHiZ/j9l4Hj5yM++mzMweVa6UMI/l9ZQ7hoY+wVmVa40pseg==
X-Received: by 2002:a05:600c:1e89:b0:453:23fe:ca86 with SMTP id
 5b1f17b1804b1-459e707975bmr51376075e9.4.1754552798665; 
 Thu, 07 Aug 2025 00:46:38 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 33/41] tests/vkms_configfs: Test adding an encoder
 without possible CRTCs
Date: Thu,  7 Aug 2025 09:45:42 +0200
Message-ID: <20250807074550.6543-34-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with an encoder without possible CRTCs and
test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1e192e3d1..8444b5509 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1310,6 +1310,49 @@ static void test_enable_too_many_encoders(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-encoder-no-crtcs
+ * Description: Try to enable a VKMS device with an encoder without possible
+ *              CRTCs and test that it fails.
+ */
+
+static void test_enable_encoder_no_crtcs(void)
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
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = {} },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
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
@@ -1346,6 +1389,7 @@ igt_main
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
+		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.50.1

