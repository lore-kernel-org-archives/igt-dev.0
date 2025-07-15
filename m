Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDBEC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A371210E5A0;
	Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ciIeRDS+";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224410E59D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so20672525e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575135; x=1753179935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5u00mJjzW1P3pKhpCpfB0deb4k/JseSNa++Gk2xx7o=;
 b=ciIeRDS+nLiMsdly+Glc+5ui4l0xQhKxIyPOZ/RWo5xdzX4leVOihUIfcJt2iP+tE5
 TUEE6gyy4gdc4U30fiAJuQ2N4n1R4yIV4OLkRFECSCxDx8EvoubPJnL/tQcZrLGueYaB
 JJdICHWIuLeq6auHW6F7vrWSZYvuibtqMqUtB8vN/gJUHIIgt/drxAT22lIinenT4Zvs
 CYqgdELlFSpmRJTjPcL935xOKFhl0wOo9INrJEnXo0FQehsHLWLKlVtCxsQv/xiv1vfa
 Sry1iVUcuhYPgOw99O2cPug+PJgdB+ka0Ni3VEZARrJD/MR3auBJPoVFR3GIQfrkLkJL
 c30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575135; x=1753179935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5u00mJjzW1P3pKhpCpfB0deb4k/JseSNa++Gk2xx7o=;
 b=Db66sd3qlsoQu2sIyH8OIWXvvrHG7KuAtuKUCjXCubWVH/YLDJUgtMpITpMoOZ39wt
 S4+qU+Y3E5O4QoasKU/P+icoe6g7IYmIq3R8cu3SXA8PEJQID+uqzzcbuXIo44CTXfsD
 IEISxHjEY2u5C0f+hzud1LQvCQSySFbH9qcjXXIgzuG42vrO0OKFrfpm/Zc1VDDpIRj+
 u5lCnu9gNg+P8SK7OkUh9RJvoRGagDXTxaJ+vso/W71Kgf1tBgPA0x2UxQN8d/HNYvbk
 I54WFqS1afdM1ODsE2FZPvaryELPIu6O4a2x9CsVTtxbQ10rjhRXqBM86VHkZQ51dGZs
 VFYw==
X-Gm-Message-State: AOJu0YwUasLmA8t/BiC5At9ag53lOQnyt/CYLTItULuVOGx9U8PYjuPW
 Ve9lMP7GusYn+Or5Ot/w4QCtXECVPmz49WyVhn1A/TZiInrQu3/RNhBIB7WOug==
X-Gm-Gg: ASbGnctuTQ2IELzvLqFnU3+7Eg5bs1dN8OAplQV/P0TxkB1VAypXnUl3qT62K7gebyC
 Ze4RGhJUT9wxSKgLJI6cHfaroonFYuLy45w8DiAhbI2+D5Cv/7ZsMGECkPnbpjBwVMMRmJBnVUM
 lgiMTdsrU36asSXDSCsSEMAxayGrVvRqcxC40ZpOJJm1Fqtw+OeKvTXAoauk1VvU/G7aUJ2Xjx5
 e9QW7C+ahwGaslWfm+G+yu/+ghi4mT/GZDl6IWkPexibmhWAqj04BOXFI/5hrjAjMDKD04YUw9l
 nAtUKzSLmMyrl8aCXt8KxAzz79u0aEycVNnpmv427fUP6vKAaiAdfzBopw8Z+w3u1NnF0jrgJKZ
 S9Hz6pBeBnbtXkaUrqw==
X-Google-Smtp-Source: AGHT+IHQHfNzMMrg/kAKQTAZ0ShcnJ+3dylqKJpwpkfKYs4xh891xkmKQRVYTGHUbj5HK1Jfp8d68Q==
X-Received: by 2002:a05:600c:1c96:b0:442:f904:1305 with SMTP id
 5b1f17b1804b1-45625e5044amr31472015e9.6.1752575134741; 
 Tue, 15 Jul 2025 03:25:34 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:34 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 15/41] lib/vkms: Test connector default values
Date: Tue, 15 Jul 2025 12:24:47 +0200
Message-ID: <20250715102513.5636-16-jose.exposito89@gmail.com>
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

Add a helper to get the connector status and test that the default
value is set when a new connector is created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 33 +++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  3 +++
 tests/vkms/vkms_configfs.c | 21 +++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index eecad1977..c8b0dd071 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -25,6 +25,7 @@
 #define VKMS_FILE_ENABLED		"enabled"
 #define VKMS_FILE_PLANE_TYPE		"type"
 #define VKMS_FILE_CRTC_WRITEBACK	"writeback"
+#define VKMS_FILE_CONNECTOR_STATUS	"status"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -288,6 +289,22 @@ void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
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
@@ -581,3 +598,19 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
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
index 6dd576b41..3d27bfebb 100644
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
index 595d258f6..d7ce4aa17 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -466,6 +466,26 @@ static void test_connector_default_files(void)
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
@@ -485,6 +505,7 @@ igt_main
 		{ "crtc-valid-values", test_crtc_valid_values },
 		{ "encoder-default-files", test_encoder_default_files },
 		{ "connector-default-files", test_connector_default_files },
+		{ "connector-default-values", test_connector_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

