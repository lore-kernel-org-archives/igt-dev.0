Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7649C54E4A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 19:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA8210FC48;
	Thu,  7 Mar 2024 19:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="L1TRh4jJ";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF24113816
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 19:41:38 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TrKS23g6rz9tkS;
 Thu,  7 Mar 2024 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709840498; bh=va8g6J/WHUOhiZ98jQf5aHND6DczSWZd/PNTG0iY+nk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=L1TRh4jJ+4ofsY1gkcH6HQ7yyfMHc0KoB005GnTCYJGId49RZwrumweJ2Hk++l5JL
 xMbgWlOFWkoBUv7Mcy0r6wuk6VxCKD5alLlK5p6tPAdg0GrM2m1ynnIi5pcGrErcm+
 +B/AJLVJ9U8/TqAz7P9A2QeeeLCPfNQ+IYhG+Cwo=
X-Riseup-User-ID: 8B81A887544D6BEDA83CD8D3528F96D37B35DEDFEACB03DD8EF95648FB54DF89
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TrKRz24SzzJtT4;
 Thu,  7 Mar 2024 19:41:35 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 07 Mar 2024 16:41:09 -0300
Subject: [PATCH i-g-t v3 7/7] benchmarks/kms_fb_stress: Add command line
 options to pin the planes or writeback formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240307-kms_fb_stress-dev-v3-7-d5b948a541be@riseup.net>
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

Currently, the benchmark runs all the possible combinations of formats,
which can take a lot of time. Change that by adding command line options
to use a specific DRM format for the planes or writeback, with the
intention to decrease the number of cases to run.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 140 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 99 insertions(+), 41 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index deee9d557175..4121ae6e4e5e 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -3,6 +3,7 @@
  * Copyright © 2024 Arthur Grillo
  */
 
+#include <stdbool.h>
 #include <stdint.h>
 
 #include "igt.h"
@@ -41,6 +42,10 @@ struct data_t {
 	size_t wb_fmt_count;
 	drmModeModeInfo *mode;
 	struct kms_t kms;
+	bool selected_primary_fmt;
+	bool selected_overlay_a_fmt;
+	bool selected_overlay_b_fmt;
+	bool selected_writeback_fmt;
 };
 
 static void plane_setup(struct plane_t *plane, int index)
@@ -243,45 +248,87 @@ static void stress_driver(struct data_t *data)
 	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
 }
 
-static struct kms_t default_kms = {
-	.crtc = {
-		.width = 4096, .height = 2160,
-	},
-	.primary = {
-		.rect = {
-			.x = 101, .y = 0,
-			.width = 3639, .height = 2160,
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	struct data_t *data = _data;
+	struct kms_t *kms =  &data->kms;
+
+	switch (opt) {
+	case 'p':
+		kms->primary.format = igt_drm_format_str_to_format(optarg);
+		data->selected_primary_fmt = true;
+		break;
+	case 'a':
+		kms->overlay_a.format = igt_drm_format_str_to_format(optarg);
+		data->selected_overlay_a_fmt = true;
+		break;
+	case 'b':
+		kms->overlay_b.format = igt_drm_format_str_to_format(optarg);
+		data->selected_overlay_b_fmt = true;
+		break;
+	case 'w':
+		kms->writeback.format = igt_drm_format_str_to_format(optarg);
+		data->selected_writeback_fmt = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char *help_str =
+	"  --primary-format\t\tUse a specific DRM format for the primary plane\n"
+	"  --overlay-a-format\t\tUse a specific DRM format for the overlay A plane\n"
+	"  --overlay-b-format\t\tUse a specific DRM format for the overlay B plane\n"
+	"  --writeback-format\t\tUse a specific DRM format for the writeback\n";
+
+static const struct option long_options[] = {
+	{ .name = "primary-format", .has_arg = true, .val = 'p'},
+	{ .name = "overlay-a-format", .has_arg = true, .val = 'a'},
+	{ .name = "overlay-b-format", .has_arg = true, .val = 'b'},
+	{ .name = "writeback-format", .has_arg = true, .val = 'w'},
+	{}
+};
+
+static struct data_t data = (struct data_t){
+	.kms = {
+			.crtc = {
+				.width = 4096, .height = 2160,
+			},
+		.primary = {
+			.rect = {
+				.x = 101, .y = 0,
+				.width = 3639, .height = 2160,
+			},
 		},
-	},
-	.overlay_a = {
-		.rect = {
-			.x = 201, .y = 199,
-			.width = 3033, .height = 1777,
+		.overlay_a = {
+			.rect = {
+				.x = 201, .y = 199,
+				.width = 3033, .height = 1777,
+			},
 		},
-	},
-	.overlay_b = {
-		.rect = {
-			.x = 1800, .y = 250,
-			.width = 1507, .height = 1400,
+		.overlay_b = {
+			.rect = {
+				.x = 1800, .y = 250,
+				.width = 1507, .height = 1400,
+			},
 		},
-	},
-	.writeback = {
-		.rect = {
-			.x = 0, .y = 0,
-			// Size is to be determined at runtime
+		.writeback = {
+			.rect = {
+				.x = 0, .y = 0,
+				// Size is to be determined at runtime
+			},
 		},
 	},
 };
 
-
-igt_simple_main
+igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
 {
-	struct data_t data = {0};
 	size_t primary_fmt_count = 0;
 	size_t overlay_a_fmt_count = 0;
 	size_t overlay_b_fmt_count = 0;
-
-	data.kms = default_kms;
+	size_t wb_fmt_count = 0;
 
 	data.fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -314,37 +361,48 @@ igt_simple_main
 								  DRM_PLANE_TYPE_OVERLAY, 1);
 	igt_assert(data.kms.overlay_b.base != NULL);
 
-	primary_fmt_count = data.kms.primary.base->format_mod_count;
-	overlay_a_fmt_count = data.kms.overlay_a.base->format_mod_count;
-	overlay_b_fmt_count = data.kms.overlay_b.base->format_mod_count;
+	primary_fmt_count = data.selected_primary_fmt ?
+			    1 : data.kms.primary.base->format_mod_count;
+	overlay_a_fmt_count = data.selected_overlay_a_fmt ?
+			      1 : data.kms.overlay_a.base->format_mod_count;
+	overlay_b_fmt_count = data.selected_overlay_b_fmt ?
+			      1 : data.kms.overlay_b.base->format_mod_count;
+	wb_fmt_count = data.selected_writeback_fmt ? 1 : data.wb_fmt_count;
 
 	for (size_t i = 0;
 	     i < primary_fmt_count *
 		 overlay_a_fmt_count *
 		 overlay_b_fmt_count *
-		 data.wb_fmt_count;
+		 wb_fmt_count;
 	     i++) {
 		size_t p = (i / (overlay_a_fmt_count *
 				 overlay_b_fmt_count *
-				 data.wb_fmt_count)) % primary_fmt_count;
+				 wb_fmt_count)) % primary_fmt_count;
 
 		size_t a = (i / (overlay_b_fmt_count *
-				 data.wb_fmt_count)) % overlay_a_fmt_count;
+				 wb_fmt_count)) % overlay_a_fmt_count;
+
+		size_t b = (i / wb_fmt_count) % overlay_a_fmt_count;
+
+		size_t w = i % wb_fmt_count;
+
+		if (data.selected_primary_fmt == false)
+			data.kms.primary.format = data.kms.primary.base->formats[p];
 
-		size_t b = (i / data.wb_fmt_count) % overlay_a_fmt_count;
+		if (data.selected_overlay_a_fmt == false)
+			data.kms.overlay_a.format = data.kms.overlay_a.base->formats[a];
 
-		size_t w = i % data.wb_fmt_count;
+		if (data.selected_overlay_b_fmt == false)
+			data.kms.overlay_b.format = data.kms.overlay_b.base->formats[b];
 
-		data.kms.primary.format = data.kms.primary.base->formats[p];
-		data.kms.overlay_a.format = data.kms.overlay_a.base->formats[a];
-		data.kms.overlay_b.format = data.kms.overlay_b.base->formats[b];
-		data.kms.writeback.format = data.wb_formats[w];
+		if (data.selected_writeback_fmt == false)
+			data.kms.writeback.format = data.wb_formats[w];
 
 		igt_info("formats: primary: %zu/%zu overlay_a: %zu/%zu overlay_b: %zu/%zu writeback: %zu/%zu\n",
 			 p + 1, primary_fmt_count,
 			 a + 1, overlay_a_fmt_count,
 			 b + 1, overlay_b_fmt_count,
-			 w + 1, data.wb_fmt_count);
+			 w + 1, wb_fmt_count);
 
 		stress_driver(&data);
 	}

-- 
2.43.0

