Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0AEC83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937B610E58F;
	Tue, 15 Jul 2025 10:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fjep0qWQ";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE21510E59D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3984619f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575133; x=1753179933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcIaURpucowqDIUznDk2+ZK8Az8N1bi0BzZ2r3cBOMs=;
 b=fjep0qWQg2408RkIL6TImYJUbri1S8ovoxbeoSpNQk0SMakWoFkW+BZyJy1CiVjS7T
 xMok/5m56oI9F1q2JXXYdsPclc2QyMhge2XwQ/XDdFbaTFf7m/+NOqOr4eBRmBt5hPAj
 bPGGmozntbmaVVeVly8jNC5hJ55cI7UYOWxtKY2LKSRZlqyBbE56V7ft3JFX30aCe6W9
 ZAHbd60Y9/++WZceJ3f/3S1ac/APP5C7EfSwr92e+LkwhImwdu8izifDq1VrBOf+mB06
 00CV35Wdgtk1JymRw7GqemG5DRiXjFWb7qikrid49XHaA8K9gXtZBLPKJ6ET7RZkzR/6
 LPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575133; x=1753179933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcIaURpucowqDIUznDk2+ZK8Az8N1bi0BzZ2r3cBOMs=;
 b=SmiZTwMW5Vi1D9XjVh6KiOVK5t17yTrv0qoFs8s8U0Oh6eP/RoflP9wM7+yVLlTbkL
 aSNXWlrIc8aTQWN9rs14ZhyvGqVM5QlRlG8LNUDTaMsxFcQctlDyI3sHeJGLUHxwEFqL
 yPZiTaBpqHU1UNR5/tAMx0Lx6k4tS4Tb23YCpgGgMUxMBM0F4/SEhoHp3cplNWxBAjAJ
 wiO2aVxxqdQ2HU39YnZqEBQYE81o3P49zxq6hYcZvs9kwVfv53H3WfWs3szS6TiSJTyA
 lTOhLyV3qj3SX1bWv1/soIpMC/1+6odZYRqJVkAR29CNskV/qscymt/2IEZ/jnUKacu7
 aidw==
X-Gm-Message-State: AOJu0Yw3ue4fRq6jVl5gjhzdHDzdSoCUhO4IxX2y+p7TfLiPRe/CP8cU
 suJtEgakAT0GAB1DkuaqM2iCKvLZub/sk3aB5X1I+Hh3wK6Z8FznRnpKHkk2ew==
X-Gm-Gg: ASbGnct1xbjYdp2j6+AhQfOMs32Dix3Lh98nvbUuVtwgqLQWE1CvzitTob0kHNu7PVJ
 lVgckMPMw5Z7O2h+ZrkkRf/V08B7jjY105ClvKXFpoLzl7PiOjWGpbD24D3OLDqnqfa4/wm78mm
 4iJrbccq9sMAHQdghcHMtgRaoUCoc4PHSIDD/FPwCwyjiZuddMc3+gdmSAH4/dq88OHSYARJpxG
 CKKI1/Wam3adhOCeEqT/EC9VCUgLbn5tx2eY6pqlp0yvcb8T9RTzk0dj1Lz/QdO4oGynopjeq2b
 iqVfSB6dnN9Dnv7qWsOXdYl9zJwmtATaRInyw75Xa8eBy//nWjHP9HkcBS18yUMwec234hjGkEM
 WOw48CFEuk/RbpHW8rg==
X-Google-Smtp-Source: AGHT+IGMnCj9rkGveevbnTnt5qGR1ApkOnjsfvifpOXCCtF7Uar2bXHYt7bk1oaMiCUZPCpE/AHHBA==
X-Received: by 2002:a05:6000:2481:b0:3b3:9c75:a4fb with SMTP id
 ffacd0b85a97d-3b5f2dfe003mr12451717f8f.33.1752575132970; 
 Tue, 15 Jul 2025 03:25:32 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:32 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 13/41] lib/vkms: Test encoder default files
Date: Tue, 15 Jul 2025 12:24:45 +0200
Message-ID: <20250715102513.5636-14-jose.exposito89@gmail.com>
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

Add a helper to create a encoder and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 0a14f9af7..ed28adf9b 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -258,6 +258,21 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
 				    VKMS_FILE_CRTC_WRITEBACK, path, len);
 }
 
+/**
+ * igt_vkms_get_encoder_path:
+ * @dev: Device containing the encoder
+ * @name: Encoder name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the encoder path.
+ */
+void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
+			       size_t len)
+{
+	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -527,3 +542,15 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 
 	write_bool(path, writeback);
 }
+
+/**
+ * igt_vkms_device_add_encoder:
+ * @dev: Device to add the encoder to
+ * @name: Encoder name
+ *
+ * Add a new encoder to the VKMS device.
+ */
+void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 90cfde77a..aa6ff513d 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -31,6 +31,8 @@ void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
 			    size_t len);
 void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
 				      char *path, size_t len);
+void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
+			       size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -48,4 +50,6 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
+void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 860a06f41..8939ef611 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -406,6 +406,34 @@ static void test_crtc_valid_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: encoder-default-files
+ * Description: Test that creating a encoder creates the default files and
+ *              directories.
+ */
+
+static void test_encoder_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	const char *dirs[] = {
+		"possible_crtcs",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_encoder(dev, "encoder0");
+	igt_vkms_get_encoder_path(dev, "encoder0", path, sizeof(path));
+
+	assert_default_files(path,
+			     NULL, 0,
+			     dirs, ARRAY_SIZE(dirs));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -423,6 +451,7 @@ igt_main
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "crtc-valid-values", test_crtc_valid_values },
+		{ "encoder-default-files", test_encoder_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.0

