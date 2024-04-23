Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15F1C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8ED11214F;
	Tue, 23 Apr 2024 14:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Du+ubmzC";
	dkim-atps=neutral
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329A6113405
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:03 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d895138d0eso44628681fa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882781; x=1714487581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0KVNZOWoSEObnM6zC2gc1e/2DLFNPEJBm6IYXOdbTI=;
 b=Du+ubmzC48kfVAvT+NyOdFf61//Spa18ukjJoXER8t6ZkdopXYVKY6W/IqnqwohZrh
 xxxAXXI5482PlLvcCkGeVd6CyFIGFGsBSAKMd/IdPtKhuC/kSL5XV3UxyRRRtoiGe0Ja
 OV98wCi4GLOn056W8dXI5lWirlM30CeyCzVy8m79QY139Tr20J5jKaWiZB299jX6exRr
 V0VFHSybnFpCEEonou8/j3DbCUJQjVRWQq2qt0jmbCOW7WXXtHt/brlbiwMKXt5g1eoa
 eiJIgxzU3yYHf5wLx74Xt23OGYOh+AIMPDbOCx/Ag00LbTCNTiasV6R6rSCqVMVPjEW3
 ozIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882781; x=1714487581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0KVNZOWoSEObnM6zC2gc1e/2DLFNPEJBm6IYXOdbTI=;
 b=nLbMsT2JEKnkisHVbyDkzRoU/OLZbcuxWsyYBxXFHQqkgy0alFIyrYdttMaJJINefe
 NftELWr1X4pnMDXxrbqkMkZrgVQBeqq1o3DqJL1SFK5B9AtPnLd1XZevkm0xuZkNZsXA
 q2htvTkdYt/IpzruwjK+QCWZZvQeINRWP0y/0tfxmkSKpSrWWAhz6nb/c88sELuMP94K
 EiPJVMhJ0a1/ssurNlQHMtuuwWr6/2aMVjXtuqc/1vTDF/cV6mVG63+ls2veKEnJoYX6
 XIY54zDhe0yMuWZJDcgdbea7Jve2x9ouiwTEpy6+9XwzWlDGjcyFYRVWu/UdWH6Ew/oL
 lCqA==
X-Gm-Message-State: AOJu0YyDBwzWNLmx3h4NcnqId+kC2TqRwm5SzO+Q1WFrlmgPE6z5eRVa
 Si1fmtE2fuuialRTJIC83uFcI6oeecbhwwNGsEy9yauLuGZyZrEwNoRNS5hyVbE=
X-Google-Smtp-Source: AGHT+IFAfJwLmHuHFO5E/MhZ3qOm+z/6t1rDeTY4LYzScfvCXY4eL6MAFFwSBhlklvjdH9RZe4WyTg==
X-Received: by 2002:a05:6512:3b14:b0:51b:62b8:d7ec with SMTP id
 f20-20020a0565123b1400b0051b62b8d7ecmr4457817lfv.15.1713882780513; 
 Tue, 23 Apr 2024 07:33:00 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:32:59 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 3/6] lib/igt_fb: Sanitize blt_fb_init
Date: Tue, 23 Apr 2024 17:32:43 +0300
Message-Id: <20240423143246.130884-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
References: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
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
index f9868e269..ef21095ce 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2759,21 +2759,18 @@ static void copy_with_engine(struct fb_blit_upload *blit,
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
@@ -2784,17 +2781,48 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
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

