Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD23F483D3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243E610E4CC;
	Mon, 23 Mar 2026 16:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dLV5+26+";
	dkim-atps=neutral
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6A110E497
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:43 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-12a71ade78cso432552c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283383; x=1774888183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6DbSv5VPwADW8XDqeFSJ3+KTumOqjBsvHMLVsJ71aA=;
 b=dLV5+26+6diTSNu3CUXXKURLgitiJJmGmmfp7yb0XV21cCVJNhOFB1PuKeAWVzF8Ij
 2A/H/HGjpFkYx5N6WK8dOIQPF9diUoQnXGA17puo6KOtKJYhxUaHTfvG9wZAmXUnO8g+
 BFoM0krsrf1dBS7ziYUQ0pB4E77pe+atKljv/Rs6PtL6R6KJ5v+RYGB33/olCCkY0KXx
 /eGhRLw7H/btJtU3NHVFSkTJI8WeN2bRzi6uDeribPVZUptss6UTXv1Ufuw5Ou964nJL
 sRqsfXQZf2aSJcsOG/hyn1e5DCi13FAXSCx+RL+6+duRZ8cx9pgS6FMwz6Vp2iC6pBZv
 9iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283383; x=1774888183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B6DbSv5VPwADW8XDqeFSJ3+KTumOqjBsvHMLVsJ71aA=;
 b=dWVzZAdIhlJ+Ny/JYJqqY572L5CjwIlIs9qJoRriA94lAIv6w3bjamXhpM1lwbnzed
 MQUxhZLiTbfHFpyccPpE816Bk0VU4zBdGGKLoCUAztN8bbeenEd3C6PKGq0Hirl3OUv8
 LtGDTrOuSdwb9QOh+VJy+0tqiNq+E1m3hDOKdpeWjY8gsAA8fx9s+smTcMQn+EFXlfXl
 blC55Xe94oA9ZllhD5yT4xotOPZqtNEMIjFwlHKUWw3dMffVHGUrWlbhHOr7ebqUCWLM
 L0V1FYt2qcFhWHjMhJodeSWoOZ/UHZxiOdfTcqXheT+Kux4kaqkBKUJrSjEszzA8z7bp
 CGjw==
X-Gm-Message-State: AOJu0YyByH1W/IrrDf9mHIzWg0KE9xPkqqPWtJaqSN7bGmQOd3HXFriv
 AgnCkbBbSJJxjpgY2s89uwogoMumYxAQASAzTAFeFUnaFelTTDbXve7c9U7b0fNg
X-Gm-Gg: ATEYQzxEYlfh2DtmHiLjzjU/JlORdyEafeBY8WhhUrq0A7ZOOcjBfP/tAevfOx907Vf
 7Lla3qJEKyONpa64QAT5ybAkftcKqIsseA0IjoUWNghHvbvRX4BKW37pH9b0mgjQLelQADQrKlU
 pI1SCW3HfuC20G9wSNoaShHFxjRqdUS9JJrkg8jZoGTfgzazE71EfJrNmAFGcs6nLlGypTBqjzN
 yXChaF4Not6zCLsRSEWGZNmAYtMlnnuFCJRsxa7r0ErrJe91MRhoeD+ORV6pkcHFSB10WnQSuZw
 hP30guhiIrsC6hbvBWXk5Wz9jBvtd/FRnaWk+KtsqiyK15DwKPg9+JYFBsLYpWQd/Jx+QXRo95q
 ZiigFwtfC5wRbB2R+rV9AvYZUD1F2DWNihDXfknv85CPjriCZJLMHA1VCeTOxPAxLeY267lhGjL
 uY2HzSVQDJ4caLnnLv5Z3/T4n/3bcfhT++gvgk7DVgPUluECSPqArgY3tLbA4=
X-Received: by 2002:a05:7022:f509:b0:128:bac0:2ee3 with SMTP id
 a92af1059eb24-12a726ed9d4mr2201571c88.33.1774283382909; 
 Mon, 23 Mar 2026 09:29:42 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12a733e794esm9546654c88.6.2026.03.23.09.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:42 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
Date: Mon, 23 Mar 2026 18:29:06 +0200
Message-ID: <20260323162911.1912755-4-juhapekka.heikkila@gmail.com>
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

add function to create exec queue with class and gt id

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index ea3f2fcaa..d56c58053 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id)
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
index b62d259fd..f2164e640 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id);
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value);
 void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
-- 
2.43.0

