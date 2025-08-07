Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096F5C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32FF10E807;
	Thu,  7 Aug 2025 07:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h7rX2+8C";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976F110E804
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-459d44d286eso7877575e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552776; x=1755157576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gixtRawPeWZAMy927/4SceOT/mkD20LLXAKyLuSSsHo=;
 b=h7rX2+8C5FNGio6jSGpnrcjS99hdJrv54T9Lm+5JT8ld7kO6cnlnscopD1nHRBEoXd
 cxPAFwRidt8oaHFRL4aB9tOHPnjXyb8vrM8APU7KPjwrhjBY5ZCuOnkVsTtE4+9z+k2V
 kJMdQWa9OU7AGZNgHW8P03p2MTohlJ5SoqKp/tIUfRy/kE2QX7uF+/Wj4j0raSaCR3yy
 9i77z6rR2gAf9QKD7j05EFlm6FMf07RvOPpCTnMLXIxdx1r2oDSaDbj6H2+3CM6H/YZi
 b3HphQ9NFm+5YqK33UyhETTsZbgA/re2LbR4j/XO1lR0jxRETbMzLgOI1wy+7CFyFM8S
 lwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552776; x=1755157576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gixtRawPeWZAMy927/4SceOT/mkD20LLXAKyLuSSsHo=;
 b=qp5pQ0XpDFVz70FCfQF+GG5xKF8K7WXiQtBsowK2y0pmECHoQrmmWLAAhr2ARYYkI2
 pNaDGKtdqhSeJO83YY08LF0soc88P7w32Go4luu71uuo+wZSOzGZjEYPIa5Zql/f5QRD
 0oCmDw4fK3C34mqijzFnYqhzfxQf64kL1Q6UvQ5/d6C8ay2aLW3Ed/9w1rdPvP0VYBO8
 pF/++EAs8yQ1jPtvNhuRW4taHq8YDEd7lCLKuapvR4d2Ir0HzOWk5jo1bR2QHW7kHcda
 W5K/OhChbRDW/waY7n7c1tNU5LdwVPRFoUYDcKfEWEEBs5SKrDr4+fjPjyKEw+Rmc05s
 k8gw==
X-Gm-Message-State: AOJu0Yxzj3LfgftQMzEKM6npIzQI6WPQ0tEzKgwLxPOhiRUytdE1KAp2
 yvDQUrbGCHmUUouVESgmc5+LeogxJiH5teO0rFCYsh56VaSIyD4amy+fa3IXB/9B
X-Gm-Gg: ASbGncs5GYJJQ8e3kL0nKr7/ARtMJtuOXlmI7rySr63Kt8EM96lauyizYfHsdKUUIr0
 JSpxya6/d9gAFCi94JOhzAo2z/7dEL9QASlfcDoQ7+pAlaSaQhmXm3Bi/ojr0eVAlTIh0Mxwzm+
 eZZ19JlCIXXHult+AY72fAqRTIC3/L3TsCkLhXX5hK76MhIebCSJIjv4kL3H9dL2JVnhLz/gviL
 K6UWq2PPKq/OeaZYHtIB72lFCZm4Z2Wg7Ht1ZGaY8ugYhWIGVV0iWsrZY+nhQeogFUml61TyYhf
 WAGAAa/xJfhYpSjLrwAR/sFrjgY6l+cYmLZDemmoxskfBbN2y3HPxcC0X7nhDkY5oEmgtUKb+EG
 R5F6AYqdqwdIf8Ee6rU4=
X-Google-Smtp-Source: AGHT+IFdBr3BDqbAxe//ZcsA4edJMIkhozAF7fdUO9BrsYdSZTU7cqTzn1PVUyFBbhjP0J4Tp0UhTA==
X-Received: by 2002:a05:6000:4029:b0:3a5:1388:9a55 with SMTP id
 ffacd0b85a97d-3b8f97bb949mr1932126f8f.5.1754552775367; 
 Thu, 07 Aug 2025 00:46:15 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:15 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 11/41] lib/vkms: Test CRTC invalid values
Date: Thu,  7 Aug 2025 09:45:20 +0200
Message-ID: <20250807074550.6543-12-jose.exposito89@gmail.com>
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

For a VKMS CRTC, it is only possible to set invalid values in the
writeback connector status.

Test that setting wrong values fails and that the CRTC status is not
accidentally changed.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 18 ++++++++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 26 ++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 51eb48c44..0b8fd6500 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -508,3 +508,21 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name)
 
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
+	igt_vkms_get_crtc_writeback_path(dev, name, path, sizeof(path));
+
+	write_bool(path, writeback);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 5d3610057..651339221 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -45,5 +45,7 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
+void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
+					 bool writeback);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index ec5cc6ee7..0a62f3d02 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -356,6 +356,31 @@ static void test_crtc_default_values(void)
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
+	igt_vkms_get_crtc_writeback_path(dev, "crtc0", path, sizeof(path));
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
@@ -371,6 +396,7 @@ igt_main
 		{ "plane-valid-values", test_plane_valid_values },
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
+		{ "crtc-wrong-values", test_crtc_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

