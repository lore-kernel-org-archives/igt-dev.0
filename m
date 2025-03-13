Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA16AC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F87010E900;
	Thu, 13 Mar 2025 17:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZIUK/HCa";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A387E10E914
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so810298f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887219; x=1742492019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IemLjmukrZnK5wTvAKAEwOxU02KUawXLsz9y9GEA81I=;
 b=ZIUK/HCai6SAbOq79moNmefEJ7++N+/56cwh40bbT++SJHO/CCEAcwc6Rj9P2RvwHm
 QWml5QOfYf1t+viQgy2P4bp3yl8mtkSdOpKiHVvJy/3HeXa0zCOvJGiks3hwDTEpa+tf
 GZKiwa+sBIRayqNMv3XLkTOtI5MfUc3rDgHem1xFEb3ULDeGZ7kzMnzSn6XBL9Vs3X0P
 xs5t7IjJZ+g1lr92I7fWqZKxfY+rwZHZ+L913wwji50Yf4Hb1A6nozqBUo6Mga9VnzwC
 b6W6osLJbiDIuwwm1xdGfdvXfrkzVGBd/paeXtZyXG8RGRsaP0WiILrf0kinZkQjKNEC
 eTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887219; x=1742492019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IemLjmukrZnK5wTvAKAEwOxU02KUawXLsz9y9GEA81I=;
 b=pXaYINkN+RHraY8kc14OwBXKhdbapG9QeUoPiTdYPdYXsyZmIqYEI9NTrmLfpczbfz
 N0X62UZuamJKiZsPSqG81hObhEnnKh4Q9u6KXRV0BL5E3OFgCk4A+f9s8J/wOXwpsET/
 ywCf+JqrH4pz81auyYSusDuvaa4pAblHxfphfzh7p1YX4WINYO7+4Grtaq9JSd5nd568
 2AXkdtuq5aNeidPG2G0N+tRlE3qlOYYcJdoGsETniExd0cHdNEz805L5/2puUn7h1hyU
 DDMNzvjlQhfsdo6RsofKsXznocELWrid1MNN1DjlUUsiWoWheQekdKI5P7VftsC9hzgA
 3usA==
X-Gm-Message-State: AOJu0Ywi0NDUV2T4h3S908L70pYUMOQFRji+rqqwOeF7F/4dkuzJwBim
 IyfvIyqKf20PRtT/jBEqPAvt8X/BijxWGEQ/aDJF70LK7HIU7OTwbY9xszXC
X-Gm-Gg: ASbGnct5/PeQZoRFBNZM+oyihyuA5yL/+j+4avIgtIhN8RDlRp0lVoPrGcOwSb7w2VZ
 pO6wBRDDFstaSi2rjcVlAEetZku7GExdWG74sHs5ymKr+P6sBL2wCL8UpUce5L1G+QzBLYoL9MS
 wem3cukURfkHTZrrjKpkbrLKlKHsYM/EFT4m1HriJwHNiN53zvnePm/4WergUfhxFch+1lrr0y/
 nU6Fj5XqiSVAkdzgofGn++ULRpf702pmwoMilUnLIPVpewBQyw0qdNNUzOYaZDgVz3AUbJzrJfo
 Dk3WeydK3se2TyCKchtxXRiNuiZLKBqSn7xl5Tj8q44y
X-Google-Smtp-Source: AGHT+IHlexBduVltksXgzqB/PdsUYcu/ycoeK1C6K8CojjTbhXGy9o32kgQL2yefftH5sLBpVbbjOg==
X-Received: by 2002:a05:6000:188f:b0:392:c64:9aef with SMTP id
 ffacd0b85a97d-396c1a34a35mr356750f8f.20.1741887218687; 
 Thu, 13 Mar 2025 10:33:38 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 17/43] lib/vkms: Test connector default values
Date: Thu, 13 Mar 2025 18:32:52 +0100
Message-ID: <20250313173318.5818-18-jose.exposito89@gmail.com>
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
2.48.1

