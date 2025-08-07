Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A23C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0266D10E806;
	Thu,  7 Aug 2025 07:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oz99Lzm4";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B149910E803
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3b794a013bcso452885f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552775; x=1755157575; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1W6NjP9WOusNUL7lMJRkK2yytdoi5QN6H0R016cZ/4Y=;
 b=Oz99Lzm45kKGQqR00pizTaBvzm7ZNXdB8rUhuW/cLbp3VgR1lf6pmVWHwkkr7nLCJP
 vuEtji7blmD4FJIf8emxAnVF6kdDQ9JsNTj0sKACSF+KN3Z2elMfM5EHevgS72yXPqr3
 dFOtiE7zr46SKMpovvgXfhvLJN/eKhbVm/SSmZpotFf1dJiRP6Bxvm6cT2nSnU7UFRYs
 nzGqMnEjYT9393q50gBhjglvN2xqTVanikLfyaL+dOdGNgEWiepBO5ZCbWkTRgqNtfB9
 q/i3yO11rX+oZu/wP6Knkr3tBe0xC3PuqJjeY28GusJTDC1yARjT54hsZAandft1IAR8
 i0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552775; x=1755157575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1W6NjP9WOusNUL7lMJRkK2yytdoi5QN6H0R016cZ/4Y=;
 b=LMZJTqD0fRgqS/H9Vqh1YCe0ARXfKt7CeHKOgztyuMofkyRW1apAQ4H1E18nTs8OPZ
 /aONGt79kPknlZt+WKkmlttbrRxA2AZZubvfFD+Srwjf1/QZjyNhjhEwqWJrfO0zj83N
 gpQPL8JDEXw6Fm82ab5+hZIgXWAowNAlMTSJHpj+9ThxN3x3wHhrOGWs4jbK9Eqw0Dc1
 MXhns2dGWVkblabKy7rb9bO4HNo5vxe9KB1t1CCgYoPKGdXWKS3mrN2+WkOFDQpEcXbs
 yhBGdQTCySLX+0dsWdI95X4nLlOlZh1L6fRG2XX1bB8/hXZpHz69YoPlwc84cK8pBf0f
 B1bw==
X-Gm-Message-State: AOJu0YwUIOuHV6DBonu8xYWZxgbjuP/uUUZepXPI2+EoRkpibjwTPSfw
 FeWFOvk0/nz0Tv2cV0/g7XH9+TpB/oxa/NVlLfKrEKk2tfDBc6nNxzqAgG+fTX/g
X-Gm-Gg: ASbGnctoZP+gIrbDbWAh7Ls94Ud1mdOvhvPsxmMTcXiqcikxdpEwLbRD6JnbeJU4g1s
 dkwVSTXtiFnkCTxTg9rwDPLVgvxLz9i6gm/gdvM1UpdL7c9ooFtQdRQIvqJ0ZIyGhWBTpYIzjHe
 /wINq1fksrCTzMQUfy/XyvWc1zC8C/QXxqfYxvMSJtfgIxnGU5s+uBfGnC7pFy8HDv/h1UjEdYb
 b0TjltyrTAbEKnI2ASkDC04XSGsBMO0960qVbkE1FyHnPdZ4a37MKnH3OLDEaDI3NTKcLBzEr03
 jobRa3yQsdcGotF7doEiK9UKxoKhKHolwQWMmxOmt0XjzoXNHzBbh95hhOG+9ybblgmdKPSlO0Z
 gFSaJlR1dRhC6vW1u0Ury9YUnpXJ/qw==
X-Google-Smtp-Source: AGHT+IEP7OqrYCWfYPDK7H0TFz03PYB+5B1DZKrkqbMUQzTqG+NRa2j4eZjAwsowcbWenRqAZkm/lA==
X-Received: by 2002:a05:6000:402a:b0:3b7:7377:8361 with SMTP id
 ffacd0b85a97d-3b8f48de375mr3861546f8f.8.1754552774573; 
 Thu, 07 Aug 2025 00:46:14 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:13 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 10/41] lib/vkms: Test CRTC default values
Date: Thu,  7 Aug 2025 09:45:19 +0200
Message-ID: <20250807074550.6543-11-jose.exposito89@gmail.com>
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
index 0c193e33f..51eb48c44 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -23,6 +23,7 @@
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
 #define VKMS_FILE_PLANE_TYPE		"type"
+#define VKMS_FILE_CRTC_WRITEBACK	"writeback"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -240,6 +241,22 @@ void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
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
@@ -475,3 +492,19 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
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
index 1062675f3..5d3610057 100644
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
index 6fd0350a4..ec5cc6ee7 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -337,6 +337,25 @@ static void test_crtc_default_files(void)
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
@@ -351,6 +370,7 @@ igt_main
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "plane-valid-values", test_plane_valid_values },
 		{ "crtc-default-files", test_crtc_default_files },
+		{ "crtc-default-values", test_crtc_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

