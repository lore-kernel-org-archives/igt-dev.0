Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C5CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25B210E3C4;
	Mon, 25 May 2026 16:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HM6n/8kw";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447510E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:31 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-36a8ee1e28cso2276509a91.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727170; x=1780331970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ysi4OEFQ+uj5q7Y+6zEyTOg9JxtKgxY27bHNEtA+Mrc=;
 b=HM6n/8kwj0e1H6fo7Q776YcjLMV7n6WAIPSZFW/zFilRHOZqYeH0j5aqRof50RLVsi
 lN2v3yEUW9SmjLrH2rbQbFWIOuQgQ7VMQcMMRDehy76Ihc8bIOMwwx4UwdFlU5DIzQMY
 vs3yYYh3P47QG1psnOQmJ8jYYsPVX9sDCs+RvEt40FEI1bsL4PAv6TNzQIDJcWzgsFBR
 Ow0BpoLfBDLJ166/7H7/kBfsDer1mTiPJD6vVb70jFRATMWko0qLXkUg6cwf48ZJ5gcY
 +jNgP0MnF3ALAcAWIYR/aMpTCAezEgOyoc7751ojFXdYgmoCcYJtnWFCal7n1OC3WqXZ
 ikxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727170; x=1780331970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ysi4OEFQ+uj5q7Y+6zEyTOg9JxtKgxY27bHNEtA+Mrc=;
 b=s2D82FEG89LIFRyhUUvqOKEMNKVvE4m9f9QMLpeFqayb0ZEs68gpohwkAIiG48I1ZR
 KTLR3ZsTuuYMmgWa796Icu25euL3m/AvnhlWBz/f8p1EbGaYyTYpTtd89FeWHjZR2TQh
 ilFVQLeiwQujiCSB0lNy9jFpexyEFYb2/EurNJXbj8C4GOe3DmuJVvHyyg+1WWnIingA
 Agi9NHkp2448eaGHekl0JqCPsV0O/ixuvZP3TaAaJnzAziJoEMdPEPRbmHgtRnCzYmG3
 fB6Cs6OlXmg9C48wzICf14d8MHCcgzfrF8g4LWYRXFrGlbnatghKljqe9rjniSSeBqoW
 evoQ==
X-Gm-Message-State: AOJu0YwOsbok9vlhSlfJKPNzp9X9fkVs//hk8ByWYenvNfACBdjh8mzJ
 BC3k3FefbaexPZ+5xGEUYz9hFT3cHUr6N2UaEWXuErmnouS8Nj41VINvF8xJ2QC4
X-Gm-Gg: Acq92OGRpFrPc1BFj8ADI75B1Gb9Qk9bouBpXLdQ+DeHk/UHyrHsyL8mMNWyvntAEuR
 IWQl8LO1BNN/cBTyhxCE4VOXnkstA6P6Hd1AX2KDTGZ4BZm0s6HWwON544cYiFw0b5hYtVT9D/Y
 MRhtAtRAOKbSYjE6S4vaVfHFgTztQVqto+l75qvQhmsBSMmHW5viEz58rBAjwJuqITN2GSrmBKc
 n4kmOUVYL+rI/hrDz6bPH7nlYO4UotRIK1j/AHu0HPKIDYdqwcXouyqwUzTvysqyMKZQrYdnHpc
 e4eqBf/aDryfpayYFsku9gl1/elajGtnBBfwDuMYLg7m3W0Sm1iQ04dBeDTJN7qf4Fm9mbhv0ZZ
 xW2JU6c1PLR4+Njaz4cKJVbdE5+6nf+6gC9JaMOQUoBhgyYzhvXugX3U/RM2t4WB7GDap9QvDVC
 qNCIlgwDdpgy5yWByv7sIAYEZw5YuyRHICSXOLu3FS0iP75Q3lqHSao6t7psiOdkmh7QI6YQ4Y
X-Received: by 2002:a17:90b:2e04:b0:369:b957:1d84 with SMTP id
 98e67ed59e1d1-36a677c78famr14661474a91.14.1779727170597; 
 Mon, 25 May 2026 09:39:30 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a72c4cd92sm10630088a91.10.2026.05.25.09.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:30 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t 7/9] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Mon, 25 May 2026 19:38:48 +0300
Message-ID: <20260525163850.3493602-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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

Choose correct gt for Vebox and use gen12 veboxcopy
functionality on Xe2

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 lib/igt_fb.c            | 17 ++++++++++++++++-
 lib/intel_batchbuffer.c |  2 +-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa9220953..44d2ff89e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2596,6 +2596,7 @@ struct fb_blit_upload {
 	struct fb_blit_linear linear;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
+	uint32_t vm;
 };
 
 static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
@@ -3400,10 +3401,24 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 	int fd = blit->fd;
 	struct igt_fb *fb = blit->fb;
 	struct fb_blit_linear *linear = &blit->linear;
+	struct drm_xe_engine *engine;
+	uint16_t class;
 
 	if (!igt_vc4_is_tiled(fb->modifier) && use_enginecopy(fb)) {
 		blit->bops = buf_ops_create(fd);
-		blit->ibb = intel_bb_create(fd, 4096);
+
+		if (is_xe_device(fd)) {
+			class = use_vebox_copy(fb, fb) ? DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE :
+							 DRM_XE_ENGINE_CLASS_RENDER;
+
+			engine = xe_find_engine_by_class(fd, class);
+			blit->vm = xe_vm_create(fd, 0, 0);
+			blit->ibb = intel_bb_create_with_gt(fd, 4096,
+							    blit->vm,
+							    engine->instance.gt_id);
+		} else {
+			blit->ibb = intel_bb_create(fd, 4096);
+		}
 	}
 
 	/*
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f0fef6bda..ccd31c75d 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -699,7 +699,7 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 {
 	igt_vebox_copyfunc_t copy = NULL;
 
-	if (IS_GEN12(devid))
+	if (intel_gen(devid) >= 12)
 		copy = gen12_vebox_copyfunc;
 
 	return copy;
-- 
2.43.0

