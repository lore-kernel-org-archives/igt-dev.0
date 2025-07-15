Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A61C83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02E10E5A7;
	Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HkEoZGnq";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F45F10E592
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:43 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b5e6bfb427so2732219f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575141; x=1753179941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NrlF4KvoqYw2xTnyiKGH9jouZNGCYdrKF00T+X/Q8eg=;
 b=HkEoZGnqTslp2ZNfbrPlIqqX5v44BY9AqC1Odut9yaPIR3ZGkVLrcGLi+Ug9ZxyTcQ
 I0+Vy5fT4VOcrBpqNcYSEVsCI/70QM0dcm5m8/JUBt+8cjFriuJjf3WA7Pp3NKUvd86f
 q/Bx9jAh7leaU0Rg+JVjl/apO1AtDZpp9vHDELne3S+ndGoD7P9XyTvzwuwEL4BsAhjd
 FZJyLgVqzq+FBMfUd5+yTpGCfEe1pBcLCdcWPCapQO58RN6qjGbetwa4l6Bk/OwSXCNo
 EpGeHT8T1sQbuCSo+ym51ZJC1VQGvvgyjNuOjC/++xxOFpFswkYfVoNEL4+CD85nE7Ck
 18Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575141; x=1753179941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NrlF4KvoqYw2xTnyiKGH9jouZNGCYdrKF00T+X/Q8eg=;
 b=siz/FtIAT7cXD0icGVuN8pSdBMGS9s+5mp4BbskOe+u71tIwNnyz7+YOEl4ZOlo/UF
 wXCDMrpIKUYF5DS0h1LbjynlaXDrXleJhW5ceXKXNhwi24ukAsRuJZ4eH19eh42zPIoa
 UCH7Gesgh3eGQH1NXcGwvq6RNTS0hb3gssL4F4e94F9ACdFmKV8tl8/KUuo4wy3gqEEj
 5ZmTfftm2g5yGzTP47MgPA3abYt0YlbvK03CP1n4B83WkkREhcAp+OTwFjTI1cEyV5pS
 utT4/fF3We95qoxKgUFksor7o40xZKwLfasVeNM0MuBHO2+FN2qS7P3xFNVk3aBp29eC
 i+gg==
X-Gm-Message-State: AOJu0Yz+NWXxnkSGSZvEjOEJiWrPaR/8GDKzWDhcn+pF2kZAVH50hyK8
 T1QtHIhHytlmMT2cZaqmbxKvoauIn5BoFfIZ6UvbnZHlss/Gb7swly/PutDwsA==
X-Gm-Gg: ASbGncvdV0DaCR2EWEMVqjvLbwfZ3BJioAt2VHEM2oP+Ko+no4pDzjLIYp1H6ooCahH
 NKVxG97oOwllKoq5dioUWKhQTTv4GIMU2EHukteGzwv4SvpnNnQU8E0yp21zlXIng9UursO7wbU
 EAXeF+bDMC4OZiuQrIzxPshBfUDB8ZcggtqC2ooA3A+pu5ZNw6+m+jagufzfFF9+wvRJZUtru5K
 +kMcanKDM9Zkxf/jJyrvMIMvP8udY08EoElm0CyDql4xLOeRxyhMEi+ol0xCPmnUq1sVq+HMAw8
 Bo7j85GTe3gFKFDMuaEVBl+xzsDHH+u+7LcUIFpcVuNWntr3tG+4FyvS8Nh1vHVRc3StHNtBPKM
 i/qEIeRs50o8WWfaiOQ==
X-Google-Smtp-Source: AGHT+IGTRfrWujfOMRE5HC6VkVyACi2OWVtbGhdhny2zcUblVLF64ANJL5utx9sLSZ+5fIzz1SPWdw==
X-Received: by 2002:a05:6000:24c6:b0:3a3:6991:dcbb with SMTP id
 ffacd0b85a97d-3b5f187a48cmr12148531f8f.12.1752575141428; 
 Tue, 15 Jul 2025 03:25:41 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 23/41] lib/vkms: Create VKMS device from static config
Date: Tue, 15 Jul 2025 12:24:55 +0200
Message-ID: <20250715102513.5636-24-jose.exposito89@gmail.com>
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

In order to make the process of creating new VKMS devices as simple as
possible and in a declarative way, create a set of structures
representing a VKMS device configuration and a function that reads them
and applies the configuration.

In addition, add a test using this new function that checks that
creating a device without planes fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 88 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             | 43 +++++++++++++++++++
 tests/vkms/vkms_configfs.c | 40 +++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 2cd78fc95..ccc6910c4 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -466,6 +466,94 @@ igt_vkms_t *igt_vkms_device_create(const char *name)
 	return dev;
 }
 
+/**
+ * igt_vkms_device_create_from_config:
+ * @cfg: Device configuration
+ *
+ * Create a VKMS device and set all the parameters specified by the
+ * configuration.
+ */
+igt_vkms_t *igt_vkms_device_create_from_config(igt_vkms_config_t *cfg)
+{
+	igt_vkms_t *dev;
+	igt_vkms_plane_config_t *plane;
+	igt_vkms_crtc_config_t *crtc;
+	igt_vkms_encoder_config_t *encoder;
+	igt_vkms_connector_config_t *connector;
+	const char *name;
+	int n, i;
+
+	igt_debug("Creating device from configuration:\n");
+	igt_debug("\t- Device name: %s\n", cfg->device_name);
+
+	dev = igt_vkms_device_create(cfg->device_name);
+	if (!dev)
+		return NULL;
+
+	for (n = 0; (crtc = &cfg->crtcs[n])->name; n++) {
+		igt_debug("\t- CRTC %d:\n", n);
+		igt_debug("\t\t- name: %s\n", crtc->name);
+		igt_debug("\t\t- writeback: %d\n", crtc->writeback);
+
+		igt_vkms_device_add_crtc(dev, crtc->name);
+		igt_vkms_crtc_set_writeback_enabled(dev, crtc->name,
+						    crtc->writeback);
+	}
+
+	for (n = 0; (plane = &cfg->planes[n])->name; n++) {
+		igt_debug("\t- Plane %d:\n", n);
+		igt_debug("\t\t- name: %s\n", plane->name);
+		igt_debug("\t\t- type: %d\n", plane->type);
+		igt_debug("\t\t- possible_crtcs:\n");
+
+		igt_vkms_device_add_plane(dev, plane->name);
+		igt_vkms_plane_set_type(dev, plane->name, plane->type);
+
+		for (i = 0; (name = plane->possible_crtcs[i]); i++) {
+			igt_debug("\t\t\t- %s\n", name);
+
+			igt_vkms_plane_attach_crtc(dev, plane->name, name);
+		}
+	}
+
+	for (n = 0; (encoder = &cfg->encoders[n])->name; n++) {
+		igt_debug("\t- Encoder %d:\n", n);
+		igt_debug("\t\t- name: %s\n", encoder->name);
+		igt_debug("\t\t- possible_crtcs:\n");
+
+		igt_vkms_device_add_encoder(dev, encoder->name);
+
+		for (i = 0; (name = encoder->possible_crtcs[i]); i++) {
+			igt_debug("\t\t\t- %s\n", name);
+
+			igt_vkms_encoder_attach_crtc(dev, encoder->name, name);
+		}
+	}
+
+	for (n = 0; (connector = &cfg->connectors[n])->name; n++) {
+		if (connector->status == 0)
+			connector->status = DRM_MODE_CONNECTED;
+
+		igt_debug("\t- Connector %d:\n", n);
+		igt_debug("\t\t- name: %s\n", connector->name);
+		igt_debug("\t\t- status: %d\n", connector->status);
+		igt_debug("\t\t- possible_encoders:\n");
+
+		igt_vkms_device_add_connector(dev, connector->name);
+		igt_vkms_connector_set_status(dev, connector->name,
+					      connector->status);
+
+		for (i = 0; (name = connector->possible_encoders[i]); i++) {
+			igt_debug("\t\t\t- %s\n", name);
+
+			igt_vkms_connector_attach_encoder(dev, connector->name,
+							  name);
+		}
+	}
+
+	return dev;
+}
+
 static int detach_pipeline_items(const char *path, const struct stat *info,
 				 const int typeflag, struct FTW *pathinfo)
 {
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 42134c82e..1e077caa8 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -10,6 +10,8 @@
 
 #include <stdbool.h>
 
+#define VKMS_MAX_PIPELINE_ITEMS	40
+
 /**
  * igt_vkms_t:
  * @path: VKMS root directory inside configfs mounted directory
@@ -20,6 +22,46 @@ typedef struct igt_vkms {
 	char *path;
 } igt_vkms_t;
 
+typedef struct igt_vkms_crtc_config {
+	const char *name;
+	bool writeback; /* Default: false */
+} igt_vkms_crtc_config_t;
+
+typedef struct igt_vkms_plane_config {
+	const char *name;
+	int type; /* Default: DRM_PLANE_TYPE_OVERLAY */
+	const char *possible_crtcs[VKMS_MAX_PIPELINE_ITEMS];
+} igt_vkms_plane_config_t;
+
+typedef struct igt_vkms_encoder_config {
+	const char *name;
+	const char *possible_crtcs[VKMS_MAX_PIPELINE_ITEMS];
+} igt_vkms_encoder_config_t;
+
+typedef struct igt_vkms_connector_config {
+	const char *name;
+	int status; /* Default: DRM_MODE_CONNECTED */
+	const char *possible_encoders[VKMS_MAX_PIPELINE_ITEMS];
+} igt_vkms_connector_config_t;
+
+/**
+ * igt_vkms_config_t:
+ * @device_name: Device name
+ * @planes: NULL terminated list of plane configurations
+ * @crtcs: NULL terminated list of CRTC configurations
+ * @encoders: NULL terminated list of encoders configurations
+ * @connectors: NULL terminated list of connector configurations
+ *
+ * Structure used to create a VKMS device from a static configuration.
+ */
+typedef struct igt_vkms_config {
+	const char *device_name;
+	igt_vkms_plane_config_t planes[VKMS_MAX_PIPELINE_ITEMS];
+	igt_vkms_crtc_config_t crtcs[VKMS_MAX_PIPELINE_ITEMS];
+	igt_vkms_encoder_config_t encoders[VKMS_MAX_PIPELINE_ITEMS];
+	igt_vkms_connector_config_t connectors[VKMS_MAX_PIPELINE_ITEMS];
+} igt_vkms_config_t;
+
 void igt_require_vkms_configfs(void);
 
 void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
@@ -46,6 +88,7 @@ void igt_vkms_get_connector_possible_encoders_path(igt_vkms_t *dev,
 						   size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
+igt_vkms_t *igt_vkms_device_create_from_config(igt_vkms_config_t *cfg);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
 void igt_vkms_destroy_all_devices(void);
 
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c2cb9dbc0..355f8b72a 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -812,6 +812,45 @@ static void test_enable_no_pipeline_items(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-planes
+ * Description: Try to enable a VKMS device without adding planes and test that
+ *              it fails.
+ */
+
+static void test_enable_no_planes(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = { },
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
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -838,6 +877,7 @@ igt_main
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
+		{ "enable-no-planes", test_enable_no_planes },
 	};
 
 	igt_fixture {
-- 
2.50.0

