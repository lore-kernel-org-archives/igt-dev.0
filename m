Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE744105F7A8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4410E06F;
	Fri, 13 Mar 2026 13:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJM+es7k";
	dkim-atps=neutral
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212F10E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:24 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2be1b5fe11cso3417732eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409943; x=1774014743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=lJM+es7kUI8KIOTJ13YlL1ixqjVSZSEEUab2QiJCTPMNWGJoIKRfZ3NmbL97sDTX3N
 yr6BBWfRgCWDWb1shY+S5d+SomKMe3yXFdnwfqHq2bDDbwmShJT0X50xWf4BxSw7ZBYQ
 nEuGqIJcQHbEfazdtbsgel/ooZ/4fQTjX0XhzFRfTAZGVVqfU2zgLm8w6TruRBfUPPSj
 /3ZFAauBGMH8XQYAaJ30oYzJrRYovn43dgjnyxP9CC+GD0hdUEJHVsFELlNnC4FyvQZJ
 +O1Z4dHRnAdeIBPdvmm3hk5Fs+relQVv1eI/3BI6YZKY+c/Gwg7MSspajsOSjpsgtTNJ
 /UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409943; x=1774014743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=dXnHjy9U3FyH9sLXX4J/sPJUniqVWMLnmMS9/HaEgigdiI2pe+H1FRkxEmtwnNwz7w
 IrnOe3RDgnY82nkZUX51dwu4z11hzjw1myY7rlaii6JRB7urAtKgIqiY8nRvwvcDmLe1
 VnGDmRsHYetpgMj5U2Tpvf5BVUtMfU3rqg9+dcsB0JuFaDYiz7sQBPor1mSr381OTiVr
 Sd0xBCWSZVIO5pcXarEvWHdn+apCUry9BO0ypiY4650TYSUGbZmdPUybJSbDrPK4ADU5
 +UvLTQH1+acLg4B9GYLV9AD/sdCOLO0ncLaL9KwfkJhv/qK2K2HsU9YltFC8uJwFeGT2
 VPrA==
X-Gm-Message-State: AOJu0Yz8sGiiIo1NYud1lGkx3y4lJ7dZJsCEawK7Edzdz5QhVm/GJZBZ
 IfBYuqppRr+MVSPmd5sNjfPY0iB6dwjqAY77S0TIgOiWF1xwbmWiJmxaNkph4ha9
X-Gm-Gg: ATEYQzyun49kQzfGrN1M4xBmwqKn301iVA0w1B44RZMW0ikfCDNOKTFpWZRu2jEpqk1
 +FF1uGOcvLce85adZkdu7O0TR4t10DCKyZCx4Ycr6ehgWibr2bd52whuAuv8DdMcA9IhmjxQnWf
 tMFx1Q/j0Aynwz/q5n372oZMhTdvl8IQm0R7rcG4s1nDaONKC9V6DKrBMtHh8AwK5SGxPPlG4mk
 EXRGIaLF191SiK2BJna/cD2wObNwx1HknPUWIgn+dX//7UpRUORle2XWG/mg8fCfOnwiub5tzxh
 nD2fq1LhR6aLNFvK7O+QlK8+REl5h+m1ZT7/uRkmXI8/lyO/2SwNKm3FFSxd/sv5xmQSHQj2ehg
 kM49wXzSu2efng8bByxqfYbNmTGGgHoIbQA3vg1c5gRGmetrE5JuwafeZy/MB/nMFdRV4xFCrAC
 RN8itAVIxsEitFik63C3T3ZOqn3BxNFc5ODR0dLuUhBjSiCAsjxROL8lwZ/Sc=
X-Received: by 2002:a05:7301:1284:b0:2be:ca4:e145 with SMTP id
 5a478bee46e88-2bea54ffe0fmr1370974eec.21.1773409943278; 
 Fri, 13 Mar 2026 06:52:23 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab57b1d2sm2489428eec.32.2026.03.13.06.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:23 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/8] lib: take out duplicate assert
Date: Fri, 13 Mar 2026 15:51:56 +0200
Message-ID: <20260313135203.1782240-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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

