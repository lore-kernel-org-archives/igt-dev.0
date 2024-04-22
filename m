Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E662C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E9F112DD8;
	Mon, 22 Apr 2024 22:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="mGSZ2CvU";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46CC112DDD
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:18:49 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VNfm93ldHzDqgG;
 Mon, 22 Apr 2024 22:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713824329; bh=mSM0GVzyzQTlm0LPD1cDjx/1jhFRl3U/G0sQoVeRk0I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mGSZ2CvU4q1KyjqffrbqHFd3J/+bMrAKOPleW1IkTuVQhbbciONvO+1mJyCerkhAc
 xA/Pfn6Kwee+MXJNqIYpDTGV02FXkDeUfU1rPeLY/snZE7ADXzouVb+ySz5dhgLeb0
 jQl76KZ0ACdV0lTz+3klQsRC12KAMYn+deDW/aEQ=
X-Riseup-User-ID: 537A1D61827DDF7C380777B59A64835F3AE87C50EA047B22884C8A4304C388F9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNfm62fbJzFv5M;
 Mon, 22 Apr 2024 22:18:46 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 22 Apr 2024 19:18:22 -0300
Subject: [PATCH i-g-t v5 7/8] benchmarks/kms_fb_stress: Optionally enable
 the overlay planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-kms_fb_stress-dev-v5-7-0c577163dc88@riseup.net>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
In-Reply-To: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
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

In the future, we would like to not use overlay planes, so make them
optional.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 8775fabdd164..d2d6b3e65eae 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -37,6 +37,7 @@ struct data_t {
 	igt_output_t *wb_output;
 	drmModeModeInfo *mode;
 	struct kms_t kms;
+	bool use_overlay;
 };
 
 static void plane_setup(struct plane_t *plane, int index)
@@ -75,8 +76,10 @@ static void gen_fbs(struct data_t *data)
 
 	for (int i = 0; i < NUM_FBS; i++) {
 		create_fb(data->fd, &kms->primary, i, !i, i, i);
-		create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
-		create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
+		if (data->use_overlay) {
+			create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
+			create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
+		}
 
 		kms->writeback.rect.width = mode->hdisplay;
 		kms->writeback.rect.height = mode->vdisplay;
@@ -150,12 +153,14 @@ static void stress_driver(struct data_t *data)
 	igt_info("\tprimary:\n");
 	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.primary.format));
 	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.primary.rect));
-	igt_info("\toverlay A:\n");
-	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
-	igt_info("\toverlay B:\n");
-	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
+	if (data->use_overlay) {
+		igt_info("\toverlay A:\n");
+		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
+		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
+		igt_info("\toverlay B:\n");
+		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
+		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
+	}
 	igt_info("\twriteback:\n");
 	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.writeback.format));
 	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.writeback.rect));
@@ -169,9 +174,11 @@ static void stress_driver(struct data_t *data)
 
 		plane_setup(&data->kms.primary, fb_index);
 
-		plane_setup(&data->kms.overlay_a, fb_index);
+		if (data->use_overlay) {
+			plane_setup(&data->kms.overlay_a, fb_index);
 
-		plane_setup(&data->kms.overlay_b, fb_index);
+			plane_setup(&data->kms.overlay_b, fb_index);
+		}
 
 		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
 
@@ -187,14 +194,18 @@ static void stress_driver(struct data_t *data)
 	elapsed = igt_time_elapsed(&then, &now);
 
 	igt_plane_set_fb(data->kms.primary.base, NULL);
-	igt_plane_set_fb(data->kms.overlay_a.base, NULL);
-	igt_plane_set_fb(data->kms.overlay_b.base, NULL);
+	if (data->use_overlay) {
+		igt_plane_set_fb(data->kms.overlay_a.base, NULL);
+		igt_plane_set_fb(data->kms.overlay_b.base, NULL);
+	}
 	igt_output_set_writeback_fb(data->wb_output, NULL);
 
 	for (int i = 0; i < NUM_FBS; i++) {
 		igt_remove_fb(data->fd, &data->kms.primary.fbs[i]);
-		igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
-		igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
+		if (data->use_overlay) {
+			igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
+			igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
+		}
 		igt_remove_fb(data->fd, &data->kms.writeback.fbs[i]);
 	}
 
@@ -279,6 +290,7 @@ igt_main
 	}
 
 	igt_subtest("default-stress") {
+		data.use_overlay = true;
 		stress_driver(&data);
 
 	}

-- 
2.44.0

