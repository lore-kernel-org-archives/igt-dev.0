Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D8DC36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E600610E5DA;
	Tue, 25 Mar 2025 19:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCFwqBEr";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BF910E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:08:59 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso3027185ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929738; x=1743534538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCBaOHPJZtOrgfJIE6986IHfTnITD9j4IHlG7PYQ0Is=;
 b=lCFwqBEr/dEZlHT5rnH0/qTadVB7Dq5gPIjqZJTjYmjj16k1H4Ph75/L99a6Gm/bgj
 TpfosZfZ8J6PW0HCPNXjAh7ATgrvlGjiTVCNVB/ddh7oJDQU+YJGPm1r/e4orIyofdUr
 ybNHuIXSjPVXkF5LXh6ybm+60VHbnQG3/UbMLukQjI0ESKQDvr3AYLHVQC+GjGUSjnTj
 1cXzksSuP0yW0EU3+q+ccSW3k77XIwPToVqnQaP1bNr7oMCFn+vSSrv5UZBT5RGjBRvt
 sVFAebvRGpkic2x3/FbOhfgABE279htWzbjgSfUduW1pLDNlbV67BHJzCPSq0WC1VjAe
 oKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929738; x=1743534538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCBaOHPJZtOrgfJIE6986IHfTnITD9j4IHlG7PYQ0Is=;
 b=B/Saa6Kg7apeDZlPA0lBmDEmjLB/HJeVCEnmOgRuMuyqidBgoHZIq/Ic5lFo0WCNV6
 +a4zVh5SeNvoADL9dJ2AFjqkUG77oeV75M9j/wefOzWmOvJ+nPXvYakQxIsgde1ZXVR4
 nT1BoewP/qez3PA+4LK44irlEl/Ii8YHbX/66k4I+BVplfN6ZgEZeMu65kl4fxSIVjAf
 UoqZy1tshBNcYVDsaT4GhsAe8UJ8sryL7P/8qFJTQbBzxqxioAF+Ow+xZ1lRj6B1vs3f
 3++McneMui+gVDADARsCsTfOho1bf3Be7SBN3GwTDYlsONgT4PIalZOTq+3YDi8mLU5y
 Gjkg==
X-Gm-Message-State: AOJu0YwXtIf50WtwNLX6S51yu1782TKMTfajzbJjLrY/IyGN/ArTvW/9
 u87b+jnOU47mEQkzj8e7//YaK3K8lwP70wq5ZKSTP7LuGZj+2TWu0FGikskilnc=
X-Gm-Gg: ASbGncvdLq5uvU/Rnejm2TGgq9fH8LLezXKZjdqT4i5Pbz0V7IAJwDNF+HF2ROOEzcq
 UyCbYxJfY8BXLp7KiTgYfH4nxtjzaJWHmAdme+feTra6h7CNZ8vWb+F7yrwqpSTyw6YsimN6XuK
 enCQH7MbYiKYlVgkHeto8uS3tlTcPRkUnb8t3SGU0210ZQ3h8UrqtJjgPJsEwyZWSWCqTTh+7WO
 /B0pCW+xMoHDiVNzx+kafOwEkXcqbe0mUeW0jkiYXH2weNRU7HIn5pe1cLTB6AyuxOyNkZtWb6d
 8xkDI/6q9rkHdGOyR1Ev1SfS4kf6B5An8HkbHy2fMythAA0ZsihMojcrXIk88gNJ
X-Google-Smtp-Source: AGHT+IEhAxPL9R7d2z8Bj2EEVdkFa2zzTPBChyGvThWV5ca1ZAkiobJzth4odf4MbXnN49R/RI4EFg==
X-Received: by 2002:a17:902:cec9:b0:223:fb95:b019 with SMTP id
 d9443c01a7336-227efb914bcmr15623845ad.24.1742929738137; 
 Tue, 25 Mar 2025 12:08:58 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7390618641bsm10570816b3a.160.2025.03.25.12.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:08:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/7] lib/xe: add xe_exec_queue_create_class_gt
Date: Tue, 25 Mar 2025 21:08:34 +0200
Message-ID: <20250325190839.1984723-2-juhapekka.heikkila@gmail.com>
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

add function to create exec queue with class and gt id

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d8388918..a52d75e3c 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -399,6 +399,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       int gt_id)
+{
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = class,
+		.engine_instance = 0,
+		.gt_id = gt_id,
+	};
+	struct drm_xe_exec_queue_create create = {
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+
+	return create.exec_queue_id;
+}
+
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue)
 {
 	struct drm_xe_exec_queue_destroy destroy = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 18cc2b72b..d8e5b3064 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       int gt_id);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
-- 
2.45.2

