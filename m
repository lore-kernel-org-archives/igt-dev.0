Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E7DE7E0BC
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BBA10E438;
	Mon,  9 Feb 2026 16:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k3ze06Qr";
	dkim-atps=neutral
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108810E438
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:53 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1271195d2a7so136296c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654772; x=1771259572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vj60NtKj8CxvjuF3scse+1MntI7/Spb8sxpSXJqqTZE=;
 b=k3ze06Qr24wz9Pl2p+FZAadR0uwu4hf+/l+xNON1FCt1adjyg7xqMb+G1s0iXtQdD8
 1Piu9hAhPvhfRWMzAC8z0w+58CsKtFrrTb4ubDBAeToYbNScPkXVI0Y0jByaXQZw3ixy
 laeJKnQYjpIltgewGhOHwgDC2ATnY2USOmYNd+UhaVz1px3cXvc99SVGjH1A816KeLn3
 KqzydtsurmrTwnS9Ne+fUNL+ZNdmYl7EjHPpvIc01dEPVIumFRaMvL6tCkvN788CJRh3
 VPOoFFv3Ar+LX2c049+V3NByEjn03hGaSRCSvA/s1BAXkTNt4L4tmy/UaDTIeovjA6Jz
 VC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654772; x=1771259572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vj60NtKj8CxvjuF3scse+1MntI7/Spb8sxpSXJqqTZE=;
 b=q2HpyniLG8yn8AN31bYwRCYNSMxddT1TXn/2hIPd0nmNxktzPQcVLOvbcfcT/z5/P+
 Oyk/UcNru+eTrDV+t8cjkan2JLBJdpT/7bQYKN6lJ1ApYimC1gOiFkmqVK3EdnqBd4dc
 Y/qX0Q8bgk6rf27KbOjBReVcb/FuDImG4TqM0GT2JFcKz/h5Fk4wNSqH+b4I7hZhdsA8
 gWKpslcNDBHmUYq25KxyWqmpIGFuPqu8qKf/O0A6Xv+ucfZgsKRkt6jTd8ZeHEvnIuHq
 Futbn9rkFLU4GwaPz9d6XRtBwmjBJZkHwAXyU2XDPxGiUjG6nQaPX/7f81BgdAYoK+mh
 uzRw==
X-Gm-Message-State: AOJu0YzCJ4beKmynYspTSYpYPMKFDOc4zdTHUq18v8ldI1+y6XeJN9Pc
 5gq4xPCv3VTiVRB3lnExs0gjH0EWVKG60LRG72nQa3t1rp70ikP6iCUTquSm4WLM
X-Gm-Gg: AZuq6aKDwk2Na1oHUZMLZBU/lysGdLrtNyl5OeMmJ+5qvFFFO7YkRywtI+VP6VzaI8g
 Of6S11IQedgnQDBq2gQNFo+hFzxH1lXH3kYWbrk8e6P6IJsL3zB+a2BFlfWdmnXIvnMgzp7gIPo
 lqXEMKh4bFcaRtM1qN+6VxZxeJln+WgIUvdgF3xG/HFDmDIA8a97CEvaKrDvrw70Snc+iDmvkTE
 NCFtFs3BPQQWdmM/McQsE9W30Jlvqhxrtf/VfgsPIHvAMkD295ePGz0Mser6gd7wRR3xbBRak05
 PREMJV38vszQRL5Oma0TRXfuqNxxQ6YOdjOdFz5zuMS2TKjhJvRRMrj7weIsNeg2h3MMoCbWA03
 7elKsLyvVTXyks7sJ3bNnCA2G+1jAaQZunqMfd1hlQROZc5lyKzrlfvdKjBjzPeImJJgSHgUVo5
 4b3mmLyilBM3OICSWz143Oafk8BOVvDr0AUjVTrF3towYFiWJj
X-Received: by 2002:a05:7022:b85:b0:119:e569:f274 with SMTP id
 a92af1059eb24-127040597d0mr4913190c88.29.1770654771962; 
 Mon, 09 Feb 2026 08:32:51 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-127043463bcsm9293951c88.13.2026.02.09.08.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:51 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/7] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Mon,  9 Feb 2026 18:32:12 +0200
Message-ID: <20260209163213.1483598-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
References: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
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
index c80881301..15d82e394 100644
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

