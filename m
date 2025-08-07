Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD67CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471D510E81C;
	Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Idszojn8";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221AB10E80B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so319115f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552777; x=1755157577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kkXl5ZjswJZcSs2kUewjtnSnCZrfQXhXvw+eZkyty94=;
 b=Idszojn8nOvjwK1xITo7vX2kLFUC/023lfcwkTzDad2I0eHddmn9X1bRmOPJZSWYaT
 hdxI/Z69bF2+j07ruPrL3xWP7IZwztBvOgxFMlnzp57EjIZZ8k/6CIConMHw8bZC3xBE
 2WasEyOc/P0U95JkJjkkl4ifTyNGOgDBhAN1TBIFHYa0PoFfM5dRikYjNCZJXPxGwlrJ
 7yaxTVY32NeZ9hrIhIkPz1M4Y4BZmAv8mETarvbWhldqR+vbQKT77RBqvA/E61McDTpR
 KMx8voZbxOo9W6pvVSxe2c0ugPml0ryQGC0sboC7SCooWvW7jYDekXBsURzx7Sz1wLCd
 iJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552777; x=1755157577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kkXl5ZjswJZcSs2kUewjtnSnCZrfQXhXvw+eZkyty94=;
 b=JlFiyapdsoXPjWDlK9PPqMRZqXLxpNWbMyg277vtKvZ1KwjdfXxk2zK5dwwko5P7vx
 cGjQNBcBVy7sS9Y8R33Vq9SyyxKTRrYycGEoTCBS4Ogwic4Ojj23DF5vB8s0MJLlSZNO
 5BP+6gp32X8cOPyITLvhB2Lw+Uz3zpumx8i9p720r7ILDJq0E9o8Ui9Qcy21Sj78vAmI
 xqM3vD0ktW7ZTgEJ8GVungWDx4K6ChXMFwP/hm+F6cW9M2wQaE2IyTNyuo5j1Jlo4tha
 3PbnUjta22GflM1mKM/hb7U2ou+K9hXNzfLD8KWEEuHVClXhWMKzzHrdrVQDmDAc99O5
 dJ5A==
X-Gm-Message-State: AOJu0YxroISD2L2PR6KQG26jkwgGtsyI9i6ADbuWEdB14CfKXDihmtlo
 vhslg7Su7Z9er6liweVJU5fURfH6NQluQW6eU+FKEqNqb3sGlo2Ec97GD8g+QS5k
X-Gm-Gg: ASbGncsdhys4w5iBCHHWMFsvZI9TaleumwSIMKya2OD/CwwravvBIiwmkHfocMtAB/e
 SycZvP4HlfZFeOGqCKR5aCMoG3jKZ/M2umGPRBqezCXggpdpiqgyN3DC6n0kkfOF60/ESzDSX31
 P9r2vf2j/olDtAdST9iJNPwAYF1yXw7OvfeY/P6LVrBAIGaOE9rfVa4FWwBPYteHoMnNMY1YpAK
 kXH24o6Kt9fdu8ppneqfPyR7EKhie8WvqI9wfR6IgHGtef5Myz7u+z3VEzXzFw4HGGIKRxhdU8D
 OjsEjuzQwol2jQMEfyzLiqv9oiD2s7DOPjWPbVG9kYLgU6PBbfqFiURIyrJnhZzlf0VsAjFLlMM
 8Bn0jQ2CMiP3hoIxiNGw=
X-Google-Smtp-Source: AGHT+IFUyWgHvYWqeyi+N0jm+zSrAOz1e9ZtFhCqjXp0l6Kki2tKbxMlO1Qq5FAPYI0Fd4bk1WrHjA==
X-Received: by 2002:a05:6000:40dc:b0:3b6:176c:2a13 with SMTP id
 ffacd0b85a97d-3b8f4197b7emr5920859f8f.15.1754552777245; 
 Thu, 07 Aug 2025 00:46:17 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:16 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 13/41] lib/vkms: Test encoder default files
Date: Thu,  7 Aug 2025 09:45:22 +0200
Message-ID: <20250807074550.6543-14-jose.exposito89@gmail.com>
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

Add a helper to create a encoder and a test checking that the default
files and directories are created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 0b8fd6500..082bc6393 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -257,6 +257,21 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
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
@@ -526,3 +541,15 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 
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
index 651339221..4bb1421ec 100644
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
index 1fec83602..3a004a789 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -405,6 +405,34 @@ static void test_crtc_valid_values(void)
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
+	static const char *dirs[] = {
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
@@ -422,6 +450,7 @@ igt_main
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "crtc-valid-values", test_crtc_valid_values },
+		{ "encoder-default-files", test_encoder_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.1

