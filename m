Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5863CA0EC1
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3EC10E802;
	Thu,  7 Aug 2025 07:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lMPRXbMF";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBD910E800
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:15 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so271894f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552773; x=1755157573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfDOwfGvhy+BGCcOiWDganugIIDZzu8i2eTzKKECcus=;
 b=lMPRXbMFERBcRln8pISMGvaLceyyaHGRXPsMtZuavbsWcvybxsl9IafU5a7mETmPOj
 2B2o4DoroVumkQEfv2mWs7Nq1cTZ8t5i1iaNVoGd4flSG9tMWSzbo2BQdVM87e5L6grb
 c1PAFBUsNwaB/Gnv6zfyM3zomYjwungXvHrGZP+vupeHHu2AxQHBt06vMq/CSxOuvGZb
 Y8pbfE6JkUMpdFThtaTanpSHDBJCaUFpj6q0S3/+48Uc5IfrqThr2GsG5GGNrsl0XBdI
 l8G39J52n5cihIuZH4vZ5DTGlUtiHw/9gmoMy3RonLXowDbRu2kj3BUP7qEzZBkgtcHq
 jDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552773; x=1755157573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfDOwfGvhy+BGCcOiWDganugIIDZzu8i2eTzKKECcus=;
 b=Rdv00aek54rSqPFsaXCPThOKCvXe6nI0L2mACFbWCV0JeWp+iRmG2HIUVuIAJAtCqZ
 5kJ1/98PNYiuUUNIUhZFrisU3qM9K6gMcF1ZqoJPSh0cjZxqFpantGnyTmXHAv07seyG
 ug5bHWxDmzi7GP5CQ5RmVFEDLjn9aPOmzmfIwthoiC8kpWd5VX1Uh6tFrueTwVTcmky7
 4E8lmDCso2PlXKICfOz5h6o7jmbcE2a/W+P+qp4eG/587bn2zSNurlFa5C65jdo0Xku5
 YdyTF97yzCYd7pNnhhl07t/Wn36M97lDclCt29kEMWpQYPiwcAN/U7X3O/VgX52RaQj7
 iN/g==
X-Gm-Message-State: AOJu0YwJF+2JJ8JU2tOz8FVG7WqyFusECpzrLJz6hSenb9HgZYjWQcZh
 rdnu0O0WkDHNq7a67mVLhYZH5jxjOUdP1IGI8yS7ufqlXDoElyXA7ZlUe9W3Dqp7
X-Gm-Gg: ASbGnctDEZB6dzdrhpTcSOXUGAqImOjDbzHMmyfs6ZTVH2B0rFW1xgdrSLQZIZTIkAZ
 SBhWWyRZx26yTHIVtXgjUg5NiV0Pa5bPhFhDhoOArTSXRhebxW3Qtm/TnhMvJv6DettJ8mDXHeA
 OqKZMxMIuWKylF8aO8Sf6/sqQjkaqsH5AMznIRdgp+mjyu185F+/MOUXFzqBqg2rJGK5Abb+y1m
 Xi0yBQJPPmx58FlYU3XTanmequsV+fBfqfCn1YJES5z2UffkX7+aB3IOLEljrzzDDMAZ4UEXPZz
 ow4U1/58K7atNFaZ5lf4Ee4exCvbttHj6e2gNs/vVZ34ufNi9P+ULoHXD350RfwaZ1DLKTFLNQI
 p3UhoV8wPtDaxZCE9UDA=
X-Google-Smtp-Source: AGHT+IGAGcFvbnUYkVf/XxY26dkpbgCkBU7VDUSqHn5tHo8NXyd37iZ0uzRyZXA9GGCCJ0tBqyEutQ==
X-Received: by 2002:a05:6000:144d:b0:3b7:8525:e9cc with SMTP id
 ffacd0b85a97d-3b8f416605amr4302323f8f.18.1754552773346; 
 Thu, 07 Aug 2025 00:46:13 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:12 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 09/41] lib/vkms: Test CRTC default files
Date: Thu,  7 Aug 2025 09:45:18 +0200
Message-ID: <20250807074550.6543-10-jose.exposito89@gmail.com>
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

Add a helper to create a CRTC and a test checking that the default
files and directories are created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 2c9ab607e..0c193e33f 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -225,6 +225,21 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				    VKMS_FILE_PLANE_TYPE, path, len);
 }
 
+/**
+ * igt_vkms_get_crtc_path:
+ * @dev: Device containing the CRTC
+ * @name: CRTC name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the plane path.
+ */
+void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
+			    size_t len)
+{
+	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_CRTC, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -448,3 +463,15 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
 
 	write_int(path, type);
 }
+
+/**
+ * igt_vkms_device_add_crtc:
+ * @dev: Device to add the CRTC to
+ * @name: CRTC name
+ *
+ * Add a new CRTC to the VKMS device.
+ */
+void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 95828fb11..1062675f3 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -27,6 +27,8 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 			     size_t len);
 void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				  size_t len);
+void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
+			    size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -39,4 +41,6 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
+void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 6adb74213..6fd0350a4 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -309,6 +309,34 @@ static void test_plane_valid_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-default-files
+ * Description: Test that creating a CRTC creates the default files and
+ *              directories.
+ */
+
+static void test_crtc_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	static const char *files[] = {
+		"writeback",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+	igt_vkms_get_crtc_path(dev, "crtc0", path, sizeof(path));
+
+	assert_default_files(path,
+			     files, ARRAY_SIZE(files),
+			     NULL, 0);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -322,6 +350,7 @@ igt_main
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "plane-valid-values", test_plane_valid_values },
+		{ "crtc-default-files", test_crtc_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.1

