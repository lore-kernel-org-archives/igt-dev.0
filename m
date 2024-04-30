Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986BFC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 16:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E89112BCE;
	Tue, 30 Apr 2024 16:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CvhgAjl8";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D06112BDD
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 16:29:47 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2dd19c29c41so72437311fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714494585; x=1715099385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myzcxdZCmibZsRj8bpxr/+iVM9GQ5a6KpJyTAW7cPho=;
 b=CvhgAjl8kZg4/uAUdDm8AMbgU8zc4iwImzb9WgUxUhJfVpFyZJQWwIy8PNobKg4d8d
 dduKhHqg3apEfOiOK+a7CkdLYL6e7HXmpYSvpI/liNawQT/jYVIgjjSiqdj3D4V/7Fmg
 SuBNOwVlMEuxfBblS6fptn71l2O1r5qtC1GHWdmududRWzbY0UTpUObZEJJf4qjX0UeC
 tlQwn4tztLzlhnG5QVNGjCCmkoixkcYIy1T9wTI+/FEf9pUttIDEvFUHVbaE7+ZKCOoX
 d2FEaP2ra2fogBNC0CZ+FulYbZvNlvQ4aZFbmfM8HQpv+vrHx6y/fEXV4pjOhwj+HTa2
 CKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714494585; x=1715099385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myzcxdZCmibZsRj8bpxr/+iVM9GQ5a6KpJyTAW7cPho=;
 b=kwAttZPozAvdo7B49tkdR9g7vpV5ykjlthWFUR/a/LoEvjxsuAtGXQ8KG0hzuL69l1
 89j2hhtCUQvtbCAm53LDhQ4KVEMfcvhqgaAr04xbiueZ4r/jZ2KxRyiTBRNs00zXIibQ
 HudNR6eHp4JwfT45AhZ1td4l2/iDo5S6qN3+uM7VghZMt2hR03F9Ltj2drjp6N8iloV9
 HohnbZn+AQZnbqiyt4FBAarEmTaUxu26BJb6smALRp05AXZifqKyaCXvwCyBQp2UeMcJ
 XgzKuXj2MMriHBozg7uLsARyoiQETHBCZW0+8TSYDgF6qKygDXXk9MLbFmgzzvqDY3V/
 1bVw==
X-Gm-Message-State: AOJu0YybmMeRY5crjhZfMgA8byW4HOQ79LFrp1n1efj7cNdKklTm0fGS
 laqG5PmonmCikVY1FAuSVa8XIAh1fLoyByXcVKqdgRQAWTr+D/trYiJuwlYR7+g=
X-Google-Smtp-Source: AGHT+IHyw8V/yu/dWde2Vnx7TldWtZBpTY1Sehs7oSbMUVC7LKQ+1U/ip3r6Ilhx2vS6DcJwQ63Xng==
X-Received: by 2002:a2e:a688:0:b0:2d8:8b7:76e3 with SMTP id
 q8-20020a2ea688000000b002d808b776e3mr107403lje.11.1714494585214; 
 Tue, 30 Apr 2024 09:29:45 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a2e9b93000000b002e0e410ad06sm302814lji.138.2024.04.30.09.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:29:44 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 3/6] lib/igt_fb: Sanitize blt_fb_init
Date: Tue, 30 Apr 2024 19:29:36 +0300
Message-Id: <20240430162939.272990-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
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
index 707eb0a1e..b4afcaacb 100644
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
2.25.1

