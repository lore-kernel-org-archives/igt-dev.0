Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A5EEE277
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E412210EC89;
	Fri, 13 Sep 2024 00:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="BAI0thtg";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3186810EC5E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b753kvXzDqns;
 Fri, 13 Sep 2024 00:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188001; bh=2rvv1oEXZfpCwIDfZvy1EMz86UE403eTH2+cPar3+V0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BAI0thtgp+5zdZqeBB+9TVBQ/AuSFUOmC229cY+Zm0GEluDSGcIzyQvUZqvOQpeDF
 YvDnf3rS7b0TekvoQp6+nOJ/4EwWynviFlpL8fndYBG9a74bqInmcniGxo/kO7H7sB
 vWVaVGS4lC4Y+35Qpvd4ETC5IqavmHRfDvKGC5C0=
X-Riseup-User-ID: D58FD4282E140D6714C2BE7FC4F347A6C4DE1BDAAAE27C6C7003C9FE09A60A5D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b730jgZzFsZt;
 Fri, 13 Sep 2024 00:39:58 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:30 -0300
Subject: [PATCH i-g-t v6 06/12] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is not supported by Pixman
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-6-71e9a65397e9@riseup.net>
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

Pixman requires strides to be divisible by sizeof(uint32_t).
So, don't paint the FB's if the stride is not.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 25673d57f593..dce69d0b5b81 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -45,10 +45,27 @@ static void plane_setup(struct plane_t *plane, int index)
 
 static void create_fb(int fd, struct plane_t *plane, int fb_index, double r, double g, double b)
 {
-	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
-			    plane->format, DRM_FORMAT_MOD_LINEAR,
-			    r, g, b,
-			    &plane->fbs[fb_index]);
+	struct igt_fb stride_lookup_fb;
+
+	igt_init_fb(&stride_lookup_fb, fd, plane->rect.width, plane->rect.height,
+		    plane->format, DRM_FORMAT_MOD_LINEAR,
+		    IGT_COLOR_YCBCR_BT709,
+		    IGT_COLOR_YCBCR_LIMITED_RANGE);
+
+	igt_calc_fb_size(&stride_lookup_fb);
+
+	if (stride_lookup_fb.strides[0] % sizeof(uint32_t) == 0) {
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
2.46.0

