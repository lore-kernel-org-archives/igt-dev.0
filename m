Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E77E77180
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 21:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D516710E58D;
	Mon,  9 Dec 2024 21:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LNcEZ6wE";
	dkim-atps=neutral
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636B810E58D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 21:12:41 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7f71f2b1370so3093935a12.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Dec 2024 13:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733778761; x=1734383561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyDcVUm+1uyshRvvg+n/zLRRNAHOzsgLxEotjF8/EQ8=;
 b=LNcEZ6wEoE90pOlUrDN9adQoFjN0md7JOggugmlPi1ZG4leM2gllIK4HuqWCuDMDA+
 Om8fcAvrjgQa4TW2a9AsNp6YV3F/jb0htrR53UO0RjUZDxRmtS2xMrIE2GpFojLfD1ZT
 wjzAHad6d/NEF6ZwdMBCUhDaq5CeSSgIU7V6XuXR0BU0/vgKIV2OXlxGzUAriwk6ZyrV
 i7KmYFmrpLjrLht66ProOliZXzUCdp6pQV8MKH14D5kbylXd9wAlELy7o6ggjIIYQlD9
 M68BuUY6Gh384eIsevjUeNoi8Ic5SUbrBA9Yz1UMs6rZk2noOlJr+5BKlILud/ilRSD3
 JZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778761; x=1734383561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyDcVUm+1uyshRvvg+n/zLRRNAHOzsgLxEotjF8/EQ8=;
 b=Op8nCrvBc+6GtBgEhIdq5rIsyzN+8eEHGpCz3NrkkCXyJkUQLyra3b4bG3rcqzdSSr
 5S0iLgjTZUnlivmkcO7urU9KYWIgVfpUUQqWzj0Z15HdukYMCtCKu3NmETBS0TJkXiIk
 tL4xhzUjxDxpIreXDQWOkGGI0mufu9fo5n3rQKCKViW4t2oKDyG5IAwqH7+UokXfc14+
 wnq01ptadm2GCEKIMLqvmYRu5xBUffbYbzIUbaMH1Rsj6X6+2s3Gy+Mw3md5vJGnisRo
 g6NbK4VkiGwOE9sk6MVT8LAlJFoqDBk7owYZIxbH6WCH6Sh9U+p1QIqMl/ukSky13+Mj
 Yy9w==
X-Gm-Message-State: AOJu0YxypTYOUR4Ok8znWD/+K2b7tVLRzm25YSWS8aVbS0mnlR8kb0Um
 XL0LmSX332LkYZL4s3MiHjyDDtcK1ECKnCWD4eOdI3Mo1/i8iu4UFdJmpg6l
X-Gm-Gg: ASbGncv7M9K4mKzd6nJZgu6H+tfmkVS/Y7TFU2mLsmxSgJ6F8hMDKe/P62EwIxBs9ct
 LXiDWAgHLNcqs4lb2Ht0dNUXWi5njAemN0eZX1C0LpW1XUwXP2YBcRHnNw7H/QsTnm3N1T8yxUf
 UhP+J0sgSiephNGtmT+Nj4aZv425TMoJXcFSmvh6s5/w7lYbEcbGhIfbujf5RRyIhdj4V9G5d7h
 X/jIBQBZjtNg7ns2yBXa1byxMKU1GHm8TB7NzOsqYoBp0SFxIVAPAjKXhDUJdE=
X-Google-Smtp-Source: AGHT+IEFtvxEieNMzdZI5NGPK0SYKqBGK+SXEdzwazzQqaaR4ZM92vR7UPp+1sbZwhdU8IXggKT2+g==
X-Received: by 2002:a05:6a21:7896:b0:1e0:f495:1bd9 with SMTP id
 adf61e73a8af0-1e1870a7887mr25037152637.8.1733778760680; 
 Mon, 09 Dec 2024 13:12:40 -0800 (PST)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725f1cf7e7fsm1953933b3a.22.2024.12.09.13.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 13:12:40 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/2] tests/kms_cursor_legacy: for basic-* tests require
 physical connector
Date: Mon,  9 Dec 2024 23:16:20 +0200
Message-ID: <20241209211620.3679545-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
References: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
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

for basic-* tests require physical connector to avoid problems related
to virtual connectors.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 4e2cfde17..16c42f39a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -2010,7 +2010,7 @@ igt_main
 		int t;
 
 		igt_fixture
-			igt_display_require_output(&display);
+			igt_display_require_physical_output(&display);
 
 		for (i = 0; i <= flip_test_last; i++) {
 			const char *prefix = "short-";
-- 
2.45.2

