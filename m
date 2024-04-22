Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960CEC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE59C112D6F;
	Mon, 22 Apr 2024 20:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4/kHd3e";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9858112D6F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-516d264d0e4so5298542e87.0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818704; x=1714423504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCv9nObkdcX237844134SL+1KkDd3OMINkOoq0RYm0U=;
 b=Q4/kHd3eLVc2qmMqmk83XdD7OFBr1zAmf1KEyBFuI2FgWYun59LqmCY0cTb4+Gjsz4
 zjGDdSzcUErfduv8kSDN88jPU0cIaM2ttSdRBBN0TJTD2i1hHo/tez0iB2nMexbFOYOW
 eCqeKUbo18iw3wiVxb8qyaYOlYcITZMyUYzFWF4eYfY6Vc3lGXyAIYg3ANIpiDaqdMD7
 JiGkCYI3NnM4BhUmZ43gC1LpMKUPOzUj2ZEXpqyIhTnsOSwHdqAIhzISsjbuf7eOCyfe
 kAeDql7Rimepq+7Vic4SNtOfE/bG6lRJqmGq/PA4EZeh8zRJoRJPPrPWUwbXOyk0x/sR
 I91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818704; x=1714423504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCv9nObkdcX237844134SL+1KkDd3OMINkOoq0RYm0U=;
 b=V75yXNIhvX/dsrx2cfUUWaqFODqyfIxU/VJobllTioJfyx5a0wDHxygQBFKJrRvT4Q
 3YZ1QqFX5+2d+HHhid7+CpE8LNQBdY4Cy9VJvxtvHQ8Tn+2jsaxVcoO9nZbvQv2S33fM
 8Clx/+S4RSCB2gJohJKwe/GSygIvlTAXr4YUBcpOHMRLQ80bZYvSfq1RPArtgakMlYyv
 yWd7aMQSX8RlYZx5chVKISxhLu1b6zGCodPkE8XotAgWluLkxR/3TG/3HZQa1myjrovT
 aZ1QOvwS0a/oHQ+OjxWXOiqhf/cdTIInR5XrM+92xGf2lAxMLb3QpPjw7g+B6cC110eO
 higA==
X-Gm-Message-State: AOJu0YyeOMKX3lTJsa/bCf2LYt9+3vKeH0HCYVwengv4BPvWRdYNNtpV
 lSO4gIN4HoCDhrBjTOp1qaNmTUfl6pjdyIq0oifjdoj/LvMPqjYdR2/5jKlhfXM=
X-Google-Smtp-Source: AGHT+IEF8rg5mK22N/qVNPSue+PURcR8pJsDRTk0byE0ZynOcTLJekvInPOAdY/7LaFSbQ09OLsCBQ==
X-Received: by 2002:a05:6512:4808:b0:518:9762:500e with SMTP id
 eo8-20020a056512480800b005189762500emr223646lfb.5.1713818703328; 
 Mon, 22 Apr 2024 13:45:03 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/6] lib/igt_fb: Sanitize blt_fb_init
Date: Mon, 22 Apr 2024 23:44:38 +0300
Message-Id: <20240422204441.106197-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
References: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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

Sanitize building of Intel blitter setup

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 64 +++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 684995909..491cbdaa9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2756,21 +2756,18 @@ static void copy_with_engine(struct fb_blit_upload *blit,
 	fini_buf(src);
 }
 
-static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
-					   uint32_t plane, uint32_t memregion)
+static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *fb,
+							   uint32_t handle,
+							   uint32_t memregion,
+							   enum blt_tiling_type blt_tile,
+							   uint32_t plane)
 {
-	uint32_t name, handle;
-	struct blt_copy_object *blt;
-	enum blt_tiling_type blt_tile;
 	uint64_t stride;
+	struct blt_copy_object *blt = malloc(sizeof(*blt));
 
-	blt = malloc(sizeof(*blt));
-	igt_assert(blt);
+	if (!blt)
+		return NULL;
 
-	name = gem_flink(fb->fd, fb->gem_handle);
-	handle = gem_open(fb->fd, name);
-
-	blt_tile = fb_tile_to_blt_tile(fb->modifier);
 	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
 
 	blt_set_object(blt, handle, fb->size, memregion,
@@ -2781,17 +2778,48 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
 
 	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
-
 	blt->plane_offset = fb->offsets[plane];
 
-	igt_assert(fb->size);
+	return blt;
+}
 
-	if (is_xe_device(fb->fd))
-		blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
-					  PROT_READ | PROT_WRITE);
+static void *map_buffer(int fd, uint32_t handle, size_t size)
+{
+	if (is_xe_device(fd))
+		return xe_bo_mmap_ext(fd, handle, size, PROT_READ | PROT_WRITE);
 	else
-		blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
-						     PROT_READ | PROT_WRITE);
+		return gem_mmap__device_coherent(fd, handle, 0, size,
+						 PROT_READ | PROT_WRITE);
+}
+
+static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
+					   uint32_t plane, uint32_t memregion)
+{
+	uint32_t name, handle;
+	enum blt_tiling_type blt_tile;
+	struct blt_copy_object *blt;
+
+	if (!fb)
+		return NULL;
+
+	name = gem_flink(fb->fd, fb->gem_handle);
+	handle = gem_open(fb->fd, name);
+
+	if (!handle)
+		return NULL;
+
+	blt_tile = fb_tile_to_blt_tile(fb->modifier);
+	blt = allocate_and_initialize_blt(fb, handle, memregion, blt_tile, plane);
+
+	if (!blt)
+		return NULL;
+
+	blt->ptr = map_buffer(fb->fd, handle, fb->size);
+	if (!blt->ptr) {
+		free(blt);
+		return NULL;
+	}
+
 	return blt;
 }
 
-- 
2.25.1

