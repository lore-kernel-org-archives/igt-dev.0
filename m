Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF3CEEE274
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02D010EC8C;
	Fri, 13 Sep 2024 00:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="B+RpsdCX";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200110EC75
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b7L3tqDzDq7M;
 Fri, 13 Sep 2024 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188014; bh=M3rFcYfhtYbCX+urajFcgG/XdL4ICAvT0GKJjHd/Mng=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B+RpsdCX0ZRLbPKT/GbtLXi0Pb+d958+jWfjAWxfcZkjL4u5MRpo/LNvQ6cLwyAvK
 nFgTG1cDBrXAOYNMiGFhgJkU/i8BodPzK35kIFzCJe0e3RyEniwMhPYV/GYL07iE4F
 tPhGsnkEmTHp5ozVfnha+FZAR9UN5nyTdacF2W/k=
X-Riseup-User-ID: 44A2B560AE3F76DA187A9D8BECE6169B2D7D17CDA3FCD78B5B597F728A483991
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b7J0c1vzFpdt;
 Fri, 13 Sep 2024 00:40:11 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:35 -0300
Subject: [PATCH i-g-t v6 11/12] benchmarks/kms_fb_stress: Create a
 benchmark for writeback formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-11-71e9a65397e9@riseup.net>
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
In-Reply-To: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
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

Create a benchmark that tests the performance of each supported format
for the writeback.

As IGT lib doesn't have a way to get the writeback formats it's needed
to call DRM directly.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 57df3ae2bac9..818201f1b8b6 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -36,6 +36,8 @@ struct data_t {
 	int fd;
 	igt_display_t display;
 	igt_output_t *wb_output;
+	uint32_t *wb_formats;
+	size_t num_wb_formats;
 	drmModeModeInfo *mode;
 	struct kms_t kms;
 };
@@ -148,6 +150,25 @@ static void set_crtc_size(struct data_t *data)
 	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
 }
 
+static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
+{
+	drmModePropertyBlobRes *blob = NULL;
+	uint64_t blob_id;
+	int ret;
+
+	ret = kmstest_get_property(output->display->drm_fd,
+				   output->config.connector->connector_id,
+				   DRM_MODE_OBJECT_CONNECTOR,
+				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
+				   NULL, &blob_id, NULL);
+	if (ret)
+		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
+
+	igt_assert(blob);
+
+	return blob;
+}
+
 static void stress_driver(struct data_t *data)
 {
 	struct timespec then, now;
@@ -274,6 +295,7 @@ igt_main
 
 	igt_fixture {
 		int ret;
+		drmModePropertyBlobRes *blob;
 
 		data.kms = default_kms;
 
@@ -313,6 +335,15 @@ igt_main
 									  DRM_PLANE_TYPE_OVERLAY,
 									  1);
 		igt_assert(data.kms.overlay_b.base != NULL);
+
+		blob = get_writeback_formats_blob(data.wb_output);
+		igt_assert(blob->length % 4 == 0);
+
+		data.num_wb_formats = blob->length / 4;
+		data.wb_formats = malloc(sizeof(uint32_t) * data.num_wb_formats);
+
+		for (size_t i = 0; i < data.num_wb_formats; i++)
+			data.wb_formats[i] = *(uint32_t *)(blob->data + i * 4);
 	}
 
 	igt_subtest("default-stress") {
@@ -344,6 +375,26 @@ igt_main
 		}
 	}
 
+	igt_subtest("writeback") {
+		data.kms.primary.enable = false;
+		data.kms.overlay_a.enable = false;
+		data.kms.overlay_b.enable = false;
+		data.kms.writeback.enable = true;
+
+		for (size_t i = 0; i < data.num_wb_formats; i++) {
+			data.kms.writeback.format = data.wb_formats[i];
+
+			if (!igt_fb_supported_format(data.kms.writeback.format)) {
+				igt_warn("Format 0x%x(%.4s) is not supported by IGT\n",
+					 data.kms.writeback.format,
+					 (char *)&data.kms.writeback.format);
+				continue;
+			}
+
+			stress_driver(&data);
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);

-- 
2.46.0

