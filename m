Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCAFC27C44
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 14:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900801136EA;
	Thu, 30 May 2024 14:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R87hDhr7";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335AE1136D6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 14:20:10 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f62a628b4cso1866945ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717078809; x=1717683609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2GdfgAiNbgUZMpKVa9RH83483rI68FbdcK5TH3B434=;
 b=R87hDhr7pVIPq1kk9bKY8VGAq23gwpUBNH3GwcJfBBH3a84EQCEBgdzK8dnoYdH3Kf
 sTSXpXageb7JUGPdilkxLwoZPzmL35uu72HOXQXnUdXvTC7uftYPImvuu8vi7w2yBrWS
 0h9HCKSeRdmjRWfNw28bjADAcGrc2oiszJz4kQPgaGRHuCJ4WoSBGsHhulPshZvdsWnl
 /RCQVIjdVAsbPBiCeAw8TUQAuhrhk/NwxC8+1kOo3jMgGlIzXrSXmjFbzGjU/3z8MlSX
 jxbdATT2L//Tan+xW9sM86Cq6ZhrOg50MwgSZCcqMV2DOOf48gnlLgKaLuf5TaVmm6RQ
 saHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078809; x=1717683609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2GdfgAiNbgUZMpKVa9RH83483rI68FbdcK5TH3B434=;
 b=dVCNdreqhayTT20uZik2CWVg3nv+4umM8F0ic1amtrs1Fxjs8ZfQJnh0riJZxDGwiC
 QJOgpDXv8IbxKysiYfWj2n28q2gsoSEpIfYC82765+rG4w9XSkd1eAacgtlj1MY9l0CR
 ghL7cMxJwbz5b0Rj1tWX6+pLAy5stXkVQHnJW1PEcGsce0V8rigYuCzYBGzRG9PwotKI
 d6O4Gbivcfb16kRzbMD4+3eTmV0MyY8ULFGyvpf3HhV9/YOzgREs0PTvhOIHzGFNnWf/
 IiNJr2levSQlJR5dCoT2bM+UHyOALrx8lsyPou2iS+WkirNvCXSHdiId7gTfcYWHkVlM
 LAAw==
X-Gm-Message-State: AOJu0YzuknEf3cH7qMtZdm7iDXzbPhiR9z17GRu+GNZHOEoAoVSNSDyv
 DijFYSrChQQ9oeOhK7z4ydTNzU4kr3j50cG1AJuKdRI6YIMF8dyJUHwQJTOF
X-Google-Smtp-Source: AGHT+IGEZRiYGzTHndluuDpIGNMc/12LuM1pSIgfzSsPxwgxoHr37F4FXnixbPCD72oGF9SgpCq+3w==
X-Received: by 2002:a17:902:ce87:b0:1f6:1f64:749c with SMTP id
 d9443c01a7336-1f61f647ecamr15247485ad.60.1717078809316; 
 Thu, 30 May 2024 07:20:09 -0700 (PDT)
Received: from localhost ([134.134.139.78]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f4b83ffffasm65738215ad.173.2024.05.30.07.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:20:09 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 2/5] lib/igt_fb: Sanitize blt_fb_init
Date: Thu, 30 May 2024 17:23:43 +0300
Message-ID: <20240530142346.1511811-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
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
index 707eb0a1e..588144579 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2760,21 +2760,18 @@ static void copy_with_engine(struct fb_blit_upload *blit,
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
+	struct blt_copy_object *blt = calloc(1, sizeof(*blt));
 
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
@@ -2785,17 +2782,48 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
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
2.43.2

