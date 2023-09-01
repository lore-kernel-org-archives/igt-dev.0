Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9289410E710
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 09:28:29 +0000 (UTC)
From: Marius Vlad <marius.vlad@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 12:28:19 +0300
Message-Id: <20230901092819.16924-5-marius.vlad@collabora.com>
In-Reply-To: <20230901092819.16924-1-marius.vlad@collabora.com>
References: <20230901092819.16924-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/vkms: Add more tests for VKMS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, yixie@chromium.org, seanpaul@chromium.org,
 daniel@ffwll.ch, brpol@chromium.org, igormtorrente@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

This adds four more tests, one that should fail when no primary plane
is created and added to the pipeline, one that creates a device with
multiple overlay and cursor planes, another one that create two outputs,
and tests that disable works.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 lib/igt_vkms.c             |  27 ++++++++
 lib/igt_vkms.h             |   1 +
 tests/vkms/vkms_configfs.c | 132 +++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 7ae8dde55..1128a9328 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -440,6 +440,33 @@ void igt_vkms_enable(igt_vkms_t *device)
 	igt_assert_eq(ret, 0);
 }
 
+/**
+ * igt_vkms_disable:
+ * @device: the vkms device in question
+ *
+ * This would disable the vkms device.
+ *
+ */
+void igt_vkms_disable(igt_vkms_t *device)
+{
+	char enabled_file[VKMS_CARD_OBJECT_DIR_SIZE];
+	int fd, ret;
+
+	memset(enabled_file, 0x0, sizeof(enabled_file));
+	snprintf(enabled_file, sizeof(enabled_file),
+		 "%s/enabled", device->device_dir);
+
+	fd = open(enabled_file, O_WRONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n", enabled_file);
+
+	ret = write(fd, "0", 1);
+	igt_assert_f(ret >= 0, "Unable to write '%s'. Got errno=%d (%s)\n",
+		     enabled_file, errno, strerror(errno));
+
+	ret = close(fd);
+	igt_assert_eq(ret, 0);
+}
+
 /**
  * igt_vkms_connector_connect:
  * @device: the vkms device in question
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 174039ca0..48bdb063f 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -59,6 +59,7 @@ void igt_vkms_device_attach_encoder_to_connector(igt_vkms_t *device,
 						 const char *encoder_name);
 
 void igt_vkms_enable(igt_vkms_t *device);
+void igt_vkms_disable(igt_vkms_t *device);
 void igt_vkms_connector_connect(igt_vkms_t *device, const char *connector_name);
 void igt_vkms_connector_disconnect(igt_vkms_t *device, const char *connector_name);
 bool igt_vkms_is_enabled(igt_vkms_t *device);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 974753318..1d3fa2ec1 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -51,6 +51,105 @@ static void vkms_basic_test(igt_vkms_t *device)
 	igt_assert(igt_vkms_is_enabled(device));
 }
 
+static void vkms_crtc_no_primary_test(igt_vkms_t *device)
+{
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+	igt_vkms_connector_connect(device, "connector");
+
+	igt_vkms_device_attach_encoder_to_connector(device, "connector", "encoder");
+	igt_vkms_device_attach_crtc_to_encoder(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(!igt_vkms_is_enabled(device));
+}
+
+static void vkms_multiple_overlays_test(igt_vkms_t *device)
+{
+	igt_vkms_device_add_plane(device, "primary", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_plane(device, "cursor", DRM_PLANE_TYPE_CURSOR);
+	igt_vkms_device_add_plane(device, "overlay0", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay1", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay2", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay3", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+	igt_vkms_connector_connect(device, "connector");
+
+	igt_vkms_device_attach_plane_to_crtc(device, "primary", "crtc");
+	igt_vkms_device_attach_plane_to_crtc(device, "cursor", "crtc");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay0", "crtc");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay1", "crtc");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay2", "crtc");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay3", "crtc");
+	igt_vkms_device_attach_encoder_to_connector(device, "connector", "encoder");
+	igt_vkms_device_attach_crtc_to_encoder(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+}
+
+static void vkms_multiple_displays_test(igt_vkms_t *device)
+{
+	igt_vkms_device_add_plane(device, "primary0", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_plane(device, "primary1", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_plane(device, "cursor0", DRM_PLANE_TYPE_CURSOR);
+	igt_vkms_device_add_plane(device, "cursor1", DRM_PLANE_TYPE_CURSOR);
+	igt_vkms_device_add_plane(device, "overlay0", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay1", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay2", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay3", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_crtc(device, "crtc0");
+	igt_vkms_device_add_crtc(device, "crtc1");
+	igt_vkms_device_add_encoder(device, "encoder0");
+	igt_vkms_device_add_encoder(device, "encoder1");
+	igt_vkms_device_add_connector(device, "connector0");
+	igt_vkms_connector_connect(device, "connector0");
+	igt_vkms_device_add_connector(device, "connector1");
+	igt_vkms_connector_connect(device, "connector1");
+
+	igt_vkms_device_attach_plane_to_crtc(device, "primary0", "crtc0");
+	igt_vkms_device_attach_plane_to_crtc(device, "cursor0", "crtc0");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay0", "crtc0");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay1", "crtc0");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay2", "crtc0");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay3", "crtc0");
+	igt_vkms_device_attach_encoder_to_connector(device, "connector0", "encoder0");
+	igt_vkms_device_attach_crtc_to_encoder(device, "encoder0", "crtc0");
+
+	igt_vkms_device_attach_plane_to_crtc(device, "primary1", "crtc1");
+	igt_vkms_device_attach_plane_to_crtc(device, "cursor1", "crtc1");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay0", "crtc1");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay1", "crtc1");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay2", "crtc1");
+	igt_vkms_device_attach_plane_to_crtc(device, "overlay3", "crtc1");
+	igt_vkms_device_attach_encoder_to_connector(device, "connector1", "encoder1");
+	igt_vkms_device_attach_crtc_to_encoder(device, "encoder1", "crtc1");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+}
+
+static void disable_device(igt_vkms_t *device)
+{
+	igt_vkms_device_add_plane(device, "primary", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+	igt_vkms_connector_connect(device, "connector");
+
+	igt_vkms_device_attach_plane_to_crtc(device, "primary", "crtc");
+	igt_vkms_device_attach_encoder_to_connector(device, "connector", "encoder");
+	igt_vkms_device_attach_crtc_to_encoder(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+
+	igt_vkms_disable(device);
+	igt_assert(!igt_vkms_is_enabled(device));
+}
 
 igt_main
 {
@@ -72,6 +171,39 @@ igt_main
 		igt_vkms_device_destroy(&device);
 	}
 
+	igt_describe("Registering a CRTC with no primary fails");
+	igt_subtest("no_primary")
+	{
+		igt_vkms_device_create(&device, "no-primary");
+		vkms_crtc_no_primary_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+
+	igt_describe("Can create a device with multiple overlays");
+	igt_subtest("multiple_overlays_device")
+	{
+		igt_vkms_device_create(&device, "multiple-overlays-device");
+		vkms_multiple_overlays_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_describe("Can create a device with multiple displays");
+	igt_subtest("multiple_displays_device")
+	{
+		igt_vkms_device_create(&device, "multiple-displays-device");
+		vkms_multiple_displays_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_describe("Disable the device");
+	igt_subtest("disable_device")
+	{
+		igt_vkms_device_create(&device, "device-disable");
+		disable_device(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
 	igt_fixture
 	{
 		igt_require_vkms();
-- 
2.40.1
