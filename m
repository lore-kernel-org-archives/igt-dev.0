Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42ECC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0610E913;
	Thu, 13 Mar 2025 17:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aTN9EcmO";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED5A10E910
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:39 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso8673245e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887217; x=1742492017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1TRMrfi8zZGBrJtuN6gTOQBjkbd7U43eUTt6I61u/8=;
 b=aTN9EcmOdzo8VgnVBYZa50JIiYcUuI2aW3+1dq1QBGLLgoG7k9dVyk/DLhUEz/hWPK
 afDpotk6SNiq5RiZX7NZdYQc1B8pZODyLgawc7N+TH/5v5DWfou46zW+bfBkM6+I+sOd
 UMbnFSzesDJ/1Q25C/otihmqWbvdSoPsoM91t3udEkndgwUIhmGcX+Pyu8nD1ih8OfiB
 FQTutLY8etNIeAIO/h80sWV9AJCG3B0vYeuAuoI/Bqcy76Dk974o1LeSP92MAC5m4bLJ
 GQomKdFf0aJf4keAoxsxB1Ao5tK7vujyZsTy0lqZTdsNk3pB2ad+rKV7S+zYUBcFdFpP
 SSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887217; x=1742492017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1TRMrfi8zZGBrJtuN6gTOQBjkbd7U43eUTt6I61u/8=;
 b=rq/GUwUqBZTbllvrEv7PlJbJhlz7io1SZsh/nIrjql290PDdbmwPM/iNEQAKo6UlU0
 OD7NkQl4E5AIPvPrm5g2rQAxz5pKVGdaRK6QwElru3K8YMFRa1LFsK6lBYMmt8B/S8ty
 WFX+AQ0fCkbbjqHmusL+6eJnfhLj01uwo0Jy4bLF3BnKCbYkJ6kI9lcRkNc1eqiYY0+R
 M1umovbn3z+WDj03NqS1+k6IyeQezI2n1cD6LeYWLA5AMzwIHxJFGBKZeE2NL7hrXxry
 GRPC1Fa2SAt445bdPgoRDoq8H3ZATRvoNIZ1e/4vsSlgBTHnny5bvLvoa0jgybXZdfpo
 L4Mg==
X-Gm-Message-State: AOJu0Yy/m52tffeamHKynHbihc5/U40fGjNf6y9ZROUsb5iJqQ3FlZrG
 bK5kSN0QpXXpVPAA3W32jlHAixuG/K/SMxQGOMt3ME1fHpKkUxQrp6iwpXqB
X-Gm-Gg: ASbGnculn/nOAdSSgDsCyFBYV5CEjpryzpdxTk9zugV6mkQzAZkHWFoplMALpNNgbvJ
 zR6lyIfWPtn2UD0nZzw3yLhFRXQOVXHKEdGYmsB1R76a80ygrZJusEM9nGAnYpdEPcphAeHEsKu
 PCL4Q8kVUgtZxPTGQUztnc4DZyYN21x05KNjHf5fUweYboga8Iym5+ZBCTKolWCCC1ayF06WT3M
 xLfajts9pZAGEUhprBNmaJCWtVrvyOukMcxX/B/pTRAF+hlJLDqKciZygbWZvOpV+DGwHmDRJFn
 WG7wy4zq461iTbrJq6Vlq4BCjmSmH+/wwYnaikPf4cKI
X-Google-Smtp-Source: AGHT+IHbDXPkJ7NV/b27taK3fDH1WLvvsfwcsrhLUyhZ77HoZjUhwL4y6qsBKpKJzhvjcKT+DtZuzg==
X-Received: by 2002:a05:600c:1c0f:b0:43c:fc04:6d34 with SMTP id
 5b1f17b1804b1-43d1d8e7e77mr3560915e9.20.1741887217326; 
 Thu, 13 Mar 2025 10:33:37 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:36 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 15/43] lib/vkms: Test encoder default files
Date: Thu, 13 Mar 2025 18:32:50 +0100
Message-ID: <20250313173318.5818-16-jose.exposito89@gmail.com>
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
2.48.1

