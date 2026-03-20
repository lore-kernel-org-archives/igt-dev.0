Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84A1098787
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43BD10EA0F;
	Fri, 20 Mar 2026 13:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2v8CmqF";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4A310EAF9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2b06c43e6a7so3438665ad.2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014416; x=1774619216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1XkIqliUqivZ7nBNmo9UjvIa9vLBxD2xxg/Gjq14/7k=;
 b=G2v8CmqFf0jKQ81DKBQNSGtOGulziVJbIjZBIusWopIZ+Qti2ttopnVERGrreyV6CY
 CxZLNhfLLZa0HaIs9eJKgNRnxsrHVlpKcPoT7YySW/ujYvkAh1yrhNPFKbsMSo11dfYT
 mDXhUXR3fHAhBRXkEaXJHjdD/dpCDZwci1IMnmR7FpoQbqHhGWY4c6hNCizNBezKkqSd
 dZh1yoxceCvfS0hk/LuncH1nWVi7yhSiAUzXumb+0OcBjrS+3TCJjkSIBjceAEkjA+up
 GB5ywB7fFMnRUW45o3oWQlTy2ixV+lucHW6pxGQRa9c/xdT5Pw9C92kKmV7FGwkcC2Dq
 hQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014416; x=1774619216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1XkIqliUqivZ7nBNmo9UjvIa9vLBxD2xxg/Gjq14/7k=;
 b=m6358U4ijJILL70d7dmtoHgcu9xtwcy1hc5UHjcshkRgPgYN/SZJh3rBpNJMA9NjIl
 yMc8yeyg9UwL4PoRP5SENIjUiaO14EyzfbceL+QarYySN6EfZF6cqIhXSLQght/vPZ28
 ncNQ9P5GnzX2d05xUPEKx2y+YhpYrC0wQRecTzTF5WcsOfXpUDtRW/ePSv1gBNoiXKfH
 gd3dToH6A1TV4kHQCzLp+ndNQNvaHqsUjmAERUVpyz+OfZrvH62UoFf3w++bynkkuz+u
 6s2DOz/4wS+XkePNJsvqjNmyV1qWvEtyt7d8tjoqiRJlguZXR5mTJ5L5hVRydNzArJdG
 7aJg==
X-Gm-Message-State: AOJu0Yy51X4HAOT+HFRvs1LkmbkKUu/Q+TqpNQElC1q1/wI+Ngm8xY8C
 kSd7KVAA4c/WRFTs+E9cetnAIIE+RW9f7Vw1e4dGt6HR4HhsrIaMUuUIxVmNOamh
X-Gm-Gg: ATEYQzx4j3lIal/pba5z1Mll9Cc1Y/ek+CgqTZ8Y7HWZ7uzz7w/TqiJ3gojhZtGzFf+
 NOBBgWSpg6p9iK57Mmf0/MvSsIH7B8pdaK0Yi+VK0AJXIV66KpzNt6o0A79fERJhRTQAnX5WT9J
 czyd65W4sOSslXavJ1KC90AJkyRWx4hwGu0szFdz/nqVq0MAR6UZOAaNPYmghcxoP6ZJuVqKJqq
 k36Bpgs/EwN9bkh3uZ6tER/MbxFAtibdaiclDzEOz3uBceIJwKhWs8wErQTO6GvGOns7C4ssVGa
 YyQQnQk5iA/PZqZMBtcSIL1ZK8xxwKeWVqRycZ9S/94g/vfciuyqGcpFcwgTCWcnQkv7NY8dSeb
 kgOeMYS04BWv0bm72n92wRoHAmnE1D0HeyJgk0YOwFBGk0dpFWC1WfQkpaBPrrsUEHfJf6eGGmM
 KN/Z4y/D0wcN+puE6R2trpytU2Zh/gYGRRfy1SGqyY5nxWUC1+gJyHFCAejJEzQpgWbcRHLrC9
X-Received: by 2002:a17:903:283:b0:2ad:ba04:40ca with SMTP id
 d9443c01a7336-2b0827a4dbamr26069505ad.25.1774014415666; 
 Fri, 20 Mar 2026 06:46:55 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0836b15fbsm32576325ad.81.2026.03.20.06.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:55 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/8] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Fri, 20 Mar 2026 15:46:09 +0200
Message-ID: <20260320134611.876379-7-juhapekka.heikkila@gmail.com>
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

Add __xe_bb_exec path to use specific engine/class/gt

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index a3fa58b4f..5c0597869 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2522,7 +2522,17 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->num_relocs, 0);
 	igt_assert_eq(ibb->xe_bound, false);
 
-	if (ibb->ctx) {
+	if (ibb->gt_id) {
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		if (ibb->engine_id)
+			xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
+
+		ibb->engine_id = engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+									   ibb->vm_id,
+									   class,
+									   ibb->gt_id);
+	} else if (ibb->ctx) {
 		engine_id = ibb->ctx;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
-- 
2.43.0

