Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF09C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8CE10E81B;
	Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KV6o1Iez";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD5E10E813
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so4262965e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552778; x=1755157578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIV+VOflsPEFBU/SHLMqAWYdYzUkefXiHOnWWf4K5AM=;
 b=KV6o1IezeeFl/T1/C3SI6KNwvLhfqOfj+XpqFoyd3AUOesquU02FR1kUWpilp29cfy
 D/s/Z2b2HdwLFokuPzTe3DgrZRvRpYbp0914ilIEdsoDA73pgf31EenxnNXd9A4pQQ9X
 QSTotpOefQ6mPA2vuiyH3ck3kWb/AEBk7qDemM3k+Vd+ql53x3OLWugJVewVfz6ljnj+
 4tD/Qkj9GtY1DR+9Dw4XrigAie2qse8PUjoqPhhXN87LNmglpSMGAN7M221nEP9q5pkj
 3e/VXmb+QVvntAXHSfDj4NKi19wWZ+p1t/+H6mm7ntaIB68VT0P4HZI8rmW+TEsBhraI
 zbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552778; x=1755157578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIV+VOflsPEFBU/SHLMqAWYdYzUkefXiHOnWWf4K5AM=;
 b=uEIg4ji2Nxh/zyy0WAshTMk2pAWriQN+Vxz2Wrl2H7G+Tra9+93bN+6ue3EUCHfY1I
 L3wsclPLqb15ehokqJf96BUhBzLh4NLJc/MU0lrLloNFuIwtFWWuilR/p3+mZmh7kNnk
 cs51C+UUMX6hctzu3FivFquliXDCxHrce6zWApeErtK9J25cL4EYJi7CT+gQ8jbq+6ZU
 GqeKoTTjjVaWONRxRmAFObQrx2xMUP1+awHPrtGtIKwyowcm4UIjOX8IqxWNUH8kmTiS
 CHYZbvW7HO9tIUJBixGOr+Bpy3ARFyORTwYoMuPyUgoYfmY+VQZllY3gGZ/XPizLBRzL
 vCmw==
X-Gm-Message-State: AOJu0YwSc9YDvVZobpzbb+uoCH1ynzXSxtBpiJ0ZbkX/1aCgssCmZL9h
 sObobKEVY7jliYWvhpbrrP4YWBbvFrKJlaKp0LFi3iiPwzKqr6iSg9tbBV43rvAO
X-Gm-Gg: ASbGncv1Hvk+ZzPNJN4s/1kdu9wUJAlZ/RGWkXleNwmaiX6mXlKACkIJWARKtPGbaP4
 M03/mZuyB6LELsW+tvCn4y5I/3RG3rP1VBtlWCtox/BGdJqqgWYjLNw9k7iCqLgXe/FYNaMRrNx
 11SOeJO5IIz7P6cM7WXRyPnFYwqNEa1++H6yRb+KGK8JkmROy2aRJfsHNH1CTtkxZPfHHQxDktO
 czcZxEIFSBrrk6Vx74BfP8bZvrU1aKFFR9Go3V6dbFxcy/ABg7E8jvzKuXxsLz/MwkniucwDqL9
 JMWh0PTPXaBr6cWEO9GxSBDJz4XtuH3IBPPpiNAyeVzZBtK45tBgHguZydnsWmHPbt8i4LSyzob
 KD7daWykZHAYEy53NpbU=
X-Google-Smtp-Source: AGHT+IENzy9bP2ycaINBHyaROfFvjDcsOc9cG9hygh2U2D4OLfZsd+VX2YHzZV8QiO6+T4mDsBvo7g==
X-Received: by 2002:a05:600c:474b:b0:459:dde3:1a37 with SMTP id
 5b1f17b1804b1-459e7103474mr46280345e9.25.1754552778371; 
 Thu, 07 Aug 2025 00:46:18 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:17 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 14/41] lib/vkms: Test connector default files
Date: Thu,  7 Aug 2025 09:45:23 +0200
Message-ID: <20250807074550.6543-15-jose.exposito89@gmail.com>
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

Add a helper to create a connector and a test checking that the default
files and directories are created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 082bc6393..4ea369522 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -272,6 +272,21 @@ void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
 }
 
+/**
+ * igt_vkms_get_connector_path:
+ * @dev: Device containing the connector
+ * @name: Connector name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the connector path.
+ */
+void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
+				 size_t len)
+{
+	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -553,3 +568,15 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
 }
+
+/**
+ * igt_vkms_device_add_connector:
+ * @dev: Device to add the connector to
+ * @name: Connector name
+ *
+ * Add a new connector to the VKMS device.
+ */
+void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 4bb1421ec..3694f4162 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -33,6 +33,8 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
 				      char *path, size_t len);
 void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 			       size_t len);
+void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
+				 size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -52,4 +54,6 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
+void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 3a004a789..29739fe3a 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -433,6 +433,38 @@ static void test_encoder_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-default-files
+ * Description: Test that creating a connector creates the default files and
+ *              directories.
+ */
+
+static void test_connector_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	static const char *files[] = {
+		"status",
+	};
+
+	static const char *dirs[] = {
+		"possible_encoders",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+	igt_vkms_get_connector_path(dev, "connector0", path, sizeof(path));
+
+	assert_default_files(path,
+			     files, ARRAY_SIZE(files),
+			     dirs, ARRAY_SIZE(dirs));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -451,6 +483,7 @@ igt_main
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "crtc-valid-values", test_crtc_valid_values },
 		{ "encoder-default-files", test_encoder_default_files },
+		{ "connector-default-files", test_connector_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.1

