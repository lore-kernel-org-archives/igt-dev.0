Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB006103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6458E10E856;
	Wed, 18 Mar 2026 15:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RITb8SaD";
	dkim-atps=neutral
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B91B10E859
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:06:24 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2c0d36f3888so16019eec.0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846383; x=1774451183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjHG3UiaKLJfWNJUZDtV4OCIIk+EFvQzpMmgNjMBTKA=;
 b=RITb8SaDOIqXtsCb/7UGGrWcIJ5/ht6N2yxIB8Xm8H1fCh9dXxG5Q49G7hkhgihjmo
 nBasX65yJxlCnpEl71FjofxRAuGk5beWOiJfY6YE3Domry1MyTHMJkDK/NI1zMiqbcqa
 pGVUaP+pYYvL2t620ixJZIV0dWx29ZbRSbY9uvwAAIJzj6U+bfC2oPyCltKtT5z649ti
 kE7n8A/e9wjPOCW9CbOevdK3ugX64U47XdTFGWviHTmUezcmExLmAvSoUkyV3VxdOaLB
 rwg+dIZCJFG2HMH9KSM0mLboyt9DKgPvznUQPf3SrZlBgwppFaxbK3sikbc0kZd9xcpY
 cq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846383; x=1774451183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GjHG3UiaKLJfWNJUZDtV4OCIIk+EFvQzpMmgNjMBTKA=;
 b=MUwfICa4dvIIeNj28HpDfaumZmWvam2qM2P388Eiefm7j5ZFKzen0H/90DAsKr5wBg
 SZEFf3hcobh1xjlRij5+3ASAnXrDy3v/dlIWeryn9U9QktxAcIFxicc8/NP0m/iX8LLc
 JtGobMq3DLzunN6HW24v0+yCKm7z+BfUiLTL8kG6U5Swg4iQGOmwyihchcZQNgVLTPTZ
 /nZctvsyl66zarYo+ym4cAvAVuPDwylBCCVfw83sPs4BteTVkB550vAkwDGZ+xGJTsyS
 OZHA02IKPqE5rQhEFeXMuF1LNqjNPjH7Z2vlx8Fi6jWsuxnuVJE+BhWQdXd84e08whRB
 BXoQ==
X-Gm-Message-State: AOJu0YxTGntLR1ohFS90CLi7/9PvtjF7oEMmG7oeJQVed5G24v8nYH5D
 MxEF4nY2ZXJRTR/SFspib9KESOIVzGs3nJycehEYjHIzDIGsKLYN4YvYhAs1RJhO
X-Gm-Gg: ATEYQzwebypLDpfTBDvlWiWpLE8uAgrOlASWYq0DmlmgQvwHQyFEnRO5Eu/gKcP1xcQ
 7p/Bkwq97Ao+SiNSAIm73YQrMCeOmFrmo2PAYmJYTCMkDH1+CyvcRVBM0QOpm3Wnunfmw0MrgUR
 T0xFSE0EM/aWolz7H4a/xkQQEXLs2OGYHQLKxorBCjRGUZx+JvN0Gqk4GJR4jah79QT19z3MnG5
 gcHVZ+91kEJWiGiAT45Yzvv9N8BX8hknoqXpmEPkQbtP8p4R8Yof1WNi13XpXsPkDip9+RTUOkX
 CEioSYfrkD0Ai+3OFyHhIFd+xspyGH46qLleFWaW+Crl0nNzxUb//Nw1MayLXJf8FusYx7DIcyX
 YN9KdHPg6PiQX21d+zTRPFh/Myr5ZzHu2KCOgBWa2kEM+eOWf9uQM61pr6o8XZJwAsciuEmtkje
 yu2QNVGmfqTjHhZ3kSOx82SEoUOYPgmoKWOZYnU2/8HdvWzKOvlrSYHWAyKOuR
X-Received: by 2002:a05:7301:1285:b0:2c0:bd37:a75a with SMTP id
 5a478bee46e88-2c0e5074a6emr1632856eec.1.1773846383116; 
 Wed, 18 Mar 2026 08:06:23 -0700 (PDT)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a0d4asm4115283eec.20.2026.03.18.08.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:06:22 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/8] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Wed, 18 Mar 2026 17:05:16 +0200
Message-ID: <20260318150517.4049206-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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
index 5c0597869..a38d6bdc0 100644
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

