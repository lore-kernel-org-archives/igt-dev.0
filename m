Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D4C18E7C
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9433D10E7B3;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I3sXBHkH";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C8A10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so3166136f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897433; x=1740502233; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrTuOG2oc+g0poW9DgnwXFrBrziqALme+fFtq3VsDf0=;
 b=I3sXBHkHZ3YBtrkq8sHA8q3ZIjnGnSmNA8Oim7SVynQRWDWT64iXcPWxBiOByqstit
 nDzsgw7i62VX8rBKK5wnUL4gUzf+YEohLAk6dCdFLIU7+FHUvX7oi0lwxxtxd4Zr90S5
 66lTkugrkUNMH5Kh2f5x6cnXlt7rA+cOzNRX1Akmy4zMnBG9+zzx1/euwuYZ92mgq2zL
 gFhZuTJwxOeOD5K/uKn+X0vp6r7aocbkZabiTVOKQnuqtE+gOZGQf4XFUB9RvHdOYuUz
 Yp8W91frWjnTNO4JLC3mtkdESNL9hhXiQZcw8l12ooezMMxX1pOypvqQ6PNA+efa8vQu
 TTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897433; x=1740502233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrTuOG2oc+g0poW9DgnwXFrBrziqALme+fFtq3VsDf0=;
 b=Goz8a+rZULOuuuG4GWl5kwCGMBzk9Du7UPsODg6kyNJQtQjW8X2Ok6Jzqwa9VkuHe5
 AvmV2Kp3JL5o/9svz7s+j6qkxOaerkFkWOPYqFirAT+1eNeS26MTnqYQ+M8mVg6rzV84
 EThq+7rb1FN3v2OvvVPG2SnlKP8KmdRl3Q54IhF4D1lc2T1liT+3PsmCGa4cjfySlrtQ
 KJBi+1kXbRKq1aW/wrG5nYeq+Zy9McwiZqqqhT+jF2/wIoCYJjp0R3d9+SM9MGy9pUpJ
 rGWCevdLUbmrPxG+P5l1KUtz1zs1U1vZzB5epmkYu8kGet7kzByq1vRr9I1/QdsbSpKY
 TJ5w==
X-Gm-Message-State: AOJu0Yw0cVV24XWQmPRhXljNyVIr4ChitLOW3iPMU3AQbaz9cciUMqL+
 QQ6sXWL6aEtdkdwvhxmiyQUd/JbLrZ4ZXiDxzbz+tTTDEIkcum7X3Vl+Qeik
X-Gm-Gg: ASbGncv+q4u/6evCGBgmy3At7GR/Eb2o6lCkuCMU2H4C0onSaYo+zlCmDpxc0fdlRfM
 TgYZ6cA0s/xXlIMhRdkrfose7fr0VpXEuqxXZOFlRWPygzSGOPqMITf2cssxffg6d9ZEkS9yNME
 gejaDpwJBwUxNY3UhMiunXvD3hea7rHGxtfAgVOS37OHq2pbiP4Svn55doxM+lZCzgbhiZeql7L
 RoUsf9Xwb3hlI4nnwi7o80PvcGETFWK+FgCbtySK90QlUcAgt3NmBl/aZOx4WdsV3+SwWJfXrWu
 bD59QTYkYl5H2m+B2w==
X-Google-Smtp-Source: AGHT+IG8DNLbiSu5rycuQK0xRYas9n/yEplA323+3GFWHSt85aM1bm2A3PJIiyvtM5mtyzUWTSScuQ==
X-Received: by 2002:a5d:47cd:0:b0:38f:3cee:a81e with SMTP id
 ffacd0b85a97d-38f3ceeaa08mr9583368f8f.27.1739897433177; 
 Tue, 18 Feb 2025 08:50:33 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:32 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 21/39] lib/vkms: Create VKMS device from static config
Date: Tue, 18 Feb 2025 17:49:53 +0100
Message-ID: <20250218165011.9123-22-jose.exposito89@gmail.com>
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

In order to make the process of creating new VKMS devices as simple as
possible and in a declarative way, create a set of structures
representing a VKMS device configuration and a function that reads them
and applies the configuration.

In addition, add a test using this new function that checks that
creating a device without planes fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 88 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             | 43 +++++++++++++++++++
 tests/vkms/vkms_configfs.c | 40 +++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 1fcb93c94..4c44efec9 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -253,6 +253,94 @@ igt_vkms_t *igt_vkms_device_create(const char *name)
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
index 1ef62125f..79edabe81 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -10,6 +10,8 @@
 
 #include <stdbool.h>
 
+#define VKMS_MAX_PIPELINE_ITEMS	40
+
 /**
  * igt_vkms_t:
  * @path: VKMS root directory inside configfs mounted directory
@@ -20,9 +22,50 @@ typedef struct igt_vkms {
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
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
+igt_vkms_t *igt_vkms_device_create_from_config(igt_vkms_config_t *cfg);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
 void igt_vkms_destroy_all_devices(void);
 
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 87d660fff..47cfa475f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -748,6 +748,45 @@ static void test_enable_no_pipeline_items(void)
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
+		.planes = { {} },
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
@@ -771,6 +810,7 @@ igt_main
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
+		{ "enable-no-planes", test_enable_no_planes },
 	};
 
 	igt_fixture {
-- 
2.48.1

