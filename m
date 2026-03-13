Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3915D105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D736E10E041;
	Fri, 13 Mar 2026 13:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kn/RoFAS";
	dkim-atps=neutral
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEDC10E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:52 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2be1b5fe11cso3418861eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409971; x=1774014771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neq4/9oPIp6nFd0tUGfXjtm+XHbpek1NCniCclzbOaw=;
 b=Kn/RoFASTz872RT+kFui2EDNElh4kdpbPm0ayk+bd4VDT9thI7icIy8p73PrStRRm5
 cPoV63Ng9QnDJlDCGFVDct2CTIE1bKZxNhlPA3rRAGzMif+oawyJ9Xe+qeZxEepoM3C8
 ASbDk83xlChQPEdf//lemQehpH+PGTfJuh4cgPy2fM4h1ecCXW5SBcjRzAXrDkgnENxb
 4vg+/saG43lmZAVKeUHXpfcGxurE6ZZl+TEveh6eio5QXfSNk5M87NdU8lIKi0HBl7uE
 01WFGqhcLh8kDFH8RImiwsumEDemM1tZJFCdJq8xAD6SPRBaNYuzZIprGTdYA582L6MY
 x+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409971; x=1774014771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=neq4/9oPIp6nFd0tUGfXjtm+XHbpek1NCniCclzbOaw=;
 b=VAS+iRXZqloSf7ncE7q63/zzDuy34cIBvHeZmvW6PvD85BkBSQvFrpG3nAHB3xTwbo
 VjbfY4YBZBNketCmcMV3DE+hBogdmlcKKdAOwkuUA887Tz/3d6zYDdk6SBGe2kI+Uev3
 k21f6Q2s//VpvreO3etOFFRbbDXvedNiZmN1wihdxXyQ/CVDfWhDKzaVvr5DpwFon8sO
 2ejSuTmcvGAbOffeOwchJaqFuvl8OYbBMydQmCmRANd5BrP86pSQys56n3Oh5jRZxQgJ
 2usLwD5NTG926BfrtoQREqFvuP1G7k9Td6k+B3K6HzTXnXPq8mciH6QJs498u7TmIEjv
 Keaw==
X-Gm-Message-State: AOJu0YxSnIMAzIAwSyqfJeDokotHPuafv2n5K4LHd/6HHiNs4qmmdJ3N
 EMUKd5swOBPyTUVwcRr269CgIWXSngEisScO8jBTZaRIr/Z2QKtauNik4OlaEuAr
X-Gm-Gg: ATEYQzytBIvKrmfSWIz82vkdsN4F8uf9ZqZd2LuoOFWlvmgM3m/vB6Pgh8WxoiGRHpu
 BzKvv0zj6wG1NowepjNodG1WIxyHKlQPvSkzQepqdouJLT2YCDBp30pDHaqRQW4XLJ+8I1m/pn1
 jK3SR+wLVojxkNQUQ3RntJhdb0jccek5GaNc7tzi+YtKuemvMygOc539gortkgec81LBgP1ipr3
 Fn6FdxLEDFAHCUpjxS6AofeQzXhogxGc9I/kQjfipLHyZEXGO5A7+pQ7ycO+vAqwIngUe7lJJIf
 uhvVpRN5+ZmsP5vu0j0MkXOXNU0RfxmxMKeeYrt1yat4N/tDsWDl6czxMmLgg3qNitqoyBjXA/H
 CJZLv/xrCQtH4MuMaNHiFnixU1CZqf6QA3gV0DWB8JMGbZbJQIuQOXMUmOcPFKSo2/tiTpNbs1+
 VhxkoO17RmMNY2BBf0ygMVq0R1/NpJ/kYY9r31jqqTPNlvZSCPXf5XwWQeWzU=
X-Received: by 2002:a05:7300:b54a:b0:2bd:b325:8d91 with SMTP id
 5a478bee46e88-2bea5542097mr1345789eec.29.1773409971194; 
 Fri, 13 Mar 2026 06:52:51 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab526f9asm3000219eec.19.2026.03.13.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/8] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Fri, 13 Mar 2026 15:52:02 +0200
Message-ID: <20260313135203.1782240-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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
index 3fea35786..89e676c39 100644
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

