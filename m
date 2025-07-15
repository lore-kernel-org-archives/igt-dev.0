Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A24EC83F2E
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81E10E5A2;
	Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fYdiZidA";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38F610E59A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso54976155e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575132; x=1753179932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4s+JadMmE9bTpG4S1NmDDjOxKY2PAnuoyTtmaKPBvLA=;
 b=fYdiZidA8sche4ZPutBBTc4J32jOzN2Ev1uTWEswQhBXc+MCrFIWD9UXY6qH05Yz9l
 /f8vrMmeP8sCQbYMsXzV3dSaVqZiaP/Nqp4/lUZMZ2lr+JF7tb/MelFAXaVvLkklYhBv
 8dXFtByPKCzEnOZ+TP//Znq53K4xqhbioWnc6s/fDnJml/bsDp5oELodGRI9SjimLPRr
 0Iyqu7wuk8dCxiUNltxycIB8nPZP84q9JANHVz4em9CuAfJ6qpZQQ6re9nA+hT8ULADX
 R0AEP3JVdq8qAE3oMRQdB6KbHr+e3l2qcu03FlCSEFS9e1eIIcBjtdD/Umj/VYxOQgOg
 ZUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575132; x=1753179932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4s+JadMmE9bTpG4S1NmDDjOxKY2PAnuoyTtmaKPBvLA=;
 b=HIHL1RgW4/f2PUYgr9OcCiGzXVpUpRARNTlWIxKoLJaym3qHppTJ5Lygq0ttWVwhwa
 MqPuuOqcDTUC+BWTCqcouhnoyFoXEJ6zP2th9vaoxr1VtjIK1Li9fvMRt3pW+qLlKWJ/
 vnnAvxFDldmmoR1JE06hKCN/ELvm8b0sDhqqjjuwL0rVK52L30Le5Q81JM2XFrQpLaVY
 BqGnaC8QZBJ28KM0T3BP2jhXrUkyxYw6TYMxIIB1TOx6QH9hFoMLaCr6WonZ4dZwXhI4
 pHPLyJJkR6ssD2YN5x8KxHuLKVQUSE1u/y6dE9hR6aRWSt/iRcGeyhi+bZqi/oxv7FjF
 QGrg==
X-Gm-Message-State: AOJu0YwHN1ed+oO4gynWrvpGEegKFc9IGF6vXOggmbD52UHhuHJjdhbB
 a0mrBGLHFkYiqURFehneLSIYdPM76n7z2f9fTsJW6zK0WnJjr/KBr2Zbp0/2eA==
X-Gm-Gg: ASbGncsXNUOWB9QJ/DwD8QixSu76AuTX4UZVo73+jhEuG122GgVuj9MJ36dVnzLqYKB
 1TzmNUwMePrgZaTTv0QDCkuQqVD9loCUkw1mfLLpEuHIwQtzhc2RfZPHa9GTOZC+3SmWs75pPqI
 CFfm8j/5hOliU5ZFZXb/Zv4gEojWDWQiAUyJfwX0PKO1G2go58jPlE3Sg86F8ilrlN5ZPRMzO32
 5w8ngxHZHu+4blOBS1D8fTT/heP7rSif7mdjLqKfGWaKbXrJdivdtZpUdqa/daXYFUyGw2jS3YR
 n9aBA1d5ve9JQPVP73wrCPK3/SAK1lAy4xHSt1sdWVpptyVCGoqAaZ9cGBhbLcDXM2tqG/kRp8Q
 33eMwyvAaI//+UCE6rA==
X-Google-Smtp-Source: AGHT+IFe3qwi6r4ErFKI2BBet8NZlti+AEDLPq4vi+7I2dJSU//fb/pu1CGZRCQvrSZXN8KjVY1jaw==
X-Received: by 2002:a05:600c:5486:b0:456:1442:854 with SMTP id
 5b1f17b1804b1-4562751a49emr21247625e9.24.1752575131806; 
 Tue, 15 Jul 2025 03:25:31 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 12/41] tests/vkms_configfs: Test CRTC valid values
Date: Tue, 15 Jul 2025 12:24:44 +0200
Message-ID: <20250715102513.5636-13-jose.exposito89@gmail.com>
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

Test that all valid values for the CRTC "writeback" work and that it
changes accordingly.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1d96a627c..860a06f41 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -382,6 +382,30 @@ static void test_crtc_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-valid-values
+ * Description: Check that setting valid values works.
+ */
+
+static void test_crtc_valid_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+
+	/* Test valid values for "writeback" */
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", true);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", false);
+	igt_assert(!igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -398,6 +422,7 @@ igt_main
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
+		{ "crtc-valid-values", test_crtc_valid_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

