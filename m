Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B77EDF173
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E2510E167;
	Fri, 13 Feb 2026 15:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4bOLwJX";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985A210E819
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:17:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-354a2a7d90fso620737a91.2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995826; x=1771600626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5V8lXzEJ0UoiGFW2jRzbtsr4sKXJyacNd4Nt6ZG57is=;
 b=Q4bOLwJXev3dguC4eWn/2TOinSom0FLhPMJaPzipb7nw2QOFGxmCJA3Wh6ILYPpZyM
 zMRKvG0YBhAX7fd4kfHWuLpuiBo7GeYVukmB+53jANHKuB7OL1XNRPcfD0C+g7GGksBg
 IMMY9hIt9puPWnQUzCPV5f3R7sLJLk8C0tJHFHWzLXr2Xgua9ZJ2p6oj5xoyUOoZRNOX
 W9vTZj2ILAcDlA7r3RGoLMrj7+N32rQI8Iqo9MAGmpqAozKfcwJ4Oi+7uxHwImr6l+IA
 ZgbbAy863YTJa13ZhZEHERf26Vi6EU/kdReEph7Tk4nw4566j5h5taecU/fi2vLiNsGx
 epTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995826; x=1771600626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5V8lXzEJ0UoiGFW2jRzbtsr4sKXJyacNd4Nt6ZG57is=;
 b=kqqoH8iJBmlD3/fj9UVfgfBld+sYz9Bi4sQNCRzJR8qm5mzuDuuHG6FddqL28GAENE
 Jz4rXH3t4y1vkGrYCI5qvW/IdjgYTsK+lWMwB/juzJapPm5KtqPCMVEJTMxpyik4unRS
 oG0iroeTOPxR264hcIYii3rgZh8GjbC3CWI7mKnB3e0xBL6Pphsvx6/k6u1/Q5WSOuCs
 CqJDTuPGinLMwTNDOgDKOu3RkTXQceGmSReGxbkJjEkutu207j6nqXP2A3lSoKLEX2am
 e6xDE48y93Bvh6W7x5iHkfuQy9mOj/K7PgJJsXOzsknJNv9MI9j37Ypa0ijGe4tIPilY
 GmWw==
X-Gm-Message-State: AOJu0YxKOo2v/mqkNe6DgpLBT79fnbxusB6tmC6M/LAiC/vkMC9OjTnP
 aKRjeFRB0+dx4IzKHARlr3UFpABoc0h0c6bNkbk3cAjDllJzg+p/OJQsXxTg41b0
X-Gm-Gg: AZuq6aJpJEN1GGdZhcnIjZjwe+vVNCDKekVLJCOLdL4BcLbExhHxHoxmbfBcJ+K9bWI
 hoZKnlE2O7dD1sxJO2gymYVieBPgXQxxuOptFWl0I05d2s2Hz22oebwk32WTbldh41ux/b+C/G1
 n0dHfYa6Ew/Jb8ol2mz3xb+ZN0LwFACm/1tWeKhrwl35P9tcY4Cms58JxleH0JEtyNK4g/xAjP2
 kaKcfJV2bYDlAdiF7rs9aU+GE/RNzxhIDbAJ0TDnI9RRnFe65R0K+r0ha4pQ41apFvpa9oPZW36
 POX5iPcPfl63k4dxcvGfK69Eqhfq0cbma4dOY93plKBCABSd0eqKjdo+Q3+u4hlHtqCcAJr15Ji
 FxXn5MOmrSjePLPPko1bCAlmNS4MVVcF336quFjc+uawUdVDUvsrn61Ldlmd/GdLY+QWf14sbdx
 MJsTSTGr0O4ZxxGF3aHrs9+VciohhbrLeZl2XkffkrhO3iSDElwfFncx9M1YSYuA==
X-Received: by 2002:a17:90b:3f0c:b0:356:4c1f:98d4 with SMTP id
 98e67ed59e1d1-356aabbbc5bmr2162765a91.13.1770995825865; 
 Fri, 13 Feb 2026 07:17:05 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567ebc3af1sm8203274a91.15.2026.02.13.07.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:17:05 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/7] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Fri, 13 Feb 2026 17:16:20 +0200
Message-ID: <20260213151621.1552677-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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
---
 lib/igt_fb.c            | 20 +++++++++++++++++++-
 lib/intel_batchbuffer.c |  2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b..cfd5d66fb 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2560,6 +2560,7 @@ struct fb_blit_upload {
 	struct fb_blit_linear linear;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
+	uint32_t vm;
 };
 
 static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
@@ -3345,6 +3346,9 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 	if (blit->ibb) {
 		intel_bb_destroy(blit->ibb);
 		buf_ops_destroy(blit->bops);
+
+		if (is_xe_device(fd) && blit->vm)
+			xe_vm_destroy(fd, blit->vm);
 	}
 }
 
@@ -3364,10 +3368,24 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
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
index 214c157f1..c5492125b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -697,7 +697,7 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 {
 	igt_vebox_copyfunc_t copy = NULL;
 
-	if (IS_GEN12(devid))
+	if (intel_gen(devid) >= 12)
 		copy = gen12_vebox_copyfunc;
 
 	return copy;
-- 
2.43.0

