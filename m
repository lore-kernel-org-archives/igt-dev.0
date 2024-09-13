Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD3EEE276
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADBD10EB26;
	Fri, 13 Sep 2024 00:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="nvj/+ZXM";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688A010EBC6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:44:56 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b6y2PhnzDqPQ
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726187994; bh=fo8qws78Tv3rxJ8ypBiuT/spFJ3hV3fVN2nQvL5qT1Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nvj/+ZXMCY/ziSo+7senUdyza7aBLkxhEaUWdCcVuLYo3rYR/LGJPVgW/Vhe2QpwR
 6O4SrEZZYopJksTS8SiB140bmZlNy3a+JjRa2PBea0QeaQWWBjhxnJexhED/Hi4Xlz
 Bzqut/EfG2JwnU5tDFLqXhveR1sXKRgjEtqnTB/w=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4X4b6x4qSWz9tN3;
 Fri, 13 Sep 2024 00:39:53 +0000 (UTC)
X-Riseup-User-ID: 9C6B1F7192A32D5508F7FC73007D5D95B4E8C93676FEAB64417797D3C972A49D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b6v1jJjzFsZP;
 Fri, 13 Sep 2024 00:39:51 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:27 -0300
Subject: [PATCH i-g-t v6 03/12] benchmarks/kms_fb_stress: Separate the
 benchmark in a subtest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-3-71e9a65397e9@riseup.net>
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

In the future, we want to add more tests to this. So move the stress
procedure to its own subtest.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 111 ++++++++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 46 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 9c6d2b52caad..32d65e5085e0 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -125,6 +125,35 @@ static void set_crtc_size(struct data_t *data)
 	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
 }
 
+static void stress_driver(struct data_t *data)
+{
+	struct timespec then, now;
+	double elapsed;
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
@@ -159,71 +188,61 @@ static struct kms_t default_kms = {
 	},
 };
 
-
-igt_simple_main
+igt_main
 {
-	struct data_t data = {0};
-	struct timespec then, now;
-	double elapsed;
-	int ret;
-
-	data.kms = default_kms;
+	struct data_t data;
 
-	data.fd = drm_open_driver_master(DRIVER_ANY);
+	igt_fixture {
+		int ret;
 
-	kmstest_set_vt_graphics_mode();
+		data.kms = default_kms;
 
-	ret = drmSetClientCap(data.display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+		data.fd = drm_open_driver_master(DRIVER_ANY);
 
-	igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+		igt_display_require(&data.display, data.fd);
 
-	igt_display_require(&data.display, data.fd);
-	igt_require(data.display.is_atomic);
+		kmstest_set_vt_graphics_mode();
 
-	igt_display_require_output(&data.display);
+		ret = drmSetClientCap(data.display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 
-	igt_display_reset(&data.display);
+		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
-	data.wb_output = find_wb_output(&data);
-	igt_require(data.wb_output);
-	set_wb_pipe(&data);
+		igt_display_require(&data.display, data.fd);
+		igt_require(data.display.is_atomic);
 
-	set_crtc_size(&data);
+		igt_display_require_output(&data.display);
 
-	gen_fbs(&data);
+		igt_display_reset(&data.display);
 
-	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(data.kms.primary.base != NULL);
+		data.wb_output = find_wb_output(&data);
+		igt_require(data.wb_output);
+		set_wb_pipe(&data);
 
-	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
-								  DRM_PLANE_TYPE_OVERLAY, 0);
-	igt_assert(data.kms.overlay_a.base != NULL);
+		set_crtc_size(&data);
 
-	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
-								  DRM_PLANE_TYPE_OVERLAY, 1);
-	igt_assert(data.kms.overlay_b.base != NULL);
+		data.kms.primary.base = igt_output_get_plane_type(data.wb_output,
+								  DRM_PLANE_TYPE_PRIMARY);
+		igt_assert(data.kms.primary.base != NULL);
 
-	igt_assert_eq(igt_gettime(&then), 0);
+		data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  0);
+		igt_assert(data.kms.overlay_a.base != NULL);
 
-	for (int i = 0; i < FRAME_COUNT; i++) {
-		int fb_index = i % NUM_FBS;
-
-		plane_setup(&data.kms.primary, fb_index);
-
-		plane_setup(&data.kms.overlay_a, fb_index);
-
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
2.46.0

