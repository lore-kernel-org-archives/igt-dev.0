Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3153C54E4A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 19:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7C10EE25;
	Thu,  7 Mar 2024 19:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="V+szPvke";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000D112691
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 19:41:25 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TrKRn3p3Pz9tkS;
 Thu,  7 Mar 2024 19:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709840485; bh=UWEZd35Rmd1uJzUeVup2+uaJ5rUBEdC4nmEhVKJfW68=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=V+szPvkeKjHKveVqkv50oNGf96j3q9MPlXj6nRASJiyBM6uNED2yLTcuyH/scwAP9
 sQyoba9eMq3hEFPDpNzVd0len+KqNkpK4v7t9VcBteI2Sj3M5any0GDVxQsJA18P5B
 tIToUaWI49NvfMc1lKgX/Ny9Bjwr3aoxZJnlnVBI=
X-Riseup-User-ID: 5AF968D645EF1CBAFA1D25C0FC748EF84F00C5374F7B3625A69D9DEFB9999A8B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TrKRj6dNmzJtT4;
 Thu,  7 Mar 2024 19:41:21 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 07 Mar 2024 16:41:05 -0300
Subject: [PATCH i-g-t v3 3/7] benchmarks/kms_fb_stress: Move the stress
 procedure to its own function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-kms_fb_stress-dev-v3-3-d5b948a541be@riseup.net>
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

In the future, we want to do this procedure multiple times in a single
execution of the program. To allow that, move the stress procedure to
its own function. This should be noop.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 86 +++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 186e92ebaf9b..ba4af5970796 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -128,6 +128,51 @@ static void set_crtc_size(struct data_t *data)
 	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
 }
 
+static void stress_driver(struct data_t *data)
+{
+	struct timespec then, now;
+	double elapsed;
+
+	igt_info("KMS structure:\n");
+	igt_info("\tCRTC:\n");
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.crtc));
+	igt_info("\tprimary:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.primary.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.primary.rect));
+	igt_info("\toverlay A:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
+	igt_info("\toverlay B:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
+	igt_info("\twriteback:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data->kms.writeback.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.writeback.rect));
+
+	gen_fbs(data);
+
+	igt_assert_eq(igt_gettime(&then), 0);
+
+	for (int i = 0; i < FRAME_COUNT; i++) {
+		int fb_index = i % NUM_FBS;
+
+		plane_setup(&data->kms.primary, fb_index);
+
+		plane_setup(&data->kms.overlay_a, fb_index);
+
+		plane_setup(&data->kms.overlay_b, fb_index);
+
+		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
+
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	igt_assert_eq(igt_gettime(&now), 0);
+	elapsed = igt_time_elapsed(&then, &now);
+
+	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
+}
+
 static struct kms_t default_kms = {
 	.crtc = {
 		.width = 4096, .height = 2160,
@@ -166,8 +211,6 @@ static struct kms_t default_kms = {
 igt_simple_main
 {
 	struct data_t data = {0};
-	struct timespec then, now;
-	double elapsed;
 
 	data.kms = default_kms;
 
@@ -190,24 +233,6 @@ igt_simple_main
 
 	set_crtc_size(&data);
 
-	gen_fbs(&data);
-
-	igt_info("KMS structure:\n");
-	igt_info("\tCRTC:\n");
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.crtc));
-	igt_info("\tprimary:\n");
-	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.primary.format));
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.primary.rect));
-	igt_info("\toverlay A:\n");
-	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_a.format));
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_a.rect));
-	igt_info("\toverlay B:\n");
-	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_b.format));
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_b.rect));
-	igt_info("\twriteback:\n");
-	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.writeback.format));
-	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.writeback.rect));
-
 	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(data.kms.primary.base != NULL);
 
@@ -219,26 +244,7 @@ igt_simple_main
 								  DRM_PLANE_TYPE_OVERLAY, 1);
 	igt_assert(data.kms.overlay_b.base != NULL);
 
-	igt_assert_eq(igt_gettime(&then), 0);
-
-	for (int i = 0; i < FRAME_COUNT; i++) {
-		int fb_index = i % NUM_FBS;
-
-		plane_setup(&data.kms.primary, fb_index);
-
-		plane_setup(&data.kms.overlay_a, fb_index);
-
-		plane_setup(&data.kms.overlay_b, fb_index);
-
-		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb_index]);
-
-		igt_display_commit2(&data.display, COMMIT_ATOMIC);
-	}
-
-	igt_assert_eq(igt_gettime(&now), 0);
-	elapsed = igt_time_elapsed(&then, &now);
-
-	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
+	stress_driver(&data);
 
 	igt_display_fini(&data.display);
 	drm_close_driver(data.fd);

-- 
2.43.0

