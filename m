Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46104C35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA38810E903;
	Thu, 13 Mar 2025 17:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y7oas4ZI";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C177910E900
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so1066333f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887221; x=1742492021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0QnLhsspkSlm1lmq6UwaSw93gwreuslcBqecTdmPPN0=;
 b=Y7oas4ZIVA/qJUYL8na7EV/swfFmGjsY0+5WYQJAjOoB0xsXXVGaoKoMBDrfKNudYM
 56iKlRnL+3shDcUXcvR7FbSRAyNJXOSfe8JoThsNH9U05EH3ARmDDWiewBBIacYKIZRZ
 VpLZ3zc+H0m2BgFhH+UwZJSTOA68eSdbtM61FmRaNW0EEAs8FJ3+Y9yw39Jp6u5qqD31
 rollk1+NiZqisHz5lPQ7G3ax5hmAD07CeOG1FnVf3D8PHxAUsnp1z0nfQFx4t7Wi7lxU
 mQb99afYzPx0yY7Ijhz5dCy5LxNP6DnmNXeqkD9sxVzkHikXnpQ41UXnEymfLK0juNp1
 4EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887221; x=1742492021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0QnLhsspkSlm1lmq6UwaSw93gwreuslcBqecTdmPPN0=;
 b=xG/Mw4LQRwjk46jPSD1oxU9A6gRV48zNzU+eTfnSdLO95IoXmOUH7qo3Z8EH+dHHeV
 /8NR1dXM3zJmyBn7PJoMbWbxOQBZzX+v0VG19MA8M6dSinWj6n/NZbN8p6U2LJ7yn3fS
 u9kSnkg3fVNVElcMqyDJuc6QRUIn+Ub3xbbD1b/iwVKc5P/w8smqTeNlSxkqNPfyfrXB
 mM7G+YUFF+lex0AyALq0GW19d98USUMxkT2NCNFeJfNHn+2fhDNNnXPLN07JskokSd5b
 JPXXLjVRqXNuigfJT4f8NDUqrMH2Drqd5jw1NrqwvTLZDin3P9Zb1XxIBBZCqN61yYYJ
 i8LQ==
X-Gm-Message-State: AOJu0YxtTh/KMVJOJPKFevLV2Zv2BcPPlctPaDWTE7jHdsPXuT2iNmLG
 Q2Hc9Q7k1YHlqoQkp4JP22R5lNBvd54TMxhFNft/C2iQR7pO4QNKc1ldRVCt
X-Gm-Gg: ASbGnctLcUBsBFuJ4lzK2TySCKnLUshaTSyGpJu5XHa9mFzDUavmA84AOCr5DHSaZlV
 OZBKKaP03u+N+grL5aApUk2eL7LpZsU+1evp4WRs5JSIEu4C0MPxQgLxVos/GvpBF+3YTTQ/MLQ
 Izg4GR7L1zn1ANYBd/Om6o8KxmMFBuoe77UNUl2P51+FDtfV3KMuRQAsP3LSAGh+9jiwK6kJdVT
 /C02x/nkQdjU+uUJvQaAOxsFRBZC/RBevkieeKrOmi1qptAvfSD9UZOkBlXXvz+5binnZe/L6v0
 3VKdFLRgWIQeqkFNnZmrQ38Ib4DRmd5vbIMkDWQdFXX9
X-Google-Smtp-Source: AGHT+IGm6GZPnI0Iw1kK7HeeHja/Ed6jnBBJnbQl3y6AdDvoV+B8za06ZvXgU47IfCbMYRBdjf8y/A==
X-Received: by 2002:a5d:5846:0:b0:38d:d0ea:b04c with SMTP id
 ffacd0b85a97d-396c345b253mr426753f8f.38.1741887220560; 
 Thu, 13 Mar 2025 10:33:40 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 19/43] tests/vkms_configfs: Test connector valid
 values
Date: Thu, 13 Mar 2025 18:32:54 +0100
Message-ID: <20250313173318.5818-20-jose.exposito89@gmail.com>
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

Test that all valid values for the connector "status" work and that it
changes accordingly.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c74bbc15f..407310e52 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -535,6 +535,36 @@ static void test_connector_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-valid-values
+ * Description: Check that setting valid values works.
+ */
+
+static void test_connector_valid_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+
+	/* Test valid values for "status" */
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_DISCONNECTED);
+
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_CONNECTED);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_CONNECTED);
+
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_UNKNOWNCONNECTION);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_UNKNOWNCONNECTION);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -556,6 +586,7 @@ igt_main
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
+		{ "connector-valid-values", test_connector_valid_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

