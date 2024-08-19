Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B13C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E28210E367;
	Mon, 19 Aug 2024 20:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EU0gjx8O";
	dkim-atps=neutral
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8917A10E367
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:26:47 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-713e460f920so1416690b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724099206; x=1724704006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mUN7eqsusaqgjVxFvq5BXDb38u8Tf/3qiHctsXu6P3E=;
 b=EU0gjx8OlYkaj0moBNBO6Mk3QXh4GK0A1IQn9LTRK61K9gRAt+ahJ8n/Uwk2JZVnGC
 scnavkD0G6CwyekveRuVLIcNkJC1Y/j1udtiydZwkB/NNO8xWaXXO1zPmEwvCfPHij0g
 mEzux11L23gI1xj4BCpaHnZNCCyjJMG8LLkizL+JLeaGG/9qCjzDXW2jU9XjOtTcKqef
 cDEblWaOzcZHcNW0nBrG7U1ha6EWXGKKJD6conIzicFJf8L4gkScw5Nnz7qDtDh1kBJv
 K4pyomaFP3/fJtwEzQZD8u7gwL3w6hLihKYrz23mxm+0LFtmg9lpIUBUzdnHxnJ4STxM
 dbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724099206; x=1724704006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mUN7eqsusaqgjVxFvq5BXDb38u8Tf/3qiHctsXu6P3E=;
 b=PGvTFJvwE5YRCauTs7kEhl5IjwtUVdCAW8i8tThz0v9stb2i9use+mpoKSicDjOzIm
 hA224WpJbWej9gVNp1QhJuXD3qTKDtBlhYhyv7JB7wuBQq4915/8n68vpi8dJJ/vTjC4
 rJhApR9++48HBlBAGvf55NW3gfuZ/4FFEwzXxEyBwDvXMI8Rxb+3JTPMjR2efGbmTNEq
 +BYxEk2OSXuLhuDV/Ng3sccNA6d1Ox1qJGc2j9oCuDdKQMncjbdbpWdrzrQDh14Zt3px
 elUtLuI7dApLXcLyIEb0NFBewrW4nNo2zn3MiZBT/B8L84WUEYMx3agCsImr0JoJ1adj
 yPYQ==
X-Gm-Message-State: AOJu0YzGT/Dpo1I9hO9XU6a5ZUEcNt89VDqCzAf7/nlvVo3woce2A0dD
 osQKpAm8mzdynir4cgbEtd5k7iVwzelZs+t6iwxSDbLJtHTYm3lV0L/56w==
X-Google-Smtp-Source: AGHT+IHT46Y0s9vx0UtXzVbeRmb1vNwrfpZuhxld4hgvmfpm3kU3yXgzQgMg7WUI7RSjDkXYgYinJQ==
X-Received: by 2002:a05:6a00:1ad1:b0:706:284f:6a68 with SMTP id
 d2e1a72fcca58-713c4efc813mr12064044b3a.23.1724099206173; 
 Mon, 19 Aug 2024 13:26:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127af3faf3sm6929280b3a.200.2024.08.19.13.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 13:26:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH] tests/dumb_buffer: Fix invalid bpp subtest
Date: Mon, 19 Aug 2024 13:26:42 -0700
Message-ID: <20240819202642.111559-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

From: Rob Clark <robdclark@chromium.org>

Only zero is actually considered an invalid value by the kernel.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/dumb_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 1d4bf296c53e..e1c18c70b09b 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -143,7 +143,7 @@ static void invalid_dimensions_test(int fd)
 	memset(&create, 0, sizeof(create));
 	create.width = 4032;
 	create.height = 2016;
-	create.bpp = 24;
+	create.bpp = 0;
 	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
 
 	create.bpp = 32;
-- 
2.46.0

