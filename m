Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719AEC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E727F10F1F3;
	Thu, 11 Apr 2024 18:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Q0O2W1fG";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03A510F137
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:51:33 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VFph528VDzDqD7;
 Thu, 11 Apr 2024 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1712861493; bh=PSK5DZt74qWhRrpn2rX5NcYujUCqQojMRn5bMT4o/vw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q0O2W1fGhmGg41fqaAjcDPWu15rPUYvp5WBFQbpIABAxp6tP4sBnvKdmhsQTQP+kH
 eHiedkaqgnCIxdbBrRp1UYhUVoWwKYYMBPVS3uyMu26odrzEUJ4jFIB5uX10KSnyQN
 6bTpfQE7rJ+kxvDXYRzV4Wyes/7c0x/RAwc3tUX4=
X-Riseup-User-ID: B59285B4D5CA85B0DCC81816478C3DAC5596DB44DF3F5E413757EC1BE2257607
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VFph244ZmzJrlH;
 Thu, 11 Apr 2024 18:51:30 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 11 Apr 2024 15:51:13 -0300
Subject: [PATCH i-g-t v4 3/7] benchmarks/kms_fb_stress: Separate the
 benchmark in a subtest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-kms_fb_stress-dev-v4-3-7a8f3a419ebb@riseup.net>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
In-Reply-To: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
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

In the future, we want to add more tests to this. So move the stress
procedure to its own subtest.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 138 +++++++++++++++++++++++++--------------------
 1 file changed, 78 insertions(+), 60 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 8d4707f5a8c0..bc548fae61f8 100644
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
@@ -162,82 +207,55 @@ static struct kms_t default_kms = {
 	},
 };
 
+static struct data_t data;
 
-igt_simple_main
+igt_main
 {
-	struct data_t data = {0};
-	struct timespec then, now;
-	double elapsed;
-
-	data.kms = default_kms;
-
-	data.fd = drm_open_driver_master(DRIVER_ANY);
-
-	kmstest_set_vt_graphics_mode();
+	igt_fixture {
+		data.kms = default_kms;
 
-	igt_display_require(&data.display, data.fd);
-	igt_require(data.display.is_atomic);
+		data.fd = drm_open_driver_master(DRIVER_ANY);
 
-	igt_display_require_output(&data.display);
+		igt_display_require(&data.display, data.fd);
 
-	igt_display_reset(&data.display);
-
-	data.wb_output = find_wb_output(&data);
-	igt_require(data.wb_output);
-	set_wb_pipe(&data);
-
-	set_crtc_size(&data);
-
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
+		kmstest_set_vt_graphics_mode();
 
-	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(data.kms.primary.base != NULL);
+		igt_display_require(&data.display, data.fd);
+		igt_require(data.display.is_atomic);
 
-	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
-								  DRM_PLANE_TYPE_OVERLAY, 0);
-	igt_assert(data.kms.overlay_a.base != NULL);
+		igt_display_require_output(&data.display);
 
-	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
-								  DRM_PLANE_TYPE_OVERLAY, 1);
-	igt_assert(data.kms.overlay_b.base != NULL);
+		igt_display_reset(&data.display);
 
-	igt_assert_eq(igt_gettime(&then), 0);
+		data.wb_output = find_wb_output(&data);
+		igt_require(data.wb_output);
+		set_wb_pipe(&data);
 
-	for (int i = 0; i < FRAME_COUNT; i++) {
-		int fb_index = i % NUM_FBS;
+		set_crtc_size(&data);
 
-		plane_setup(&data.kms.primary, fb_index);
+		data.kms.primary.base = igt_output_get_plane_type(data.wb_output,
+								  DRM_PLANE_TYPE_PRIMARY);
+		igt_assert(data.kms.primary.base != NULL);
 
-		plane_setup(&data.kms.overlay_a, fb_index);
+		data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  0);
+		igt_assert(data.kms.overlay_a.base != NULL);
 
-		plane_setup(&data.kms.overlay_b, fb_index);
+		data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  1);
+		igt_assert(data.kms.overlay_b.base != NULL);
+	}
 
-		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb_index]);
+	igt_subtest("default-stress") {
+		stress_driver(&data);
 
-		igt_display_commit2(&data.display, COMMIT_ATOMIC);
 	}
 
-	igt_assert_eq(igt_gettime(&now), 0);
-	elapsed = igt_time_elapsed(&then, &now);
-
-	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
 
-	igt_display_fini(&data.display);
-	drm_close_driver(data.fd);
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
+	}
 }

-- 
2.44.0

