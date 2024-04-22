Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B89C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE6610F8D5;
	Mon, 22 Apr 2024 22:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="omGGwSCb";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C77112DDD
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:18:42 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VNfm23tJqzDqCq;
 Mon, 22 Apr 2024 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713824322; bh=gkjPNd5OkiIdXwtgDwsmolTFH72mO192ax4qJrH5NPw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=omGGwSCb/ioYkMRtD4aDkAlGS1NWrZlmBUTlbikAhqp41g37bvnjhTXiXCfKiZDqB
 yrY1nCaGDlcYXRfad999Pkqkqs3oBE8jxD05Hd57fHq/xijUZ0aIgiHr7mNmzJXLVn
 kKhuBZRiyg3jNHAHM0Qi5m75R+6Q9DLY4IbD77b8=
X-Riseup-User-ID: CB77FD95160BAF7B335DD367447AC8C60B1DF9840612865B82D6DA1C447EBFDD
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNflz2C0hzFvKg;
 Mon, 22 Apr 2024 22:18:39 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 22 Apr 2024 19:18:20 -0300
Subject: [PATCH i-g-t v5 5/8] benchmarks/kms_fb_stress: Move FB creation to
 a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-kms_fb_stress-dev-v5-5-0c577163dc88@riseup.net>
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

In the future, we want to add more logic to the FB creation. So, to
reduce code repetition, move the procedure to its own function.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 433e751273e6..e028424bb3e4 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -46,26 +46,23 @@ static void plane_setup(struct plane_t *plane, int index)
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
2.44.0

