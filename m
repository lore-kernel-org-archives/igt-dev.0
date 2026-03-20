Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD51098782
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5DA10E466;
	Fri, 20 Mar 2026 13:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NB3jonYk";
	dkim-atps=neutral
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C42E10E466
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:47:01 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-82c20b9fb16so138313b3a.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014421; x=1774619221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKSoufC6xw/roQvOEofpUhiAqD8bomd1RkdyojGAPXs=;
 b=NB3jonYkSuJZrmDdWV80S8cXHekrP/2PjH4cvK5nPkJF8GhCfihWX4qcwLrlLxUYgZ
 Feg9P2r9+iHOj8nZLommfS8OpBgIYKvgo3FGDkecGhjkCoBDc+eAgHS/ugVLTa6exAvq
 TcIZONow3AZWa8xZPs3f9hY/NN1lxCxJKWMppWENIakKI6TdpqkOQqI+4QYrfsshECgv
 Er7KO+QfUGM8wQ8X2Y9TwjggMajB1+bbxHpnTCBvekct6xOowegSy1lt19JGtIKZx4tz
 EcxGuCmGG+thyi9qsZsaMbtmIF9agrv6mjLBPIVFtT7+0/sgUQxAwRyYSC5r8zApmsGS
 3v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014421; x=1774619221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bKSoufC6xw/roQvOEofpUhiAqD8bomd1RkdyojGAPXs=;
 b=Cb1QjgqW3qikdidqq+5nsEW7O2KRJ3DgeiFp/x/s+60uqiwDsiOOuZGk8pAqDo+LKE
 sr6sUi6akg8ACbBa9QoPOAUqxdIIbNcZDQKM9OhxF8CHkf5MkMBHjaX7n8dRJfmgjJnZ
 /J/oZyHrR/0E9c3cYtOoG6MG2E/3hedLXjXRggpcVXXO8v9Utb+oXO1erSTjfnu7R4v1
 p63BCBL8V0mGhKFlSqv5gsgE/Nq2IJOgtRJ3ITzfBz1SMoX1JxY8ykQ5eFkC2bS5L3xa
 aqqIx/tGT11qaWYyGlb531fJ6iDDcQHyI4DHx62vPZ4S6ekrQ0feKiS9/yAvfo+kwzGX
 A3xg==
X-Gm-Message-State: AOJu0Yxnhdx5dTFlG/Jti3dUSPFrQDlJDcYUQzoWEllHk6Y7qt3+NxnB
 IjdYQifK75OaWXxgrmfNqroeQilpZK74t8e+GtMDONAKSgGKb0El3EPCq7qXIEPd
X-Gm-Gg: ATEYQzyu6JxFHxB6AicJZ6plZNCfcKYEPJqAz/Mn4cCUab970F6aU+PduTWQx6CewD2
 nmQ8TYcu6PEAUlePhrtYuDt9Ecj9Ypz4p7OWJ3VXlJhbkcLzLM7Y6ymsXXPnRVr/wmCB7lludob
 PaRFWPuRc7uYFYSRJ8XOk+r8+3nWok76rrcf57V6uPwJHs6qJt7oaHxKZogIynYtvpxSKQ4hNds
 LSWs5ZZ6mNyzj8s48v50zKcouH3HMW8ltGdXuEyEeABN4eEU2lmq0OqQc8wkvQ6jZqRxNW3HzlM
 cnSbOqngZX9JnobUYCIeX3q6eS0ucdm4O8nXPIC0D7GTRFeMw/O2p6CGFRRMKQzg66yK5Pr5dHq
 YXVN9WbF0ZOjlzg5AlykPcJCFR3enwJsAfEV4TZ9xLlju0KYvFJe8KSag20O58OBMQ1U6Xt8VQQ
 NKrmZGU5ZIWR4kRi1GLa09/t/FjXRK6pxJ6qoPa8vikfq0uj65hPbDOKpg82vBIQ==
X-Received: by 2002:a05:6a00:4b14:b0:827:3b1b:43e6 with SMTP id
 d2e1a72fcca58-82a8c2a07c7mr2582615b3a.21.1774014420585; 
 Fri, 20 Mar 2026 06:47:00 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b03aa79dcsm2014665b3a.3.2026.03.20.06.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:47:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/8] lib: Enable Vebox framebuffer copying on Intel Xe2
Date: Fri, 20 Mar 2026 15:46:10 +0200
Message-ID: <20260320134611.876379-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
References: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
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

