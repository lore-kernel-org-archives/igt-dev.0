Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29E7C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 14:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5D8112450;
	Thu, 28 Mar 2024 14:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iXWChPWH";
	dkim-atps=neutral
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDAD112454
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 14:25:58 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d48f03a8bbso17861691fa.0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711635956; x=1712240756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTascmuJXaHm9ayV7T4bYcz6LNfwLSaUuJJzQXl50jo=;
 b=iXWChPWHH+6aVy10pa6uJOpZZ6Opstg1KfHB1W8Jn5Aco/SvlaPwMstjqmZRvci90k
 iZHKV6UiS/asM216zfuMQJFvwGHprVuNYnRpZpEqebiRYtFEDIrzFa4TeiHpQF0uNTCG
 cEri22kvAWgsiPtGv+we1Tb46BJ8PLTqzC9T4DsrM3I8t31vxESkhQ5aiEuUd3YfNNcR
 r5Dpgd7MlkjMPd6sNSKJlYRvR0EewSM0LUPno3fwE3osgb5c3eDx07xCqZRnQeU6Rwui
 HutX1tU7Ur7We+TPfIXjIgfH5B28seAZY7PYfRBLyz1x22kNr3wqp8MOJoMuA0tVOlN0
 +2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711635956; x=1712240756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTascmuJXaHm9ayV7T4bYcz6LNfwLSaUuJJzQXl50jo=;
 b=jKVUMNJ9hJax1pmZmRB5A0+cabGnvbWr2bqXYMP4O6FghEN7+B73e9+G9e4MPEhtUf
 bPD74lLEh60ZHm6+7KMu+7ueuA1yhITdj815U/vTW+bp6vShLFHwWfJU4iwmGMWA1dSW
 gfaUqOrHugUX9uPDYztmxrHp0voc3QV9ZbigR54GFu0gcgzgBwydQS/+oNF2KiPh0uGO
 iP38etQ8AB5lq89MT6x5kRXC8piZN8m3xD5iRygBt9q6ujE6eGNsQ9aoDS5YRpDCDx2W
 IvTLKEJp7C4lw0CMS7xbEB+c6h+Vva3I1ZgNKrGrOsdXHf9FHUTSyf0/SMrst1bmAvZo
 bueA==
X-Gm-Message-State: AOJu0Yz9M5wHR9s6Cy0+DubRWkewf7lKDl8NVFvw7hfPMn3xe7OrFgPN
 oj7lD0vBT3wq0D5211RSchFZxzhZHqOjqDC4UxLnDLq2E9gnyewYj+4u6iSf7VuX7g==
X-Google-Smtp-Source: AGHT+IFm7TH7e4vCiFmsfzB1trNHKlWJ2Z3MwdHozkCnR3UydY5p/Tg2Y8nVVEkghx4zjidBa+31qw==
X-Received: by 2002:a2e:3314:0:b0:2d6:dd34:d38 with SMTP id
 d20-20020a2e3314000000b002d6dd340d38mr808416ljc.17.1711635955772; 
 Thu, 28 Mar 2024 07:25:55 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:1fcd:f37:81ff:7a1f])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c031200b002d465c62f16sm248018ljp.68.2024.03.28.07.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 07:25:55 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_fb: fix intel modifiers for fb copying on xe
 driver
Date: Thu, 28 Mar 2024 16:25:42 +0200
Message-Id: <20240328142542.79809-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
on all platforms with ccs modifiers use engine copy for those.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
v2: here fixed only mc ccs. Seems x-tile for legacy blitter will need to be
fixed elsewhere. This patch will allow mc ccs to be tested on dg2 with Xe
driver but on the same go reveal rc-ccs-cc is not working on igt side with
Xe and need to be looked at.

 lib/igt_fb.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cc70cb91c..880fd08c9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2508,9 +2508,7 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((is_ccs_modifier(fb->modifier) &&
-	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
-	     is_gen12_mc_ccs_modifier(fb->modifier))
+	if (is_ccs_modifier(fb->modifier))
 		return false;
 
 	if (is_xe_device(fb->fd))
@@ -3062,7 +3060,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 		igt_nouveau_delete_bo(&linear->fb);
 	} else if (is_xe_device(fd)) {
 		gem_munmap(linear->map, linear->fb.size);
-		blitcopy(fb, &linear->fb);
+
+		if (blit->ibb)
+			copy_with_engine(blit, fb, &linear->fb);
+		else
+			blitcopy(fb, &linear->fb);
+
 		gem_close(fd, linear->fb.gem_handle);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
@@ -3142,7 +3145,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
 		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
 	} else if (is_xe_device(fd)) {
-		blitcopy(&linear->fb, fb);
+		if (blit->ibb)
+			copy_with_engine(blit, &linear->fb, fb);
+		else
+			blitcopy(&linear->fb, fb);
 
 		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
 					     linear->fb.size, PROT_READ | PROT_WRITE);
-- 
2.25.1

