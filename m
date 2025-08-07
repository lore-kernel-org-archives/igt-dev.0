Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407B5C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20610E7FD;
	Thu,  7 Aug 2025 07:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZPNUd2z8";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A3210E7FC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso3868885e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552768; x=1755157568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2nXURq4J+cveMcdLpIaiDPkRrp3ej/Wyf40J0pUUEI=;
 b=ZPNUd2z8I8nYDGnVu9EhVlj+Vrn7Zc98SP5WJRmKPfUhzm83NUCvvrrPaAV0Jml5Dj
 F2sX8IrHu3GthnvVvl77zLlNwGops+JHxJv6sTag6ttbccBlr4GkuA8Vjynpp+i0GS+c
 X5gRp3LLEz8zc384VGVpaltwPfHog/X1mU62IhwuwfP9wICIuU/2yni2XMqbDhsDtVyW
 XHxbtbJUvIkekeapDQbXURWehazyhqDR606Xvd0v0i1OXvDRvpT5a1yKLe3jNHKzoleJ
 SMOL8pfsOruHc7b+TszvIn0MvsCyN8RUDVSAILg1EUFNEgWRwoe5Xs1mCz06p3+V66gg
 K8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552768; x=1755157568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2nXURq4J+cveMcdLpIaiDPkRrp3ej/Wyf40J0pUUEI=;
 b=Q6D7ArRRvvttdpY5pgWzf9oWroSO8f0KGLEtbNeu8i/eR09TQAMXIvjm1WaHObrDYH
 axJXZEzpwArsvgCBE/YfN5vfMpMYgSMp7DFWJ62xBDN1/k/6nHsw2Xa4ApG0CneHW5Bg
 Ccycwk3fgccg85Srk1G0WP9YZr7L4zNKaHOc8vUPug/fyufpahdDupynHEoC1VdaW4t8
 TmCX3CdOf4lLq4AE/omegMO1GguyzBV9TWnjxgRkwW7XuhnRbu8alnwCzozzVnWQeyHH
 /EbUBvSav+34LgKTjpMwp1f+S5Wg8zZ4+4xO8tzPAWlQth+IyM5QwCKpXZUxN7u18wUL
 ROnA==
X-Gm-Message-State: AOJu0YyYsqBQDnVmZvXJ0jYfSBvpV+4miF/hk54lFNBqMrXrFUSnKfH1
 xuILVMntiDqDt3hrH/chf4jnXabqGrqi7Y/syA/vi4ZdYH5s13weAdxAlawfaToQ
X-Gm-Gg: ASbGncvstxkmASclcyVf28giQfbdAUdHI9ukv8swbV03Kpx01BB+kg2C3t297B+8YHC
 bviKkr0q8nHy/Lu/w82yKV3T4ZJb01SGdJV6eHbtrhmzaworNy/EjGBtMczFDRLdl9W9vKXZG2R
 4IehiueVIfD1XtO2YLth+a/t3xURN3xXpL6o7qsCSDGIRI8CNwsjT75VlxcXeveuoAReDTsHYXD
 YABrYDBSoKwSQZCco9ZGz6YTLCYck++ez4sufbAmT457oa3uHtcCOjLXsde+8SHOlkauyHPWQGy
 QFLLzIASNcyiEF6s5BtMAl05DRMcTcDa4PKUmgybmI6dpR2z/jX9BsLyPwTuq42xNQn+xwU8dbv
 DVsIidtEUYq4X6/g8HZA=
X-Google-Smtp-Source: AGHT+IEYoA+TCj8HMJ6BlqUMIhBN1+GoDwlXnkuocn//mctSxnVYMG0uzdG7RVeTpxWehbnxabIf2A==
X-Received: by 2002:a05:600c:3b90:b0:459:e3f8:92ec with SMTP id
 5b1f17b1804b1-459e709ab0bmr58467675e9.10.1754552767994; 
 Thu, 07 Aug 2025 00:46:07 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 04/41] tests/vkms_configfs: Test device invalid values
Date: Thu,  7 Aug 2025 09:45:13 +0200
Message-ID: <20250807074550.6543-5-jose.exposito89@gmail.com>
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

For a VKMS device, it is only possible to set invalid values in two
places:

- The device name: The "vkms" name is reserved for the default device
  created by the driver.
- The device enabled status: It should only accept boolean values.

Test that setting wrong values fails and that the device is not
accidentally enabled.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 0ed6a63a6..d38791ccf 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -23,6 +23,11 @@
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
@@ -71,6 +76,32 @@ static void assert_default_files(const char *path,
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
@@ -119,6 +150,34 @@ static void test_device_default_values(void)
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
@@ -127,6 +186,7 @@ igt_main
 	} tests[] = {
 		{ "device-default-files", test_device_default_files },
 		{ "device-default-values", test_device_default_values },
+		{ "device-wrong-values", test_device_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

