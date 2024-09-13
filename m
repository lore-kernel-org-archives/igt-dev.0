Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C3EEE27A
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130A610EC8F;
	Fri, 13 Sep 2024 00:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="JG3kKDmG";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9910EC5E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b782jKSzDqpZ
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188004; bh=IDLwqA+kN8UGCAf+S/qoCXgD7hSNxchFjeLRRKjvRsE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JG3kKDmGh0Sl+0hvDZVz5Ag8R3XImhP5Nz21HRHwuQ1LQYBYEFDL6btyln61egywT
 EU1erJr8HhDnfDzYAEEDZi3hNopkExmkssN6hoQNoXOBlmu1hycOK67/vMwxqcrIqA
 3JJZI3IUFFZsLG5DAYMq7m4A5ddTZ5lNbA7NJ9Q8=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4X4b780C0lz9tLw;
 Fri, 13 Sep 2024 00:40:04 +0000 (UTC)
X-Riseup-User-ID: F51EA16D337839645CE4F7C0D70083DE98B50E0EE8C6B14368698D83280DEC95
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b755D6czFpdt;
 Fri, 13 Sep 2024 00:40:01 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:31 -0300
Subject: [PATCH i-g-t v6 07/12] benchmarks/kms_fb_stress: Set writeback
 rectangle size outside the loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-7-71e9a65397e9@riseup.net>
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

This doesn't need to be inside the loop, so move out of it.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index dce69d0b5b81..6f70f201be0d 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -72,14 +72,14 @@ static void gen_fbs(struct data_t *data)
 {
 	struct kms_t *kms = &data->kms;
 	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
+	kms->writeback.rect.width = mode->hdisplay;
+	kms->writeback.rect.height = mode->vdisplay;
 
 	for (int i = 0; i < NUM_FBS; i++) {
 		create_fb(data->fd, &kms->primary, i, !i, i, i);
 		create_fb(data->fd, &kms->overlay_a, i, i, !i, i);
 		create_fb(data->fd, &kms->overlay_b, i, i, i, !i);
 
-		kms->writeback.rect.width = mode->hdisplay;
-		kms->writeback.rect.height = mode->vdisplay;
 		igt_create_fb(data->fd, kms->writeback.rect.width, kms->writeback.rect.height,
 			      kms->writeback.format, DRM_FORMAT_MOD_LINEAR,
 			      &kms->writeback.fbs[i]);

-- 
2.46.0

