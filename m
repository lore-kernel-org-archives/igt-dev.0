Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5C7E7E0BC
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BB710E363;
	Mon,  9 Feb 2026 16:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="isMQFJOR";
	dkim-atps=neutral
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBB10E363
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-81e8a9d521dso1930187b3a.2
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654746; x=1771259546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=isMQFJOROwcvVqsDPUcWR9dNYHl+KAI+J0DYhKC26jS/Wl+5vuN98nnvQJ1kZj97bM
 DNoBOLLxOz9BJ/ENrrJ2CDstnXLBeyXiuvd0wNK8mb/2rYmBI22l5ZDC1OBNEHUbEa/y
 cLK8FdeRN4YfExdGkWEU1xgeIwcochlanGXQl7Pe1NWBBRR7v4OrXeCs0N1gFmFINwOb
 HLVlwk+vve1VWqtsT4t4IouWUDdANoxcz8idy6ssmQOLyTemeQAQI/zadhKq84PGEVZk
 +kvMijYJ75WygWAtL1iaLmFp/Liob79IbAVAk8hDoV1ir/omB6y4w4bJz5p+wYP26F6e
 mS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654746; x=1771259546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=Pw+6t5rIT1vKmV6TEemibfcPXh9YtxeBSA7RlGJq5QM0uqLO/W2PpE+5MGsNiJz5CM
 eah+J3Q3w/knuTQY3CyPG0w/8dzdyiSgmc7naXrFniGaqMyLuMT7bKm4CoTAzthhRJsP
 pYDfZz9sZVHNO43yfEtQ50ydADTHNod51dpOJmkFpDasBih7giLAGpb0nr5mkXYcUAay
 Ws/hngnOcrApz6vFml1qjRlKFEJKM65SONTBDLjrtBMjZv6z37ACZH9KBEbWqGoYgDS7
 L9CkTq3N8EJtMyENxlkktTsZYE9xdhABqxexXhqTPCyHoxbNYVtXZnHLA5ywnZMa0Ukr
 LezQ==
X-Gm-Message-State: AOJu0YyU0hr7wdMFJP9EQyZGU2OxkLS/pra4u29RyjmIlARVdwDgwrLY
 wlP0LElkdd4IChy6+fmxn98VA5z5Lhs1EWIEVnLZ6q62krNASiS+ChSZJj+VgdpXqxw=
X-Gm-Gg: AZuq6aKzfu6ybQtjw+IXagTV6ccCdprCdV9TxgLHLhl1JPJVbNG24QSPj45zw0TN9rp
 9I6lULk/tsmnMjp87+ZYqlNxDQdjlOeaCgenhzci9pWhuftBo9xqQjpXcfJh2S/eMfU/hRf2Klu
 PLYzQ3fUr+EsLbhPPlKUrAa45y8z2KvPnIsh8XQzpmDe7Ov59LlXVS7xDUX7bZ4fyrHpJsCGRUF
 ENAgx5ABahhVKpeJ/0CbMJfv1aV/G9IUlQNVc/mLWOVdbIoYXG06UeoOj6xrBY5Vn71Iq/+I56E
 C9t3vmDedzHrR33ekopvZhUR8hFs4+TrSnAnV5p5a5d4bRMVM5t+7/7OPkQxMnJCeRtGTE+95OY
 ln4GZ981NNjlqPVIEvXpiJGByQI1ZIDNzQjkIpA8IxYh/4ThSWIi+dBpqI0QaDh02XZJje/BiuB
 YuFN3xhbBMabXyJmnJljspXdYT9dXZtIL4mP2l4g44+ER6QC5ajw==
X-Received: by 2002:a05:6a20:12d6:b0:387:dfb3:cd0a with SMTP id
 adf61e73a8af0-393ad3933b9mr11583945637.63.1770654745686; 
 Mon, 09 Feb 2026 08:32:25 -0800 (PST)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6dcb542c36sm10245135a12.16.2026.02.09.08.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:25 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/7] lib: take out duplicate assert
Date: Mon,  9 Feb 2026 18:32:07 +0200
Message-ID: <20260209163213.1483598-2-juhapekka.heikkila@gmail.com>
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

in gen12_vebox_copyfunc there's the same assert few lines below

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/veboxcopy_gen12.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 2193433a1..9d07ebb91 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -314,8 +314,6 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 	uint32_t aux_pgtable_state;
 	int format;
 
-	igt_assert(src->bpp == dst->bpp);
-
 	intel_bb_flush(ibb, I915_EXEC_VEBOX);
 
 	intel_bb_add_intel_buf(ibb, dst, true);
-- 
2.43.0

