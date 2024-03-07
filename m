Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC178C54798
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 19:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411B710ED94;
	Thu,  7 Mar 2024 19:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="CsCd0rCH";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545BB1132FC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 19:41:35 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TrKRy72sbz9tkS;
 Thu,  7 Mar 2024 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709840495; bh=QW3+86mskIm+LV6jbthtQl4JwfEnO2Y7IPwy8ZZHOdQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CsCd0rCHXTZsgKroxHIbDnPzzcdQIfVAgNTYnFQNwJnpyLn6CbAknZmYNBKpWEXWH
 QtIUb944Wp/nDVCuHWSr1kwERp7AyYuJAmRqm9FrJciVquCXwSyM89rEi7hunF9FoT
 pLqC1QDf0Q/eS9Ehioo+XPb+yrstvlStsCKhREXg=
X-Riseup-User-ID: C369D8506854EB1A1A9CFBD1248BC062958408B44151928C21E3219A9A5255A1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TrKRw26QTzJtZV;
 Thu,  7 Mar 2024 19:41:32 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 07 Mar 2024 16:41:08 -0300
Subject: [PATCH i-g-t v3 6/7] benchmarks/kms_fb_stress: Test every possible
 format combinations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240307-kms_fb_stress-dev-v3-6-d5b948a541be@riseup.net>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
In-Reply-To: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

After some discussion[1], we realized that it would be good for the
kms_fb_stress to test all possible combinations of properties in a single
run. Currently, we only manage the formats of each plane.

So, test every possible format combinations.

[1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 67 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index d3823908f131..deee9d557175 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -3,6 +3,8 @@
  * Copyright © 2024 Arthur Grillo
  */
 
+#include <stdint.h>
+
 #include "igt.h"
 
 #define FRAME_COUNT 100
@@ -35,6 +37,8 @@ struct data_t {
 	int fd;
 	igt_display_t display;
 	igt_output_t *wb_output;
+	uint32_t *wb_formats;
+	size_t wb_fmt_count;
 	drmModeModeInfo *mode;
 	struct kms_t kms;
 };
@@ -117,6 +121,26 @@ static igt_output_t *find_wb_output(struct data_t *data)
 	return NULL;
 }
 
+static void get_wb_formats(struct data_t *data)
+{
+	drmModePropertyBlobRes *blob = NULL;
+	uint64_t blob_id;
+	int ret;
+
+	ret = kmstest_get_property(data->fd,
+				   data->wb_output->config.connector->connector_id,
+				   DRM_MODE_OBJECT_CONNECTOR,
+				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
+				   NULL, &blob_id, NULL);
+	if (ret)
+		blob = drmModeGetPropertyBlob(data->fd, blob_id);
+
+	data->wb_formats = blob->data;
+	data->wb_fmt_count = blob->length / 4;
+
+	igt_assert_f(blob, "Could not get writeback formats");
+}
+
 static void set_wb_pipe(struct data_t *data)
 {
 	enum pipe pipe = PIPE_NONE;
@@ -228,28 +252,24 @@ static struct kms_t default_kms = {
 			.x = 101, .y = 0,
 			.width = 3639, .height = 2160,
 		},
-		.format = DRM_FORMAT_XRGB8888,
 	},
 	.overlay_a = {
 		.rect = {
 			.x = 201, .y = 199,
 			.width = 3033, .height = 1777,
 		},
-		.format = DRM_FORMAT_XRGB16161616,
 	},
 	.overlay_b = {
 		.rect = {
 			.x = 1800, .y = 250,
 			.width = 1507, .height = 1400,
 		},
-		.format = DRM_FORMAT_ARGB8888,
 	},
 	.writeback = {
 		.rect = {
 			.x = 0, .y = 0,
 			// Size is to be determined at runtime
 		},
-		.format = DRM_FORMAT_XRGB8888,
 	},
 };
 
@@ -257,6 +277,9 @@ static struct kms_t default_kms = {
 igt_simple_main
 {
 	struct data_t data = {0};
+	size_t primary_fmt_count = 0;
+	size_t overlay_a_fmt_count = 0;
+	size_t overlay_b_fmt_count = 0;
 
 	data.kms = default_kms;
 
@@ -276,6 +299,7 @@ igt_simple_main
 	data.wb_output = find_wb_output(&data);
 	igt_require(data.wb_output);
 	set_wb_pipe(&data);
+	get_wb_formats(&data);
 
 	set_crtc_size(&data);
 
@@ -290,7 +314,40 @@ igt_simple_main
 								  DRM_PLANE_TYPE_OVERLAY, 1);
 	igt_assert(data.kms.overlay_b.base != NULL);
 
-	stress_driver(&data);
+	primary_fmt_count = data.kms.primary.base->format_mod_count;
+	overlay_a_fmt_count = data.kms.overlay_a.base->format_mod_count;
+	overlay_b_fmt_count = data.kms.overlay_b.base->format_mod_count;
+
+	for (size_t i = 0;
+	     i < primary_fmt_count *
+		 overlay_a_fmt_count *
+		 overlay_b_fmt_count *
+		 data.wb_fmt_count;
+	     i++) {
+		size_t p = (i / (overlay_a_fmt_count *
+				 overlay_b_fmt_count *
+				 data.wb_fmt_count)) % primary_fmt_count;
+
+		size_t a = (i / (overlay_b_fmt_count *
+				 data.wb_fmt_count)) % overlay_a_fmt_count;
+
+		size_t b = (i / data.wb_fmt_count) % overlay_a_fmt_count;
+
+		size_t w = i % data.wb_fmt_count;
+
+		data.kms.primary.format = data.kms.primary.base->formats[p];
+		data.kms.overlay_a.format = data.kms.overlay_a.base->formats[a];
+		data.kms.overlay_b.format = data.kms.overlay_b.base->formats[b];
+		data.kms.writeback.format = data.wb_formats[w];
+
+		igt_info("formats: primary: %zu/%zu overlay_a: %zu/%zu overlay_b: %zu/%zu writeback: %zu/%zu\n",
+			 p + 1, primary_fmt_count,
+			 a + 1, overlay_a_fmt_count,
+			 b + 1, overlay_b_fmt_count,
+			 w + 1, data.wb_fmt_count);
+
+		stress_driver(&data);
+	}
 
 	igt_display_fini(&data.display);
 	drm_close_driver(data.fd);

-- 
2.43.0

