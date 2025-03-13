Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A90C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB06410E916;
	Thu, 13 Mar 2025 17:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e99iGCAI";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953AC10E916
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso702565f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887224; x=1742492024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKlFb+TaXRUElV1s0taMNpnV2kgg5uPhGMJLN00CVqU=;
 b=e99iGCAILySPgSCtkh6EuusVNT0poGCfJndnYfzULEHq1Pc1B5828NohC20f93dvCj
 CimulokIHzuaGtafOdtUF89ow2dkO+VfUvLGEfmxOf2ml/46ZkgjyMwTENmY37lIFRyo
 GQbkTc2/5goEain7u2LqKwRuSILJyP9ouZ4OVU4McUGW7hn07YR36nHvskFIbnvI72/X
 37ExQdf5z0vY001fcvGaVpBTTT+vj1Zc7MVw0rmrdXGC7QSkDM4VXuTfac7nbBpuBrGw
 bgYQd3B3/dFnqId8a1sAOKvUxOFSL4/5KIHPqItwgsAx+B21MNjdS6TPZLsysan/tc4H
 2Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887224; x=1742492024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKlFb+TaXRUElV1s0taMNpnV2kgg5uPhGMJLN00CVqU=;
 b=fpkQehYmJJt63ZOSeO0qucBuVGS4Aol8D9v+nVjALt4HF4Fyxi1FsfqGq6n6j9fVm5
 Jqmywsk/Wq4i9fB7+Ce4Up1DB+qrT+CP/6tVPGvET/rtGIbBVOt58A8PRhY4JbTvjD20
 90oHH9ZOK3Txc8DTCcwUd9lkt7j40kSgA59TkOdyJ/F9WPNyiPMVLNRCzYyI7aTqr2fn
 qoP7wdCiKaXFqWtyNqtOQPfRu0eMZIyrbPYOKcU8bGm7YqTZyUXxu9PvdT70W5Xc5Spd
 r1XSedtSEESldKbfzjDX1ZowdAw251D7u7VUpi7IRvKEByxegIUF2mgL5tU/htYOsNhK
 Mgpg==
X-Gm-Message-State: AOJu0Yzxgn3prtrQjc8GPndcB/gUlpiYdPYSZvsuTTlqiEO7+cGtz/iB
 oCyCMxv60cCUa08+aTfi5MMFYNyOFKiaCCnkHE/fvG9yXkKVCL7y2Zpkrt49
X-Gm-Gg: ASbGncuLJKyOz+BR9/Wkz1VZxnHgOEnYABr+RheVu6W06x6u2zheeDxbDwJ0+wcfmy6
 5f1whrZEdNbzzfZMKoQM3CH1oDiUp0dVFenDUHKvrT3OCBy/TjMpMaGLFOCJtX6/Hlxx+TZENZB
 w+3AoYe8Xb67fcxiJm61QlOlj8ayYHmNmZR7kASU5nXs+6YEcFNEFXAwiKofGn4VxlDcaUn+rpX
 MwoV+njJZ7Z+EHkH31HUPUluyTGxpxKazmBASEMtoQGPqoRusfoClx5N7R7m/YA2abQFGpie9kf
 Ffuyv1+/Ng45F1T7ZHCWWzMiC/3dSc7twhJSrg1Onsfj2ZWkjYFNWU4=
X-Google-Smtp-Source: AGHT+IHe5M8vOba/fSxqfwthivVIS1BtvSgHBfdNWrq6RNbPzNB0DabN4r8WqkYHoqkR+4v39sb5gQ==
X-Received: by 2002:a05:6000:1843:b0:391:2c09:bdef with SMTP id
 ffacd0b85a97d-396c1d1b9f6mr322097f8f.30.1741887224290; 
 Thu, 13 Mar 2025 10:33:44 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 22/43] lib/vkms: Test attaching connectors to encoders
Date: Thu, 13 Mar 2025 18:32:57 +0100
Message-ID: <20250313173318.5818-23-jose.exposito89@gmail.com>
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

Add helpers to attach and detach connectors and encoders and a test
checking the different valid and invalid cases.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 50 ++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  9 +++++
 tests/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index b6f22721d..2cd78fc95 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -410,6 +410,22 @@ void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
 				    VKMS_FILE_CONNECTOR_STATUS, path, len);
 }
 
+/**
+ * igt_vkms_get_connector_possible_encoders_path:
+ * @dev: Device containing the connector
+ * @name: Connector name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the connector "possible_encoders" directory path.
+ */
+void igt_vkms_get_connector_possible_encoders_path(igt_vkms_t *dev,
+						   const char *name, char *path,
+						   size_t len)
+{
+	get_attach_dir_path(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -804,3 +820,37 @@ void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 
 	write_int(path, status);
 }
+
+/**
+ * igt_vkms_connector_attach_encoder:
+ * @dev: Target device
+ * @connector_name: Target connector name
+ * @encoder_name: Destination encoder name
+ *
+ * Attach a connector to an encoder. Return true on success and false on error.
+ */
+bool igt_vkms_connector_attach_encoder(igt_vkms_t *dev,
+				       const char *connector_name,
+				       const char *encoder_name)
+{
+	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR,
+				    connector_name, VKMS_PIPELINE_ITEM_ENCODER,
+				    encoder_name);
+}
+
+/**
+ * igt_vkms_connector_detach_encoder:
+ * @dev: Target device
+ * @connector_name: Target connector name
+ * @encoder_name: Destination encoder name
+ *
+ * Detach a connector from an encoder. Return true on success and false on
+ * error.
+ */
+bool igt_vkms_connector_detach_encoder(igt_vkms_t *dev,
+				       const char *connector_name,
+				       const char *encoder_name)
+{
+	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR,
+				    connector_name, encoder_name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 2dd91df9d..42134c82e 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -41,6 +41,9 @@ void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
 				 size_t len);
 void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
 					char *path, size_t len);
+void igt_vkms_get_connector_possible_encoders_path(igt_vkms_t *dev,
+						   const char *name, char *path,
+						   size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -72,5 +75,11 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
 void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 				   int status);
+bool igt_vkms_connector_attach_encoder(igt_vkms_t *dev,
+				       const char *connector_name,
+				       const char *encoder_name);
+bool igt_vkms_connector_detach_encoder(igt_vkms_t *dev,
+				       const char *connector_name,
+				       const char *encoder_name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index fdbfa61a6..c36a795d6 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -707,6 +707,73 @@ static void test_attach_encoder_to_crtc(void)
 	igt_vkms_device_destroy(dev2);
 }
 
+/**
+ * SUBTEST: attach-connector-to-encoder
+ * Description: Check that errors are handled while attaching connectors to
+ *              encoders.
+ */
+
+static void test_attach_connector_to_encoder(void)
+{
+	igt_vkms_t *dev1;
+	igt_vkms_t *dev2;
+	char crtc1[PATH_MAX];
+	char encoder1[PATH_MAX];
+	char connector1[PATH_MAX];
+	char encoder2[PATH_MAX];
+	char crtc1_writeback_path[PATH_MAX];
+	bool ok;
+
+	dev1 = igt_vkms_device_create("test_attach_encoder_to_crtc_1");
+	igt_assert(dev1);
+
+	dev2 = igt_vkms_device_create("test_attach_encoder_to_crtc_2");
+	igt_assert(dev2);
+
+	igt_vkms_device_add_crtc(dev1, "crtc1");
+	igt_vkms_device_add_encoder(dev1, "encoder1");
+	igt_vkms_device_add_connector(dev1, "connector1");
+	igt_vkms_device_add_encoder(dev2, "encoder2");
+
+	igt_vkms_get_crtc_path(dev1, "crtc1", crtc1, sizeof(crtc1));
+	igt_vkms_get_encoder_path(dev1, "encoder1", encoder1, sizeof(encoder1));
+	igt_vkms_get_connector_possible_encoders_path(dev1, "connector1",
+						      connector1,
+						      sizeof(connector1));
+	igt_vkms_get_encoder_path(dev2, "encoder2", encoder2, sizeof(encoder2));
+	igt_vkms_get_crtc_writeback_path(dev1, "crtc1", crtc1_writeback_path,
+					 sizeof(crtc1_writeback_path));
+
+	/* Error: Attach a connector to a CRTC */
+	ok = attach(connector1, crtc1, "crtc");
+	igt_assert_f(!ok, "Attaching connector1 to crtc1 should fail\n");
+
+	/* Error: Attach a connector to a random file */
+	ok = attach(connector1, crtc1_writeback_path, "file");
+	igt_assert_f(!ok, "Attaching connector1 to a random file should fail\n");
+
+	/* Error: Attach a connector to an encoder from other device */
+	ok = attach(connector1, encoder2, "encoder2");
+	igt_assert_f(!ok, "Attaching connector1 to encoder2 should fail\n");
+
+	/* OK: Attaching connector1 to encoder1 */
+	ok = igt_vkms_connector_attach_encoder(dev1, "connector1", "encoder1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	/* Error: Attaching connector1 to encoder1 twice */
+	ok = attach(connector1, encoder1, "encoder1_duplicated");
+	igt_assert_f(!ok, "Error attaching connector1 to encoder1 twice should fail");
+
+	/* OK: Detaching and attaching again */
+	ok = igt_vkms_connector_detach_encoder(dev1, "connector1", "encoder1");
+	igt_assert_f(ok, "Error detaching connector1 from encoder1\n");
+	ok = igt_vkms_connector_attach_encoder(dev1, "connector1", "encoder1");
+	igt_assert_f(ok, "Error attaching connector1 to encoder1\n");
+
+	igt_vkms_device_destroy(dev1);
+	igt_vkms_device_destroy(dev2);
+}
+
 igt_main
 {
 	struct {
@@ -731,6 +798,7 @@ igt_main
 		{ "connector-valid-values", test_connector_valid_values },
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
+		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 	};
 
 	igt_fixture {
-- 
2.48.1

