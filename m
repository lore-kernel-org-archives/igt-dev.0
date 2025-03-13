Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F196C35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9239610E90F;
	Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HT5u8mtd";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28A510E90B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso8985205e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887215; x=1742492015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6u7EVw4kJljnHJrPuRZa5OnxxO4Hmtg63s72Uc7ob0=;
 b=HT5u8mtdbVZb4RkZRcXap5eq4By/SzdIq2yBaklb+7Yl6VqkKilK8FTgUFDfAlG7te
 sRMi2GDqVkcingfv7y/IiT5owcplRQlF/mSNewwX3qs/UqLM4LW7NzxNxXzZgugH/b5X
 6glZTTS1lwb1CYdNcvwulbWlCOJwiEkzMgrJeGKidk5I6gRyQTOIfslf5JPlanm/t8AL
 TXI27c5jNt7HFA8fcTPQgw45+JuAn3vEodu6LQfEVmWx2o1f4zR6eDEN6q4l3FYnKwIR
 NdQSp/pSopJOKMj1giMswXvqKpHctHIU0yu8emuWS50V1jUk1k00xKVLD3O8Ewgd6Vzm
 XnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887215; x=1742492015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6u7EVw4kJljnHJrPuRZa5OnxxO4Hmtg63s72Uc7ob0=;
 b=lAXgUD/CHqS8vvxWGsP0kMkplNLJkkdyEP2Q5ZgVaUxBSt0Huviy16DVVkNkKyU7mW
 wGxEHNvtRpCG0P9DBxV9tISwYx1x2SNV2jZM5E+ASw/ndYvcma6botPrLEBlbUmmPQ16
 z75oboae90HWR9KdmMU1H3DIaTzEW/AxLhv7XrNWnLsMc1zdGCmZPg8Uw7g7h3CDZk8P
 I906CWk0HRt5dRgkOjNL1FYest6sYHjoZMPK6WXx2bgLrRHFxa2/EUuooNUcOswjjuRK
 RNm8vqf0I2H3veToL38/3lMa5d22cYqtQksYjomHYrGgSWRQestAg2kNE6AVOuXOq0xq
 VHrg==
X-Gm-Message-State: AOJu0YwlwzeCZzImS6qE/MLMlW53fxGpPgpX+z860hYoB/4pJNfupUpK
 7fHlf09Iv49wnw/w7LvbkXHM8gcovf2rpU2Ev67i/Qdnoe01zGHekUqBAEGy
X-Gm-Gg: ASbGncvP3ZVmgCecQNZ26RrYc4PDgAePBY0bWLry1pzYVCmQn0GBRQB9SGgina9oe9F
 LHtf44rrwEude20w+wamC63gRJWyKd7Jxt43+1ptNMfTa4MJGOJ9tu1cmHrLE/XH7lhZHQIWkO+
 Io3/DDTTqSw2QetSNhoZvA5wn+mo0RypW1QNYvEte76wL1Y8MGrJoiRi/lZ0Zyz3oSy9v03YrJl
 wbp3REjpqDQSMPOXq+4ExnxlF7E9Df+1L0G14xYj3ABV2gBkXTh9R0xHowcuLXKe3WsJjiJFPOa
 VeHMmnGp3v2Wz5EoKd9D6RpFRgzgYtlbZWMqyKnwyg9F
X-Google-Smtp-Source: AGHT+IEMtbd8UfOrTd/b6YVmE9i00yQ2O+Zk5atq2aCRaDACFx3mHjtPhNuCJMqWekDRvLDjHN84kw==
X-Received: by 2002:a05:600c:420b:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-43d1806c066mr25549855e9.6.1741887215052; 
 Thu, 13 Mar 2025 10:33:35 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 12/43] lib/vkms: Test CRTC default values
Date: Thu, 13 Mar 2025 18:32:47 +0100
Message-ID: <20250313173318.5818-13-jose.exposito89@gmail.com>
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

Add a helper to get the CRTC writeback status and test that the default
value is set when a new CRTC is created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 33 +++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  3 +++
 tests/vkms/vkms_configfs.c | 20 ++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index e780e4af2..0c3c9812a 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -24,6 +24,7 @@
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
 #define VKMS_FILE_PLANE_TYPE		"type"
+#define VKMS_FILE_CRTC_WRITEBACK	"writeback"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -241,6 +242,22 @@ void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_CRTC, name, path, len);
 }
 
+/**
+ * igt_vkms_get_crtc_writeback_path:
+ * @dev: Device containing the CRTC
+ * @name: CRTC name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the CRTC "writeback" file path.
+ */
+void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
+				      char *path, size_t len)
+{
+	get_pipeline_item_file_path(dev, VKMS_PIPELINE_ITEM_CRTC, name,
+				    VKMS_FILE_CRTC_WRITEBACK, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -476,3 +493,19 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
 }
+
+/**
+ * igt_vkms_crtc_is_writeback_enabled:
+ * @dev: Device the CRTC belongs to
+ * @name: CRTC name
+ *
+ * Indicate whether a VKMS CRTC writeback connector is enabled or not.
+ */
+bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_crtc_writeback_path(dev, name, path, sizeof(path));
+
+	return read_bool(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index d44131407..23c0560f8 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -29,6 +29,8 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				  size_t len);
 void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
 			    size_t len);
+void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
+				      char *path, size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -42,5 +44,6 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index ab15f29f9..7f0e07121 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -338,6 +338,25 @@ static void test_crtc_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-default-values
+ * Description: Check that the default values for the CRTC are correct.
+ */
+
+static void test_crtc_default_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+
+	igt_assert(!igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -352,6 +371,7 @@ igt_main
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "plane-valid-values", test_plane_valid_values },
 		{ "crtc-default-files", test_crtc_default_files },
+		{ "crtc-default-values", test_crtc_default_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

