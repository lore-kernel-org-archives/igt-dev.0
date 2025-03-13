Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F10C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70F510E90C;
	Thu, 13 Mar 2025 17:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EOHKiVYG";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CA210E901
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so11027695e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887209; x=1742492009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7a/4rDReUhO1UVt+i2hCfc95deUhuugvuiQF4BI4Ic=;
 b=EOHKiVYGu3bh2F2G+NH+TYRKHoPnF3lD/qXP0n6MN0gr+I8YkBhWUTBSIUf44XzNgI
 ziwc4MiySmlVnPYFIK7KCnW9SkJ2mN0urvmZ4tU96fM9fCXq92gML0tMSPMS3ANCIoRt
 3HIIkD8IyaHdmTM7dAH1Xz8j2zRRLjwYgKYUTUUgGFCYxyC3fYy3w0LCJXnhlcbrtByP
 lRud34FsForqGWiI6OHjX7JtVju5kklnxfgCOZgaTE8Tf2gpMlv5p65CKfSkofykR8tb
 uXlhDuXsqyTsjA3SYl56ncoTi4SYrhxI1FPRZTEmQ4xweUJeFLTVVuOB6ODerKBT+FWE
 hjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887209; x=1742492009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7a/4rDReUhO1UVt+i2hCfc95deUhuugvuiQF4BI4Ic=;
 b=Y8teCylX97MDI/p+xCl31Td7iNI3N7UVhYvW0YvBGCmijDjiefbdNnThBrQ1S+8GKw
 YRkW4NO8r9pA+aUqQyU+m1EARcs1Qv/t7qL5wE3NnlkfGFz6Kq9swd4ZvJ+tejXpWJPf
 JZCJi6Dg+8Ag9BPYSimF1Sk5nbRG038GYU7sKMe4iXrbPH7sAmJKcbFI89QVCV8M+A/8
 j/et56Y/q41EerOa8j4rtk1WRZTi5vtZpXwCui0rt9RVcr1Dd6sua6OY2IXz3hUNBnpl
 OmeFHWdyk2Ww2jitu86hgJuDG7jpE+3EM6krSO2lZaxaIup+OONd8+gE1fLQ4vjtbnvI
 tD1w==
X-Gm-Message-State: AOJu0YyA2WPNeRUDNVSZodRZBssxLz4HYSt/NK0gT3Ego+uuvnCaCZ7y
 P9k4QTX1N+T9qU/1wiZ0FHjx6cFg+wlhsnD8corrg/8JIrYUJsvbe5HI7HGX
X-Gm-Gg: ASbGncu2PjS0vfs3jknKTV68hIPMspQf6/HIQw/1L0D2vr9I4pYV7jpv6IobRgF5YlK
 9OTWcH9AtINhw/MAwh+qswboYum43vm7G4HqnHdZftoUPw1/gZg8hE1ofx6RAlIxPN0O9kC/uIm
 TueD6LZm/GdXtlTl6smEvLuCooxN9Ew+miDBWKH4YyDg+YP4YdnK5PnHHISFUoqplSTutI4aWgi
 OwOKya0oksmiQ6rCLPP/zHzTFQ8IazbTI0d9QroFLHbsdxX03Z/Jp76aIr0ruvEaaDzPkNapgnX
 9n0zsPFkYicez/xQo/Y7kJOJE/X5thvPZyHwNtJDJMAh
X-Google-Smtp-Source: AGHT+IFK6lwlyD1R25ZbEHHwMaX7n+h/dUua0AZ/Y/UyWtEtEZiCVq7IjURX/8SjfTX1G4Jo0kEfOA==
X-Received: by 2002:a05:600c:1910:b0:43d:ac5:11e8 with SMTP id
 5b1f17b1804b1-43d1d8e5ccfmr3906065e9.21.1741887209176; 
 Thu, 13 Mar 2025 10:33:29 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 06/43] tests/vkms_configfs: Test device invalid values
Date: Thu, 13 Mar 2025 18:32:41 +0100
Message-ID: <20250313173318.5818-7-jose.exposito89@gmail.com>
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

For a VKMS device, it is only possible to set invalid values in two
places:

- The device name: The "vkms" name is reserved for the default device
  created by the driver.
- The device enabled status: It should only accept boolean values.

Test that setting wrong values fails and that the device is not
accidentally enabled.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index aa7cd9e4e..16e5f6725 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -24,6 +24,11 @@
 #include "igt.h"
 #include "igt_vkms.h"
 
+struct invalid_value {
+	const char *value;
+	int size;
+};
+
 static void assert_default_files(const char *path,
 				 const char **files, size_t n_files,
 				 const char **dirs, size_t n_dirs)
@@ -72,6 +77,32 @@ static void assert_default_files(const char *path,
 	}
 }
 
+static void assert_wrong_bool_values(const char *path)
+{
+	struct invalid_value invalid_bool_values[] = {
+		{ "", 0 },
+		{ "\0", 1 },
+		{ "-1", 2 },
+		{ "2", 1 },
+		{ "o", 1 },
+		{ "invalid", 8 },
+	};
+	int fd;
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(invalid_bool_values); i++) {
+		struct invalid_value v = invalid_bool_values[i];
+
+		fd = open(path, O_WRONLY);
+		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
+
+		ret = write(fd, v.value, v.size);
+		igt_assert_f(ret <= 0, "Error writing '%s' to '%s'", v.value, path);
+
+		close(fd);
+	}
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -120,6 +151,34 @@ static void test_device_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: device-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_device_wrong_values(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	/* It is not possible to create devices named "vkms" to avoid clashes
+	 * with the default device created by VKMS
+	 */
+	dev = igt_vkms_device_create("vkms");
+	igt_assert(!dev);
+
+	/* Test invalid values for "enabled" */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_get_device_enabled_path(dev, path, sizeof(path));
+
+	assert_wrong_bool_values(path);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -128,6 +187,7 @@ igt_main
 	} tests[] = {
 		{ "device-default-files", test_device_default_files },
 		{ "device-default-values", test_device_default_values },
+		{ "device-wrong-values", test_device_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

