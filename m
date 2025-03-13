Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C126C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B13510E915;
	Thu, 13 Mar 2025 17:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jzq5WqiX";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41010E903
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so8724215e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887222; x=1742492022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgQc3iu2E/QKNLr2DHN58xrBBXV8MfFUTdH4NtYlXts=;
 b=Jzq5WqiXa0vsUTKRHQVxVq9GCIpwzzJEDcUiRFg1Y5qk8s8cRzuMHdLR1vNdQJ/bwS
 vtRB0pjBu9qaO9QvbAPZZR4kIhRcny4cqoR4M0w7lcSYEnQV0LZNxiCOWr/19NulvNSj
 8mW85MCuc6ytxS6ssIv7fi96bUxUgZTZ0h+36MsXC6AI3IZqmUG1IIQx+AfixzX5tOqh
 qbWuAu/O4CMkTcJam/obNyD6jisTNyhzDAyzPbAHKsYvGKHByN/a5XzuyB0GDaQAQUKo
 dr/RpLLyJoE+WBgTA54j1aqN5tYOvj3pfIKdFU1o1dDNNoNN+ksMbxNWUijj0ocHrGz9
 pFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887222; x=1742492022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgQc3iu2E/QKNLr2DHN58xrBBXV8MfFUTdH4NtYlXts=;
 b=X2fuMAKoF9+Ydwow1/uV+50Vn1nhtwOZ5yOquzM488YLnGWalhiS+E7pJDDezBO9X8
 SuUnkW6gZ1inyv7R+t0YprHOE/D1FN9l9AUvDnh8TePNtNzhSuRX318eBydpykolPZcV
 wviy+6qUjkwOS327RIFpst0w3jGuRac3A4EoDBKnj5eEUmf8ucedGGkxr6AqsTWZhaj6
 X942rzH4+vhYUf4gxtrDUf5FULYaWNWNKlLfyE0bpfoXMK82irfaHo050rIOcoD1h/yl
 MZXOZr83haZYS1B6McmNWTZYQSqec6mt0Q3o9fjhBUiXL/jX0rKzH+e3qR/JTbP2nfcq
 CLKg==
X-Gm-Message-State: AOJu0Yz9oiQ7kmAtJCOdgIw5udrHdBVW/HpMw0K0mnZaln1hJGKZmOif
 fAiADy49V2sYcdmwqs1XfIoqDj7Dq57xxUrAYsr+XYRoO8o2xvPOB/CF8j7C
X-Gm-Gg: ASbGncstQR/pDpTmGTlgTy5zrEGjlsAGYR6l94ALMQLkKdAtshUnjAnu4rn1rrmbuKl
 8VgZouZHy6eQrQNDMgkaeOsd8SH6Fa5t9Fpdxp+8WotafkB1sqrBfzcytFjhdLaMC5F/dr3zyP9
 PBnocn9iUGFj+S6yYOIg9unHGEVTqCYCuVgwr/mS4QXKyceA4jfzkE+Zc3EsdBPk+Ow5IsLz7oR
 2SqimK5dUZAjhhwZXrTNkBLDgAB2iyGJfg4fo8vw4zW6ypWQTrN7eywRDxKHd5s51IjgNJbJvpp
 lrDDO6CUaBqGiTk7H4r8Q5MD64nJzHBWnVRYebxDxw62FIIAWRoo7zk=
X-Google-Smtp-Source: AGHT+IHF+tO52BuqdJaDF2sl6gPXOnV4omQv8mNd7e8IoaIbaSFGKNwEDyM/QumtgWiY5mXpPza+IA==
X-Received: by 2002:a05:600c:3585:b0:43c:f4b3:b08b with SMTP id
 5b1f17b1804b1-43d1d88efaemr5780075e9.3.1741887221977; 
 Thu, 13 Mar 2025 10:33:41 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 20/43] lib/vkms: Test attaching planes to CRTCs
Date: Thu, 13 Mar 2025 18:32:55 +0100
Message-ID: <20250313173318.5818-21-jose.exposito89@gmail.com>
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

Add helpers to attach and detach planes and CRTCs and a test checking
the different valid and invalid cases.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 120 +++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |   6 ++
 tests/vkms/vkms_configfs.c |  78 ++++++++++++++++++++++++
 3 files changed, 204 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 1cd560038..ea18816e7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -163,6 +163,81 @@ static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
 		     path, errno, strerror(errno));
 }
 
+static const char *get_attach_dir_name(enum vkms_pipeline_item item)
+{
+	switch (item) {
+	case VKMS_PIPELINE_ITEM_PLANE:
+		return "possible_crtcs";
+	case VKMS_PIPELINE_ITEM_ENCODER:
+		return "possible_crtcs";
+	case VKMS_PIPELINE_ITEM_CONNECTOR:
+		return "possible_encoders";
+	default:
+		break;
+	}
+
+	igt_assert(!"Cannot be reached: Unknown VKMS attach directory name");
+}
+
+static void get_attach_dir_path(igt_vkms_t *dev, enum vkms_pipeline_item item,
+				const char *name, char *path, size_t len)
+{
+	const char *item_dir_name;
+	const char *attach_dir_name;
+	int ret;
+
+	item_dir_name = get_pipeline_item_dir_name(item);
+	attach_dir_name = get_attach_dir_name(item);
+
+	ret = snprintf(path, len, "%s/%s/%s/%s", dev->path, item_dir_name, name,
+		       attach_dir_name);
+	igt_assert(ret >= 0 && ret < len);
+}
+
+static bool attach_pipeline_item(igt_vkms_t *dev,
+				 enum vkms_pipeline_item src_item,
+				 const char *src_item_name,
+				 enum vkms_pipeline_item dst_item,
+				 const char *dst_item_name)
+{
+	char src_attach_path[PATH_MAX];
+	char src_path[PATH_MAX];
+	char dst_path[PATH_MAX];
+	int ret;
+
+	get_attach_dir_path(dev, src_item, src_item_name, src_attach_path,
+			    sizeof(src_attach_path));
+	ret = snprintf(src_path, sizeof(src_path), "%s/%s", src_attach_path,
+		       dst_item_name);
+	igt_assert(ret >= 0 && ret < sizeof(src_path));
+
+	get_pipeline_item_path(dev, dst_item, dst_item_name, dst_path,
+			       sizeof(dst_path));
+
+	ret = symlink(dst_path, src_path);
+	return ret == 0;
+}
+
+static bool detach_pipeline_item(igt_vkms_t *dev,
+				 enum vkms_pipeline_item src_item,
+				 const char *src_item_name,
+				 const char *dst_item_name)
+{
+	char attach_path[PATH_MAX];
+	char link_path[PATH_MAX];
+	int ret;
+
+	get_attach_dir_path(dev, src_item, src_item_name, attach_path,
+			    sizeof(attach_path));
+
+	ret = snprintf(link_path, sizeof(link_path), "%s/%s", attach_path,
+		       dst_item_name);
+	igt_assert(ret >= 0 && ret < sizeof(link_path));
+
+	ret = unlink(link_path);
+	return ret == 0;
+}
+
 /**
  * igt_require_vkms_configfs:
  *
@@ -228,6 +303,21 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				    VKMS_FILE_PLANE_TYPE, path, len);
 }
 
+/**
+ * igt_vkms_get_plane_possible_crtcs_path:
+ * @dev: Device containing the plane
+ * @name: Plane name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the plane "possible_crtcs" directory path.
+ */
+void igt_vkms_get_plane_possible_crtcs_path(igt_vkms_t *dev, const char *name,
+					    char *path, size_t len)
+{
+	get_attach_dir_path(dev, VKMS_PIPELINE_ITEM_PLANE, name, path, len);
+}
+
 /**
  * igt_vkms_get_crtc_path:
  * @dev: Device containing the CRTC
@@ -529,6 +619,36 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
 	write_int(path, type);
 }
 
+/**
+ * igt_vkms_plane_attach_crtc:
+ * @dev: Target device
+ * @plane_name: Target plane name
+ * @crtc_name: Destination CRTC name
+ *
+ * Attach a plane to a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name)
+{
+	return attach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
+				    VKMS_PIPELINE_ITEM_CRTC, crtc_name);
+}
+
+/**
+ * igt_vkms_plane_detach_crtc:
+ * @dev: Target device
+ * @plane_name: Target plane name
+ * @crtc_name: Destination CRTC name
+ *
+ * Detach a plane from a CRTC. Return true on success and false on error.
+ */
+bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name)
+{
+	return detach_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, plane_name,
+				    crtc_name);
+}
+
 /**
  * igt_vkms_device_add_crtc:
  * @dev: Device to add the CRTC to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index df64bde9d..58896790b 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -27,6 +27,8 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 			     size_t len);
 void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				  size_t len);
+void igt_vkms_get_plane_possible_crtcs_path(igt_vkms_t *dev, const char *name,
+					    char *path, size_t len);
 void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
 			    size_t len);
 void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
@@ -48,6 +50,10 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
+bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name);
+bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
+				const char *crtc_name);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 407310e52..5ee03ed2f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -103,6 +103,20 @@ static void assert_wrong_bool_values(const char *path)
 	}
 }
 
+static bool attach(const char *src_path, const char *dst_path,
+		   const char *link_name)
+{
+	char link_path[PATH_MAX];
+	int ret;
+
+	ret = snprintf(link_path, sizeof(link_path), "%s/%s", src_path, link_name);
+	igt_assert(ret >= 0 && ret < sizeof(link_path));
+
+	ret = symlink(dst_path, link_path);
+
+	return ret == 0;
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -565,6 +579,69 @@ static void test_connector_valid_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: attach-plane-to-crtc
+ * Description: Check that errors are handled while attaching planes to CRTCs.
+ */
+
+static void test_attach_plane_to_crtc(void)
+{
+	igt_vkms_t *dev1;
+	igt_vkms_t *dev2;
+	char plane1[PATH_MAX];
+	char crtc1[PATH_MAX];
+	char connector1[PATH_MAX];
+	char crtc2[PATH_MAX];
+	char dev2_enabled_path[PATH_MAX];
+	bool ok;
+
+	dev1 = igt_vkms_device_create("test_attach_plane_to_crtc_1");
+	igt_assert(dev1);
+
+	dev2 = igt_vkms_device_create("test_attach_plane_to_crtc_2");
+	igt_assert(dev2);
+
+	igt_vkms_device_add_plane(dev1, "plane1");
+	igt_vkms_device_add_crtc(dev1, "crtc1");
+	igt_vkms_device_add_connector(dev1, "connector1");
+	igt_vkms_device_add_crtc(dev2, "crtc2");
+
+	igt_vkms_get_plane_possible_crtcs_path(dev1, "plane1", plane1, sizeof(plane1));
+	igt_vkms_get_crtc_path(dev1, "crtc1", crtc1, sizeof(crtc1));
+	igt_vkms_get_connector_path(dev1, "connector1", connector1, sizeof(connector1));
+	igt_vkms_get_crtc_path(dev2, "crtc2", crtc2, sizeof(crtc2));
+	igt_vkms_get_device_enabled_path(dev2, dev2_enabled_path, sizeof(dev2_enabled_path));
+
+	/* Error: Attach a plane to a connector */
+	ok = attach(plane1, connector1, "connector");
+	igt_assert_f(!ok, "Attaching plane1 to connector1 should fail\n");
+
+	/* Error: Attach a plane to a random file */
+	ok = attach(plane1, dev2_enabled_path, "file");
+	igt_assert_f(!ok, "Attaching plane1 to a random file should fail\n");
+
+	/* Error: Attach a plane to a CRTC from other device */
+	ok = attach(plane1, crtc2, "crtc2");
+	igt_assert_f(!ok, "Attaching plane1 to crtc2 should fail\n");
+
+	/* OK: Attaching plane1 to crtc1 */
+	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	/* Error: Attaching plane1 to crtc1 twice */
+	ok = attach(plane1, crtc1, "crtc1_duplicated");
+	igt_assert_f(!ok, "Error attaching plane1 to crtc1 twice should fail");
+
+	/* OK: Detaching and attaching again */
+	ok = igt_vkms_plane_detach_crtc(dev1, "plane1", "crtc1");
+	igt_assert_f(ok, "Error detaching plane1 from crtc1\n");
+	ok = igt_vkms_plane_attach_crtc(dev1, "plane1", "crtc1");
+	igt_assert_f(ok, "Error attaching plane1 to crtc1\n");
+
+	igt_vkms_device_destroy(dev1);
+	igt_vkms_device_destroy(dev2);
+}
+
 igt_main
 {
 	struct {
@@ -587,6 +664,7 @@ igt_main
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
 		{ "connector-valid-values", test_connector_valid_values },
+		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 	};
 
 	igt_fixture {
-- 
2.48.1

