Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C13C021B7
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFADE10E7A9;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZtDUosB8";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C30A10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso42471475e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897423; x=1740502223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5oVKbxYTRAzBg6jEfH2WWYW6tg+Dbwm2Uc0R3hU3mAA=;
 b=ZtDUosB88KZ+7wXWr4pbJJ4st+9llCxj7uVq/S8Trx3OVHucPV6MoJGMpsXpt5V17l
 JtePnin/sFSj55gg/5PzcdOfo+Jl/Gt5OC8gLypaUdur3zVYyifVZ6SRCkybiF9ZJZX8
 VN4Jpqv1ey1xhQ4ZSqbyv+M2cyXEgf0/wNyuAlz76vJhi8fiGYWBO1bAnJ0k9q92VQy6
 1Bk7+mvCE6zpvXkq6psrcYc2mMc8QYiI5B1HbMZM+iaD2COlaZGkcimBbPw44kT7rdMX
 gviNTjyaYi3HuTa6cRF/l6ekUbGxLAB1ePBks3ayfZR65GaI0uaLYTcZIyvQo3zsoiGP
 BUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897423; x=1740502223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5oVKbxYTRAzBg6jEfH2WWYW6tg+Dbwm2Uc0R3hU3mAA=;
 b=bjcmPkUSlCE27qJtV6NN44ijrJ36Xy15654ct/9PSJxOEc77R+IxOHc2nSMl/0h6ik
 nTX1XrHJs2TE/r5jTUl6N0V4Epr9FN2k0LVKF/7MQ5Y0ajBL7dSRbERRpAkL+ebZ4+ob
 Prk+8Vq1RD9p8C0v8bgQPlJugpJRguYDaNSTG2U6VpA5BfXZ0JUbXsnTDAdQD3koCoOE
 L+1zNqoHWB5Qqjvr4tdpove7ETBttJ0rHZsv6MD7bOptdSHWZsIkHqLLg1vIjf9Dl5hF
 ZDv3deWJoTAHa5dh7QX2F9BgCwBnd0vmixziPPwCPVHZV6AxywXqdDejhNTiqMyXIrp3
 1j2A==
X-Gm-Message-State: AOJu0Yxocbyc4bujkwmAMGrcYOOtonPz46TDqJ8kvtq5V+6ZCB5QGvCN
 qT6LQZntw7lkLQ7DqP5v3FQGuHNZ8nqPy2hEg5PNCsh2xuLat7ZhTliDcuhB
X-Gm-Gg: ASbGncvrEyeJ1Y4iaK0DsUwCiZTFnicQi0KzxyDilTRL6MEiAsHNWlsAKr9LIh3X795
 NJ85sBSD3mne1gLHbDvvCbsFrv8EOddPMSWQQSV5DT/ikzM2yxJHu+WLlhJKr2Hfhc1pXhk+5ra
 mggh4sppIoPVTEGYc5q/9PC02Kj9hDP3W+lQzGmnQZhE1rqILDgbbBQjeRLpEPI+4alOaMlnTjZ
 XFj4k+MAmlj2UOn5pbAD2aGgAN9TSltC8uibBucF5ZbaZbFndCXeghDQQvhQkHe1DPH+CeJfPyB
 oZJsawm7/ghNw3xNWA==
X-Google-Smtp-Source: AGHT+IHbJT8oZUI+bLau+EoxvgOTQyTC8aF/fKlvSHyWKjNu/uldFbHoHejaTOCraD73nGhUS2VilQ==
X-Received: by 2002:a05:6000:1a54:b0:38f:4e50:8b0b with SMTP id
 ffacd0b85a97d-38f58796ab6mr135228f8f.31.1739897422910; 
 Tue, 18 Feb 2025 08:50:22 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 09/39] lib/vkms: Test plane invalid values
Date: Tue, 18 Feb 2025 17:49:41 +0100
Message-ID: <20250218165011.9123-10-jose.exposito89@gmail.com>
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

For a VKMS plane, it is only possible to set invalid values in the plane
type.

Test that setting wrong values fails and that the plane is not
accidentally changed.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 25 +++++++++++++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 5cfe5123c..ca6f37975 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -340,3 +340,28 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
 
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
+	snprintf(path, sizeof(path), "%s/%s/%s/%s", dev->path,
+		 get_pipeline_item_dir_name(VKMS_PIPELINE_ITEM_PLANE), name,
+		 VKMS_FILE_PLANE_TYPE);
+
+	write_int(path, type);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index dd06d8f5b..283be5699 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -31,5 +31,6 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
+void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index a3fa60762..d607b1a5a 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -222,6 +222,56 @@ static void test_plane_default_values(void)
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
+
+	snprintf(path, sizeof(path), "%s/planes/plane0/type", dev->path);
+
+	/* Test invalid values for "type" */
+	for (int i = 0; i < ARRAY_SIZE(invalid_type_values); i++) {
+		struct invalid_value v = invalid_type_values[i];
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
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -233,6 +283,7 @@ igt_main
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
+		{ "plane-wrong-values", test_plane_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

