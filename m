Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E2FC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 23:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245D112D7C;
	Tue,  5 Mar 2024 23:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="mtEoo+hg";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EB2112D7B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 23:16:17 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TqBJd0DKkzDqFV;
 Tue,  5 Mar 2024 23:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709680577; bh=91a7PDhBGiJ5p5K6w87bxHG5JsA77nU9uktuM6D/Ozo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mtEoo+hgAO6ouI6TQ4/Je3psiG338vEAGD8TS9bYVYOmPWxm4Z8B2DsyDLRk/ocXu
 6BXaGkhpT/HSvo4Qt/8fOZFfdyCIK5Q4uaiD5un5WTRs9/s7h3ybuwK+Phk9nxIay5
 HMZUX+Ha2TceOAnyjOzcG90RVPpRzjUqV5pSS1N0=
X-Riseup-User-ID: 8BF7DE7BCBBBC465174FEFD9DBD46400F95866D3374BEE8A3D8CD61A80983EE5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TqBJY2D74zFvjs;
 Tue,  5 Mar 2024 23:16:13 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Tue, 05 Mar 2024 20:15:42 -0300
Subject: [PATCH i-g-t v2 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is DRM_FORMAT_RGB565
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-kms_fb_stress-dev-v2-5-78888a38e563@riseup.net>
References: <20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net>
In-Reply-To: <20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net>
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

Cairo does not fully support the RGB565 due to some stride issues.
So, don't paint the FB's if the format is DRM_FORMAT_RGB565.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 55 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index c3b32072384e..d3823908f131 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -52,20 +52,47 @@ static void gen_fbs(struct data_t *data)
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
+		// Cairo does not fully support this format
+		if (kms->primary.format != DRM_FORMAT_RGB565) {
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
+		// Cairo does not fully support this format
+		if (kms->overlay_a.format != DRM_FORMAT_RGB565) {
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
+		// Cairo does not fully support this format
+		if (kms->overlay_b.format != DRM_FORMAT_RGB565) {
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
2.43.0

