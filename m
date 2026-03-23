Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2F7F483CC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD010E49B;
	Mon, 23 Mar 2026 16:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WUmRLNfW";
	dkim-atps=neutral
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E246710E3F1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:32 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-8297e0b27e5so1536383b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283372; x=1774888172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=WUmRLNfW+ehyMNsskvT3krI1N16A1YD4JIHtq4+geKj/AqP1bWBIaS4GqoOwzlVhqJ
 /76NjGVkxw9VeshQwoN+wbjiwK5Af4xDze++mHWv0MVxIgLCq1cs5nB8u82gB//QaHor
 W2FNhReQvgVlVYg+luuCHz2EqD/DEwkN1ijebeCyinga1YzqjEWpZobW0HFBJtyg1SQV
 3ybhjuecuYr0JUzf9+rd/+6Ws599wA5baKtVDtwWxoAdN64Ca3ueKC2NAJqj389rd3W7
 e6SqhPBjb/g0lz4z9zocpjAH8l/l67r37PRJgFYZ1lVTpKHJqK3yzZH7E2tYqWEufRbg
 ZGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283372; x=1774888172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=Uu+rVFZIPsvOpLO3zBqkRUqvt3O3AEbiEY0hoXjqDAnwjJa3i+hIuFw8veStxPeHA6
 WBERJUKDY3D+Ptf1ZKk7uBHSXbLC6cAOVcH/OA/EoNhFc9y4OZwTUnu5YRdeqCMatHYS
 t7OGK+F0SQFSkjc12SWYJwk0dK2impEIqGPXIp+NFOAgqZVkGs9Y4d6isAmf7EtYUMjZ
 0W3EiMXiGcddgX17UiH7+fxCyjpX9JYZu9tLk1W4apkoBGZlEDrTw00pRgmXjhhbY0JT
 dQhPOrER5jsX9Gr0pZlLCi3FCkO27ZfBr/VveQIG6DsN6usTD/i9HdiSXTdjUSze4UN3
 BfFQ==
X-Gm-Message-State: AOJu0Yyc9XIvPCP24y1IbxYzTeATYAHvNOOyI+JmUUJA3KVkHLpYeFN9
 bFzgqKADnOw4ri1lMCCqWvO7mmDxtZwhRKHy5yCiwBYP/JwtLlOW/+1JO/Kb7Cmq
X-Gm-Gg: ATEYQzy70ByIVyCjCV1Xca3cXStjr/29cFZ1f5MwSbr4u1k/9YXkWBZF6K/05kJzEJB
 zyMT2AYTMvub0NbncNlaD8/wJbDaBLDdWDcXv9caDXmD6bivGDQMjuhNRFK+jFi4bI/5chYqYK9
 +ETIpB/bZsfDFY6vgEad5NLSTIrNxweCgU209WhYK1IoPHjumVdeWEda85CSYT5tfDMF7l+TQ7V
 mO8FSYc3COzoteaNN1inQjT0sJFlcJbdgZo0xO81qm/KGpF1Y1iBYg75iKQe045B4ngFCJB6lR0
 fmL1F7Gl3MSJkFGvbdQD8eUavcWbft8Xf72hA5FLgykuOFeBP1E9DMyrtOqT9n8kHrK68TMJgSH
 FcizD0RnMTmI+7zkNu6lNnoYglZ2tZ2p/hwvyGjqWz4n9UW12GlEAPy1lW/K9I85x1TjFQ4Q/k5
 ic7ETOqMSAMqZnlTn/23slT0ffrEK3QPzhkzsAtMTQwV+n+XIDR8PJyY/SbRaUzA==
X-Received: by 2002:a05:6a00:bc0b:b0:81f:3c7c:8591 with SMTP id
 d2e1a72fcca58-82a8c382388mr9521968b3a.50.1774283372150; 
 Mon, 23 Mar 2026 09:29:32 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b04222f42sm11809458b3a.61.2026.03.23.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:30 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/8] lib: take out duplicate assert
Date: Mon, 23 Mar 2026 18:29:04 +0200
Message-ID: <20260323162911.1912755-2-juhapekka.heikkila@gmail.com>
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

