Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A72C87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810DF10E7FD;
	Thu,  7 Aug 2025 07:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Npd0QuxN";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F091D10E804
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so5928105e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552788; x=1755157588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCCVbfXoya88s38PN80GmOvLBX8CaZ4L/A36JIe9GEk=;
 b=Npd0QuxN2D5KPuB9a8mvK7DjojyMBcrX/ShTMrBD2IDFdb0ZZAUNdlSj9QACm4ORJ2
 CsKfpynh4kZ/89JGdCaJrvtyhekyMrgNISGm7rwtZazb0bBQNf4KAFP2t31BOP+3kSJU
 PAI4mka0GlzTKXTKH6wu9ipOv0z5Vw9Y4pmc7MdjftPW8fTlm1/NybAjtaNnEeiqVXQi
 yv7zaLvNpQ07g3fysyfOovr54shFxvI3U8xsTsz71lGKKk8844jGZ7dAtaHDsGGkLqLA
 QkgAfAViWPO1BFWC21UeybAj0V341e5p8CjKnKw4tB+VaVPS+vCiTwQ+RmCTac6IkDRn
 YbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552788; x=1755157588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCCVbfXoya88s38PN80GmOvLBX8CaZ4L/A36JIe9GEk=;
 b=LV8WCVcKfLxvTWd1rmN5TjO4E+7UGaIC2K02uuboJBle/dNHOQU/+N1h2+txH5KwmV
 0qj/rVhuMVfGzqP0mY2d9pvLhwoh7gNYhMdRgB+lsN6Ii4jcpK6uN2sOEzSZn8dVKyFf
 nzW6k72/FqcLULCnMvVaxtBPsuVL5teUmyZ67I6Xi/LG82aHyEc675eC9n0ZRqOZyOTU
 vydKYK5t2CziI/wPDvf4NdHexKuDk83ptGiqyr5UDfEUDqxfdig2N4dikbNRWvTcPpHW
 +RA3MbsG2HJmWBnFr833rBXD3PC7W6IA0IqIpzQ9dCINruogaJzGLleDf1H8hjHdHSoO
 0JiQ==
X-Gm-Message-State: AOJu0YwUsb9VscEELEWuzDJUy4sfwNkDhYcEsARD2upB0nZFJVWUieNl
 k+b+1tKkmRbN9veZIlxLZ8ZipvYb30n+dI0gBq1wUB8ZqLi5zAfufJRH0kf4j1JZ
X-Gm-Gg: ASbGncuAGI/SzaqLjUbqApc9qmFgB+CVozD+l3jXg93CC4nHGhMzrr6el0m4it3NJaH
 KwkuGHSf9+8+KnLPf1EMI9UrzJYlooHbR0vlpn8JMaDPyZCDXAFcY3xuKFJTNjtU8/VNoiG3Zhd
 QWOAgwjeAuCUOFHHozFdaIeoY1+PP0pj3i7A8cgLmXikoeRVoBGTDGsRt+vDImBI3/zk+FjH2bK
 NrIi4Dbdq5ZuYlntj2c8M91O45L4HxAyaHAKW1rEvcXyEDrOfV9EGQaZJ6AHyQGbo/se6ALiLtV
 OiUx4Bo4v/oZb6tfiG0gwpi8xnQhABexCf9j7y3OqTtFCGwFaLMH3JkajVzEvrkbgijow31bWGD
 /k1PnB4tkSlM86IOWcio=
X-Google-Smtp-Source: AGHT+IHiBkOJaWBof0rhtwnrsRg+EefRHpCQpP7NYWBbw/1AAfEimEcz9OMSMjTjSWy62zQgjHsfKw==
X-Received: by 2002:a05:600c:b8d:b0:458:6733:fb43 with SMTP id
 5b1f17b1804b1-459e70d810amr51854645e9.19.1754552788010; 
 Thu, 07 Aug 2025 00:46:28 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:27 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 23/41] lib/vkms: Create VKMS device from static config
Date: Thu,  7 Aug 2025 09:45:32 +0200
Message-ID: <20250807074550.6543-24-jose.exposito89@gmail.com>
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
index 0897c77ab..30f7c289f 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -465,6 +465,94 @@ igt_vkms_t *igt_vkms_device_create(const char *name)
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
index 62187a8aa..7de3171cb 100644
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
index 2156b59ca..551b7610a 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -811,6 +811,45 @@ static void test_enable_no_pipeline_items(void)
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
@@ -837,6 +876,7 @@ igt_main
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
+		{ "enable-no-planes", test_enable_no_planes },
 	};
 
 	igt_fixture {
-- 
2.50.1

