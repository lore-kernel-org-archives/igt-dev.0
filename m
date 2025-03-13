Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77200C35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E9C10E90A;
	Thu, 13 Mar 2025 17:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dfa9hDDh";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0C910E901
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso11888095e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887211; x=1742492011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aexOVqPFfdCJ8o0jg5i8f8I1iNJWozJzc3RiaeT5P7A=;
 b=dfa9hDDhOLk+As+brEVsm3LZjKCyTGWGEHN4ZsvmrakxjPOrCYsXc5PViKKAK91Vvs
 OMbMt7PV2cAO0Zbr/drgOTvEq0whUSallQC+cU322Kg0xNEFv7/pAgMOSs+EXnmDzlDc
 VTrBkjPpQAopD2NULwDTTqzpoHhnCNN7B4uq3zrjcPFEJIzGQuaqx0kRx9wNs+uykegK
 QdxzIbWBeS54mfifNfsQRv3iwvMWsulSh/bAwNut38qgwZWiOUDV2pwbD/du4OozwDii
 ASwbwhW7MolTx4YFlDgbBNvmXEapYR1etEY5BU+UHbbCHsw3wzFVcTXFpTgM89DQhz51
 FvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887211; x=1742492011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aexOVqPFfdCJ8o0jg5i8f8I1iNJWozJzc3RiaeT5P7A=;
 b=e3X3B/Id0KlsH0RpNEoN3jciBFroZJtFtYZlrUB0aQkt6rnsoKd/Vfds8+rErVyxrZ
 MT4UeIPfxZzdj0/8GeM/aZK/ilNi+u64Ss1er6meYF7OMu6FMWKYp7ouJnzcbNCkZhe2
 cMBKV/IUB37DrH8NAiSjJY+tFbueAAJ78+ihU/ETEzI6x0YsVKjU51nN6+jl1fxGVlxc
 7crn53OwhKWT/IVixQmR1EgoW9vIkU/HmbrzM4ySmG4Lq8o3M2vfIKXC+CYE1QSYXLK0
 tJ2TTpfBdIoV2Wu7Au/rqsiWbmmozZWW9tHhHSOl3XrsNL8dRGnDeLnLt4fWfEmCfY37
 QDZQ==
X-Gm-Message-State: AOJu0Yy/zTiXEU83iku8zb4vsTUzY0d6TXCblyp8k0z7bilS17IsgnWF
 OEbM9mkXAtDO16v5SjoDZT3/JtgiHpPxwhnZQSYAG5xNE+FHH6wUb+mTDWiD
X-Gm-Gg: ASbGncsYSGLMrSO/dMYM9zqOpm6+gChlUWKpFmFgCjeQrLUlTIFuh3S83c3JrFJnIdR
 6I0y2xz5OtWGwqpHtQm79rePvfmbFzEpO8BAM85jzobQ/aeNghcFOobT2KEKV1rj8Ns0nK1Mfly
 Te/Sp4C7PEXk1MVqXb9YxB050QjTpmH1wCJNfeFvn9A7P04iJMvgaTzrHh3WhcGc785k2FByGOz
 ivlzJhhRaczsNFwyV0BXSmQlytVZEQAiSsZ9Q0dACF/ZGppBfL/CpG09bPLPC9I4l5EhQWudPXg
 4hQnzV11icJ16uZTWhjVo9BfjAhxczX11N6U3vEh5qjf
X-Google-Smtp-Source: AGHT+IE0PK3nrDEeK+SiIBP8smvnbxOpBaMRy71xrkQhr/QFUECcYQDZ0aobz2iT6V82MyXVG+YyPQ==
X-Received: by 2002:a05:600c:a05:b0:43c:fbe2:df3c with SMTP id
 5b1f17b1804b1-43d1d8ebc67mr4100205e9.26.1741887210992; 
 Thu, 13 Mar 2025 10:33:30 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:30 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 08/43] lib/vkms: Test plane default values
Date: Thu, 13 Mar 2025 18:32:43 +0100
Message-ID: <20250313173318.5818-9-jose.exposito89@gmail.com>
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

Add a helper to get the plane type and test that the default type is set
when a new plane is created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 47 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  3 +++
 tests/vkms/vkms_configfs.c | 21 +++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 1f90e1569..6cc9b8afb 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -23,6 +23,7 @@
 
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
+#define VKMS_FILE_PLANE_TYPE		"type"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -132,6 +133,20 @@ static void get_pipeline_item_path(igt_vkms_t *dev,
 	igt_assert(ret >= 0 && ret < len);
 }
 
+static void get_pipeline_item_file_path(igt_vkms_t *dev,
+					enum vkms_pipeline_item item,
+					const char *name, const char *filename,
+					char *path, size_t len)
+{
+	char item_path[PATH_MAX];
+	int ret;
+
+	get_pipeline_item_path(dev, item, name, item_path, sizeof(item_path));
+
+	ret = snprintf(path, len, "%s/%s", item_path, filename);
+	igt_assert(ret >= 0 && ret < len);
+}
+
 static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
 			      const char *name)
 {
@@ -195,6 +210,22 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_PLANE, name, path, len);
 }
 
+/**
+ * igt_vkms_get_plane_type_path:
+ * @dev: Device containing the plane
+ * @name: Plane name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the plane "type" file path.
+ */
+void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
+				  size_t len)
+{
+	get_pipeline_item_file_path(dev, VKMS_PIPELINE_ITEM_PLANE, name,
+				    VKMS_FILE_PLANE_TYPE, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -379,3 +410,19 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
 }
+
+/**
+ * igt_vkms_plane_get_type:
+ * @dev: Device the plane belongs to
+ * @name: Plane name
+ *
+ * Return the plane type.
+ */
+int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_plane_type_path(dev, name, path, sizeof(path));
+
+	return read_int(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 9062cc42f..cea0c7242 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -25,6 +25,8 @@ void igt_require_vkms_configfs(void);
 void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
 void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 			     size_t len);
+void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
+				  size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -34,5 +36,6 @@ bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
 void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
+int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1ac85d8f9..5aafe39ae 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -211,6 +211,26 @@ static void test_plane_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-default-values
+ * Description: Check that the default values for the plane are correct.
+ */
+
+static void test_plane_default_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_OVERLAY);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -221,6 +241,7 @@ igt_main
 		{ "device-default-values", test_device_default_values },
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
+		{ "plane-default-values", test_plane_default_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

