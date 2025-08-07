Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664EEC87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C90310E7F9;
	Thu,  7 Aug 2025 07:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fIVU6irZ";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC20510E7F9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:25 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so6076285e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552784; x=1755157584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+YEKy40f95XRZfzSKE3pp96Em2pRwVB2+V673BrTaQ=;
 b=fIVU6irZYw9aq9nCeVRXBswX1EIq3p5suEoKvdTwNne6XXVc/mAwDbXH/nVYApvD5w
 5oTC4n7iIL9PPZFApJR6o9yaDtFuluWZKG0A8MQZ/ysQ9kdRm6JVVjRHXTsgKb0zEF8o
 7Li4oNfPoy/4/h7Y0JxBGLmItK7SfA3dChoeyvaR+/OrkTxkyEZCI0eWY13bgTBKcRUx
 PGLwkawj1FNAcmUEvGJKsi/WT9JGwbfRMa7gSmGd105IH210h8t32y1rrGQQ213Agux+
 MZcLK8tRP7Fwv+fCuX9/p6rVIjK9aiEHaku3r+L3wLBASkZArPVGC8EcwYAFXKMQNzjn
 uflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552784; x=1755157584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+YEKy40f95XRZfzSKE3pp96Em2pRwVB2+V673BrTaQ=;
 b=U3t/JwXeeJPEX73sEGX3SNVAU9Ks+1ZFvuJKdt9Eu6O2V/pbbW41bbHFwD4ddVDdRw
 5nSWiqqEnlPe6wAtzhB3ilXjJGraPvw6VKVGIKfdvPJLEpcXfq7ci5VgiKnIXL6vK72Y
 Eo24MuvO6YUkxkPB/vwpR/2+i0oNz9Sz40gEC+nAhIPlFEwg/MGzP7FWPgYwMi/cJX9f
 SycVe6moJAQ8mUEU6/iPF9MGNhBMA/KW7U5ZSU+i+QfdjwEVtn+6S29cMcca2fl5P/E9
 1SW83GSUQN5VuAw2KI8mbc+kbLBF3870m4D0icN3YJlfUTTBot3cIbSh4Ian2IJKNeAW
 TBWA==
X-Gm-Message-State: AOJu0Yyzc+a52OqwIhttPSWvhIJwBmzoi6iSOuItUM57gtBlScBrHNOF
 l5OIyuccImLjO39MRX9AKhNd/OOhi1rot1OLHPID47seVEFYMWmPockiRSI3ckkD
X-Gm-Gg: ASbGncusNE+g9PkhP9ijyuiusrvNSTFb6Bgha6jDYQaLuF9IEioufgv9eTT6tgBjTzB
 /cK2qDpPAi7IXUeJzohW0kxAredjB5WZsrAJjo0P4WGxtY3S67QV2eMwKHmxlePq2+R2m1o8fh2
 /z9nKYsCofxOypT2zub1TkWGIiJBKJvW3pl3LLvlpGQSpMEnDscwutKnjZhNUTKW/lsnVTFjr9g
 U+fw7bcOzrwvcPgSxGA7hEGFcsJXFBY+28EAh8oYSsXUreFl4a7b7zoSqglW29TsZnTJ5T3YYFV
 Unf/vT628ULE5ygJ6QYL9d004vk4g7YMiBsv5/68x9ZoxqLhX66QFH1n04gVDOcL5uLVyLx9wzS
 oYKiLlWb7xFbHC3rOMNI=
X-Google-Smtp-Source: AGHT+IFY/HBmIKLR7/pH+drK4e18W6ej+7fr1qtMPuiBtkKFPlx5KNat/HUraO86KCPkr7fC82OIwQ==
X-Received: by 2002:a05:600c:3147:b0:441:b698:3431 with SMTP id
 5b1f17b1804b1-459e74731femr44240305e9.28.1754552783927; 
 Thu, 07 Aug 2025 00:46:23 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:23 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 19/41] lib/vkms: Test attaching encoders to CRTCs
Date: Thu,  7 Aug 2025 09:45:28 +0200
Message-ID: <20250807074550.6543-20-jose.exposito89@gmail.com>
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

Add helpers to attach and detach encoders and CRTCs and a test checking
the different valid and invalid cases.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 46 ++++++++++++++++++++++++++
 lib/igt_vkms.h             |  6 ++++
 tests/vkms/vkms_configfs.c | 66 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 66d4a397d..13ba50273 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -363,6 +363,21 @@ void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
 }
 
+/**
+ * igt_vkms_get_encoder_possible_crtcs_path:
+ * @dev: Device containing the encoder
+ * @name: Encoder name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the encoder "possible_crtcs" directory path.
+ */
+void igt_vkms_get_encoder_possible_crtcs_path(igt_vkms_t *dev, const char *name,
+					      char *path, size_t len)
+{
+	get_attach_dir_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
+}
+
 /**
  * igt_vkms_get_connector_path:
  * @dev: Device containing the connector
@@ -706,6 +721,37 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
 }
 
+/**
+ * igt_vkms_encoder_attach_crtc:
+ * @dev: Target device
+ * @encoder_name: Target encoder name
+ * @crtc_name: Destination CRTC name
+ *
+ * Attach an encoder to a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name)
+{
+	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER,
+				    encoder_name, VKMS_PIPELINE_ITEM_CRTC,
+				    crtc_name);
+}
+
+/**
+ * igt_vkms_encoder_detach_crtc:
+ * @dev: Target device
+ * @encoder_name: Target encoder name
+ * @crtc_name: Destination CRTC name
+ *
+ * Detach an encoder from a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name)
+{
+	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER,
+				    encoder_name, crtc_name);
+}
+
 /**
  * igt_vkms_device_add_connector:
  * @dev: Device to add the connector to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 18f2a1068..4975fdf49 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -35,6 +35,8 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
 				      char *path, size_t len);
 void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 			       size_t len);
+void igt_vkms_get_encoder_possible_crtcs_path(igt_vkms_t *dev, const char *name,
+					      char *path, size_t len);
 void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
 				 size_t len);
 void igt_vkms_get_connector_status_path(igt_vkms_t *dev, const char *name,
@@ -61,6 +63,10 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name);
+bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
+				  const char *crtc_name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 737af8847..d210b7f89 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -641,6 +641,71 @@ static void test_attach_plane_to_crtc(void)
 	igt_vkms_device_destroy(dev2);
 }
 
+/**
+ * SUBTEST: attach-encoder-to-crtc
+ * Description: Check that errors are handled while attaching encoders to CRTCs.
+ */
+
+static void test_attach_encoder_to_crtc(void)
+{
+	igt_vkms_t *dev1;
+	igt_vkms_t *dev2;
+	char plane1[PATH_MAX];
+	char crtc1[PATH_MAX];
+	char encoder1[PATH_MAX];
+	char plane1_type_path[PATH_MAX];
+	char crtc2[PATH_MAX];
+	bool ok;
+
+	dev1 = igt_vkms_device_create("test_attach_encoder_to_crtc_1");
+	igt_assert(dev1);
+
+	dev2 = igt_vkms_device_create("test_attach_encoder_to_crtc_2");
+	igt_assert(dev2);
+
+	igt_vkms_device_add_plane(dev1, "plane1");
+	igt_vkms_device_add_crtc(dev1, "crtc1");
+	igt_vkms_device_add_encoder(dev1, "encoder1");
+	igt_vkms_device_add_crtc(dev2, "crtc2");
+
+	igt_vkms_get_plane_path(dev1, "plane1", plane1, sizeof(plane1));
+	igt_vkms_get_crtc_path(dev1, "crtc1", crtc1, sizeof(crtc1));
+	igt_vkms_get_encoder_possible_crtcs_path(dev1, "encoder1", encoder1,
+						 sizeof(encoder1));
+	igt_vkms_get_crtc_path(dev2, "crtc2", crtc2, sizeof(crtc2));
+	igt_vkms_get_plane_type_path(dev1, "plane1", plane1_type_path,
+				     sizeof(plane1_type_path));
+
+	/* Error: Attach a encoder to a plane */
+	ok = attach(encoder1, plane1, "plane");
+	igt_assert_f(!ok, "Attaching encoder1 to plane1 should fail\n");
+
+	/* Error: Attach a encoder to a random file */
+	ok = attach(encoder1, plane1_type_path, "file");
+	igt_assert_f(!ok, "Attaching encoder1 to a random file should fail\n");
+
+	/* Error: Attach a encoder to a CRTC from other device */
+	ok = attach(encoder1, crtc2, "crtc2");
+	igt_assert_f(!ok, "Attaching encoder1 to crtc2 should fail\n");
+
+	/* OK: Attaching encoder1 to crtc1 */
+	ok = igt_vkms_encoder_attach_crtc(dev1, "encoder1", "crtc1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	/* Error: Attaching encoder1 to crtc1 twice */
+	ok = attach(encoder1, crtc1, "crtc1_duplicated");
+	igt_assert_f(!ok, "Error attaching encoder1 to crtc1 twice should fail");
+
+	/* OK: Detaching and attaching again */
+	ok = igt_vkms_encoder_detach_crtc(dev1, "encoder1", "crtc1");
+	igt_assert_f(ok, "Error detaching encoder1 from crtc1\n");
+	ok = igt_vkms_encoder_attach_crtc(dev1, "encoder1", "crtc1");
+	igt_assert_f(ok, "Error attaching encoder1 to crtc1\n");
+
+	igt_vkms_device_destroy(dev1);
+	igt_vkms_device_destroy(dev2);
+}
+
 igt_main
 {
 	struct {
@@ -664,6 +729,7 @@ igt_main
 		{ "connector-wrong-values", test_connector_wrong_values },
 		{ "connector-valid-values", test_connector_valid_values },
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
+		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 	};
 
 	igt_fixture {
-- 
2.50.1

