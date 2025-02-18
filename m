Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49578C021B2
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8867310E7A6;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nD4DSOFQ";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECE510E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:23 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3232052f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897422; x=1740502222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+z+va2ty8C8kc7HKIOOXQt/SYuxooAPCorrolQxGys=;
 b=nD4DSOFQFk6LBPJk+qLy0ltT7trO3mVk0vAARQjxrMsL5+Jt5F7OP+7gIeVoeSJwvb
 4H7Xs3h4U2hvOnkGJ3EPtdlUzUAIOhJz9AZNIlHPTLCHjpt+puXxXBkTbfMO3HrFeFcb
 QsCfl7mxPUEw3Jr4vc+ISHrIJvHjeoXp3iv51M4rgdzFzt9tpruMmdMlAXn9MNz7zMV4
 BWRF9J7zLX+5WvjzGsv7GP2gf93tE0nH+Xv7MtKvavD2WFO730pS/E3jV9FX091c8FCY
 zZZ2MnxA1r3hAp281Bd1Bv0Bn0xPxXUZ2Gj4J5LkVsMoGSbPqEWhU6z68IiAHHIwZuGI
 0n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897422; x=1740502222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+z+va2ty8C8kc7HKIOOXQt/SYuxooAPCorrolQxGys=;
 b=XeHVEth0/p9Xk8f5XHUBVJ87kn8vSmJJBlN84ZlBDrAhDLga9IhCgM295x63VwTiUa
 4yCHSzZ+DpjYwhUp7KzGYlRgXqn+WYuJSTfQ492/q/ol2lJsR/MScyR94KuWZsKoCh1m
 9zRYU3y2y0eMwpGuTOHpNfYWYDAftoMoKgy8DXJZo5qDiC4d3a56J8s7+BcN+neNxP7f
 OOLLQTkk0vdcEF+JhAKUZEHtl/Nn7XXrHBNl0ISpiG2PvcBL1hIpkTMhj5TW/+xx50De
 KlQuDqdJmqp3cas5L7/lppp3U6TQ6B5OdKkAj4Y4JzYy+ixhmHZXUqu7R2xph4928TdH
 Ya3g==
X-Gm-Message-State: AOJu0YzQLRS2gfT18jv640gYQmgti9sgCI2i8xnaX484QiMpkGnewPyQ
 mHxMqoA5svDb8E9td3sBdFeN8ophFiF7YBEhowm4XX/NmVgpXKrpZTA+KMM8
X-Gm-Gg: ASbGncuPtjeoCCtYH+F3t1BmVdy7Rdi5ZQQdz9+RzH61U/f4A+luptBgsRlIPA0gPUc
 pFmJZwKq/NPW15uRyC+G/vU5rK7yNi8j3tHWwrwKhZz1bKxLvdee3eaMzh0WFFq8NTzHcRDq+dT
 yzRYPRMKeWQ5y+AYFII5jVqbfXA/uvYdlqGMrXFvfrYt+W1jQuUdVHY+fvc9Y20fQfPlhlJV2EO
 EGYZIFvV4Og6Uj/TVfmUzz217JnHVeUEox/5X1KZkrEjTNd5V0anQzpVbL3rwSi7GKXsBhd8IWY
 GhMQNqZtzxzWYLLSqg==
X-Google-Smtp-Source: AGHT+IGkZ0pxSAp+KxkBTE2IYUD3NIRg34WT1ZmzqHJpXm+DMcOMCVps/3WhZrVNuIM2jv/ITOBVAg==
X-Received: by 2002:a5d:588f:0:b0:38f:3ee0:7012 with SMTP id
 ffacd0b85a97d-38f58782b8amr194378f8f.3.1739897421940; 
 Tue, 18 Feb 2025 08:50:21 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:21 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 08/39] lib/vkms: Test plane default values
Date: Tue, 18 Feb 2025 17:49:40 +0100
Message-ID: <20250218165011.9123-9-jose.exposito89@gmail.com>
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

Add a helper to get the plane type and test that the default type is set
when a new plane is created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 19 +++++++++++++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index a7b395a71..5cfe5123c 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -23,6 +23,7 @@
 
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
+#define VKMS_FILE_PLANE_TYPE		"type"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -321,3 +322,21 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
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
+	snprintf(path, sizeof(path), "%s/%s/%s/%s", dev->path,
+		 get_pipeline_item_dir_name(VKMS_PIPELINE_ITEM_PLANE), name,
+		 VKMS_FILE_PLANE_TYPE);
+
+	return read_int(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 9e16ae7eb..dd06d8f5b 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -30,5 +30,6 @@ bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
 void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
+int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index ec334641f..a3fa60762 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -202,6 +202,26 @@ static void test_plane_default_files(void)
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
@@ -212,6 +232,7 @@ igt_main
 		{ "device-default-values", test_device_default_values },
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
+		{ "plane-default-values", test_plane_default_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

