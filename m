Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3177BC35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B5D10E902;
	Thu, 13 Mar 2025 17:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NPiJ+vqu";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55B310E902
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:41 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so11676465e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887220; x=1742492020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0HZBOiJmbHIRsuwf1CZcxlcW9j9CF8GpVpUbG2OvTc=;
 b=NPiJ+vqu7awmgd1ir4mgV6XUQ2C+S/5MUNngBmjvyG53QL/HLj4VxAfQdzw1W4XErN
 dBa/Rt1X4lm2WTGawxlaEFzPwibbhqUs32RhOHiYEpSkKrt1KWPdQa5/Rn1PhV+0syeA
 LNSMmGQes7oN6Bc/STkaUuVcPRjdbEhxx0/QkgCT+uATamYke7hYs/N4GhVlV3Ds3j6M
 OKYEFp6BMga4VjiPnbG7QoIzRayF/l03oLjtKdohcGLqcCJ4UVIw5Y2CYkF7zWdptIw3
 G3ApJ0075R6RBnkANa0jUExns1Q8bWorXiPF+0/QcMsaDwxctVlzLtGM6ot7aOBwjadA
 dtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887220; x=1742492020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0HZBOiJmbHIRsuwf1CZcxlcW9j9CF8GpVpUbG2OvTc=;
 b=NAHMX2AcxKLyg1NZdDztbI504Ky2XK1gzbMPaPoa+MJgLva7qMqsHSXKV5ttLpYdwy
 pJObMv5T5OeH9f7BwxLo9BAwQwNCll6fZGhNv9mQUCHKIgOLTsDctJya0xkD/wyDPZc8
 vgrlxKbjXCXKEp3eA9xiG870hfdivG6l2b4hMQvmGo0z4q6nghHZWPFmy2amF4uxJHIc
 YVYivQpn5S2MIH0uoqGLnGvMn89mXQg3SsmvOyDYGpgH/wJPC1WzT81yHYwPaqOe5R2e
 FSvurOmx3AyvtInvwot5VV0SeTGDOju2YoHW7hQRymBTrhFPGPhb8GV9vhmzhL5KYbPX
 6tFw==
X-Gm-Message-State: AOJu0YyDUBQ6PDQSLseTnN21VVCVDZPotepGffxGGJgJsUFqBcfODW7I
 d0mwnBFpUcMplmBE+g/CjTx3gTi36WpPaDZqYeGSdaiZC1s13/+Sxsmgf1zc
X-Gm-Gg: ASbGnctfxbtafDks46wxQjfgEbTanM8Mw7lQr64aymevrqn3HjGBR6g8QytJOd0lrVr
 de+G23niJtzUZBHNkdezHKI/U4fyqzxdrXx5KKqXlXfm8jO1B6JhwztuJUs8iv105cXSPLGT3Q/
 ExFFCPmGbcIkXx+Ho0hJhQz4pu8rfwSk/Ki0uxLnfHuG0WExKP0RHKhtf9CvvpQYm/8eSdw03F6
 gUH7MDF2ObzuKVrqz5GgLZSGI9cjyDW162PukS+nmRUy3/WESynv9wbmSrPZt2hVXR38KEaYtRN
 GKVdiW/Ir3w1NblUqlj4blbM8BBpQpFETn7A19kUlAR0
X-Google-Smtp-Source: AGHT+IFAZuweMIwPtOzjJXnS9jLZ7FF0FaAOEjpYwi7pavziQfG3ngm89M6DRH8veIXdMKAWUXjkIg==
X-Received: by 2002:a05:600c:3b04:b0:43c:fe85:e4ba with SMTP id
 5b1f17b1804b1-43d1d8c422emr4973665e9.15.1741887219872; 
 Thu, 13 Mar 2025 10:33:39 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 18/43] lib/vkms: Test connector invalid values
Date: Thu, 13 Mar 2025 18:32:53 +0100
Message-ID: <20250313173318.5818-19-jose.exposito89@gmail.com>
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

For a VKMS connector, it is only possible to set invalid values in the
connector status.

Test that setting wrong values fails and that the connector is not
accidentally changed.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 24 ++++++++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index c8b0dd071..1cd560038 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -614,3 +614,27 @@ int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name)
 
 	return read_int(path);
 }
+
+/**
+ * igt_vkms_connector_set_status:
+ * @dev: Device the connector belongs to
+ * @name: Connector name
+ * @type: DRM_MODE_CONNECTED, DRM_MODE_DISCONNECTED or
+ * DRM_MODE_UNKNOWNCONNECTION
+ *
+ * Set a new status for the connector
+ */
+void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
+				   int status)
+{
+	char path[PATH_MAX];
+
+	if (status != DRM_MODE_CONNECTED &&
+	    status != DRM_MODE_DISCONNECTED &&
+	    status != DRM_MODE_UNKNOWNCONNECTION)
+		igt_assert(!"Cannot be reached: Unknown connector status");
+
+	igt_vkms_get_connector_status_path(dev, name, path, sizeof(path));
+
+	write_int(path, status);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 3d27bfebb..df64bde9d 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -58,5 +58,7 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
+void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
+				   int status);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index d7ce4aa17..c74bbc15f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -486,6 +486,55 @@ static void test_connector_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_connector_wrong_values(void)
+{
+	struct invalid_value invalid_status_values[] = {
+		{ "", 0 },
+		{ "\0", 1 },
+		{ "-1", 2 },
+		{ "0", 1 },
+		{ "4", 1 },
+		{ "connected", 10 },
+	};
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+	int fd;
+	int ret;
+
+	/* Create a device with a disconnected connector */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_DISCONNECTED);
+	igt_vkms_get_connector_status_path(dev, "connector0", path, sizeof(path));
+
+	/* Test invalid values for "status" */
+	for (int i = 0; i < ARRAY_SIZE(invalid_status_values); i++) {
+		struct invalid_value v = invalid_status_values[i];
+
+		fd = open(path, O_WRONLY);
+		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
+
+		ret = write(fd, v.value, v.size);
+		igt_assert(ret <= 0);
+
+		close(fd);
+	}
+
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_DISCONNECTED);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -506,6 +555,7 @@ igt_main
 		{ "encoder-default-files", test_encoder_default_files },
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
+		{ "connector-wrong-values", test_connector_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

