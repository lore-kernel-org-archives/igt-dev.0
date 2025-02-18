Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34938C021BB
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381AE10E7B0;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZQiTEsYS";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C2310E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso3724663f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897447; x=1740502247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAMyLkSHPdCfTsP7PNQUABAmvPiCO6DAhajXmTz/3BA=;
 b=ZQiTEsYSPEaxscfHzMd0z/Miej9jlZt20x1JMUdWVarTnk7gw+8vIVXN1HWeib3E7C
 2x8u4sZQ+bJn4sbZGnaqiZ1yqSIUdJV02oX7eNrg4ICGRjqkEf+A9Lz/ku9UK9Jb7wgT
 pG5cCnOMckz+eRLofX1e7xqhGc6kSO0+XsPWWwcvL3yAAA7/3aqlAd4wVTSUEAmimwIK
 SnMwfv3KP4NSK3bV72MJVPy8qwmEUzAdJIkqerVu4kysXr0c2FFHeA9uzqocuVr+8jHM
 OnrMbc8qVkiFEE6etFUPjuegz8n42UduHPEbM2G93ZeArT6rvDWsiIp/79rjQ2gy/qVI
 lIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897447; x=1740502247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAMyLkSHPdCfTsP7PNQUABAmvPiCO6DAhajXmTz/3BA=;
 b=EGE3UcuucTOGiAC8CvthN6TuqIfrpYg5ZipBzI83xoxUKQ6bXagLofGkQtsFeZ/cRp
 +WlIvCjRjuXwHxdT+pOhGrVMozuXvGI78ztoD3DG6mCvZEYt5ozjXYOGPDMvlT0zt7E4
 NjmKtMG447TmdrctFmkEW7QDsydUbzhNo4pyv2iJut2JVKJt0EbuabqVq04KYQSe3q3L
 94ThTLvK6zwbPPneu2avP+b9DKvgwo0ruV89bd739IKXqUr8CfYjzrRDF5xkbEBDn3V/
 6lY7ANQEInxsDKD/ya0tuaqhIunv6rhDtWo70th+XqjzOS5OI/sVpkyCvhM+8JuR4Fuj
 l2Qg==
X-Gm-Message-State: AOJu0YzS4aoLvQ8KDOxvShaIB3OQHlo0bMXJNWyPGOi1QR3X2IhJmLkz
 ZBuaklnh9h9+bEupGN5E2xRoO63UeQtdzQN7GBp+z0FqIkToe8X15uClVRnu
X-Gm-Gg: ASbGncsK4ftswrzzNaX6n5EvabpriRD0h/4uWC+rKcWxOcNp+P0jBf55yc3SBDrqeNC
 izOu0zOlgD/DV4hbFWHgiAw08Oo2PVHyzfycPc7hLm2GR+b1WeoPbihvMCnh6P8CyiLFyMdF62d
 n/sxQHCzq5ri6rhhdy1F2/8UrT/b4Ry9fk50eU7jKZ5KM5UIpbMkQ1B6exLTU9PvG0ViIX1mnzi
 O1GDEOytrmUk0MiNeBaREijUdsoJVwpU5fjbMtBf+3pr68n272OSkJtj/9GFRmeCaetXjFbo0sX
 aRdeHfvvVyHeJX+6pw==
X-Google-Smtp-Source: AGHT+IHSCF85lZ6IsA3VmTmfgvltcwt62waCf9R+WYuQuc1O8Lv/G2P41mi7EbFltd9IKfF5leJwaQ==
X-Received: by 2002:a05:6000:1a86:b0:38f:2ddd:a1bb with SMTP id
 ffacd0b85a97d-38f587813a0mr178822f8f.8.1739897447393; 
 Tue, 18 Feb 2025 08:50:47 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 35/39] lib/vkms: Test changing enabled device planes
Date: Tue, 18 Feb 2025 17:50:07 +0100
Message-ID: <20250218165011.9123-36-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the plane values can't change
and that deleting it or the attached CRTCs doesn't change the VKMS
device.

Add a function that performs a basic validation checking that the
device created matches the expected one.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             |  27 +++++++
 lib/igt_vkms.h             |   1 +
 tests/vkms/vkms_configfs.c | 147 +++++++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 4c44efec9..3dab7a823 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -152,6 +152,21 @@ static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
 		     path, errno, strerror(errno));
 }
 
+static bool remove_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
+				 const char *name)
+{
+	const char *item_dir_name;
+	char path[PATH_MAX];
+	int ret;
+
+	item_dir_name = get_pipeline_item_dir_name(item);
+	snprintf(path, sizeof(path), "%s/%s/%s", dev->path, item_dir_name,
+		 name);
+
+	ret = rmdir(path);
+	return ret == 0;
+}
+
 static bool attach_pipeline_item(igt_vkms_t *dev,
 				 enum vkms_pipeline_item src_item,
 				 const char *src_item_name,
@@ -474,6 +489,18 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
 }
 
+/**
+ * igt_vkms_device_remove_plane:
+ * @dev: Device to remove the plane from
+ * @name: Plane name
+ *
+ * Remove an existing plane from the VKMS device.
+ */
+bool igt_vkms_device_remove_plane(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
+}
+
 /**
  * igt_vkms_plane_get_type:
  * @dev: Device the plane belongs to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 79edabe81..03f9cb339 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -73,6 +73,7 @@ bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
 void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 5a5f85ef3..066911715 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -144,6 +144,89 @@ static bool device_exists(const char *name)
 	return exists;
 }
 
+static void assert_device_config(igt_vkms_config_t *cfg)
+{
+	drmDevicePtr devices[64];
+	drmDevicePtr dev;
+	drmModeResPtr res;
+	drmModePlaneResPtr plane_res;
+	drmModeConnectorPtr connector_res;
+	igt_vkms_crtc_config_t *crtc;
+	igt_vkms_connector_config_t *connector;
+	int n_devices;
+	int n_planes = 0;
+	int n_crtcs = 0;
+	int n_encoders = 0;
+	int n_connectors = 0;
+	int n_connector_status_cfg[4] = {0};
+	int n_connector_status_drm[4] = {0};
+	int fd;
+
+	n_devices = drmGetDevices(devices, ARRAY_SIZE(devices));
+
+	dev = find_device(cfg->device_name, devices, n_devices);
+	igt_assert_f(dev, "Device '%s' not found\n", cfg->device_name);
+
+	fd = open(dev->nodes[DRM_NODE_PRIMARY], O_RDONLY);
+	igt_assert_f(fd >= 0, "Error opening device '%s' at path '%s'\n",
+		     cfg->device_name, dev->nodes[DRM_NODE_PRIMARY]);
+	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1),
+		     "Error setting DRM_CLIENT_CAP_UNIVERSAL_PLANES\n");
+	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1),
+		     "Error setting DRM_CLIENT_CAP_ATOMIC\n");
+	igt_assert_f(!drmSetClientCap(fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1),
+		     "Error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+
+	res = drmModeGetResources(fd);
+	igt_assert_f(res, "Error getting resources\n");
+	plane_res = drmModeGetPlaneResources(fd);
+	igt_assert_f(plane_res, "Error getting plane resources\n");
+
+	for (int n = 0; (&cfg->planes[n])->name; n++)
+		n_planes++;
+
+	for (int n = 0; (crtc = &cfg->crtcs[n])->name; n++) {
+		n_crtcs++;
+
+		if (crtc->writeback) {
+			n_encoders++;
+			n_connectors++;
+			n_connector_status_cfg[DRM_MODE_UNKNOWNCONNECTION]++;
+		}
+	}
+
+	for (int n = 0; (&cfg->encoders[n])->name; n++)
+		n_encoders++;
+
+	for (int n = 0; (connector = &cfg->connectors[n])->name; n++) {
+		n_connectors++;
+		n_connector_status_cfg[connector->status]++;
+	}
+
+	for (int n = 0; n < res->count_connectors; n++) {
+		connector_res = drmModeGetConnectorCurrent(fd,
+							   res->connectors[n]);
+		n_connector_status_drm[connector_res->connection]++;
+		drmModeFreeConnector(connector_res);
+	}
+
+	igt_assert_eq(n_planes, plane_res->count_planes);
+	igt_assert_eq(n_crtcs, res->count_crtcs);
+	igt_assert_eq(n_encoders, res->count_encoders);
+	igt_assert_eq(n_connectors, res->count_connectors);
+	igt_assert_eq(n_connector_status_cfg[DRM_MODE_CONNECTED],
+		      n_connector_status_drm[DRM_MODE_CONNECTED]);
+	igt_assert_eq(n_connector_status_cfg[DRM_MODE_DISCONNECTED],
+		      n_connector_status_drm[DRM_MODE_DISCONNECTED]);
+	igt_assert_eq(n_connector_status_cfg[DRM_MODE_UNKNOWNCONNECTION],
+		      n_connector_status_drm[DRM_MODE_UNKNOWNCONNECTION]);
+
+	drmModeFreePlaneResources(plane_res);
+	drmModeFreeResources(res);
+	close(fd);
+	drmFreeDevices(devices, n_devices);
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -1414,6 +1497,69 @@ static void test_enable_too_many_connectors(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-plane-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the plane values can't
+ *              change and that deleting it or the attached CRTCs doesn't change
+ *              the VKMS device.
+ */
+
+static void test_enabled_plane_cannot_change(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0"},
+			},
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0", "encoder1" },
+			},
+		},
+	};
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Try to change values */
+	igt_vkms_plane_set_type(dev, "plane0", DRM_PLANE_TYPE_OVERLAY);
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_PRIMARY);
+
+	igt_assert(!igt_vkms_plane_attach_crtc(dev, "plane0", "crtc1"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_plane_detach_crtc(dev, "plane0", "crtc0"));
+	igt_assert(igt_vkms_device_remove_plane(dev, "plane0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1451,6 +1597,7 @@ igt_main
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 		{ "enable-no-connectors", test_enable_no_connectors },
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
+		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.48.1

