Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE237C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614F810E90E;
	Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ugxb2FEe";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE0410E90C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:37 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so8166085e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887216; x=1742492016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KB2juM+WH+wKHASIkTeHcDfdGFz6ikNqGihA6VAG/sA=;
 b=Ugxb2FEeDYZCRgz9+fELwI3eM2hYlChMRDiyOR3FLkpkJmQkrAA/4LADUUcTTq2zfZ
 PDcSoZMlN49qwh4wLyJAbDks5Q3eG2D+5tFLZ8M7x/PayGVlxJtvPWmIPvXvUfK23Oei
 p77NVVepFnGwfZyaCrtvrY4c+Ngp8nPQkndO9MntE4lWKuopsiLWq2eE5myMuQYZkLFU
 VG6BsGk34jl7+v3sJNOqCknOmYYvjBppiytD+UQ2gXDf3qFuWoVyFlfNL5/vktgmox3a
 mYIPFeShaRzNG43FbhLyjUcjLa7NR8GivO77z74sZwFRQsSjTKBYy1uvVGNEM4vYyBco
 wpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887216; x=1742492016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KB2juM+WH+wKHASIkTeHcDfdGFz6ikNqGihA6VAG/sA=;
 b=gZM8VxpIEJe4IaL7yvA8PythBPs746cq78nqhCAI+NrlhsCIcl+cppHFehGRxXRV15
 YdcFWbbv6RDvaxnGcjBoGFrfTNMPuXkwIDHASrr+qXkfkgMeFTNVAJmieDsRNSk0wpdP
 U7fqL7VP65Uw9fOO4i9IU99/wwbAQBeiKaLGdMwyfRgD2uqu9L52xL5JwHhr3kGeF6Ke
 MWa72ao+onp9vy8SVZhEcp0eBYMg3BepQEF+6RMq73vAjHfiblA68f4UDfVUbUTSvU67
 LTUAgL7BgmNfCm4cRuFU7KV67d12pXjV/aHdfbQr8SsdXjfC7FhwHw0YLf2E13xjdjEs
 savg==
X-Gm-Message-State: AOJu0YxrJTfwnalzdz4Y8qLHj8inh2XpFSo9+kAq54EiQB1MnbhWuL9o
 7isdw7gS/p/Uad336fvSlhLuJo0WuOSPNqs2qaNn9Bfd/4KZZ8l6QDQ5ALdD
X-Gm-Gg: ASbGncvoYjtsk45J5wyZQQqTk2LiHzYjRFoczHv2DhIZ3U0k4rcG4TqTIVX1MqC87OQ
 rkLXzBS/8aoiJkeBM8aulh9x6mpkG8uL9kjkNJwdq26pnEOqtNC4O6IT1p2+a/liUF098DMJ4eT
 CZh/1lOA04FXYz14Q83AjR/oWzP+STB8Qh4gnk4/zYk2ctpN0FOpJytTwRV7npyD/0T1Bbs9TMv
 aRsrWNgmYL7Qlk7DzEt8HwZn2M4hyCYgSgsPAJjLoVH9dZ1yqT5ZWFL3SvUfz2gJJfdqcxl1SpN
 jXIswgOI0YXrtzUE0bRDHIKg9C3Uf/si8+OcUZNaPUEY
X-Google-Smtp-Source: AGHT+IHFUu87vxddCKeXNfp/jgacvw4AEO8vN4PFSevlHBckW8y+saUm+LFG3x9aGEfRTLv1IeTtQA==
X-Received: by 2002:a05:600c:4fce:b0:43b:c0fa:f9dd with SMTP id
 5b1f17b1804b1-43d01c25c64mr103080695e9.25.1741887215667; 
 Thu, 13 Mar 2025 10:33:35 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 13/43] lib/vkms: Test CRTC invalid values
Date: Thu, 13 Mar 2025 18:32:48 +0100
Message-ID: <20250313173318.5818-14-jose.exposito89@gmail.com>
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
index 0c3c9812a..0a14f9af7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -509,3 +509,21 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name)
 
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
index 23c0560f8..90cfde77a 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -45,5 +45,7 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
+void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
+					 bool writeback);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 7f0e07121..1d96a627c 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -357,6 +357,31 @@ static void test_crtc_default_values(void)
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
@@ -372,6 +397,7 @@ igt_main
 		{ "plane-valid-values", test_plane_valid_values },
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
+		{ "crtc-wrong-values", test_crtc_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

