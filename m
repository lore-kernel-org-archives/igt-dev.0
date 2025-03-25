Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEB8C3600B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00B10E5DA;
	Tue, 25 Mar 2025 19:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MVb7YDhS";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409A310E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:09:13 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2243803b776so56138405ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929752; x=1743534552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Skfe+z9O2N1vSpRn6SoWOht9Tf9gPItBXkiBO1mRnxk=;
 b=MVb7YDhS8wCL8/UqlqFpl46Iwlo+Qect7rHDXwdvV79b9sQl6CM0wgKNeS5YoicwMN
 7o310ccy0VBZwIz/8qcVp7NU74x2Dj6X+DNVNwp00cpKlkUgXMPfQF8YHObjK3ME2X+p
 iCNi7HLW/MgP2RIUKU7xkmf4clHpPNtlN06bO+MkcDXrC4XXS8Uq4YrYUpYYkcKik+cL
 5lUCn3SrdJKxhj00Q8GBvXR9cacTybhpk0b5eu6fh3TWSC9UVblGpIhUoKvarjRkH7L7
 hc5CwBKz2vPn053PFm24w60hpaRM0/C0UsYeZRsMBCqZFM+R6ndkCKZh3ehiARTdoO13
 ZbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929752; x=1743534552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Skfe+z9O2N1vSpRn6SoWOht9Tf9gPItBXkiBO1mRnxk=;
 b=PBxIhkyYeAtmcFY6S5Fkd+2NTS7VHSEd1rDu1v6tYei0ZDbVtp8uRYvpj8Kzbhjokf
 7Z3uSy0hZm0SwvYN6CGewt2PjClJz529fjag3Q39cP1YHLpyxQlqxUUcHDOzqVbV8rxd
 BQfEGRIVHXHNPcBJWJNngPxh4AuAcB9vxJ5SPvAf15HPcmPpM5Bc1PuiULuUkUKKyTAG
 pfD7icExzoRpc1mnAmWkiu1ATRb/aldzx2wa1lDNUzyVBdrzFlIUfM6bhGCipTrvtPXC
 yfqoimdqz7TVACfSaYzZUmPNKJz7I3GldClIGuxPlAEOTGZ79Waz7wI3q/27YzMW71Ad
 FC4A==
X-Gm-Message-State: AOJu0Yx87tqMvTxezuMMmKKcrPStzeFPHoqNo7YeGsBJDi2MhU7stOrf
 DxjMmop+Au7vmCAGiOx+WHzvdPXYVWsBkmlAZUMrL0bxFnnhbWsa/+C72cX9pUs=
X-Gm-Gg: ASbGncuyjutUTQjHo5DoX/cUHYXCXRoPdkDhcKUV06wcEFg6YxXLL1Ettou7GHax+Qw
 w/9cHgmSf/5hYccTkWBnKE9cQAaKsNm3g6aEQX09y8Q0LWKUUXQf6wNd6W1LXEfUvWkdyXpazrq
 XjBsy4x+atRU3jSJXhdlqUKyYKi31mR5GB3GRlA37cGFNAqzlgUsFTXZMlj5vvl2nVb3mhuSCpg
 S8ZvmvwAvh6VV5K3osPSIzUnYs7nk6+Lr3WQm5HZ2V8Aa+MXDUe3JFIhsJ7yh1jadMUtIVzMUD/
 ZxzT08YFCh2MevJ6ENln09D4yJyzQV9rjBVfvqoZ/wshKkyePFSLKhbsfV2V/6nx
X-Google-Smtp-Source: AGHT+IH8U5gCyzTaqDLrSW73W3O94Cne1re671PbLGD+cdQLdSETIvS1RC7II7rBo4zIUuzLpg15eA==
X-Received: by 2002:a17:902:e543:b0:224:1935:d9a3 with SMTP id
 d9443c01a7336-22780d78745mr278350955ad.21.1742929752390; 
 Tue, 25 Mar 2025 12:09:12 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f4d5f5sm94425415ad.79.2025.03.25.12.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:09:12 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/7] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Tue, 25 Mar 2025 21:08:38 +0200
Message-ID: <20250325190839.1984723-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
References: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c            | 22 +++++++++++++++++++++-
 lib/intel_batchbuffer.c |  2 +-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0d024dcad..a09eb00a3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2484,6 +2484,7 @@ struct fb_blit_upload {
 	struct fb_blit_linear linear;
 	struct buf_ops *bops;
 	struct intel_bb *ibb;
+	uint32_t vm;
 };
 
 static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
@@ -3268,6 +3269,11 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 	if (blit->ibb) {
 		intel_bb_destroy(blit->ibb);
 		buf_ops_destroy(blit->bops);
+
+		if (is_xe_device(fd) && blit->vm) {
+			xe_vm_destroy(fd, blit->vm);
+		}
+
 	}
 }
 
@@ -3287,10 +3293,24 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
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
index d337c56cf..c95790aeb 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -688,7 +688,7 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 {
 	igt_vebox_copyfunc_t copy = NULL;
 
-	if (IS_GEN12(devid))
+	if (intel_gen(devid) >= 12)
 		copy = gen12_vebox_copyfunc;
 
 	return copy;
-- 
2.45.2

