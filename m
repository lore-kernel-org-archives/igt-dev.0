Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8065BC87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3559B10E7FC;
	Thu,  7 Aug 2025 07:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJ1/BSme";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A389E10E0D6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:24 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so4416855e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552783; x=1755157583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FWDj2etHZe+FKDWNFwo/sinl1gmxS+58nvMgRh2K/U=;
 b=lJ1/BSme0ytzmy2LCM8M4Ei6mYQsXFGktXdR8Wnoxfs1/RTESva3B3JuxiO6N6k19t
 TikeldG9LgXZmgusmMasSjpFpdoz8l2X8jBQGaFUc5t8sU0BUlTFSH+adKaV3n7VV6Vn
 d4WF4VtVSsMREeyGRVvxvHQctxxG7LZeSv+QGFQaMjdescLn+XicoWVRpKoWssgYgZwR
 W3pNkkKJKfzIwUerla5ZUZ2Z6UthmFU4FmLEy8kszRcsNypEYnGDn/CY1JHOOiCTDhx2
 EGqDhJxlegnoeuTE7GB/Ee2Tq7qdXS9aGZrdNjW86q+MNxfcCclXdKMEGL89YoMlyVYD
 WK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552783; x=1755157583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FWDj2etHZe+FKDWNFwo/sinl1gmxS+58nvMgRh2K/U=;
 b=Tmvkydwk1kcAXK0Pdot6KlmMhkhJ1fJm9r+Jw3U/FBqLLm/a7Hgd4N/SdmvTSqcMwx
 ckMZOjCzP/6uZSPpZllcOTLZstDyJj2HB9yhkRI2PPSxtC7Mb1lT/BABDvKONLWbnm/V
 ctPdI0g3BtjzqUkNwWhD1h9/VDEphGLjTjoJWu6rf8bEZ7SbC0lZ+ZCZtr/g0Myk/MUz
 5cYSMhWel5NtNfEXL4t0vVyXz4q+0uJvjycqSMOu1Qp9jsSg+kRODIrtkkepvL2i/VqE
 59gwPiGYCZsrW4+SCvQuP/PS+NnBfK5JjSBcfkZoabAth2kSC/mZ7L67/Z7y6JfXBSOO
 b0CA==
X-Gm-Message-State: AOJu0Yy7YPxQx28FptYJcmYKzG/cjfyMflL7k8r3EQCOlNIlyPwUsUHy
 YlzTuxTu9v9u4+zhRNtjWPb5LpJYwDbr9eXLNkzDm2dkHFtVhea+fL19ldmveHjX
X-Gm-Gg: ASbGnctZyAMpkIrWT2LJRnURKhVB+dOSNfkASXviDOX5RINdMjcSpP8WfK6pL7RPwZf
 rIHUvx+w1gSOWsd8g3KGY/N+TYzxGbVXu3rDOBbh+gMQ4DoHiBPWdkT48Pv4+sgj/k8VQG/wGuA
 46h/9TIZywWQwPOmZHtP5emb/TIy9N31Vy8/UaqzuMuJ+eUAjbDqN63CrcMBQ6f22hZbcmJliSu
 P9EkYyAjwMpPG2gpseepUBqXOwnyfpIl6VXQHE2u/tOa6pcrjDPk4FNqM/P5t6vALVLTqaHX7Ts
 eN9/1b0Hg2XECxbBbaf33HbihcDo1IuXyab6CLBU6t56kKpu/16c5hA/rnB3F5yr1jx6mVrQGbi
 p1Zju1Xzm/V2Qtp6+N0w=
X-Google-Smtp-Source: AGHT+IH23jLL25vf5Pft52rSVyWhnKkHBjaNgnizbt/416MB5eNHrb3nxt53pDLQ79MDJSy6pJew9Q==
X-Received: by 2002:a05:600c:1388:b0:459:443e:b180 with SMTP id
 5b1f17b1804b1-459e7098bb8mr49774705e9.8.1754552782623; 
 Thu, 07 Aug 2025 00:46:22 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:21 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 18/41] lib/vkms: Test attaching planes to CRTCs
Date: Thu,  7 Aug 2025 09:45:27 +0200
Message-ID: <20250807074550.6543-19-jose.exposito89@gmail.com>
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

Add helpers to attach and detach planes and CRTCs and a test checking
the different valid and invalid cases.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 120 +++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |   6 ++
 tests/vkms/vkms_configfs.c |  78 ++++++++++++++++++++++++
 3 files changed, 204 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index a86d5e05d..66d4a397d 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -162,6 +162,81 @@ static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
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
@@ -227,6 +302,21 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
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
@@ -528,6 +618,36 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
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
index 596990547..18f2a1068 100644
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
index 55b528a5c..737af8847 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -102,6 +102,20 @@ static void assert_wrong_bool_values(const char *path)
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
@@ -564,6 +578,69 @@ static void test_connector_valid_values(void)
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
@@ -586,6 +663,7 @@ igt_main
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
 		{ "connector-valid-values", test_connector_valid_values },
+		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 	};
 
 	igt_fixture {
-- 
2.50.1

