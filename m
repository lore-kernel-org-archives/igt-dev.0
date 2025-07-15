Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07CC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B54210E592;
	Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y1TKzc2s";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEF810E592
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4560d176f97so27067585e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575128; x=1753179928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2Uq5+X/V6pp9wEMUeLmao1EGstFPZWBQlo368tVfY0=;
 b=Y1TKzc2sY5HLpXjc0n1SRSWsdaNM6dgJj89y1/WOwQGTu4lFqZHuDgrfGwwAMUwBwB
 Mt0xcnYLgZzWtBT6Oel+rkl5co/qdqqUcsgSEobRB6bXHViFVDWSC8mPKvBwjFu7sWoM
 8o7ZcaiN12Ggch/yCbddnBC/0FHtIPu41l8IyhWSOgsXM2uSgOZnaXptxxHUyMg8olJB
 QtQCsmF8aLqvDOrAZCT5JVW9SZ9IlofOSy76pKREdHGvh0BovbGpd8ZaI+4HcnU8im+q
 Nhcmc/NUkPp+2HzStu8iAOAt+Hb4chJOLheq8cG7wz/FH1H98wTnbTU5eN79cQRFPkxD
 MW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575128; x=1753179928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2Uq5+X/V6pp9wEMUeLmao1EGstFPZWBQlo368tVfY0=;
 b=wSm2Hij7Fjn03Z5/wwCca6egf/FL5iZch0TUwKA4Jt2j+BdVzE9VVJg66W4mR8lVU7
 1lIQfywNHx/+PmnC8qBZOXeyl97Fa21+6VJDJ/m5F/GggnS9qFe3MVJD8Wlb/o7QXfMe
 tb2mFly7Otiuc0xYDEt1WDERjbko+rRGuMlLf9L/E3j9hjZ3S+h+vuyIZUVuUMylKJh7
 WsCw1yi1cYC0P0rwqUTAopgQCo6QnAw/TbkSHAAYJ633BgAzTqCFnFQJ5fEPC+Lcuxa1
 Yh+9cV/9rpipqp0RHnKklSrX78cBZZdafnk9liukVkgu10nxTA3cx6vDuK1jYkAX8Zes
 j7GQ==
X-Gm-Message-State: AOJu0YyHfB6ENSSbBNVI3hZSReUzgE8VDZvTOwkfTOLT8PCKAN2g0p2x
 DEM6YZOLlDH12kYxFSJMRIpJCiFAqIsRYoa+MIuMuaYT1J9/MOez/kRRje2NhA==
X-Gm-Gg: ASbGnct6KY4buuBeDz8fHSbXGzOGBdP5aqh2pZeWD+TvzLSPfFF818CY93qvsrWfutu
 ljKZRCU07RuH9DhvE0vWgX6SKg/MAzqP6d+znhsZyxRwa7QIyZ/Hey/XRy1+4gK4cxfAOz9seb3
 kF4IksCLCfiSF96BoWFJNBQ3krzI0PLxfFnLQmqT7SQlOhj0ap871sYr01lesp0qr9HJ/qe7Rv/
 o0+sKrmYZoeoJ/cuFyecd5WQhXqx01IRHi2aVz0ErWBT5sPnfbhi4AeVsYZnN1Ah+ubtxC5jqFg
 UojnXy7Fqrwd4JZjB+tuU5YCzHR8EbBjsoHI5GDgkVZSjxx23waFsehgC/bOkiNtK2YhRh/hBwv
 rDFTB7w0hnYkE2tD0vQ==
X-Google-Smtp-Source: AGHT+IEbj+5wFiO59dF0FVxVPX29d/zrQamkNDUh+qn5h4tVYvrcy5XrWDJWxAFtVtd67tmbGH3ggg==
X-Received: by 2002:a05:600c:3f0c:b0:456:dc0:7d4e with SMTP id
 5b1f17b1804b1-4560dc08725mr102008685e9.18.1752575127927; 
 Tue, 15 Jul 2025 03:25:27 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:27 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 07/41] lib/vkms: Test plane invalid values
Date: Tue, 15 Jul 2025 12:24:39 +0200
Message-ID: <20250715102513.5636-8-jose.exposito89@gmail.com>
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
index 6cc9b8afb..eb3830685 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -426,3 +426,26 @@ int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
 
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
index cea0c7242..b5f9a5b24 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -37,5 +37,6 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
+void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 5aafe39ae..bb9c53f34 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -231,6 +231,55 @@ static void test_plane_default_values(void)
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
@@ -242,6 +291,7 @@ igt_main
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
 		{ "plane-default-values", test_plane_default_values },
+		{ "plane-wrong-values", test_plane_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

