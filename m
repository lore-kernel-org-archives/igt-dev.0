Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11418C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09B310E599;
	Tue, 15 Jul 2025 10:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZdwYkqP4";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380D10E599
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:31 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso16482655e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575130; x=1753179930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/QHs51pZAuPqjykhsaPAlW9sxLhe7aJHy1efgBl0W1o=;
 b=ZdwYkqP4gQilsjNCOpdrjDJgTHU1oUraJdBDvi4ukNXvuTNnUXjW5wxi7oM5S25OHY
 yAKtZbzLmpYZgNnP5/2JiWFsUHg7DbWc2qtqcUEuf4cMD0KQZfTwcmahSO3/nniubfth
 e1T8jjVkN3ft+QogliwaIQ5QlFBBpuxuBTyvR8thT+IaiIi5/SOcdpm61RK0uu2bZG7M
 vdtwoQM80m641qJs2COv3kwQaZRl5r8AQCDGfPc7lLLgGqNsIeLhNxCnfpLmqfmrwBEs
 BJNCtWIEveidMcqzar46IGlni7Ph4fb9sM3zWRAfAQPcoU9mDPLAulrBV4QbkZz98Tlw
 vaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575130; x=1753179930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QHs51pZAuPqjykhsaPAlW9sxLhe7aJHy1efgBl0W1o=;
 b=J+3+8oyY9RhOiKDBbXiDyLM6NFklG/eAM7J9owF6yZUoqvjGGe2WIA051cluKxy08s
 1DTJ5z+RHlYEggM6pBDFS/8j5tsbkmFOzQ5O+GWAvWtWdVftVBB/kCflaON+2bPxsryC
 uqysRB0ZNXVke6DOTvff31PbpR7miPd+yrFPxvdMf172c427zCnq2Cf/OEfqkzK0znbo
 Fse/RwnFLoDyk8BVyS6VX06qrqhP45X3SpaarbR6Vy/L5GB5lNNdldPsFt+ONnCQ44Il
 SZo1IaJBu9LUxlSYQ00L229XDmCQfyP778w94UJdAE3HALoY0Zz4oNsrrQqOdmu4hCu8
 fhhw==
X-Gm-Message-State: AOJu0Yz746g9s2qMhkQ58MG8I/3ITJCjX0L3SUhvXTGebx2F408cZpUG
 wHMdqxr7SFUWQT24y/+cJz6zBdEgLATg/3hN9KRdI8pkeKTiw7cwRSy5uD/SEw==
X-Gm-Gg: ASbGncs7dxCWb6tO3I6BrTXwSLK0lf8PyisnQX/rkuDmgL3vQaOu5+HJcAAfe5IoMdo
 rImrFS+OyfwSBscQr0R2psq2FhGU3z3i8p7Mwbt+oVySg7NJ0MLNs2XOG7L37fhrCUQs0/OCJXn
 f9p8RPYxRdR94zwuzV7JHTjbTRfbikLTVIkmvqGpuBkGydlHC9UHdMFvBZRdk/U21n+zPualYtR
 /xFZN9FWa4as0hgey0H6INf9c7QGtgp7yzCqoTkCk2RnaOJboSngsuBU+XKwd33Kg+rCcqwydKf
 DDz613GlrbMVWZfRSo+z+NjAyAmMvnHgBTFPktWhCq6VRq3/OfthvawR83lzv17eHW8VE7N3YCG
 QYQZbTasCNBfJBCl9hQ==
X-Google-Smtp-Source: AGHT+IFkFDU/DljSFkQ1ujFbOihW4uR/TsLHvblnCtFf2oUWYTw9j43Z05+Fhh4UjgO8RFYXsUcg8w==
X-Received: by 2002:a05:600c:1d96:b0:456:23aa:8c8 with SMTP id
 5b1f17b1804b1-45623aa0f4fmr43864865e9.13.1752575129751; 
 Tue, 15 Jul 2025 03:25:29 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 09/41] lib/vkms: Test CRTC default files
Date: Tue, 15 Jul 2025 12:24:41 +0200
Message-ID: <20250715102513.5636-10-jose.exposito89@gmail.com>
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
index eb3830685..e780e4af2 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -226,6 +226,21 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
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
@@ -449,3 +464,15 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
 
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
index b5f9a5b24..d44131407 100644
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
index 76aa6e432..ab15f29f9 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -310,6 +310,34 @@ static void test_plane_valid_values(void)
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
+	const char *files[] = {
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
@@ -323,6 +351,7 @@ igt_main
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "plane-valid-values", test_plane_valid_values },
+		{ "crtc-default-files", test_crtc_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.0

