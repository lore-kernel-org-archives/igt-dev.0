Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57277C021B9
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31FE10E7C8;
	Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gr03jSDL";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F6A10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so38802035e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897420; x=1740502220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPXqSN5GvcL0/SfXIKezSy3bVEB6IKrsVJXHCcgwzL4=;
 b=gr03jSDL6vH3gqSwX+NIYxCp32J98ZU8GtnpepsZq4l2UMu4Pru1qCgbnfGkqY2xb/
 /Pxchaom6r43Zfula1xspJ6Vvqy7SFCo4ZYJYsYWETIkN2my0oe8E6iSMwzwJVc2kOg9
 Q0RehJBu+NOOfjgzks4HlGYptUAGJWDz9lc1ltXeEI4714zc+n8DB12tAssH0DU+sStq
 WF3UTpWUuvGF3fHaUIUVS9DQywjx2PzP4KxvPEj2jGI2gEWA//oW0mwtwjuDKgTLj1fL
 hcvRBtKhpPsXqi2sw2osjqO1ztXU6DahnyoE4SVYSYm6w6nm1e4XnE0KYYOLU9YC7iSi
 3R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897420; x=1740502220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zPXqSN5GvcL0/SfXIKezSy3bVEB6IKrsVJXHCcgwzL4=;
 b=Mwx/1izqCrIFKs3vMZ30VLlqvt6JlpdxDhJILsOIFrND2HFM9GfENy1UkYj913Z3rb
 dk4SCKO6ywwLlN/ME9ppaN2OviuaDPiVKWBfbJPgITmGBqj4gW1GqGAeAdf39XpSBfLC
 /13ylarmdsBVoLZ33YEa4LUGOxr7Ni1Ek5Fce2AXZNMCaJ6d9NJfZIG3km3guvIVMIt9
 SVxtViqVCui1WaeTexPnf+uPFblC/LGicxu3HqCxfM61m2Y/kElqgvBgWDOtCvEDushN
 LtmN0M6WW3ZMgl8bj+sRijHMjQcGpzvE9qenM3z27BEo36FtaMsG7yRiKkQt8NLpeayB
 XDWA==
X-Gm-Message-State: AOJu0YwD337pZE2pHMQ5tFWZ4zUcIHxZJlfkpKNZ/Y80tkZxA5xv8kAn
 1vyJzsEOetFW/me1S36KaLrStWEeUM5zAQ6v993CFXFt3OK8yT5wVf4QbaP+
X-Gm-Gg: ASbGncsEDCFBx8DMUG8+Sb+SLvpb0gAfMJQFvwhBOg6HczQfa7gUoaOzr7topMGfE72
 DLFxibTQT/GYL6zlGt1JagC11G9EgI3WLZG69VVFR+voL3h2EXb6XIWyDUMgV7wEY2wmyjeavb2
 K26Cqwu3fWJYKwHhn6dSOGB2II7g0Vj7T1uqj72dV4wQ5YBajmajh8PX7RVdEdBi+U9YiXj1ZsC
 QeRyXTtj+KIaImIgCJDhu+gq2kwaLW29DD1HpUoYNQdVru22jl9S8rJnKiYUGfzUdCNT4R0zSHM
 8M3morR4q9NDpjvcdw==
X-Google-Smtp-Source: AGHT+IHaEeMUrzuupPFwPTZzcA8kFOM4dX4kBrWX/4zpwpxwB1DY4/SIJk5B58Q/MBz6WzCuJvb5qQ==
X-Received: by 2002:a05:600c:1e26:b0:439:7dfe:f12 with SMTP id
 5b1f17b1804b1-4397dfe11eamr104032495e9.5.1739897419962; 
 Tue, 18 Feb 2025 08:50:19 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 06/39] tests/vkms_configfs: Test device invalid values
Date: Tue, 18 Feb 2025 17:49:38 +0100
Message-ID: <20250218165011.9123-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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
index 6c7d0310c..79023359a 100644
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
@@ -63,6 +68,32 @@ static void assert_default_files(const char *path,
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
+		igt_assert(ret <= 0);
+
+		close(fd);
+	}
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -111,6 +142,34 @@ static void test_device_default_values(void)
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
+	snprintf(path, sizeof(path), "%s/enabled", dev->path);
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
@@ -119,6 +178,7 @@ igt_main
 	} tests[] = {
 		{ "device-default-files", test_device_default_files },
 		{ "device-default-values", test_device_default_values },
+		{ "device-wrong-values", test_device_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

