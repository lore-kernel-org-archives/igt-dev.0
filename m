Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEDE81BD3
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D7010E434;
	Mon,  9 Feb 2026 16:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IKv9IRiv";
	dkim-atps=neutral
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A0110E434
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:32 +0000 (UTC)
Received: by mail-dl1-f65.google.com with SMTP id
 a92af1059eb24-124a635476fso6037370c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654751; x=1771259551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfR0q0MwxIkTwYUVsYjAFlJZjw+9ZDL9Y3z+KbKcgUA=;
 b=IKv9IRivbJRAOyroVlzuwYCCXI65c77eosS/Fh6FvupsQXGjICh8w/hMjhrXqY1RZ0
 sGMur13iVfUmW0YNQtkaqcyeWFvLH75IqImg7acM9vz8Uy2n7W0DA8S7hBwHgZBYwWXY
 hR/skk8ZrzmWYIo1LWQwP0wUpOcoK17wKgmL1ueM8/A+3L+2gKyj1Ck/vLC2uPffDfs1
 G7/TrKIBIeCv/3azpnd7FVGeAvWHVUiNYlbq79KrUNzMDWUquagFAfaKEHWh9MywiriL
 odXZW+/TGFiOfIB5VETIumrKahymtNBanTapyA9XU/mpRQMP2pQs/DiUhTS35PvRgt6K
 Q2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654751; x=1771259551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kfR0q0MwxIkTwYUVsYjAFlJZjw+9ZDL9Y3z+KbKcgUA=;
 b=AJv3j2c9Vzz6vHCpl+U9kMVJXQka5uv631uDZZBkRHEtjA7/pKfQdreNbQZVyYA/sM
 66QsPqZjvDfffBVFlj4s0iA9j39YM8txaIkhMYfjAW/MPbXTrP/dqqt1cIYf3XW1yiHM
 zDdP1m6I0uV2SLGKpI9reC8Bz/Ym0todJqndx2mQ2aUxXcDsbSMpYa1T7etUL9d18hCg
 KjU8oeSGo02Kx7HocMJ6JRvWGcHiJkY+wOYs/zNqz26W/e3Mba/+7zXE2qhaVNgBh/Lq
 1Wn/zeEiakOOxqCk1cV8fTRIJvcCJKsaphIRdOXEhyHpIfLfFxwOHuE7+twQAj07P2Fh
 ZeUg==
X-Gm-Message-State: AOJu0YxiUTS97U+kJuLpYwI5tIRjLcFhw1bI8mThEznIqkNng9EsvnSC
 ZhujV/4eObDhk8AH3vDqxb5YDHbs5L6m9M+GhTOIXDaisiqq4Y0QUCrvxkJHZX6tKyA=
X-Gm-Gg: AZuq6aLE0PrYzjndm086sagNkpPA4xXcPoJmxrg5oKNksmcKwNjq9mfpR4R/fjA5blw
 sMJ4C1mRURz4SW6ZbuT14cESXAYe9mH2CdieExyhaEZtZh0Gl91Sd3xObOqPifjH3AXUglt6dOT
 /duEiJPTixklhf36+1zrjTFENhEJjniLBf+3+AUWeKDpyAVmc2DVC/3QTlNqSo8RtcR4ztZgTuv
 l0NOnn7y7wewRfs59WR2PCcJdqOG7et6t597oD6bTWbZGp/PPrnGe/I/a9F3J7ozcOLVenN4lxJ
 Plb1a94LkusQR0C5uU74Pze28ehTR1tcJG/8ebmXwD2YWScCbVPi5Kj1XJdouLHxdk4MD0buvdT
 iFmG4mz8jNpSoc15YDpML0RLlchz2p8HWQqKJ//rCecPjGoX92kh0erQ27qgrW8/4uF2j6pXqIN
 MRR4t7RiOCdIzCvHlrc2CjF+VQQuju48Zo7Q2OHD4fBWKa89f1
X-Received: by 2002:a05:7022:4a4:b0:11b:9386:a38b with SMTP id
 a92af1059eb24-127040981efmr5890720c88.46.1770654751224; 
 Mon, 09 Feb 2026 08:32:31 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b855af5ca2sm8777614eec.8.2026.02.09.08.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:30 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/7] lib/xe: add xe_exec_queue_create_class_gt
Date: Mon,  9 Feb 2026 18:32:08 +0200
Message-ID: <20260209163213.1483598-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
References: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
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
index 16aae05c9..738985192 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
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
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..e4fb5e838 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       int gt_id);
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value);
 void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
-- 
2.43.0

