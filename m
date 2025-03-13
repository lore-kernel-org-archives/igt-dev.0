Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9984AC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9710E909;
	Thu, 13 Mar 2025 17:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HjKK+z5U";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995CE10E908
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so15331985e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887212; x=1742492012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6F2r6ELPSFm7CtKahu2lify5R790aarysuUzfya3U84=;
 b=HjKK+z5UARQ2x3JaKlZogtpZBTdPp8YIA4FLs9y9uoxAV0In+fx+YvUQfBXieoaeqJ
 91yixmA8zpiUw6muTzYp+JW1e9G8Qg4kdNJI88K99nascZHW7RaXIJiyp/5PEFAfW0DR
 MKi3jaYrmolPYcRGkwlRzfLDuv2cFZkMpEo2lYAsg9Mg/beXYXOyzK5+NZsXHQiwLPcY
 pbeoOeMVlIJQJ1acDOkgy1inTnhz41fmWuf41So6MeRoe+nw6QI5JP3Y2daZ9cFWEOoh
 7iOOmSsXZRDcuiWBBxP4yQdO98XQxW/ruFwxtrnU/7JW/zE/L7CCn0r0y8/sFvgTQN6+
 xtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887212; x=1742492012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6F2r6ELPSFm7CtKahu2lify5R790aarysuUzfya3U84=;
 b=rxTxhIm2xVNPUaO17OBzKBkgGEdhJC0UYU425e8kMs7OKgsvL/2r9G/ez3kmVrakAj
 notNAnES4eL4H4d6Z13FRnSX3njubcX5FCA/tgMe770M/UuZkTXeiCvPP1lMwGLVvJMK
 2MoceTozxPe1tpRa1eBLj0ZpRxM6ntwqQVatj8PTqI8FXs9aCY+wzgwFoEW91tlVj1Fy
 CRUFe6Dw71oBc8HSWAQML5cRsYQo349VFSXgYKjR2focrbFUFQxT/wY8vUWVePCUXKph
 ninxdm6vjt81psQlv+RqclTQZnOock+h/jbNlKfmiCGE8TTFRlyU2W3kQs5WCzgtA4Go
 0Q+Q==
X-Gm-Message-State: AOJu0YyDOWlwtUxkEQ3aRc+eb+i7boAkMkwXUQE1Go4qFBaWpsduhz0T
 nVovsjk/0PZCCu/Utl0FXXXQ80XNa/EdZGJ+7mkpUTTdQ0n492/ov8xY/2qG
X-Gm-Gg: ASbGncvqzQQBQKR4w0z8kwnv2NcezMPJHvC3aFugoI7l1F2ATDTAValwf7bx4tPsVHa
 QqO75zADPiWE00JXTS/sZjO4EsyL5UQ4XsFWWIgZAREGu8bmY4kI14npXmtMY1lD0MbGLgJ7hnq
 ff6CRmuH4Dyb+xBVWNGRUPYTBhJxFlUx0t/DR0DsOCLclS9uQ6ZosxoZQZ4fJ5yKlWlOB5A5XKt
 hUmBHKIaHkU0DPqoEsohWD5VIyneFZBLavcsle2GE8OYYCNZU3YzP+BsREFHCXhHzivSCXuThgC
 oNrRX1keoipJ/BfuPtjs8eIVyhfLhzG5ztb0+kAZPU//
X-Google-Smtp-Source: AGHT+IFI1ibglyaO335LM4QGLrJyA5uUhiVIR+skbS7eX6k9/Qd+5toh1YHgtnAJarUQCz4DRXyqSA==
X-Received: by 2002:a05:600c:3543:b0:439:9737:675b with SMTP id
 5b1f17b1804b1-43d18084c39mr26286175e9.7.1741887211726; 
 Thu, 13 Mar 2025 10:33:31 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 09/43] lib/vkms: Test plane invalid values
Date: Thu, 13 Mar 2025 18:32:44 +0100
Message-ID: <20250313173318.5818-10-jose.exposito89@gmail.com>
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

For a VKMS plane, it is only possible to set invalid values in the plane
type.

Test that setting wrong values fails and that the plane is not
accidentally changed.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 23 ++++++++++++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 6cc9b8afb..eb3830685 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -426,3 +426,26 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
 
 	return read_int(path);
 }
+
+/**
+ * igt_vkms_plane_set_type:
+ * @dev: Device the plane belongs to
+ * @name: Plane name
+ * @type: DRM_PLANE_TYPE_OVERLAY, DRM_PLANE_TYPE_PRIMARY or
+ * DRM_PLANE_TYPE_CURSOR
+ *
+ * Set a new type for the plane
+ */
+void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
+{
+	char path[PATH_MAX];
+
+	if (type != DRM_PLANE_TYPE_OVERLAY &&
+	    type != DRM_PLANE_TYPE_PRIMARY &&
+	    type != DRM_PLANE_TYPE_CURSOR)
+		igt_assert(!"Cannot be reached: Unknown plane type");
+
+	igt_vkms_get_plane_type_path(dev, name, path, sizeof(path));
+
+	write_int(path, type);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index cea0c7242..b5f9a5b24 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -37,5 +37,6 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
+void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 5aafe39ae..bb9c53f34 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -231,6 +231,55 @@ static void test_plane_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_plane_wrong_values(void)
+{
+	struct invalid_value invalid_type_values[] = {
+		{ "", 0 },
+		{ "\0", 1 },
+		{ "-1", 2 },
+		{ "4", 1 },
+		{ "primary", 8 },
+		{ "overlay", 8 },
+	};
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+	int fd;
+	int ret;
+
+	/* Create a device with a primary plane */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_PRIMARY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_get_plane_type_path(dev, "plane0", path, sizeof(path));
+
+	/* Test invalid values for "type" */
+	for (int i = 0; i < ARRAY_SIZE(invalid_type_values); i++) {
+		struct invalid_value v = invalid_type_values[i];
+
+		fd = open(path, O_WRONLY);
+		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
+
+		ret = write(fd, v.value, v.size);
+		igt_assert_f(ret <= 0, "Error writing '%s' to '%s'", v.value, path);
+
+		close(fd);
+	}
+
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -242,6 +291,7 @@ igt_main
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
+		{ "plane-wrong-values", test_plane_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

