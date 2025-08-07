Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C6BC87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1181910E7FA;
	Thu,  7 Aug 2025 07:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UJ2uNJ6z";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234E310E7FA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so292129f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552785; x=1755157585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heZJW6fG/AaQ1EvJDWygwEmIVPcrq1s8gwZ8+SUNDbY=;
 b=UJ2uNJ6z9ms5hSQNmbYBpMDCvSeVIrsGpVfi9sGVp1yVj8vZC3t72aJqNOmCVtQOk2
 VNyiT2w7/Bt1ZEMkXtpwGdEMWP7PClmEep/Bd9snv0ZlSaTHOH2yilkQwEvuv7VpHcr7
 EyyP4pw4v5/aNXjsyO3cuaNz8MSC0CTK2jswV5qDH3yjIuywxX7WOUdAj93ZgeDNOq0N
 IUtCfCOM7iTqYdi2j3K+F3x6qmEHDstSWLSEAa33L4Il+YYcACWaCLMojBUL27fqC7B1
 RHpGvJS+DItvw+8z9WL3HeWClJhrIpOMM5o94lLOaMCf5oyUN2JV8w2FEHRNthq1XRxE
 bw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552785; x=1755157585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=heZJW6fG/AaQ1EvJDWygwEmIVPcrq1s8gwZ8+SUNDbY=;
 b=LsW///OXskoo4tGXqcd209iEVNY6VGlfGNxbMgcewcODOzMdeqrh9GqSqkZucM3yxZ
 O/bWl5AxGbE9ELuO31X5Z+IATL/9AjbBsUzzmzucn/SOYul5+U/bhcjhhZ3DNC47Fowz
 eK7vFgr/1z40Iv6koYhgwvH7DV45GcAjwY7M76Lkhm/qM46FwgTnrwykQEeTJdeqkatR
 bLBXYXlia++UB4JwBtJjYR2iYGRaK24hC32r5TudW1VTwEr+VGbk1g5/KRAXdBnwZuma
 WO/gPNJdz8HryIukvhTT/WDe2NXpJgliPr9BGTsqLfNi4At5ZTKyWUBR7MfzRyk8pC2E
 y0QA==
X-Gm-Message-State: AOJu0Yw6h1+I0ebzuzTjBbZ8kh2reqlge1NljoN5cuP5ktQTXlp4dmzN
 0L52dH9wjw2UrtQIHbPUW9ncZev2xmyrFF3Vbz70+qPDtks2WMp6dsa6s8WGN8Dx
X-Gm-Gg: ASbGncv5e600ameo6/fUIvlaIHH9nC62ENwpuwXRuICzHNmxmQP46Na5xTfGMdtLMwR
 50p+kQ4N6Sf7BMi10vydLvrFGNk3uVewCDUoglov2CXHmlp3eHcOxabrxk9B3waJoE+n2KCyUTY
 PDgSKgd43dIZdXbl9It5vRgp0750QKvgOgha56b/K2RNZKnkkWm1rnjEmfYsM6Vsd8Qanjb3E5m
 OguPE0FDpUp3ylllzwpbNQGt9whIx369IXyUuZJyb3+lS3HuQGDIbxSqigKcajNBJC5Yg+zXycC
 XstH3v9RAG9XLMXXzsZkkJkMBqj4lWU1iQDHSHdGwQppmrMHqsv+mNDjBQucmfaaYv+w9H7Na6a
 VJgoHnWWrlIVhKHx+YXU=
X-Google-Smtp-Source: AGHT+IHP2R/Bcytcgdx8YpIfXat0Tgynygv8Wt0QQfh5FiOJnFjmNiAywEY+x965Ntfy1dDcetA8lw==
X-Received: by 2002:a05:6000:26cb:b0:3b7:84fc:ef4c with SMTP id
 ffacd0b85a97d-3b8f41a8431mr4464316f8f.6.1754552785048; 
 Thu, 07 Aug 2025 00:46:25 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 20/41] lib/vkms: Test attaching connectors to encoders
Date: Thu,  7 Aug 2025 09:45:29 +0200
Message-ID: <20250807074550.6543-21-jose.exposito89@gmail.com>
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

Add helpers to attach and detach connectors and encoders and a test
checking the different valid and invalid cases.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 50 ++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  9 +++++
 tests/vkms/vkms_configfs.c | 68 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 13ba50273..0897c77ab 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -409,6 +409,22 @@ void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
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
@@ -803,3 +819,37 @@ void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 
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
index 4975fdf49..62187a8aa 100644
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
index d210b7f89..8391513ea 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -706,6 +706,73 @@ static void test_attach_encoder_to_crtc(void)
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
@@ -730,6 +797,7 @@ igt_main
 		{ "connector-valid-values", test_connector_valid_values },
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
+		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 	};
 
 	igt_fixture {
-- 
2.50.1

