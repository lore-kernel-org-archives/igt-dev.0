Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163B1EEE276
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C702110EC88;
	Fri, 13 Sep 2024 00:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="h/y3vA2w";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01310EC88
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b7B4HsfzDqq2;
 Fri, 13 Sep 2024 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188006; bh=fKQAV0XIl5j+TjrkO9hTWMdXcY+OcL5nMj/s8yvJkPo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=h/y3vA2w0GwycNjl4+vWPwfdo6rwFy0kuFYVX21idTX9Hja+UePoMoh4Zrha1IUzx
 Q7rV1y79XcrKyW9D8lXISXC9yGvhBD1r8jMjjcBaZOoYJzDlQ7PGAXfH8i9lBlpTwk
 cnSk+byiQ7kqXd3EIKHh9rMjvpGARdwQE3/RNjxE=
X-Riseup-User-ID: ED287218777E7F960CCEE5CFD5C798B377A4459970336E407CE7B74EA4B75237
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b782JB8zFpdt;
 Fri, 13 Sep 2024 00:40:04 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:32 -0300
Subject: [PATCH i-g-t v6 08/12] benchmarks/kms_fb_stress: Add enable
 switches for every plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-8-71e9a65397e9@riseup.net>
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

In the future, we would like to separately enable each plane depending
on the benchmark, so create an enable flag on each plane.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 69 +++++++++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 6f70f201be0d..45e03f97919a 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -18,6 +18,7 @@ struct plane_t {
 	struct rect_t rect;
 	uint32_t format;
 	struct igt_fb fbs[NUM_FBS];
+	bool enable;
 };
 
 struct kms_t {
@@ -76,13 +77,18 @@ static void gen_fbs(struct data_t *data)
 	kms->writeback.rect.height = mode->vdisplay;
 
 	for (int i = 0; i < NUM_FBS; i++) {
-		create_fb(data->fd, &kms->primary, i, !i, i, i);
-		create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
-		create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
-
-		igt_create_fb(data->fd, kms->writeback.rect.width, kms->writeback.rect.height,
-			      kms->writeback.format, DRM_FORMAT_MOD_LINEAR,
-			      &kms->writeback.fbs[i]);
+		if (kms->primary.enable)
+			create_fb(data->fd, &kms->primary, i, !i, i, i);
+		if (kms->overlay_a.enable)
+			create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
+		if (kms->overlay_b.enable)
+			create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
+
+		if (kms->writeback.enable)
+			igt_create_fb(data->fd, kms->writeback.rect.width,
+				      kms->writeback.rect.height,
+				      kms->writeback.format, DRM_FORMAT_MOD_LINEAR,
+				      &kms->writeback.fbs[i]);
 	}
 }
 
@@ -151,17 +157,19 @@ static void stress_driver(struct data_t *data)
 	for (int i = 0; i < FRAME_COUNT; i++) {
 		int fb_index = i % NUM_FBS;
 
-		plane_setup(&data->kms.primary, fb_index);
-
-		plane_setup(&data->kms.overlay_a, fb_index);
-
-		plane_setup(&data->kms.overlay_b, fb_index);
-
-		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
+		if (data->kms.primary.enable)
+			plane_setup(&data->kms.primary, fb_index);
+		if (data->kms.overlay_a.enable)
+			plane_setup(&data->kms.overlay_a, fb_index);
+		if (data->kms.overlay_b.enable)
+			plane_setup(&data->kms.overlay_b, fb_index);
+		if (data->kms.writeback.enable)
+			igt_output_set_writeback_fb(data->wb_output,
+						    &data->kms.writeback.fbs[fb_index]);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		if (data->wb_output->writeback_out_fence_fd != -1) {
+		if (data->kms.writeback.enable && data->wb_output->writeback_out_fence_fd != -1) {
 			close(data->wb_output->writeback_out_fence_fd);
 			data->wb_output->writeback_out_fence_fd = -1;
 		}
@@ -170,16 +178,24 @@ static void stress_driver(struct data_t *data)
 	igt_assert_eq(igt_gettime(&now), 0);
 	elapsed = igt_time_elapsed(&then, &now);
 
-	igt_plane_set_fb(data->kms.primary.base, NULL);
-	igt_plane_set_fb(data->kms.overlay_a.base, NULL);
-	igt_plane_set_fb(data->kms.overlay_b.base, NULL);
-	igt_output_set_writeback_fb(data->wb_output, NULL);
+	if (data->kms.primary.enable)
+		igt_plane_set_fb(data->kms.primary.base, NULL);
+	if (data->kms.overlay_a.enable)
+		igt_plane_set_fb(data->kms.overlay_a.base, NULL);
+	if (data->kms.overlay_b.enable)
+		igt_plane_set_fb(data->kms.overlay_b.base, NULL);
+	if (data->kms.writeback.enable)
+		igt_output_set_writeback_fb(data->wb_output, NULL);
 
 	for (int i = 0; i < NUM_FBS; i++) {
-		igt_remove_fb(data->fd, &data->kms.primary.fbs[i]);
-		igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
-		igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
-		igt_remove_fb(data->fd, &data->kms.writeback.fbs[i]);
+		if (data->kms.primary.enable)
+			igt_remove_fb(data->fd, &data->kms.primary.fbs[i]);
+		if (data->kms.overlay_a.enable)
+			igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
+		if (data->kms.overlay_b.enable)
+			igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
+		if (data->kms.writeback.enable)
+			igt_remove_fb(data->fd, &data->kms.writeback.fbs[i]);
 	}
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -269,11 +285,14 @@ igt_main
 	}
 
 	igt_subtest("default-stress") {
-		stress_driver(&data);
+		data.kms.primary.enable = true;
+		data.kms.overlay_a.enable = true;
+		data.kms.overlay_b.enable = true;
+		data.kms.writeback.enable = true;
 
+		stress_driver(&data);
 	}
 
-
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);

-- 
2.46.0

