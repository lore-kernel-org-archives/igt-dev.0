Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F14C35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A1A10E90C;
	Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WXXa2TgE";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DC710E912
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso11890985e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887227; x=1742492027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FySwZy/nP9mbcahTTGIKIIRaDs4VfUVYAf6WoAKYSZQ=;
 b=WXXa2TgE0MOqI4ao7da6LGGezs/x7PG17ky8DKugSjBzK9/GHSDnSkfmOwKksMGPda
 TuizudiTeorHgnIHG8vDPv41bnFyfgheW+02jBzeC0sG7JaysaeZ+RL0Yznob5tEzozO
 Dv3qGUixnQVdRL1thO+PZRYh4IwcwM2ycZkCzZeOvOjtvpULIeVl9mbuMOSW67KYdBn9
 KM8URdcSmQoh/vAMPTH4eJaF6OQV2eJl3VwcT1zO0EarhmueerOmlXs8lVAxXiOM0aPq
 ZVTDbvZpoqEy05NOBLQj/WPgW5fWTKlZeXgOr+NnqjDZIHzG2Ruz5AyH7JCFkGjLUMwA
 AzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887227; x=1742492027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FySwZy/nP9mbcahTTGIKIIRaDs4VfUVYAf6WoAKYSZQ=;
 b=BYHuLryzfjdFk83zuklhv4hg1ZCIbH/dhIbt/uC29bl4zJV/jwmWtU7kqwbEkC47TK
 h5OZD7iyevmlRwikUOtu/6JwBTLRhTuipyQmdCgYbhhwOWbGHygZxjH3uddCCd8Eye4I
 U74bF0ERK3/Cc5mMV+5K8S1HBn09WCGZcy2qHmxApbVVwkXV7npl03gaXAnehUW0eqLk
 xRWGsTARkF0YTyYcIqYDlkYeLfKDeUiQoWlf2HHfbMfI/xRYJvjrwUypQU5qpQl+hgpv
 tUYE7DFtPBwhbKiZ0Vs01oq6OQ2Hi4ij3cPMSRilQL8rj/y9FSPMKOsxRBdESnad2p7i
 2XKQ==
X-Gm-Message-State: AOJu0Yx1VE6weDx6aaltcFyf2fCzsU0I8IKPoxG/huoSxM/oqriZEdwT
 JWcq1X9LW4h+kXfH5ZQDPQP9A6vL+5CSGkGAkL1w+dMt30rbrmzJZC+9JiY6
X-Gm-Gg: ASbGnctT6jicumQtJi5dt5jZml1HCDJiwvpyjp6v5T/6E/C4YrQSzbZ4TonRRcoPoxs
 lZhMTAktYLYvQ+5LqWeyuN2DgrPPyNm2caUxpBJsYzpEHsRdIT6HGh5ltcndMNWx6MaSy4whgS9
 LdROUqfsgpw7pi4rINMKsffZhbbeBzSNLq8P3wk7T7dd9TxHN6gJ1lrBw2dT5TfhqVs9TSLeLya
 iorjz9vZ28qvvP5EltKIyfHcpVhs1L+ScdG5scCFz8Et9hbXyjGRsqJXAheqYmgqQUts2or6qS5
 HLUYJ+RckCZXFPwhJ4QtWIX/g4i9ccLYxITM9IgaaDiF
X-Google-Smtp-Source: AGHT+IF6mZizSXKdju+WPZTZnwp5bR1ppmKf3pg++YtVkGp/m2HbENnQnhDSPAgD+wlPNEIeJ8IbFA==
X-Received: by 2002:a05:600c:314f:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43d1d8b121amr5092635e9.15.1741887227386; 
 Thu, 13 Mar 2025 10:33:47 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 25/43] lib/vkms: Create VKMS device from static config
Date: Thu, 13 Mar 2025 18:33:00 +0100
Message-ID: <20250313173318.5818-26-jose.exposito89@gmail.com>
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
2.48.1

