Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6993CC10F1A
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055AF10FCC3;
	Tue, 23 Apr 2024 14:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fiqgqMjy";
	dkim-atps=neutral
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197ED10F372
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51ae315bb20so4291865e87.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882779; x=1714487579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKNsIS8AQ47lafwYcqdkkRkj7m92SBrlfW2RV3bcI/Y=;
 b=fiqgqMjyGX1xDVJFdR2Tb5cWe7nurZaozVIJzZ4Sh+wqKSU0LfNQx/+4dkb/wdBwA3
 Ng9jKs1FKJBxLKVsG0f98dzN2PWgd7xxOMm2ELMn+uVMMMUAZM8JuAMmZj7doZCaT5mR
 lblhkN3bCgWce8UEqS9ODxOdf+1whACRtqaGBxrZDwNmP8IoobQhYrOct5vuWj/en+as
 QfqP27hmzrTgtDBJBJSikdU7vxmomEozgEkQSjPMFU2w+ReXtDyQodjpJHAKqntZ5yKa
 qu6uoRnunilREwMDg7GwLLrvYzrPRppzZV1RbyV+d04H/e+F5Bq2t9axD/P1i8zO1jfS
 X9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882779; x=1714487579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKNsIS8AQ47lafwYcqdkkRkj7m92SBrlfW2RV3bcI/Y=;
 b=tOrAe1qz/28WZZEJJwkegZnTV1Tw1OrmwMakqUqMOkORDne12rXH5saUjsX27X4waW
 zIueaEwLi0HNI7jz9Iq7Oxdd5cMy7ehNWTYNGPkjg8EpMdGLj+xWb2Gd3JKZ7XU9N5eQ
 Y4yFNhufqR67+r4a4pEFa/8xj2n70fBuvTeLtNThNzzjK024pbh1VYp/2HZnPdizrvzy
 0oXN70cPubKp+0PSrMkcbqfoOEis686LUUZfDNMmhMQ8Wgii8hY7K0NxfHBF5XS4+wDU
 tWveulGgVsMDG8hDmg96A29McSYD2gmOlS42+iTBy/DKHxlqcPsnCNn/Tce+SebtO6nh
 hjEw==
X-Gm-Message-State: AOJu0YwhlttTLTzobphwoJBgasP5QjqGQhJ8Bqd5htnOx/YbP4zFhqdx
 8GU+oTCbA1RRumzrb23d6NYrPu+xexRZaigKYhpbrqNwOUKzCpEJT8d4XaF+yXY=
X-Google-Smtp-Source: AGHT+IFwBYnnOskx3HwntYOJ7zEnTbKEAmJrM3rqeiIEALyRecj9CJQWHQMMc4pBE4CQKrY6vQSvVg==
X-Received: by 2002:a05:6512:25e:b0:516:9e97:d3ee with SMTP id
 b30-20020a056512025e00b005169e97d3eemr8421035lfo.53.1713882778346; 
 Tue, 23 Apr 2024 07:32:58 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:32:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 1/6] lib/igt_fb: fix intel modifiers for fb copying
 on xe driver
Date: Tue, 23 Apr 2024 17:32:41 +0300
Message-Id: <20240423143246.130884-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
References: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cc70cb91c..f6f280b13 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2508,9 +2508,11 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((is_ccs_modifier(fb->modifier) &&
-	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
-	     is_gen12_mc_ccs_modifier(fb->modifier))
+	if ((!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
+	    is_ccs_modifier(fb->modifier)) ||
+	    is_gen12_mc_ccs_modifier(fb->modifier) ||
+	    (!blt_uses_extended_block_copy(fb->fd) &&
+	    fb->modifier == I915_FORMAT_MOD_X_TILED))
 		return false;
 
 	if (is_xe_device(fb->fd))
@@ -2551,6 +2553,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
+	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
 	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
 	       is_gen12_mc_ccs_modifier(fb->modifier);
 }
@@ -3062,7 +3065,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
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
@@ -3142,7 +3150,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 
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

