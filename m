Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D87EA8130
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8229210E5C5;
	Tue, 10 Feb 2026 16:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DNqpfckC";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BD610E5D5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2aaf9191da3so6895925ad.2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739832; x=1771344632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vj60NtKj8CxvjuF3scse+1MntI7/Spb8sxpSXJqqTZE=;
 b=DNqpfckCX/f9wOAfOjufjMqe3E238XDPNrqS1YSsulgtfI5SGDq6ofLNyeVifH2rDi
 tx2V4LJmJ823s9uuB3yjEuzNspufnsvU5So8dptkMJc3UnU9ZYe+Ui1bCOzIJOOgV+HO
 1+hx0Vrk+EOttbxVOjGzp4+wsv82myC2lcl5RI623NrxZAC6Cye23JUKfNfrTmf/bv30
 BcfWLCfrFkiXa8+J7+T8K4bPEEGka6hl26v7MM+0bqx+j7l8+AJyW4qhoZHxWL4EfWhT
 ujjM5KAt58ZpWioUHtuhQmS3S6rIKWq1vwx0F6iAnUNjnfHyDEbF8U4zbQafrvSMOxmS
 VXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739832; x=1771344632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vj60NtKj8CxvjuF3scse+1MntI7/Spb8sxpSXJqqTZE=;
 b=qTfYuj8HsrjDHx65feahTi5KFs7n9APYGvcWTZ0dWqVPhegPeUuMicK+Tnyj75lOwB
 hyjd/Cft/IBSqz9dUQdigdIj+AIoqcW1VNSgy0WbLTS2zSfgRD1bXkP0+mSHuUs4DQ9n
 uv+eE1QxelNxV0P6YNMevVNLTHQRJDDifitnw5JWipB48JAeVB1JR6PLoANpo1WE4Udf
 zAAAts8OpeLOVE8bHW5ywLpFV59KHhEPQDEqjJbOTJpE62ettVuoMms1cfuc0bKi9ytX
 qFoLhBVTf+5Nv/BBpeXJTzo8pmh1I2jJum9rBn0dEj+acDWv23yC9azcdo62h+O4Rqxm
 nGJA==
X-Gm-Message-State: AOJu0YyqyOlnLJRJV7HQo8UiKv8iF+I5pAqC0iJpPrxI0418YtLzlTTn
 p8SQMQIgEh6xmHZ87GccUQlTGPzk8tS4HukZH9hXZALgzCheKul3Sd7pL8hmjG/L
X-Gm-Gg: AZuq6aKoVfRe/qqFSCLShgMSCnz9HS+WsxT39im0fnSaUvK1rtHotTG9VAtHkRtcSos
 41rPDLneX2CglBPgz1Twsq/egYNCScP7MQG1CxOXJg5Yk5yNa6D82310BcABmwgmr9KVCSgZyYN
 vx6TBjoJRTJxbnwn6JPp/bDejzL2bpx5JOJOGQK0smOKNI+xvY/39OXHckNxVy2X8ikUk+0U8TJ
 iLlFpNTyHER/9xOwu/Ytt4284H5N5Ak/2EvuiaqOY7ctwn3HvpvKeAkSVm1ueELC4Fi3oTv4GFl
 AUyWH2c1aefN4jo6nb4w9RmWxyOI1EXC5O1bxu9GDGdzRdvoJxZaJsXAJwVND/xnMRgxjrrBH16
 FxShtEnSm3oqDBL+eKW7+eVRkKRDhY1TyE6Bx7MJ/nbGwlAekuwm5bDbR43d4MryV/Zc+kHNFJw
 A1gniJgIm10p4QZgpSMvLWZdT8rmh5Yayj6Kl20IsuGqkAUm/5lNvur31ZHQZmvg==
X-Received: by 2002:a17:902:d4d1:b0:2aa:f2ce:5ac5 with SMTP id
 d9443c01a7336-2aaf2ce5f20mr64443595ad.32.1770739831920; 
 Tue, 10 Feb 2026 08:10:31 -0800 (PST)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a9521b9bc3sm145688965ad.63.2026.02.10.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:31 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/7] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Tue, 10 Feb 2026 18:09:40 +0200
Message-ID: <20260210160942.2219370-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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

