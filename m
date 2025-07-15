Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB2CC83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1D910E59F;
	Tue, 15 Jul 2025 10:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cz85mvYm";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0A410E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so16998835e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575134; x=1753179934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObPLQcYttYgFfdsABn+c1tATkS2hQof/u0x0zM6uRmM=;
 b=Cz85mvYm8pKGeykKlabEldinWk7gt33l6U85UWs0nyPiVv/JMs1HW4KsPCmkF2R7vF
 x6N8LuVbstsJttCpAI7Pv3JCY6jdiYfUW+sA6Ov5lqZrt4LrPPEKWb7KiT0swjDP12t2
 4vU9Jx5zzGgUdMsqx+2v5I0vLtYVrJqBj63sQtXANOyC5XhQFxriPlibZBbwZWSrVjEE
 qZuSfwfc3qmgvcd82pFDrCMRTUXa1PxrZ4ixd2AJexKxUbycLEu5XPwJpXnDQnoPsT6o
 LJ8e6o2di0uLuwE/P4Gl+pEiycXxZYUDPwdQlzO7HcbWQOMXVP1lNEmfxpWe8ET2uxYW
 G81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575134; x=1753179934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObPLQcYttYgFfdsABn+c1tATkS2hQof/u0x0zM6uRmM=;
 b=k2B8GuNyVJe7kDk8RrKbW+a6C0GziNMIqshnq6oM/FhLGw8BppE5/Z+theRWcvEGc1
 pDc8KSR+LrVwrMrlFnaevwsyxZLJWirNLrf8x3X4HkV54zgZSb1/o2RKtVCH2lh/WZHb
 YobEsf/l8UgMzF7DuBo1cI4lTF8evwyMO/YbytIHqSoaZH2T0vflWTQBZTw0flWCUCqx
 nGmL6pG4ddewX50d6GOE3RSdsmO8zE0Gva1WX8P8dSrAF3Y3L0rb5M2iaIuOuqxLdyCC
 7wkGZ19tQQP/Q66s8HdXu2A5lSFysoQde1vkL0JsSAqU8ruob89BRhOZHS3brJF/lO0H
 D8kA==
X-Gm-Message-State: AOJu0Ywyd3sQ3cXX6dD5Jf7+4oYGx0qVmmvQuyzMSD/Gl0dtFPMdfslR
 nXMLKfH4ZOU/rUqslw05NA4PKbUPHaEgViqeQJHneJMHlpwC92Dz/o7M6fU4hg==
X-Gm-Gg: ASbGnctZWcgXJ++SsiB1OKympnjM0lWjBQgfdFpAJ7dCoTyckVgdvVrTvkH5Ji6zcxY
 6bRiK22rbC+fQRkZOe5VVe4Vxbi1nMdDKFaiA/noc5pVytodPtwGMMdY9ZJZwrq2ueYGAajtxfk
 j5o1vt5auSwWj9MFpCZilIC660AI0QI/AGU8sDuZTXao3E4WvkyPy1GPsxCLLGwm13Z4bLwp+zF
 dbS3hZ25k3qn/uAkvf+gozmwbSjjSqUsS8/tAHvXzCY57nQ2HDpdrq/VzkGQZfH/s7zoTM8E8SA
 PIOEqzRlXMKsmjpp2eVFirHreVRG7G/b3NER/nyIKDO3ugjYb9lZReliW/J+vjzUgb00wTOeOit
 sfv3Zrhgr0h85lsDuOtHGU9vY9xLL
X-Google-Smtp-Source: AGHT+IGFHPraB9jjWBAqzm162osI/ZaOMYg3FdIoH+uhENpMguSW6vyS57OOQX+NfZG6qL3/N4fePA==
X-Received: by 2002:a05:600c:6287:b0:441:d4e8:76c6 with SMTP id
 5b1f17b1804b1-454fe10f108mr178835465e9.30.1752575134046; 
 Tue, 15 Jul 2025 03:25:34 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 14/41] lib/vkms: Test connector default files
Date: Tue, 15 Jul 2025 12:24:46 +0200
Message-ID: <20250715102513.5636-15-jose.exposito89@gmail.com>
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

Add a helper to create a connector and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index ed28adf9b..eecad1977 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -273,6 +273,21 @@ void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
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
@@ -554,3 +569,15 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
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
index aa6ff513d..6dd576b41 100644
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
index 8939ef611..595d258f6 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -434,6 +434,38 @@ static void test_encoder_default_files(void)
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
+	const char *files[] = {
+		"status",
+	};
+
+	const char *dirs[] = {
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
@@ -452,6 +484,7 @@ igt_main
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "crtc-valid-values", test_crtc_valid_values },
 		{ "encoder-default-files", test_encoder_default_files },
+		{ "connector-default-files", test_connector_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.0

