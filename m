Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ACAC87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD5110E7F7;
	Thu,  7 Aug 2025 07:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GLXz+wUv";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5D10E816
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so280210f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552779; x=1755157579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YdYZGU7+5w/qyYhG+ddirxjRH1QgPgerQclwUDT7MY=;
 b=GLXz+wUv7xX9A1kODPVYow5PBorSM/f85cQUv1noXwNANaL05IN69mN33rac3LRKq8
 kzurJmfI2B0UDPLs4rvZuZTk9sHs6qz15SADJMHGRMILVkNQZfdkmO3Md74DEKwoVuid
 EMO+aCYmF4PYT6gLe5cI7v+IfvZiNyyGg2cY2xJ5Hrw7r+PPYbWPlRpFdD0Mofurs23k
 hkbYGg8sRuotPGuUh3PSdUQl5Q/q7vC5fIn+AbMG5S81llgpy626O6tqtWDZAV6tG4xw
 UfUoKNYNuLfLctl6ivmj+NSTN4XUuLqj2hyAxssXDy3sMLPERGe7Bbpm8RO3/ZzElvJI
 BnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552779; x=1755157579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YdYZGU7+5w/qyYhG+ddirxjRH1QgPgerQclwUDT7MY=;
 b=pSoTdNfOGD4x9uEzvw00sQecC75H/VkMJ4H7HcZrRIsJS3GBVaDA+M9UdszwtqixXM
 t3Wr6P48Eoo8nSJCMQGhFJXghyixKtuz8sImW300Kob9vuK9F1TaheBd3q6NAJBkpEHJ
 J8vE5shYAi/W0UJjFMPfx0GHE/Etxo1hU3AAyn9uvddo2+tfGBurV4+pYbmph8UXo4YA
 KMw+fr4HDzr//FFSj98wN6+CZr4RYn4tHprAYsNujmUeaMlDC5nLRo0FXLjDKoGYneA8
 zZwMpwQMzEfZPqFugrL7oaRNzfp+AuKhYeQU5pTCungY/RWnEwpV+bKOgQDFxZ68MdvK
 NrCw==
X-Gm-Message-State: AOJu0YyRG7+TWGHBnlczAgOpaV9uB3ojGarfbhvVLVhpavkYNgdq3ON3
 mKMUn+hMBoWv8unS5VZtaXb++JSb57iJCYgzRtMTTWWruBNbNcFbokejsNqmaR29
X-Gm-Gg: ASbGnctfKaTWrtbLCYwTUs6rwls0ObTKH5Xz9jfqMHda78mRxw0B64kwh2vU38fEaWw
 2Adlqq5jNsEuFLySMM6P8u8QE+ZGBq1hmFkBI4kqcDJ7koUCWwAYh1Lkkr28por2J+8WVndRRs9
 RZIS88yy3pdMkwT9yjl5x8eVOb/rJPt/UHmg0Nr+CPl9UbxeIGkTFAQXPONGW9kURAAJfsrkSby
 T92janXnPR0X7D6KkTLDo/vEJTxBIQdwaibcvbbIakKiFTWlm/uX+t+uYOZ3CcOUio3RrXPRRpA
 rykeeR44hqNUloinUNuXHUcWw4E03vy4GkUYOUzwwk9e18LGOKYmWc/m/SETbn4kY9bSVoKRXmb
 TwPP0VhcZYEQxOLVEjA8=
X-Google-Smtp-Source: AGHT+IHVGHFHivPRw5q9sZa8uzjIx87UwixXLzhdlaSZjOk+hYwPcg2w4clXECDbtDwWjNS5vHecBA==
X-Received: by 2002:a05:6000:24c6:b0:3b5:f93a:bcc with SMTP id
 ffacd0b85a97d-3b8f9f673afmr1634728f8f.35.1754552779200; 
 Thu, 07 Aug 2025 00:46:19 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:18 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 15/41] lib/vkms: Test connector default values
Date: Thu,  7 Aug 2025 09:45:24 +0200
Message-ID: <20250807074550.6543-16-jose.exposito89@gmail.com>
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

Add a helper to get the connector status and test that the default
value is set when a new connector is created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 33 +++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  3 +++
 tests/vkms/vkms_configfs.c | 21 +++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 4ea369522..5d9e13ed7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -24,6 +24,7 @@
 #define VKMS_FILE_ENABLED		"enabled"
 #define VKMS_FILE_PLANE_TYPE		"type"
 #define VKMS_FILE_CRTC_WRITEBACK	"writeback"
+#define VKMS_FILE_CONNECTOR_STATUS	"status"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -287,6 +288,22 @@ void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name, path, len);
 }
 
+/**
+ * igt_vkms_get_connector_status_path:
+ * @dev: Device containing the connector
+ * @name: Connector name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the connector "status" file path.
+ */
+void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
+					char *path, size_t len)
+{
+	get_pipeline_item_file_path(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name,
+				    VKMS_FILE_CONNECTOR_STATUS, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -580,3 +597,19 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
 }
+
+/**
+ * igt_vkms_connector_get_status:
+ * @dev: Device the connector belongs to
+ * @name: Connector name
+ *
+ * Return the connector status.
+ */
+int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_connector_status_path(dev, name, path, sizeof(path));
+
+	return read_int(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 3694f4162..13d7ed094 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -35,6 +35,8 @@ void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 			       size_t len);
 void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
 				 size_t len);
+void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
+					char *path, size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -55,5 +57,6 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 29739fe3a..b3fafc069 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -465,6 +465,26 @@ static void test_connector_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-default-values
+ * Description: Check that the default values for the connector are correct.
+ */
+
+static void test_connector_default_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_CONNECTED);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -484,6 +504,7 @@ igt_main
 		{ "crtc-valid-values", test_crtc_valid_values },
 		{ "encoder-default-files", test_encoder_default_files },
 		{ "connector-default-files", test_connector_default_files },
+		{ "connector-default-values", test_connector_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

