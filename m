Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E64C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F9310E596;
	Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0poA3LN";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8474A10E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so3464816f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575126; x=1753179926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oPO79vNmbd5fgRZpQK3ekaoZgKXC+DJ9kCZ3d/YTBTI=;
 b=S0poA3LN2Sl3iyBwH3bkkwXvH96ttUVtBuI9Aq/aOjX3Po4EUcB14c+yqz/RS3ewEF
 w2IOCMUhrZJPgQQ1gPyWxP9qXEdk01Ylx5wWJNngFR6uVHMG4VVq4NBPxJRiZHezaJw7
 U1Bn73V2RZorx37Z6+X275QIh9uYsa8GqMDjbk08408LpHs8xFcvchR9anTlUyGScQ1n
 a5WmGLo67jwiTGfjZyyGVxAUb0orz12b3+Xye+CI0WZp4F2uKjPIxk1pqfYubtmxIoyT
 CS5WD1eyrezqfTIYrzXLZ3Rf7vnvZJlUHkeWnWP2pzn8zc7KJj1bLWI/L9Hdptm5bgeA
 YtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575126; x=1753179926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oPO79vNmbd5fgRZpQK3ekaoZgKXC+DJ9kCZ3d/YTBTI=;
 b=t3HcYmDeKDtYrEDdg3Xq3ajUWgI1BemAWqqhXQg522d4++irTqpXB2O2P/cqbTL0mu
 m5IAsG1mstQRrmYl3FdZrH5FHdGXfBcQvAjOPgN9cZ538hb38nTz1L9eGm2S7bTZbfYV
 pP6AzWwjjwbA+D7/Sa0KhJcS7pnATzaAlpQ4loev49OQjVk1Gy7hQ1igIsWRnTZazgMO
 TuWyyqCqu2BzlPQcyXitUfaqok8hhsKvMxlCVYwfBWhcDMhSGWcTLdydcT7RkcHjWcR9
 BIW7VEwlwMbwYhxi5951AFVHPcQal0QZaLSEaynElRYTq6FnVners9gtYPT5dgRnTsge
 O9oQ==
X-Gm-Message-State: AOJu0Yzc/9WOK2Oye5jnqaLVf0I9M2JbJxG4/2ZTmJwDF8YOzyVaSBn7
 IURCyTVMEoogaumCVMU5b9LbVGdwF66+ZPq7dM42LnJKT9NqMK0oU+zaO/yJFQ==
X-Gm-Gg: ASbGncsfmoBN/gAN1IwasnthvZLbI1698rGZBfYAmO9ZxwsET2eDwvmaIMBPGfwoXQv
 Gf6oYyi6Mc+PPJdsZK89203eOUwxundayZGoYYMD3cNTCcc3kZjgBDNWpEICHSBG+KAtpoG9vzN
 GJojz8yCj0JdUr4vx9N1BQr9AKjtfVUmsXClWRDnXi/1uv1gelqIELgkCY7+HPP488q+M4sx9dR
 HXnorU91ssM4558NuHDMfYNu3CWDvt0DA41K5+gvViF2DGXAvoAVAF9ZzH70GqYGDNnZ+Ls6o+2
 Gi8QAOE25DgpWB814i6bmRQln2wAaz9jte/sEa16waF3BUDOIv7BZWE5EuqDkwmx0PO3NArKuHk
 1fJ0/1ST9CHVlYEoGJQ==
X-Google-Smtp-Source: AGHT+IG582sUaS8kLIOLrNc3TLjLaZJSY6ssnilr0wGkT+4NfnmA/InTZoWHDXUbg2J3ScAJY0Q+yQ==
X-Received: by 2002:a5d:64e3:0:b0:3a4:eb7a:2ccb with SMTP id
 ffacd0b85a97d-3b60953af23mr2321687f8f.16.1752575125433; 
 Tue, 15 Jul 2025 03:25:25 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:25 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 04/41] tests/vkms_configfs: Test device invalid values
Date: Tue, 15 Jul 2025 12:24:36 +0200
Message-ID: <20250715102513.5636-5-jose.exposito89@gmail.com>
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
2.50.0

