Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B17C83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299410E36D;
	Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gy6oX1bm";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B57C10E599
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4330267f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575130; x=1753179930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jiTDkh0X3LNdqdbZ8Bu5tjYsXtU2uU9MPMajdpjQ+o=;
 b=Gy6oX1bm7PtqfvwEl11gVAoK9NuP4qsGoV93UCy0yG5by6rZrByRJhir2kQl745tcf
 W2LCnD1ruUq5L7o0kM3LGW+L2CQlHJhVbUFslCnIT1OXFtCJk6Wq2EFy8yGNfPs7oJ8e
 eDUFpHsNOkgEuzavCw87AaLj46j0YLv2n6TLckaluSRB3eqn/WRcBL0jRwPveyrMQyfR
 luhM25KX23Vw8gQRSQraV58osjz0x49QZC0A1gwwQyFys7tgVD6S59+gdmJcBVrv1KYT
 gPjYVPzs4604caEkWNbsUR7Bsin5jFVyP+BiQUPhnz3ZbNNiAPxNAsBkzXCnxWic0g5R
 NnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575130; x=1753179930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jiTDkh0X3LNdqdbZ8Bu5tjYsXtU2uU9MPMajdpjQ+o=;
 b=EnV3J/rAbYI6VL5n8NcmQ4lItAaMGMBt1DKzIpZFIxSBt0vySQ2Sn8gHHlmNv9we3z
 O6K1Tsd5i6bQe00YK60gPE0XhLIkh5SR12fHH7JrWlKnYlBklMFtTJOTmwvkE7BGch9A
 RaKPQjxz2AQ4GhMMdJ4dmWCaecPdfIzx1bFWZRaNLz+9mePAQ/lh9W9WFc+UbUuGLUYl
 us1pZW1mmJoy380AAQxaX0oR83jzsF4P9bRu33u5ASEzCNxwi9dQXd9F4hBvoTT3g9Xv
 M//7SXZU5foWqBG9fKOhzQrwBezsToh6a7BzHurD4jucJi5Id0PJMwmlfCQajtk4chgM
 hJCw==
X-Gm-Message-State: AOJu0Yy/XB1dUcj4feL34kUQzi+IGhK5Cm6oEnvpbiF42zTHhzbPCfyV
 Tc6UaGZjEnQXq3SYqkr7RDOD4oWhsNgHiGHMcoA96nFaJO1yUR/wJtks7spImA==
X-Gm-Gg: ASbGncu0AtvG6m+JJXDWKy2H75gW+51av/5rwHOsmlppAjCU+mDWxiEA/8sOAVPxgvh
 W4HLbUn9hVShIH6nSQbgfEAEZD8pG0tfY42+bJFfSDRwczpKUpcfbwV4uWJqZ4WLWmw3PnkmqYb
 xeNRiTaTWE+kNvZhhVnc+g00ThvS19VAr+q8gdjbjtTvjhg8YJ90v7WtUQLjtzJ0RTD6PheFMfk
 07BC2GJysITtBj6GtBKDeVZB+M+KtCyvT+7apC7A1cv036NMg5j5oJkowW8LdGnofbofulE9OpK
 ExMb6UsrePMTualntxQa0FSi/jJNTmDcX5BeZ4qhhzR2htJG7mHW3LtxIlCkGlplTkZUXmWQvhU
 2TeqDfGD/8/dFpt4+bQ==
X-Google-Smtp-Source: AGHT+IF4BgMNsNoMS8PCi37PpX/ABUBV9Lqvq93kNF+K0Oh+4lbxq/bkt4Aw0LOj8hpkfrcWB+WzQw==
X-Received: by 2002:a05:6000:1acb:b0:3a4:ef36:1f4d with SMTP id
 ffacd0b85a97d-3b5f2dfe068mr13128887f8f.38.1752575130459; 
 Tue, 15 Jul 2025 03:25:30 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:30 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 10/41] lib/vkms: Test CRTC default values
Date: Tue, 15 Jul 2025 12:24:42 +0200
Message-ID: <20250715102513.5636-11-jose.exposito89@gmail.com>
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
2.50.0

