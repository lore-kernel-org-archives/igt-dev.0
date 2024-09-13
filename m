Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83BCEEE278
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7EE10EC8B;
	Fri, 13 Sep 2024 00:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="QToQj80I";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D710EC75
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b726HjszDqfm;
 Fri, 13 Sep 2024 00:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726187999; bh=ygMwHgG1TbD/OTojmLgQka7cw6W8aQCwDqbQRTII1MM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QToQj80IbEqmEMNI+nPZk13mHDhygzzRk0s4yw0t8dZEDXWnjRt70kXOnoVCnFUNV
 CXJKcZhb1S8qeQMPePzcN3RI1wIfrX4NxSVQ/AsgOqRI5VYburZvIYbXc+pCT98Myw
 8JfOkYhjhf5zYyRcP7Nm/BjVGXugs8h2T5B4q25I=
X-Riseup-User-ID: F2520BE992EAABD58E08D697524B4C7485759BFAD5467D0C4E9AA0664902D3E5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b703YbFzFs2w;
 Fri, 13 Sep 2024 00:39:56 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:29 -0300
Subject: [PATCH i-g-t v6 05/12] benchmarks/kms_fb_stress: Move FB creation
 to a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-5-71e9a65397e9@riseup.net>
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

In the future, we want to add more logic to the FB creation. So, to
reduce code repetition, move the procedure to its own function.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 1e79af897ecc..25673d57f593 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -43,26 +43,23 @@ static void plane_setup(struct plane_t *plane, int index)
 	igt_plane_set_fb(plane->base, &plane->fbs[index]);
 }
 
+static void create_fb(int fd, struct plane_t *plane, int fb_index, double r, double g, double b)
+{
+	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
+			    plane->format, DRM_FORMAT_MOD_LINEAR,
+			    r, g, b,
+			    &plane->fbs[fb_index]);
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
+		create_fb(data->fd, &kms->primary, i, !i, i, i);
+		create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
+		create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
 
 		kms->writeback.rect.width = mode->hdisplay;
 		kms->writeback.rect.height = mode->vdisplay;

-- 
2.46.0

