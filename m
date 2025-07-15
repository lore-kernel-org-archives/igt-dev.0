Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4176C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0210E58F;
	Tue, 15 Jul 2025 10:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4v3efEy";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7CD10E5AF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4560cdf235cso15251035e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575152; x=1753179952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQoh4W5bBPRzrBrQIC01DNSWAn3OhLKajaZcqZlfXOs=;
 b=Q4v3efEygDf4+5dEn5b1Bbvzsp9rv0s7+U4CJQie5DDW/qViH9KBmX3EPyV4TpljMv
 WAiOgnt0xRqXIaqMOxRIf/RQz3YmaV9YC9OWvPdtXAiBUyYr7RFHLDmnKc/Z2z9QBURm
 fSE5mMAaQk67pTIcgWc5EB9DbhZY1Jy3sGwUj9+PtuDFCtS+/wIVKMZC/Affqu6iE/wv
 KujCf+wXx7VEXPgPLjWbaEMxVfjEFCADNTdcw9/NBeeY17PGMauMQzwD9FHv3O/XxJgW
 8bao++pKklZgGxAKVqJil8yixGa8XMjpj55DLIxiR2aynqH2hZ9ZIKzXZKhF30l4+XV/
 cDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575152; x=1753179952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQoh4W5bBPRzrBrQIC01DNSWAn3OhLKajaZcqZlfXOs=;
 b=NH2qYVnDpXebdari0mTRASaT77Tac4EDFaFCVdk6VlNe5gGpfSusrSq9CScGnqShSs
 P9IzO0RsaQyI7haOoGTJKyEWn1IvIHxGfgRQ4C9jrjxxZ8CjxT6jOwTb7nNpOYAnVzyd
 ns2iavJ5ygzFII2jngLo6S5p6bM1E/oENPiAOhfkaskJKZfnbwkRU+twDas7ug7IZyX7
 OsARqFLgLOhbEeKxVxhT+onuAaCY3JFkeHCfs2dDRS1253WRupmYOjDwKXzN9JpXUWBr
 LQJr3qB0CywpArWtvz95hxcsSrgVTtuEzOqeVk9Tk0wiE0tnirXK551hkYObHoKfu6kO
 +9tQ==
X-Gm-Message-State: AOJu0Yw09xxpJ4/EM4pWH3FOhnTVO2wKKqMSvD5PhhMyWU6O0TOV4qy/
 tKXlklM40Z8S9SCuW9xr79M+u/4cTSFImpuHo/6Ie5WwD0n6s7xJzhsxFWHA9g==
X-Gm-Gg: ASbGncv/sXgR0bn/gQFXjeJAwxBy79U3GK7ONzHw6Ka1za44/jL6L3Jgk0/6vAP9mUY
 FvouR903D5FqpY/KhySoljd0d3mFeLnU7wptqABhaINQY5ZfXtBm3egp6aJ4SqCwy7zf9dIXcwz
 TIH5IZUV/i4BcMbrHSEwf+B9vsOIWRIfsQP3WPg2W52/Kid933awlgaG75+j/pAL37Q0Dm4upng
 BWFVjmSzzeO10vOhiQzgH0GFZ7MCKva6kuGl+EGAKTS3Mmz9jkiXngY13negL59IocmQ2WJYtB7
 8a0n3fpbWxavuxmdIS2gxLKiESA413Q9n7wduWIw/h8lrQJwuW1x5XqJEDh64E93z5ZkXeU7J/b
 beEw75al7g+y0BcRIaA==
X-Google-Smtp-Source: AGHT+IHO21BdZxBljwmKz9aZHPwWnVZAnlZu5f9dP92CBXSNEPgdC7fFjW8RJI0Gc5IKnMYnrqedmw==
X-Received: by 2002:a05:600c:a216:b0:450:d386:1afb with SMTP id
 5b1f17b1804b1-45555e4c191mr105397805e9.9.1752575152051; 
 Tue, 15 Jul 2025 03:25:52 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:51 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 37/41] lib/vkms: Test changing enabled device planes
Date: Tue, 15 Jul 2025 12:25:09 +0200
Message-ID: <20250715102513.5636-38-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the plane values can't change
and that deleting it or the attached CRTCs doesn't change the VKMS
device.

Add a function that performs a basic validation checking that the
device created matches the expected one.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             |  24 +++++++
 lib/igt_vkms.h             |   1 +
 tests/vkms/vkms_configfs.c | 143 +++++++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index ccc6910c4..96f13d628 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -194,6 +194,18 @@ static void get_attach_dir_path(igt_vkms_t *dev, enum vkms_pipeline_item item,
 	igt_assert(ret >= 0 && ret < len);
 }
 
+static bool remove_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
+				 const char *name)
+{
+	char path[PATH_MAX];
+	int ret;
+
+	get_pipeline_item_path(dev, item, name, path, sizeof(path));
+
+	ret = rmdir(path);
+	return ret == 0;
+}
+
 static bool attach_pipeline_item(igt_vkms_t *dev,
 				 enum vkms_pipeline_item src_item,
 				 const char *src_item_name,
@@ -699,6 +711,18 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
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
index 1e077caa8..786db224e 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -96,6 +96,7 @@ bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
 void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 bool igt_vkms_plane_attach_crtc(igt_vkms_t *dev, const char *plane_name,
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index ad5d72481..11dea86ed 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -132,6 +132,85 @@ static bool device_exists(const char *name)
 	return find_device(name, &card);
 }
 
+static void assert_device_config(igt_vkms_config_t *cfg)
+{
+	struct igt_device_card card;
+	drmModeResPtr res;
+	drmModePlaneResPtr plane_res;
+	drmModeConnectorPtr connector_res;
+	igt_vkms_crtc_config_t *crtc;
+	igt_vkms_connector_config_t *connector;
+	bool found;
+	int n_planes = 0;
+	int n_crtcs = 0;
+	int n_encoders = 0;
+	int n_connectors = 0;
+	int n_connector_status_cfg[4] = {0};
+	int n_connector_status_drm[4] = {0};
+	int fd;
+
+	found = find_device(cfg->device_name, &card);
+	igt_assert_f(found, "Device '%s' not found\n", cfg->device_name);
+
+	fd = igt_open_card(&card);
+	igt_assert_f(fd >= 0, "Error opening device '%s' at path '%s'\n",
+		     cfg->device_name, card.card);
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
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -1493,6 +1572,69 @@ static void test_enable_too_many_connectors(void)
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
@@ -1533,6 +1675,7 @@ igt_main
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 		{ "enable-no-connectors", test_enable_no_connectors },
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
+		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.0

