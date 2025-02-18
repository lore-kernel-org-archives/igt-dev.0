Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E83EC021B5
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FA810E7C5;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CnAKKecU";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1271110E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43964e79314so53200645e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897430; x=1740502230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEQMANs6P9QlrnyNj6Wc8PtXtUIQ5Ynhq4Ows8j7E4A=;
 b=CnAKKecUlTwRr/96rgAWpdkXLJdQr6OklRTAasXixNquqEqvHQcHbZCVu85HjLMlHu
 ZJSdmBuYb8oHsXN/vO1O4CTQ/L6BeHFNVSNZbEcxOJo7I2lSqLtTCyZmhCKeYISI9yPJ
 2TVPanfZfkx+8CTKFK2Kz5bdsJqTR3Xh3UFUTBrhJUJ+LMXi+8H2ZojgorMtzKSVgHhA
 ZB32uqarOL1o6ex2GFqkrlXZX4u3HYVQZ6Zm9aTmn7rxuBMxD5gFqyyN15sM4y8f4lsZ
 qxRmA5A+2Mmk2pyTXz8ZYxY+VUp5P1s0BrEJ12sJEUlXtyn2zHM/jQYz9kEwRy891ZWF
 OZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897430; x=1740502230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEQMANs6P9QlrnyNj6Wc8PtXtUIQ5Ynhq4Ows8j7E4A=;
 b=kJ14pan/8y3l/6TuZqLPiwXkJ7DGS3GFxktiF2wTFt8gn2ffoHUKesCcK4tGnQ5EJN
 bDR5XFM1nTzEoHvU8ef0FW9tiLUfJeUjFWq+IV+0fy/rBNEWkH3K619oXlfi9LiNa7Yd
 GdKd12nAyyTJTdX2wUZdWU+XqFZibAwbJ0iTJk6/JHcYc/KDXtHc6XLn6KG0JjwNmuZb
 VXzk/4X2h7w+qS0rtVTcHg56oXQuJq2dzLVGvP2A5pasnZ08k7+ei0PIaba/x3ZfEdBe
 ScTZIgp2ZxiQgq1PcwsXCl67t+lKEthWOucjnlJE7VfMij4EJYpaOeP3mjqxZm7hoIj+
 +Pew==
X-Gm-Message-State: AOJu0Yw49DMQGIUo9n8kFIWxm0QGP+tpjcQqKXL18AVOpjRrMHx9RABf
 w1D3Hs613ltYh0HiMKlSwY37TMzLP+4LStOkFeJtqgd5LfRbUqjw33QnOzbE
X-Gm-Gg: ASbGncurib3aTzGZADX7F2wqvmlvh9W7k+kkTlgQ5s5HzmQJ6DDhJl0uny86Ugz9bIl
 V7QwLMdtR0mCceU3ShBC7Kd9+nJdBfDGzUEsjduFbIrcoqxFmzP/eyFbAGtuTzWEU6cpVaGc2bb
 k8t5/nN9uSkhVP7X45faBAN8zr3nFQkBLggO5RX83sFv828ipriwRBCttLQK2/KYHzklOdUjO1o
 oKBla6NbPQbZ1tRlvsaXohrabNmiWh3tL+WDRs/zVboAeZ56c8D8fzF20/JXYxbY4aRxnU70PoJ
 IUxRgUSETswk0Pb9NA==
X-Google-Smtp-Source: AGHT+IF/lH3D4JgTR3l0NhpTKN/fXLmOwk14jLeFfAuR9D5xpUVUPKkKo3rQBYT/lxE3XOydDeKBKw==
X-Received: by 2002:a05:600c:1547:b0:439:94ef:3780 with SMTP id
 5b1f17b1804b1-43994ef3997mr34344665e9.30.1739897429935; 
 Tue, 18 Feb 2025 08:50:29 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:29 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 17/39] lib/vkms: Test attaching planes to CRTCs
Date: Tue, 18 Feb 2025 17:49:49 +0100
Message-ID: <20250218165011.9123-18-jose.exposito89@gmail.com>
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

Add helpers to attach and detach planes and CRTCs and a test checking
the different valid and invalid cases.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 91 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++
 tests/vkms/vkms_configfs.c | 81 +++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index f5e193a1c..147234e5b 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -119,6 +119,22 @@ static const char *get_pipeline_item_dir_name(enum vkms_pipeline_item item)
 	igt_assert(!"Cannot be reached: Unknown VKMS pipeline item type");
 }
 
+static const char *get_attach_dir_name(enum vkms_pipeline_item item)
+{
+	switch (item) {
+	case VKMS_PIPELINE_ITEM_PLANE:
+		return "possible_crtcs";
+	case VKMS_PIPELINE_ITEM_ENCODER:
+		return "possible_crtcs";
+	case VKMS_PIPELINE_ITEM_CONNECTOR:
+		return "possible_encoders";
+	default:
+		break;
+	}
+
+	igt_assert(!"Cannot be reached: Unknown VKMS attach directory name");
+}
+
 static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
 			      const char *name)
 {
@@ -136,6 +152,51 @@ static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
 		     path, errno, strerror(errno));
 }
 
+static bool attach_pipeline_item(igt_vkms_t *dev,
+				 enum vkms_pipeline_item src_item,
+				 const char *src_item_name,
+				 enum vkms_pipeline_item dst_item,
+				 const char *dst_item_name)
+{
+	char src_path[PATH_MAX];
+	char dst_path[PATH_MAX];
+	const char *src_dir_name;
+	const char *attach_dir_name;
+	const char *dst_dir_name;
+	int ret;
+
+	src_dir_name = get_pipeline_item_dir_name(src_item);
+	attach_dir_name = get_attach_dir_name(src_item);
+	snprintf(src_path, sizeof(src_path), "%s/%s/%s/%s/%s", dev->path,
+		 src_dir_name, src_item_name, attach_dir_name, dst_item_name);
+
+	dst_dir_name = get_pipeline_item_dir_name(dst_item);
+	snprintf(dst_path, sizeof(dst_path), "%s/%s/%s", dev->path,
+		 dst_dir_name, dst_item_name);
+
+	ret = symlink(dst_path, src_path);
+	return ret == 0;
+}
+
+static bool detach_pipeline_item(igt_vkms_t *dev,
+				 enum vkms_pipeline_item src_item,
+				 const char *src_item_name,
+				 const char *dst_item_name)
+{
+	char link_path[PATH_MAX];
+	const char *src_dir_name;
+	const char *attach_dir_name;
+	int ret;
+
+	src_dir_name = get_pipeline_item_dir_name(src_item);
+	attach_dir_name = get_attach_dir_name(src_item);
+	snprintf(link_path, sizeof(link_path), "%s/%s/%s/%s/%s", dev->path,
+		 src_dir_name, src_item_name, attach_dir_name, dst_item_name);
+
+	ret = unlink(link_path);
+	return ret == 0;
+}
+
 /**
  * igt_require_vkms_configfs:
  *
@@ -368,6 +429,36 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
 	write_int(path, type);
 }
 
+/**
+ * igt_vkms_plane_attach_crtc:
+ * @dev: Target device
+ * @plane_name: Target plane name
+ * @crtc_name: Destination CRTC name
+ *
+ * Attach a plane to a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name)
+{
+	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
+				    VKMS_PIPELINE_ITEM_CRTC, crtc_name);
+}
+
+/**
+ * igt_vkms_plane_detach_crtc:
+ * @dev: Target device
+ * @plane_name: Target plane name
+ * @crtc_name: Destination CRTC name
+ *
+ * Detach a plane from a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name)
+{
+	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
+				    crtc_name);
+}
+
 /**
  * igt_vkms_device_add_crtc:
  * @dev: Device to add the CRTC to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 50f42aa4b..fc8db268b 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -32,6 +32,10 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
+bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name);
+bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index ea84d9f82..e1572d65f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -94,6 +94,20 @@ static void assert_wrong_bool_values(const char *path)
 	}
 }
 
+static bool attach(const char *src_path, const char *dst_path,
+		   const char *link_name)
+{
+	char link_path[PATH_MAX];
+	int ret;
+
+	ret = snprintf(link_path, sizeof(link_path), "%s/%s", src_path, link_name);
+	igt_assert(ret >= 0 && ret < sizeof(link_path));
+
+	ret = symlink(dst_path, link_path);
+
+	return ret == 0;
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -476,6 +490,72 @@ static void test_connector_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: attach-plane-to-crtc
+ * Description: Check that errors are handled while attaching planes to CRTCs.
+ */
+
+static void test_attach_plane_to_crtc(void)
+{
+	igt_vkms_t *dev1;
+	igt_vkms_t *dev2;
+	char plane1[PATH_MAX];
+	char crtc1[PATH_MAX];
+	char connector1[PATH_MAX];
+	char crtc2[PATH_MAX];
+	char dev2_enabled_path[PATH_MAX];
+	bool ok;
+
+	dev1 = igt_vkms_device_create("test_attach_plane_to_crtc_1");
+	igt_assert(dev1);
+
+	dev2 = igt_vkms_device_create("test_attach_plane_to_crtc_2");
+	igt_assert(dev2);
+
+	igt_vkms_device_add_plane(dev1, "plane1");
+	igt_vkms_device_add_crtc(dev1, "crtc1");
+	igt_vkms_device_add_connector(dev1, "connector1");
+	igt_vkms_device_add_crtc(dev2, "crtc2");
+
+	snprintf(plane1, sizeof(plane1), "%s/planes/plane1/possible_crtcs",
+		 dev1->path);
+	snprintf(crtc1, sizeof(crtc1), "%s/crtcs/crtc1", dev1->path);
+	snprintf(connector1, sizeof(connector1), "%s/connectors/connector1",
+		 dev1->path);
+	snprintf(crtc2, sizeof(crtc2), "%s/crtcs/crtc2", dev2->path);
+	snprintf(dev2_enabled_path, sizeof(dev2_enabled_path), "%s/enabled",
+		 dev2->path);
+
+	/* Error: Attach a plane to a connector */
+	ok = attach(plane1, connector1, "connector");
+	igt_assert_f(!ok, "Attaching plane1 to connector1 should fail\n");
+
+	/* Error: Attach a plane to a random file */
+	ok = attach(plane1, dev2_enabled_path, "file");
+	igt_assert_f(!ok, "Attaching plane1 to a random file should fail\n");
+
+	/* Error: Attach a plane to a CRTC from other device */
+	ok = attach(plane1, crtc2, "crtc2");
+	igt_assert_f(!ok, "Attaching plane1 to crtc2 should fail\n");
+
+	/* OK: Attaching plane1 to crtc1 */
+	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	/* Error: Attaching plane1 to crtc1 twice */
+	ok = attach(plane1, crtc1, "crtc1_duplicated");
+	igt_assert_f(!ok, "Error attaching plane1 to crtc1 twice should fail");
+
+	/* OK: Detaching and attaching again */
+	ok = igt_vkms_plane_detach_crtc(dev1, "plane1", "crtc1");
+	igt_assert_f(ok, "Error detaching plane1 from crtc1\n");
+	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	igt_vkms_device_destroy(dev1);
+	igt_vkms_device_destroy(dev2);
+}
+
 igt_main
 {
 	struct {
@@ -495,6 +575,7 @@ igt_main
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
+		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 	};
 
 	igt_fixture {
-- 
2.48.1

