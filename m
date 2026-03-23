Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C284FF483C8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757CF10E49D;
	Mon, 23 Mar 2026 16:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TUZ0YsMD";
	dkim-atps=neutral
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E62510E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:30:03 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2bdd40d3c61so2394499eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283402; x=1774888202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKSoufC6xw/roQvOEofpUhiAqD8bomd1RkdyojGAPXs=;
 b=TUZ0YsMDaHEtdoUumA3GuIIBsEBYNAUFZeB9FFup5cg3WrXoK2wcbh0xbWt7ZgOucw
 BREtPGn/1XHCHPUHvQZqjyv+lqyoLXuOsautIECVYS9VuvQ2tr2vm3r5mKv360Qs/MBw
 9V/OjFfaHHdqE74WPQzPXpdt2agWp793jx+K99RZ35Z3+GA2NWBH4LgaTVkJIzeIrqXY
 p7AFlbb4kS+juj5v4MxXjAlnifRSqHXec2eoaIUMZi6xlM2bCXkzggzpg1EpvQ3hDN0L
 kbp+zp9210NAVUGm579LJbMMg0SZm+x6sQb+Ha/pSztUmsHJQBGcneKk8tS3+9WjIdaN
 kSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283402; x=1774888202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bKSoufC6xw/roQvOEofpUhiAqD8bomd1RkdyojGAPXs=;
 b=ZfXZINL6KOKRRW3RQ/Jwtgt24uZGgKWN81xTIwWpUPytsn92ykc1KE3YZ+LR6CYFSE
 PJxD3ILtHQh0kOSaVzXzcnhxNxr0yxI6qVKLDp3/4K7GIoecNNyoGLeuhyUaeB4nA23J
 M0d/BECq1oGYlNLOEeyb6PvDqZ9yncfEK1hSTkSDRdcQ7PsWHyNQ9LVJC6AHkj8IodKu
 p0TgGs/CtoVaCMil8y1JjdbAuI+CchDMpEVKMiZgXWfvHW5SGOd3ZBUz16aJjmt2u3Qe
 zH5BzzwFPDRF6hlPSMAUekJ3Nk7pKrYb05uLZTPtmp/8v31imWAFq/u7ALJPUMQzjBbJ
 Jv9g==
X-Gm-Message-State: AOJu0YzpmJWTKL8pP6qczsIn/3nHDOqDDCQKOBJO7PxnSWftlqmVjZ8z
 YCJIGniL4nKqw8YROjvU/iHle9B9q+xXmKImPYSjIsVnuIFCyQ7fBsopx7JKn7w1
X-Gm-Gg: ATEYQzy68dpNUYLMeUxRNHTN1U7UzT9TXi90U2Hbp6BcoStP3zin3C52qUPEOADRU0U
 WtSvfR203qKykQvmPfZvKvBFvek9rxUDtwX/LzI1BIW1+bTGjtLNNQn7IiwgG/cp9ffqlR2t3ec
 qJudKcBJKE84bHcUK627bOlht4rIaP+k3eZZiQiGMfeY61gqwUDxSLBbxRme83XZWf8F5JYbwi6
 stWBJ/rBiZcPwL3qIm4aeS9XUUxePpgrTf/Zn0E/gbyKUiWNlIvTgPR3EpAhBBjxRt0VRIcB5DY
 NUakYNjWHtDXs9eYPiMTkNdkkfZYHh3u/2DFcSmhu4o2Oc0Ev3n5KZintLAeMqAL+Ej49DpzY11
 9/wPRmIDliinxZgHZZFv2ETTHTwG1sh9S074yjCTM25Ev058Hwpoa0KuYSrHNTjomJXcILD+1I3
 exrSgPW+elzNWKT6LDpQ0LnDjrdyIVYNdEIk0zKXMDkGr4RKUgoNUcypSLUSo=
X-Received: by 2002:a05:7300:e825:b0:2be:1f58:32a6 with SMTP id
 5a478bee46e88-2c1097ab36fmr5499180eec.33.1774283402167; 
 Mon, 23 Mar 2026 09:30:02 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b17b8f2sm17515124eec.9.2026.03.23.09.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/8] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Mon, 23 Mar 2026 18:29:10 +0200
Message-ID: <20260323162911.1912755-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c            | 17 ++++++++++++++++-
 lib/intel_batchbuffer.c |  2 +-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b..0f7ebc6b4 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2560,6 +2560,7 @@ struct fb_blit_upload {
 	struct fb_blit_linear linear;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
+	uint32_t vm;
 };
 
 static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
@@ -3364,10 +3365,24 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
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

