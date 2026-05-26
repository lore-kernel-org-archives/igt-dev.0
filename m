Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4696BCD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D010E6C0;
	Tue, 26 May 2026 14:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="p7YhsF7x";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F1010E6B6
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:26 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-36a8ee1e28cso3107649a91.0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806666; x=1780411466; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U96qw/AY8soCr9HV7TIjh3SXwwDsaEnKeL0TZx5aeYo=;
 b=p7YhsF7xI0p9YjyTD/1P1E0yNuIA+f4UV9hwJ7Rg5kT4O9Hjf1uYLFhFcjlxikRF1A
 uEQ5b4DQVtKy3rNVZEUrfwhg/aMMNiyB6mdhkAGZv0zfmfbiZvp9YVK+bxm8C4AJCsT/
 THDZ+9xT0L1yLt7oeVkrirp585ujh+mx/ZV9Zv+IA0+QbMstOkh4iJUbeC4gWh6SkX4s
 f3OByx/VIlX82rERlq3nvmJv2h/5JSBM//pIpZ7nWUXfPgTwtjsaJbjYEa+OStVABGfL
 dkrQ0M8wFkrXM3ZC1SPEP/f1xRTeh6lDu/KbZ4gGyx8nsxlz9qY+x+XAAQTmPemxooD8
 q2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806666; x=1780411466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U96qw/AY8soCr9HV7TIjh3SXwwDsaEnKeL0TZx5aeYo=;
 b=ClXXYdkLr6r0NjvmogyA0wbkx4VVnVdx77ozSv8s79SL6scI7Bs7ICQlDrJC1rlqZl
 2m+z+ray54bo6KQ4MxcS1tJeBEimkj4PC0YjZQhJSLEvCnuwWanPLusypUrRAQ5qFZEz
 3jInc34nVXE4p0X0ANDwxmcwYpBBWbnhmzlqG8NGtu7XSl2fU1/nHW8nC9gXbH6dmTXH
 yVscGZQC9JMO36KVwAlDUE78R/Y1l9VgTQO2UCSXc9829LLFUOZFnK+UYgX2A8zMEcxJ
 cIJUD+4DylK2plj9AOYigudOfEE6PB8X52/llpiTIdO+cu9WI+KjFMsmYFcxxiLYPKd5
 xFWQ==
X-Gm-Message-State: AOJu0YzGtlqKAklhjSJsOuoiJ8h9WViVE56sDkehBaxWwXzglqSPifc3
 vAqfC+iRqZ8WpIDnpjENbk3UJhdR/PL4Koe8xgqAISRGeBewzzW1bNPnUw/ph29y
X-Gm-Gg: Acq92OEaRb145NpszWiOq0zEHIl9Fq3g6WvhiUltmmnuG2E6nyBwsKAfUIA/JJAWR4r
 J0ncVvzjjEEeSvwZU1UjYiqpyfJ6juNOtnCZ5KWiWBT0tHSW4vLhQ8ESAMlsQrXiEsw46y+tYY2
 m8QyoWHg8cILs0IouIwyQD8nt9qMKfXB8xFvi6YdPrJeEmz/sVqWMOmZmkenjUJtqaesE+zz9U4
 jGo25sJAIgC1AwEf70FOnCicxN1z3RsOc0laJ+r6T3QO/FQveFRR+RqTXRKrD/EASKANAgoZP+v
 tCyapllUqeo1UvOVNXgc7UfduN2xtIlUFUccfd3PJRyXfzJ1curcFB1DHkkLXzUk8ABAei3FrG0
 gJ/vSaLMPlPe5NNTKrhglU9BzfYMr2q8UbpCVYrJkY/XTjJOoSqwSyoJhIhNx4a3IJo+8Kgzs1J
 WqwQkIS5hic2cFvk7XHdY30FaYptCSPiHSyIIrX/q8L2nIod2ZLjjpBSqttT5KOg==
X-Received: by 2002:a17:90b:2e8c:b0:368:a297:bd38 with SMTP id
 98e67ed59e1d1-36a67704b2cmr17933995a91.7.1779806665698; 
 Tue, 26 May 2026 07:44:25 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a7263178dsm17060346a91.3.2026.05.26.07.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:25 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t 7/9] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Tue, 26 May 2026 17:43:41 +0300
Message-ID: <20260526144343.2531299-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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
index 9630844ad..912b936e0 100644
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

