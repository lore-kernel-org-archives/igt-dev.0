Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D78C021B5
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021910E7A5;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HCLQkbYz";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC79D10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43962f7b0e4so35453355e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897426; x=1740502226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBkwDjfpxQ42SmNuf9QHqcu+BgMOEPXuTKUp1LXaN8k=;
 b=HCLQkbYzQCaIE0sB9gU+r7D6rtUWrTbDv/O8/hlPuAypQfwC7xWqQHIciTgn/M/wIr
 IMLoFsRUe1nLVVv7cgHnlrYmnu5mef1RvYUrZ68X+68eGzGPzgv7hLrtkasBZI/9s57w
 ju1TQPmFX5+2164fssEiKpMc98UmvLVkw5WYksYskZNrtPRy2Bu5dJp/jWaPlMk8aCCN
 oHF5EJ6Lh/Uzg/tk4RBsG2uv0BcCVTGQ/UN4GEWIAazCgHvxalHIOUN5sYfOYkwWYSki
 0wEuQ/A7dq03HMTNxhuSu6D3rkVMhXS2rAA/BRUaXaoqZ8ivF5rMD4/8rZZCfQxhOV4w
 d/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897426; x=1740502226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBkwDjfpxQ42SmNuf9QHqcu+BgMOEPXuTKUp1LXaN8k=;
 b=fTJc38sgiNXmm3bIOewZZQhdZzC7E3Tx3UShIkl4+wmOR+f296kQ8Hu4LwbAlfyNHO
 mRjCosYZGszO131/n8xt0k1nyzRUQA+PyNrw0V/TuGePm2GoJaIAJYv5grXTEnCYevfB
 O8trFv8Xdn2qumZ+x5tOxcHO721H1WGTyl6tXyT0GEKXW3F/2hGPOprlNVrI8pb3F7W/
 K48ULcsyrsK5L7fitcY87S/grwupqZTgX3xz0P1Df8H16vwnlp9oGS65PJ2VqqgDv600
 QnjKRZwneXy2ju7SWQGLYbfBDP/38Oh9u36/f2vBdeMylXgp01jFERJKoVI2EL8u9VTm
 EJ0g==
X-Gm-Message-State: AOJu0Yzet9vWuuH5oUmAY7nFNduZaEbh2he1NENwtpFwIuTmxIP3y6qM
 AUiLTMmN2vrvthsnyfranWDVOIK0FDJvU0FpIS+olYNIKQsdy7O7JEUpg3Gu
X-Gm-Gg: ASbGncvouURn/VzyeETnYK8oomq1YRAzQ7M5wLxDpeNY1tLVYKXkNz/JSr3IgEupOT+
 KHQnJb2TpVPkqQ9vJnp53z/ZH0QVN/HyaZHXbYhulP6iBQB8B+WepztddmvpET0uA+ZZUTJIn6Y
 sTu8g+DDEcyzbK/js/PciP1JRGRtxecLgUqC9DF/eVht9+4IbmKbh9fVohuXjs+I1B2/O/EulhJ
 nv8vL25MgLYJbk4J5/oY4rW1PrqPFxPFh0sA6z0F3/HIsGvLVGJKZmDXl1NL+mw51+LgBT+pVu2
 ona+cx+FSCxnTt+Tuw==
X-Google-Smtp-Source: AGHT+IHZvm1ntLNqUof5sepsh2496iZatlhRPafU1gdncfGzkz5QEos+uKDjgsH/vNjuqy9cFmOkFg==
X-Received: by 2002:a05:600c:a4e:b0:439:88bb:d035 with SMTP id
 5b1f17b1804b1-43988bbd4bemr73312805e9.5.1739897425536; 
 Tue, 18 Feb 2025 08:50:25 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:24 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 12/39] lib/vkms: Test CRTC invalid values
Date: Tue, 18 Feb 2025 17:49:44 +0100
Message-ID: <20250218165011.9123-13-jose.exposito89@gmail.com>
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

For a VKMS CRTC, it is only possible to set invalid values in the
writeback connector status.

Test that setting wrong values fails and that the CRTC status is not
accidentally changed.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 20 ++++++++++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 27 +++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 4021f9aea..d881a2417 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -396,3 +396,23 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name)
 
 	return read_bool(path);
 }
+
+/**
+ * igt_vkms_crtc_set_writeback_enabled:
+ * @dev: Device the CRTC belongs to
+ * @name: CRTC name
+ * @writeback: Enable or disable the writeback connector
+ *
+ * Set the VKMS CRTC writeback connector is status.
+ */
+void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
+					 bool writeback)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), "%s/%s/%s/%s", dev->path,
+		 get_pipeline_item_dir_name(VKMS_PIPELINE_ITEM_CRTC), name,
+		 VKMS_FILE_CRTC_WRITEBACK);
+
+	write_bool(path, writeback);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 59f6a9775..cb0278544 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -35,5 +35,7 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
+void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
+					 bool writeback);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 95779d336..af42e364d 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -319,6 +319,32 @@ static void test_crtc_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_crtc_wrong_values(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	/* Test invalid values for "writeback" */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", true);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	snprintf(path, sizeof(path), "%s/crtcs/crtc0/writeback", dev->path);
+
+	assert_wrong_bool_values(path);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -333,6 +359,7 @@ igt_main
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
+		{ "crtc-wrong-values", test_crtc_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

