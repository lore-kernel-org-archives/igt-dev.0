Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A4C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E57210E076;
	Fri, 22 Mar 2024 12:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JEpmVCu8";
	dkim-atps=neutral
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5502E10E076
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:09:25 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-513e134f73aso2608334e87.2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711109363; x=1711714163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tBu0a3bMx7QPuWzsRUKBDZc3oUCYUIt/H/2yvotbKFM=;
 b=JEpmVCu8jwGb14JGL/7b2O1+88Yapch6TwV9J6rTRFbDJh/BJsluBw4TMxE66WB6Dg
 zxjVI1UoVAyvuxSB7jWsb7w8/Ozjj5d7sVR07IeZ5rj0g+gUvxiTBt0j89fb7WcywWkP
 ab1C7V6B6HFokf6eomUqVoHCBrlqQwuqXIar3q/aIxOXrJ2Tzade5jxrnT+GAdaWObLx
 HXI1d5PvCjDArou8JPNbOBweGbfVhOoBui4rqiOJ8iHHUUSfrq0Oj2CTTP8GIoEBSwQu
 gm3BP3qHLCKOBUJtjp9LSfRVKkFLba+Fau7oW+UlF1il70nXElDSNqMlZCAlh+yuc4zo
 hcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711109363; x=1711714163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBu0a3bMx7QPuWzsRUKBDZc3oUCYUIt/H/2yvotbKFM=;
 b=Li2f4JXCy4bylu8R7tAvDUZQm3mjcghyopoh2bJkTuB8ntWzEWKaef7K667mIRk578
 /cdkto/J2A81GCSvua71ah32x5AvGF9yl5hMqPeQ6xPEfU4P/90xW/okinfikfZct3Vc
 PJC6oPNjcJqr9eNq+lzT5WZce9Rui+OOWaZB9Dk84pYWIWXVxdL/1loh0x2zxy1Ablwe
 L+N+RrEVx3UZNemQf9jl0+8l0LUX0VDQhJbolcOmBylCUuDVs1KEXHoSwK0oKFZqIf4u
 6YjhdotWEEBN8dDQ0x+geVxx61w5ARIq2777IgrrFo/4oV5TgjBpMS6b7RnFMVqgHRxL
 nfyg==
X-Gm-Message-State: AOJu0YwxW2SGnZ6mUV7Aepne4rl9xWQYWA80dUl8uWONZaFwam9aEYsg
 V0M4UQ8KyRFTgJT1NEdo6hM8WmWQ6wJAVbXUfuY4UNw1iTUARq79JuWPpbSum8a31w==
X-Google-Smtp-Source: AGHT+IHn3w+FWggpNjH4qIYQKYVa+ufKUwucSBjgdud3cUYoKrDe9jtlRqxnZedk0nfOgSlzBCEN8A==
X-Received: by 2002:a19:435b:0:b0:513:c5f0:a759 with SMTP id
 m27-20020a19435b000000b00513c5f0a759mr1509118lfj.49.1711109362578; 
 Fri, 22 Mar 2024 05:09:22 -0700 (PDT)
Received: from jheikkil-mobl1.home (77-105-100-22.lpok.fi. [77.105.100.22])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a056512341000b005159bc5c043sm161746lfr.157.2024.03.22.05.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 05:09:21 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lib/igt_fb: fix intel modifiers for fb copying on xe
 driver
Date: Fri, 22 Mar 2024 14:09:14 +0200
Message-Id: <20240322120914.205342-1-juhapekka.heikkila@gmail.com>
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

legacy blitter doesn't handle x-tile well so use rendercopy instead.
mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
on all platforms with ccs modifiers use engine copy for those.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cc70cb91c..9557492cf 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2508,11 +2508,13 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((is_ccs_modifier(fb->modifier) &&
-	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
-	     is_gen12_mc_ccs_modifier(fb->modifier))
+	if (is_ccs_modifier(fb->modifier))
 		return false;
 
+	if (!blt_uses_extended_block_copy(fb->fd) &&
+	    fb->modifier == I915_FORMAT_MOD_X_TILED)
+	    return false;
+
 	if (is_xe_device(fb->fd))
 		return true;
 
@@ -2551,8 +2553,9 @@ static bool use_enginecopy(const struct igt_fb *fb)
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
-	       is_gen12_mc_ccs_modifier(fb->modifier);
+	       is_ccs_modifier(fb->modifier) ||
+	       (!blt_uses_extended_block_copy(fb->fd) &&
+	       fb->modifier == I915_FORMAT_MOD_X_TILED);
 }
 
 static bool use_blitter(const struct igt_fb *fb)
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

