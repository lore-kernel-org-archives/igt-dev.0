Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A39C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC5410E7B7;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OOJPqrnd";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAAD10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso34806125e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897429; x=1740502229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7h+EjzWWohmde1PqZSEf5Pr02VouDOR3mSavGkL7Zs=;
 b=OOJPqrndWyYkrjW8RF0gqM/wsTZvV7ENyF9Xb6IlRnrhu83pXPHWPyLLvl7hjx4m0n
 bicptqooRqjAFnbFXLWcH1PLRvXv0Rbk4v9SEnkrTN2niQiIIlN/N6sOwzViNaGM2HcV
 6iLvPvd2ALAUQBqZggTtenlTKrZ8N/JWdCc/85QtRMc6/Zmv3sjyqN/tsA3L7Wy/jocI
 ZeHvZ+Z3P0BnYS71MaL+6eRJULsVjswBAi58L39JGjCQHC+kwQaDzYzFu30hGFPvr4P9
 LotIsagwpGDIN/ojB5R5w8SRKJUtQ1Ny0EBzsHNRsV98MEjI5DJGCF3gcq9DGDhYIQIN
 z1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897429; x=1740502229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7h+EjzWWohmde1PqZSEf5Pr02VouDOR3mSavGkL7Zs=;
 b=M+eQIosf7onr/YFupSId9YwBhsuEj59Upz9n68LdS0ZD6u5nBKlWrsykACHeaYQQeA
 ZpR07fs05eFTSrmNdjPDT2YnDUOX4Vihei8sx6CRsxWpaUJMxIh9zrI4ZC/Is/pXGPYs
 aOm49SmctZPAQ4K4O6ZPybnCwsdi8/N5Z4m8wLIafy4yBM7MAq+E6uMDZ8nYze9JUDZf
 ErZhDv3TyT4nlQxHCOI0oHPHWgkRSN2VYJmWduZXSclX0nEHIlWkeQMenhKs8ESHlcaQ
 gIzIjkDUSeTPrw/g9SP1fVlEXN7pY8huWbHkXv8KqDi34jdGTqDHq/sce6JbGGEnThBb
 KWBQ==
X-Gm-Message-State: AOJu0YycLCQGRSh1CTsX/kytl95Fehd2xTsURe9eR910ksl9E7S5Q7E/
 B7HCLtOYsKcZCwYYwKNkQf3zbqVIXca5juM+tQPQ+NkUz4lASIy4lyTXF//l
X-Gm-Gg: ASbGncs5fhcrosxqw4NdKmULQ8y4Mp4vITd9Y41CApXjZHGqqotOoHCnFSnuwcIYQsk
 HwXhJ0/SX8J2Nf86UqRCsu7RZFFf8sjUOINg0S2m/7uYILOzHMvpDGuhaxx/kr7kTU6ttM0No8v
 iR+GIcZlZ+iUSWR2q7UDGjgjlFVRY8WXsqMAY39wZ/H78nmVMDu/hRXDTSmmi95thflnCuVLTA2
 mhtXiEDiBEFkWW3K/V6+ZDbmRYFNm0DwrX6PiufMQO206ck40oSP4Tc11fvQkYsdZljPiOqtdce
 Df+BgdUP5zfbLnBa0g==
X-Google-Smtp-Source: AGHT+IHswOOQ5nD0GT7ler31QQQQ9RvMnUHwB3nUGC7iOLQXaTCdnamgp8U6WXxz13MRFDppEle/8Q==
X-Received: by 2002:a05:600c:1c08:b0:439:98fd:a4b6 with SMTP id
 5b1f17b1804b1-43999b70c96mr4786315e9.15.1739897428114; 
 Tue, 18 Feb 2025 08:50:28 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:27 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 15/39] lib/vkms: Test connector default values
Date: Tue, 18 Feb 2025 17:49:47 +0100
Message-ID: <20250218165011.9123-16-jose.exposito89@gmail.com>
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

Add a helper to get the connector status and test that the default
value is set when a new connector is created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 19 +++++++++++++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index e9475bba7..6780d36da 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -25,6 +25,7 @@
 #define VKMS_FILE_ENABLED		"enabled"
 #define VKMS_FILE_PLANE_TYPE		"type"
 #define VKMS_FILE_CRTC_WRITEBACK	"writeback"
+#define VKMS_FILE_CONNECTOR_STATUS	"status"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -440,3 +441,21 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
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
+	snprintf(path, sizeof(path), "%s/%s/%s/%s", dev->path,
+		 get_pipeline_item_dir_name(VKMS_PIPELINE_ITEM_CONNECTOR), name,
+		 VKMS_FILE_CONNECTOR_STATUS);
+
+	return read_int(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index d065a2acb..d0a148242 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -41,5 +41,6 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index f6b32a9f7..b8c97e20d 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -405,6 +405,26 @@ static void test_connector_default_files(void)
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
@@ -422,6 +442,7 @@ igt_main
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "encoder-default-files", test_encoder_default_files },
 		{ "connector-default-files", test_connector_default_files },
+		{ "connector-default-values", test_connector_default_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

