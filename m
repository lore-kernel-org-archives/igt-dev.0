Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B0C021B7
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAD010E7BE;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BigCrB7N";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F85510E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2e5so2351300f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897431; x=1740502231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQlYe2E/40TevD7dACH7Kxvnx8H152Y9CbekEvnYmYc=;
 b=BigCrB7NjN52cPXS7SeUyr20JXQcsimcVn/UWGuZ+sBbRpdGNmQ6bKJ14kEg9j8GF/
 5Gx1YQAaPg8ShuI5K0lPdLDlOdI0slb8QbVF8erubQTJsjODx45M6BYjDyWvuwRNR7jf
 EYH7NqFH0vS8yK335K6yXDlZ5b/3EpW+5BoxfJTEZWodfsOHX+Pqfj1SDpS/hkPf2ZpL
 NXzigPBLciKKzRlcnlVhwNwjmcd0P/FcRMxarDK8oRsGc3OeBad+zrnq34px4vddwwQc
 upw/2Ve1hnr2fp24o0IEl5b+YvaQA77/JGaU7KVu3DGdf0Md3YMPrIzk3yteNFbn6QZD
 ks5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897431; x=1740502231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQlYe2E/40TevD7dACH7Kxvnx8H152Y9CbekEvnYmYc=;
 b=DquI9I4bcj64ABSQ9S9CAej6sXjrxWUD4p3bPl3s0vU+tAFZ50y6lhhzMjzXVkvYGW
 XEj7iUE+tDzNJuMXRKBQBCrSl5hvejQvHNzFCSdFK5Yxj4iPtCfhqpTaFQKUIL9GJS1t
 24EXiP7Vv4PqCCOW0yrZsMCnd4S31wMdM5ZUJinFLv8YVX/lxnKmPZcCqc2afRIXvFDz
 +vL4JQwQJSRfPFqWE5ZgjcarB5pAdrod70iF/NAx8cwfPE52S206GAJsK1D6jtkvETLc
 FmSAxW43g9D5DJZhrLVy48t5XeCaPtOXY95/eCzaHePFVKsRHa43U2ry+OdLmaV+uXCF
 S65A==
X-Gm-Message-State: AOJu0YzlWnmutTx0hCaDtIufndAm7SE70zlngBeZVRLZ/0B7xn0kgSaz
 KkLZGqefKAO/Hw4HuXTSEwP+eZTMJMva44/E3Ki2aRZ5r93qGb7DmvpsosBa
X-Gm-Gg: ASbGncuYn6AA0abTdxe0LvbRHWl823oJxRqk3IYLrHWXLxuoNXbz/b0B12fwsa5PwdL
 ctlzmCAcCbkMbt0/13JVPic+Vq8Px7/YLbqQtEclfmPkUsVFBaDdDXLm20Rqv+QrE4J6ae3ge47
 wC6sh27dEavYLcwiMZOjmM2w4peYAWOHLbqq/UejawAvjEsCt0wQL2L62E9x/ywGOXXzzu/qAR9
 rzh03/Xl+1p+iGK1R/914008DXYeSiOEM50/JGE9cVDY9X6MYwNIrxwdYMmzZybx0WhaCHieNG6
 Zp/l3rkq8f3xJ1fExw==
X-Google-Smtp-Source: AGHT+IH2muqadHcBlve4kAVCsgbdBZFwYLi9eQFOsRQuKV18YgnKuH1YAmk3k6mTo6f1b310h4RYxQ==
X-Received: by 2002:a5d:64c6:0:b0:38d:e3e2:27e5 with SMTP id
 ffacd0b85a97d-38f33f37467mr10350416f8f.5.1739897431310; 
 Tue, 18 Feb 2025 08:50:31 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 19/39] lib/vkms: Test attaching connectors to encoders
Date: Tue, 18 Feb 2025 17:49:51 +0100
Message-ID: <20250218165011.9123-20-jose.exposito89@gmail.com>
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

Add helpers to attach and detach connectors and encoders and a test
checking the different valid and invalid cases.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 34 +++++++++++++++++++
 lib/igt_vkms.h             |  6 ++++
 tests/vkms/vkms_configfs.c | 69 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index dba766c28..1fcb93c94 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -607,3 +607,37 @@ void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 
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
index 0cc09eb90..1ef62125f 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -52,5 +52,11 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
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
index 6ac475ff4..dc3dbe80d 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -621,6 +621,74 @@ static void test_attach_encoder_to_crtc(void)
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
+	char encoder2_enabled_path[PATH_MAX];
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
+	snprintf(crtc1, sizeof(crtc1), "%s/crtcs/crtc1", dev1->path);
+	snprintf(encoder1, sizeof(encoder1), "%s/encoders/encoder1",
+		 dev1->path);
+	snprintf(connector1, sizeof(connector1),
+		 "%s/connectors/connector1/possible_encoders", dev1->path);
+	snprintf(encoder2, sizeof(encoder2), "%s/encoders/encoder2",
+		 dev2->path);
+	snprintf(encoder2, sizeof(encoder2), "%s/encoders/encoder2/enabled",
+		 dev2->path);
+
+	/* Error: Attach a connector to a CRTC */
+	ok = attach(connector1, crtc1, "crtc");
+	igt_assert_f(!ok, "Attaching connector1 to crtc1 should fail\n");
+
+	/* Error: Attach a connector to a random file */
+	ok = attach(connector1, encoder2_enabled_path, "file");
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
@@ -642,6 +710,7 @@ igt_main
 		{ "connector-wrong-values", test_connector_wrong_values },
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
+		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 	};
 
 	igt_fixture {
-- 
2.48.1

