Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D204C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2007210F2A9;
	Thu, 11 Apr 2024 18:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="pvOlXX8Z";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44510F137
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:51:39 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4VFphC2KH9z9wsc;
 Thu, 11 Apr 2024 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1712861499; bh=iJ8iPK8ezjO6rr2qRBmL226j3hf5Zl34c4xvMg8uIdw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pvOlXX8ZA3ctD8jjhXa41nfIhS0pElWw1SIxtZ7tJuhP3jTDCsV+a5zGitKOuko19
 QpwiWX30Inh6fjLtS++exvhmUiDQXdELi0bWvh4neQMkY1V+qA4KIGPGxvfDFFwIGa
 6/V7CMPnhdsYgRjPVsNS3MEBXQKuSZfhQSu72SMo=
X-Riseup-User-ID: 2577D7C362AD4636C22BE3457E08839C5993BA59203108D327987AE88C66C3B7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VFph84gWmzJrlH;
 Thu, 11 Apr 2024 18:51:36 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 11 Apr 2024 15:51:15 -0300
Subject: [PATCH i-g-t v4 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is not supported by Pixman
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-kms_fb_stress-dev-v4-5-7a8f3a419ebb@riseup.net>
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

Pixman requires strides to be divisible by sizeof(uint32_t).
So, don't paint the FB's if the stride is not.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 62 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 76e82e0d76ea..bb85dfb18d2b 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -46,26 +46,60 @@ static void plane_setup(struct plane_t *plane, int index)
 	igt_plane_set_fb(plane->base, &plane->fbs[index]);
 }
 
+static bool have_supported_pixman_stride(int fd, struct plane_t *plane) {
+	unsigned stride;
+
+	igt_calc_fb_size(fd, plane->rect.width, plane->rect.height,
+			 plane->format, DRM_FORMAT_MOD_LINEAR,
+			 NULL, &stride);
+
+	return stride % sizeof(uint32_t) == 0;
+}
+
 static void gen_fbs(struct data_t *data)
 {
 	struct kms_t *kms = &data->kms;
 	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
 
 	for (int i = 0; i < NUM_FBS; i++) {
-		igt_create_color_fb(data->fd, kms->primary.rect.width, kms->primary.rect.height,
-				    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
-				    !i, i, i,
-				    &kms->primary.fbs[i]);
-
-		igt_create_color_fb(data->fd, kms->overlay_a.rect.width, kms->overlay_a.rect.height,
-				    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
-				    i, !i, i,
-				    &kms->overlay_a.fbs[i]);
-
-		igt_create_color_fb(data->fd, kms->overlay_b.rect.width, kms->overlay_b.rect.height,
-				    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
-				    i, i, !i,
-				    &kms->overlay_b.fbs[i]);
+		if (have_supported_pixman_stride(data->fd, &kms->primary)) {
+			igt_create_color_fb(data->fd,
+					    kms->primary.rect.width, kms->primary.rect.height,
+					    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
+					    !i, i, i,
+					    &kms->primary.fbs[i]);
+		} else {
+			igt_create_fb(data->fd,
+				      kms->primary.rect.width, kms->primary.rect.height,
+				      kms->primary.format, DRM_FORMAT_MOD_LINEAR,
+				      &kms->primary.fbs[i]);
+		}
+
+		if (have_supported_pixman_stride(data->fd, &kms->overlay_a)) {
+			igt_create_color_fb(data->fd,
+					    kms->overlay_a.rect.width, kms->overlay_a.rect.height,
+					    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
+					    i, !i, i,
+					    &kms->overlay_a.fbs[i]);
+		} else {
+			igt_create_fb(data->fd,
+				      kms->overlay_a.rect.width, kms->overlay_a.rect.height,
+				      kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
+				      &kms->overlay_a.fbs[i]);
+		}
+
+		if (have_supported_pixman_stride(data->fd, &kms->overlay_b)) {
+			igt_create_color_fb(data->fd,
+					    kms->overlay_b.rect.width, kms->overlay_b.rect.height,
+					    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
+					    i, i, !i,
+					    &kms->overlay_b.fbs[i]);
+		} else {
+			igt_create_fb(data->fd,
+				      kms->overlay_b.rect.width, kms->overlay_b.rect.height,
+				      kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
+				      &kms->overlay_b.fbs[i]);
+		}
 
 		kms->writeback.rect.width = mode->hdisplay;
 		kms->writeback.rect.height = mode->vdisplay;

-- 
2.44.0

