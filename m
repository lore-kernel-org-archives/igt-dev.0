Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E69C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A342B10FB9E;
	Mon, 22 Apr 2024 22:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="RPHzYMs+";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B77112DDD
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:18:46 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VNfm608BbzDqCq;
 Mon, 22 Apr 2024 22:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713824326; bh=HcKnYbV0WutXdGA7IUTQ4uAe/c9crQ8YOIU6kcjlHjk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RPHzYMs+KBAlv01pYyNYBxyKAee8aUqeFfW350f5XkHABcydRuUiNrVJ0Sg/8+tTU
 GLN2aBnWVGbV3ss01RkqDHR55zqOgrX3d2GkV2E01IgbHYKKuimeNJXm61eZ9Z7yi/
 0bRBtSa7R/sW2C+x6wiig3rUWcG+khMuxz8y/Ytw=
X-Riseup-User-ID: 878D1AA3010C61D9DA7C6BAE3E5CCFB7C73FBD4B62D11878429ACFD0D326FB37
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNfm26NQVzFv5M;
 Mon, 22 Apr 2024 22:18:42 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 22 Apr 2024 19:18:21 -0300
Subject: [PATCH i-g-t v5 6/8] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is not supported by Pixman
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-kms_fb_stress-dev-v5-6-0c577163dc88@riseup.net>
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

Pixman requires strides to be divisible by sizeof(uint32_t).
So, don't paint the FB's if the stride is not.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index e028424bb3e4..8775fabdd164 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -48,10 +48,24 @@ static void plane_setup(struct plane_t *plane, int index)
 
 static void create_fb(int fd, struct plane_t *plane, int fb_index, double r, double g, double b)
 {
-	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
-			    plane->format, DRM_FORMAT_MOD_LINEAR,
-			    r, g, b,
-			    &plane->fbs[fb_index]);
+	unsigned int stride;
+
+	igt_calc_fb_size(fd, plane->rect.width, plane->rect.height,
+			 plane->format, DRM_FORMAT_MOD_LINEAR,
+			 NULL, &stride);
+
+	if (stride % sizeof(uint32_t) == 0) {
+		igt_create_color_fb(fd,
+				    plane->rect.width, plane->rect.height,
+				    plane->format, DRM_FORMAT_MOD_LINEAR,
+				    r, g, b,
+				    &plane->fbs[fb_index]);
+	} else {
+		igt_create_fb(fd,
+			      plane->rect.width, plane->rect.height,
+			      plane->format, DRM_FORMAT_MOD_LINEAR,
+			      &plane->fbs[fb_index]);
+	}
 }
 
 static void gen_fbs(struct data_t *data)

-- 
2.44.0

