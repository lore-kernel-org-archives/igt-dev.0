Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27DCD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4418510E3BA;
	Mon, 25 May 2026 16:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="klm3mo19";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C969D10E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:26 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-367d88b9940so6558513a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727166; x=1780331966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH27DzdkJggZrKgSHlbfkjfwYlrkaY40mnrbZFT/JU8=;
 b=klm3mo19mM0v3uKJkiIQtEzS4/yB1n2HCr+G49IR6ZlT0MFYhXB6k/w5cSbprbaZ0i
 MxUnGxDgJWvB3zdcxOxKoylOPeQWWjh5mfP2Xw1IBiwiF8V+P3GliBQN/tmbS0zJeWac
 +HUXYrMmhOTDSNf79UI4Nwo0JNn3WuBZmxoFr2mSTQVN8H/fDxjGZtsdugyOv2ouVW4R
 iC54Qkqf4luZPSuKNq+ZOFhY8rNLzg7fTvsbQwfBWe6O2yW9Mpk0dWaZZnPIssemLUan
 kjDbBwA/Yj3EWZRldcO74y2xy8p/d3D6LjR6enuzvk39IB8NZQGf2gCnQAGCa6yjc79J
 5GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727166; x=1780331966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eH27DzdkJggZrKgSHlbfkjfwYlrkaY40mnrbZFT/JU8=;
 b=sYDVXa/CK52toEgm1R/I2sbJy77D8FA9aw3vVrs8opokKZ83VYi80JPUpnfFL0OHXJ
 jv23ghJbkyE+9TiHOIavEqUWZzd26hHrO3vhoEANd6VZDxLs/SBpIZX+5bqFvDmmZDaf
 wu/LRK6mOtZjSqEtdUJFIdv/77imYpg5GxYHtE2z+vlmc667USpE0gI+5BBwtIiRIN23
 FI9SPIexX6SmVQkMaCozXUz2OKlwPX3O3el7oL1V9r23g7PtNQy6iDLTbToLlqG9uEP3
 PnLExSsO0ljedugW0TxzLkLpz1gZmmsUHahXCc5rI4GE61ZhuMpi3fyRJh/+LUEl4uXP
 poOg==
X-Gm-Message-State: AOJu0Yz+6DhXv5AxorTa35wVhj6JgZdH9HmzONOSLmcvmCNswxJRwix9
 YsMspW+ciWOZoBNQXZvD57XX60ppOTOrvfqNlFAgVsw2I966gPvcN4nRrzOGOg0u
X-Gm-Gg: Acq92OFeIir/tdyyWeN2vPfss903PVn2jLo9AQyOSh2VCsLMPFmgghyrd94FfI9W9+8
 IqCmzA6gKdi4JgFUjCOnM36BvoghaeoYOHj4DzW0gZHR/Gbfq/6sFQXheMsldm71OUFWnnGkvhI
 EFDYE79DQ/rsO0kFaVl+824cZJ1fw5Pi7MgtYEzpwRbYuBF5Cs4gg686n66AFt7WRW9kqjtHY/H
 RxaJBKXgcqfhgeIvcU6lb9St+N7hw28JLuPapnRS7W6e/dCt5a2K/KAkGsDKAkzIPRq/wvFcITP
 mE6nwSsqLGoCh8+dwLxKzGFGTb9LkfcSpSPLrSrrW1zxBd8j4E78LxcRjh9lpYCA54AW2FMCtrw
 7o23/NS1xE1KilyxGVT6fp7gQO0v1WX+UeYPbYX8y0HoajN3vvQnaUKfQ2P7pXKlKlNUoCchPGH
 s85gPALD43okw92vM0pMqQWRXB4vJz962SFDPRdLw+IqqlNfTdKEvitIjhoWogeA==
X-Received: by 2002:a17:90a:d2c5:b0:36a:bfe7:e0c7 with SMTP id
 98e67ed59e1d1-36abff7274bmr4499030a91.5.1779727166300; 
 Mon, 25 May 2026 09:39:26 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a72c4cd92sm10629959a91.10.2026.05.25.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:25 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 6/9] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Mon, 25 May 2026 19:38:47 +0300
Message-ID: <20260525163850.3493602-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/intel_batchbuffer.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3f89ffd19..f0fef6bda 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2525,7 +2525,17 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

