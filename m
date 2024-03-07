Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263EBC54798
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 19:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5BA112E86;
	Thu,  7 Mar 2024 19:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="JUsh1aft";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D298210FC48
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 19:41:32 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TrKRw1zm4zDqMh;
 Thu,  7 Mar 2024 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709840492; bh=91a7PDhBGiJ5p5K6w87bxHG5JsA77nU9uktuM6D/Ozo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JUsh1aftD2YNhEVJA4OTjajEXZFdR5TRyWxZocTWv+mNEI5jfcTdU4mg9raGSYp0g
 +QwGaaQx4NTATgaWvb9v+u4MN8UUTGyqc76iJgQ9+RvEv2aaWWIIxy2iCO78ehaNRr
 eNk5oXovWHyXIXobU0PDVZ2Mj9uuTiwcCbAdhz60=
X-Riseup-User-ID: 0DB3B0CEFA9DB3892E033EF7026FA2854D6CF882C6DAA7AC5376C8FB1ECF9310
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TrKRs23wFzJtdn;
 Thu,  7 Mar 2024 19:41:29 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 07 Mar 2024 16:41:07 -0300
Subject: [PATCH i-g-t v3 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is DRM_FORMAT_RGB565
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-kms_fb_stress-dev-v3-5-d5b948a541be@riseup.net>
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

