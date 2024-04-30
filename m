Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10819C19F4F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 16:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A858112B22;
	Tue, 30 Apr 2024 16:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nWOrTs+7";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2975D10FAD4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 16:29:46 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so75339991fa.2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714494584; x=1715099384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3mPH4n17/JPhvYq/K65aHXjAIAn5xPlqSElJdTkNbY=;
 b=nWOrTs+7gt2TfGwu3q9eym998sYQUtBfEYMo2YveT4a9n37pFZ7avtEWKn4s6Xpzoj
 UsFyJR/hSb5V+fUDitvsXMA771bXTLS/QBHJH+ei1T1ROjf1V50xbrv/9MJlgziCn16o
 oAGuhigZ9LkIleF54EF8PgVe93eXY9We1RguplDO3IehRCbKF4dZCAmimYnPEx54XvLv
 yIIagUlhvAT2R2duTDZRm0AK80ocy4EhImp883736b0pvbHJlFR0FeWg351Z6gVnkG6n
 /XRJO0lAcic10zNESiysegbgowS+OKQtLdkkWqBzuR9fZ7XC/1xNSnRYMXOL9eCfHnoB
 o9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714494584; x=1715099384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3mPH4n17/JPhvYq/K65aHXjAIAn5xPlqSElJdTkNbY=;
 b=VneL23qG3cgPDsI3O/0P+wa5+dRlAn1bZKuqURq3A2j+VBM5Ezn7oWBSgGZSWGwGFE
 7HTbw1tJZyz8LvrPMjlyjLyKLLoeh+Byfz68nzCBl/6Z1/hrPbodfVrMp4ZG3oZsPqr6
 RSWhcVPmMVUnqh5yp7k0ZXIOc+qNatGOd15FaW6fsS0LPBkrGjExuV8ELIrgaay48kj6
 vs+KUY6dc0vjVnse3/HKuELhYj1wKaTixPKA4JaVlJAujIr/e/RiqA5pcGYprnSr6DGw
 nRe9n482rZ8CUzNgFmKx7Xc4gcsAwuIHfJUnfj25tkM9CQPXskttlrvACU5X8q1YXFaJ
 F1YA==
X-Gm-Message-State: AOJu0YyLbYprKfODNT/m0AXbdU2WUH7BZjoCfqZ5MykfqPfYaHEaSeVv
 Wnu7308Z+hUOSAq28zs+SAiJRVzhPnVsK5zgdDKr4NzWPRXHVva23aBUy4X01rU=
X-Google-Smtp-Source: AGHT+IEDzm7kh+TwWvvbdt4IvFGp644RINcTREpSNmphk81kqddIoU36RXbDBiYSN/UytiyWOQQFIA==
X-Received: by 2002:a2e:9184:0:b0:2e0:c689:f8cd with SMTP id
 f4-20020a2e9184000000b002e0c689f8cdmr191413ljg.29.1714494583435; 
 Tue, 30 Apr 2024 09:29:43 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a2e9b93000000b002e0e410ad06sm302814lji.138.2024.04.30.09.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:29:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 1/6] lib/igt_fb: fix intel modifiers for fb copying
 on xe driver
Date: Tue, 30 Apr 2024 19:29:34 +0300
Message-Id: <20240430162939.272990-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
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
Use render engine for x-tile on legacy platforms where x-tile
would otherwise endup on fastblit patch which is known to have
limitations.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cc70cb91c..5df5cb08f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2508,9 +2508,12 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((is_ccs_modifier(fb->modifier) &&
-	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
-	     is_gen12_mc_ccs_modifier(fb->modifier))
+	if ((!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
+	    is_ccs_modifier(fb->modifier)) ||
+	    is_gen12_mc_ccs_modifier(fb->modifier) ||
+	    (!blt_uses_extended_block_copy(fb->fd) &&
+	    fb->modifier == I915_FORMAT_MOD_X_TILED &&
+	    is_xe_device(fb->fd)))
 		return false;
 
 	if (is_xe_device(fb->fd))
@@ -2551,6 +2554,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
+	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
 	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
 	       is_gen12_mc_ccs_modifier(fb->modifier);
 }
@@ -3062,7 +3066,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
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
@@ -3142,7 +3151,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
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

