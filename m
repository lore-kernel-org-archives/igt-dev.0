Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C80C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C786710E5A6;
	Tue, 15 Jul 2025 10:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJ27ZXlK";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0310E5A3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so3028846f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575138; x=1753179938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVjlE5ycQq6DL4EOhi66R4ZEJFOkKTZGXib/I8qQ7wg=;
 b=hJ27ZXlKilAqPmh8k0gbFP24lrV6XFzEeF6pYBDct9jTo9KKb0noYxm/NuSiNB+awK
 es7ayA8tJURvQWYICC0r7lVtJkIgVh/bRO3z+Cz4zT+cX78TYLhjh0tlqCBHXXDdDM1h
 DBmrIcCdTOqrYKr6Y+TCMFr5dXJ4zsc2oxngblTlel2TpIyyEgS2KXrwVshstEq5uRSP
 f95jeua0dVsm13TZRt+u43mJb19bwxO+4HkV0X7XkRet9vLv/+ybuUppeDJg1I0iJzNP
 GNfDs4at82Ul0A2bSVUwCVf0dx7TL+3Cn3xlXfXoi9IaOmpftvMLEbYRD8F+i7dgyvTW
 MHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575138; x=1753179938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVjlE5ycQq6DL4EOhi66R4ZEJFOkKTZGXib/I8qQ7wg=;
 b=Z6ILa6ePBfKXa5jPqrCTgIsGiHtbwsDhF7sVkw33F3RPHII5oxCVIPSEI24WoG2l1F
 Djrqjnk1TpnKv7dD7B3//Ha/6rESG+rrh/Uy3nn6h99lQPs95kBy7zsrUQsGe+azy2K1
 ptlhhnBMHxl2Hix6B2YsGnKwFFMQkXDgTKNSvwO/Mc0EzMY75AlHj1cIbEgkv+pEQ7s3
 sYderbTBbCYTE8yEGf06xczFxilsinBy8LyT5/rU/VjmBmilRUJP1emYoprPVIy5Vadn
 F0LEs/1PmSTG2lJYgsmDWFKgfvpnqbOZawlFgOaybXcQVYokOvuf9k/KOb6B4qayou7B
 giPw==
X-Gm-Message-State: AOJu0Yy2+MajMRi8ILp9poa2dqrD4NZL7+YVJX9GFqyOXmWwZPoctDX4
 sMup4g/aaLoyfwktwheCenHg06glG117eAqEoDrXl6vEg5I8j2SVuUSY8OA0yQ==
X-Gm-Gg: ASbGncsCouUYRRslQJlcmJoS7ptp4+7qu74H90YKt8jAcFkov7zLZVrl9y8KzCrSsLr
 2QHZLGjnDSFuMU/lsK0tbpS4Hrs/b8lMCl+oyKnpuys6y5hCksXb/BAcXoKAipeyn3aVPSkXh56
 frCF334Vf/g6FKyW9IGVTqnuhsW3As2Q1Mu6w9jfsMKUMcHHwU7A2CxTm6XSQXHtG0YG5uDHIg5
 FauO6ah3kSxJhF2mXutd1Z0OkEJgmqDydQFr07kD1EPJq0fmWIqPPV2VIUu6dFsqG2eiKpmKykz
 gDVlYomOft727bP8inJk+Yh4PMcjcyCuGGE03VBfLTvvV2yepu0QaiShmYoW9rwiFvMl5beh/F6
 kI8BS8PZZVib3QuPArQ==
X-Google-Smtp-Source: AGHT+IH4L+I0iTyNamgUHRQeeekLZpXhVzj1sZ9xwkGY34k8ARJcxrdMe+e+87jQiKWHgTv9kXcViQ==
X-Received: by 2002:a05:6000:25f5:b0:3b5:d726:b7c with SMTP id
 ffacd0b85a97d-3b5f18ea7cfmr13826283f8f.40.1752575138230; 
 Tue, 15 Jul 2025 03:25:38 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 20/41] lib/vkms: Test attaching connectors to encoders
Date: Tue, 15 Jul 2025 12:24:52 +0200
Message-ID: <20250715102513.5636-21-jose.exposito89@gmail.com>
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
2.50.0

