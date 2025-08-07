Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367CACA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EE710E801;
	Thu,  7 Aug 2025 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+SQMcqx";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056910E7FF
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-459ddf9019cso2285505e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552771; x=1755157571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwXEmj/xEBhHT/QoDHnxYw9Yer8q3FbbaJjC1kgRJMg=;
 b=e+SQMcqxOHcRtr9PA9Zs+d9mHNgZxNBnINoTT0MVto04qO3r4PUwxm4d0xsgbpclvE
 AJlKYp3bkMlLMMKrnfbqt03Dplgl4LdDsGa/1PDmAAWedgM4Yp85YDtMFYhViVADCJuY
 JxVJyPUFRjTriqRkHb7pvIEs4pZHFrjm+E4W29qIfysDNbPDCVdmi8FKs4bajBUF8DsR
 aEj4xDaR1XbzXDEcpZ5wRQ4/9lvRf2RZ3w8/pcjHvRQyxoB9UsytVGldVrtS/zUYQVR6
 IO6spDzJ0zP0f3yVVgi1/+ySCInCUu+QicUPYdTqkeLhZtUgBLjlHNs9PEtWlkXNyPiZ
 ryCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552771; x=1755157571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwXEmj/xEBhHT/QoDHnxYw9Yer8q3FbbaJjC1kgRJMg=;
 b=CU+IidmJLXLxCsg2LnZX8CVxX3t0pvA57cN9I2eEbgl70UJ40QwL/eElqE59uhLXCv
 +iF2uI1ScJTb3kjSe7f/rtwMU24BJrUuYbbO2M2Kf8B3mfqRfv17VkvrnEg2YyiH1p9K
 0ibS/kPfeNyn55bSCCD6kww726I1Z2vXkxv17kLCP/VCWKJg01gaAWBLbAMjTryLdDhG
 WYzc1G/aiigGD4iMRu7gWDpGYqWKpxSO3oRml9meG+g4BPisYJYsAq9gaIpAAz2Fv65r
 KY/1K2DYhrZ4uRIDKQTyTsSRhjKygTHo8E1rw4ERAV2+ktzL2TzD73qXC0libwMu3btr
 yzOA==
X-Gm-Message-State: AOJu0YyhI18+33LudBlyiuzTOuUW3GaJLmpXZkXFJc9BvjdZTdVfbciy
 JMi+MQfw/+6yqw/Ye9Zm7ucnEDB+i5jsAJ2zp5lS8tI/uXqQfhp6cdeDL3HJMRK4
X-Gm-Gg: ASbGnct+kIaX81guEr+2YVITLrIZKrTd0gpreJNzE25NU16PursOK4jC570weJQJds6
 XWY6n1OzU0eqz/7+BRq7FHXQgXt9MUGlvUuMOrGxIxTznoQwwNH1BYje0kUzIB+Y1ENYYfk3kvW
 GXNPLG3T2o+IZ63U9Uoxm5F4bsLPuSz5CXYN4MkeS0zJ1JVw1If8bZw7PYZTTA8ClVtBIsxaCby
 ESu2y3WZqTmWKLR70iOjUYmjZ3XsY+UOHPVVteqxPG/Y2u4Iiy5bzsg5KSQnIYoy5fPrYR21xfC
 R8Te+dfMQfdCNyOG630zcgs1JXUPoHQ6Z7I2vU1kmrT/532Ifjl3sQVvEmQtqp5hxNP/gCdUVvI
 iVdoKvMcnZ383QYfFaR9YPz6Q0ztmrg==
X-Google-Smtp-Source: AGHT+IFLWG9/Q69p+JCLblZTtlNIuq7Zjfr0UcYaDQp//hQcdIrzW40ZKCftOR+RIS4gi484SJzwEw==
X-Received: by 2002:a05:600c:4fd5:b0:456:26a1:a0c1 with SMTP id
 5b1f17b1804b1-459e70eeb5cmr60113535e9.17.1754552771230; 
 Thu, 07 Aug 2025 00:46:11 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:10 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 07/41] lib/vkms: Test plane invalid values
Date: Thu,  7 Aug 2025 09:45:16 +0200
Message-ID: <20250807074550.6543-8-jose.exposito89@gmail.com>
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

For a VKMS plane, it is only possible to set invalid values in the plane
type.

Test that setting wrong values fails and that the plane is not
accidentally changed.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 23 ++++++++++++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 50 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 9a9fbde3f..2c9ab607e 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -425,3 +425,26 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
 
 	return read_int(path);
 }
+
+/**
+ * igt_vkms_plane_set_type:
+ * @dev: Device the plane belongs to
+ * @name: Plane name
+ * @type: DRM_PLANE_TYPE_OVERLAY, DRM_PLANE_TYPE_PRIMARY or
+ * DRM_PLANE_TYPE_CURSOR
+ *
+ * Set a new type for the plane
+ */
+void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
+{
+	char path[PATH_MAX];
+
+	if (type != DRM_PLANE_TYPE_OVERLAY &&
+	    type != DRM_PLANE_TYPE_PRIMARY &&
+	    type != DRM_PLANE_TYPE_CURSOR)
+		igt_assert(!"Cannot be reached: Unknown plane type");
+
+	igt_vkms_get_plane_type_path(dev, name, path, sizeof(path));
+
+	write_int(path, type);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 0e5cf35ce..95828fb11 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -37,5 +37,6 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
+void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 69fb7ca64..163b542d0 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -230,6 +230,55 @@ static void test_plane_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_plane_wrong_values(void)
+{
+	struct invalid_value invalid_type_values[] = {
+		{ "", 0 },
+		{ "\0", 1 },
+		{ "-1", 2 },
+		{ "4", 1 },
+		{ "primary", 8 },
+		{ "overlay", 8 },
+	};
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+	int fd;
+	int ret;
+
+	/* Create a device with a primary plane */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_PRIMARY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_get_plane_type_path(dev, "plane0", path, sizeof(path));
+
+	/* Test invalid values for "type" */
+	for (int i = 0; i < ARRAY_SIZE(invalid_type_values); i++) {
+		struct invalid_value v = invalid_type_values[i];
+
+		fd = open(path, O_WRONLY);
+		igt_assert_f(fd >= 0, "Error opening '%s'\n", path);
+
+		ret = write(fd, v.value, v.size);
+		igt_assert_f(ret <= 0, "Error writing '%s' to '%s'", v.value, path);
+
+		close(fd);
+	}
+
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -241,6 +290,7 @@ igt_main
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
+		{ "plane-wrong-values", test_plane_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

