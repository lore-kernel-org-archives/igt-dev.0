Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58938C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4110F852;
	Mon, 22 Apr 2024 20:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hRJxWa6o";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB6610F852
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5194cebd6caso5857527e87.0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818702; x=1714423502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HMqry5a2Oo5gAFdl32fUG+4K3zl2DrCUfIjaFG+zHN0=;
 b=hRJxWa6ozRgrzKZVYC3107tzrrAIcy6khKsAy/w4FkC5E/a9Cuo5YTTbIvkJQjDJQL
 E8Xax/9MRskaeUj23kxQMvoJTTDCj3+Pb2p4Qa/H46h8ISZWb0tJMwXx4MDZqtKW/KIP
 3mLGc6c6JRFldNS3FlbaHqTSVF+bqsV+0yTClyDFQGlgMMebtxnPa24xo3Z7AirdCNim
 Jnn43oVqIPUwu1snkNtgt1GXhh23X/IviK2qGUkEYiW3vsvjBhCFpDSal47OSfvqMlrk
 ivcPES9BUidbKAvyzPIQ1o5qX2q2f/vrFidua4Tz6PPtC1Nj5EdaAr8qxr8e5IMKKWhd
 aSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818702; x=1714423502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HMqry5a2Oo5gAFdl32fUG+4K3zl2DrCUfIjaFG+zHN0=;
 b=AbCxXHSH3agl8FcDO3ji+n1CXeB0qfwwMKg2H1xp7RQkqHdZT7fFZuwM4Ynkqau9c/
 cgzW2EiNw21p7vAkARsPg6C+kbA4ACAEJsvMK8NJQburqnrI7nI3GHrz7o4F306nb5qj
 H/anjo3eG/R9YJfgf5rLknBokmVOwtgMQml1wQbX+Y3nYhjGMj8lXeArUnKQMyqYlpAK
 qso2KmGs31Pssw6KROufxsPu5TEEd+8vCtBdIrqwPeDS7QpXvVTsYT76XuksNJ8ThNKT
 cVgRoAV0l8BSDGglcWn20WDa0CBQeasITiMetA/8ORAwLpk+isXLA32z3NoJOO1Yb3Cx
 /5yA==
X-Gm-Message-State: AOJu0Yy+8M9aEHIqNHFMrM7mfVOaSMxrDMDFJH+U/NM/dpP5fl2yCUIx
 7R5+IZGAnS1q3xNoSNBPb0HFxyd8I0H1fDxbQRm1kalcUqtV4cTwuECr3iU1Veo=
X-Google-Smtp-Source: AGHT+IEM7/YiuxgZvedDEe5Ug0m45X1dnIyNY8yzvgYOrRD3U3gCTLGqaluuT6reK+HWLwlN/56LIw==
X-Received: by 2002:ac2:4835:0:b0:519:558f:3f6b with SMTP id
 21-20020ac24835000000b00519558f3f6bmr6439080lft.27.1713818701703; 
 Mon, 22 Apr 2024 13:45:01 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/6] lib/igt_fb: fix intel modifiers for fb copying on
 xe driver
Date: Mon, 22 Apr 2024 23:44:36 +0300
Message-Id: <20240422204441.106197-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
References: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cc70cb91c..a77920fff 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2508,9 +2508,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((is_ccs_modifier(fb->modifier) &&
-	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
-	     is_gen12_mc_ccs_modifier(fb->modifier))
+	if ((!blt_uses_extended_block_copy(fb->fd) &&
+	    is_ccs_modifier(fb->modifier)) ||
+	    is_gen12_mc_ccs_modifier(fb->modifier))
 		return false;
 
 	if (is_xe_device(fb->fd))
@@ -3062,7 +3062,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
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
@@ -3142,7 +3147,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
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

