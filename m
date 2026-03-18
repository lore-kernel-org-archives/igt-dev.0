Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392CE103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64110E856;
	Wed, 18 Mar 2026 15:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUissG/I";
	dkim-atps=neutral
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6C10E856
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:05:50 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2ba895adfeaso14427eec.0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846349; x=1774451149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=OUissG/IYx8bSDd6tutWkDlyov6oBbsA3vedTA5QXWtIiaHFRyKYNZyaTSEzz1WrzI
 hx/Wa53iNxbDH9djhLqxbSptf/m/8nSzonMWd/60o8+MF3qnN9JQzjrju0yfDtkcLBr2
 X0OKSz7WaOVE4Kl0wj6IantGV5cx/XcgUurBRmYciiDaKw/3i8tHGUpx3MsMRvgj1sX5
 nmMDi8fzzIFVSr+GY45NHrGqEW5y8ZIzuMqG77CNOJh9raJNF6cKMFtr4iivHLTRplqh
 OwB1KZofSCZlVUtBSLOWLgivpBmcSqSvs0daK/N1j4u7aAH5V9oXcj+bnsYhwrUrrlCV
 CCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846349; x=1774451149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=tYflSwbwhv70DlAj8SQjp2wewJeLhxZ01wIX1TuLtLWr5QQTmK+aBDEFHkqFmqHYWC
 ZrCN5nyQ9X3pOKU4cmcGHsVNvxoxTJCCB0V4usTgAbM8atXuL0sJryAcKtnPeiEduUV3
 HaGexvllU2i8ztf/K68JcVVRHV2oEFNJvsYU9b8k8JOrrlhcZHHChD+XqUDD2uWz5BLM
 6WnbngTzPjvKwWOWdU4EtzVURQo6zVIwZqKPmzMfHgwD5/il1BLDhGBSrNxT0PxFzkkp
 uHqqMTERHDI+VtaAM5ZCm5qw70NB+eToZHOFKBTSU7oz2VksZf4oDKknivPzLi3RlBMx
 gRaw==
X-Gm-Message-State: AOJu0YyL4Guiwtneg9GjO1Q1LPnyUQUs14SGEPSYGE71pTnKbuGO71ga
 vX8mRigXGcAEePYAtrBlYNHVJZjBTNO+wYdOqcl3iA3dEvqtRr268gQ+tJq6s3/k
X-Gm-Gg: ATEYQzyaZvPfltsEzZ0hEcOQw6z6svOTuvy2YqzPuAx4BUzA/4pgHfij++njtx/Tb+7
 G+v26SkCA0GhF7wol70QDb4WwqS4ad+ngVvSzBR3VLgoB2fMo1rX7UT7WHh+L5mvKSXiGPdCAsp
 cXPKp7T9zF4dHX25Ol5vtIjhdAVWI0/4QVOnsS1RmkP8w9W4AgOdN9bfU06n+IeOfkgbWmnjbu8
 C7xtfTP1jNpLB9ZxIdBsF+fNg+9LVo2bamoZZkU19rTGZaBLQCi5YeBDPAC5D3sp4DavaaEwVj4
 CG+oPDBVXavUuRxDBnCxthLWrCx/M/9XGI9I8u+6otuaWyHge8Ff4f4LeVwhuOHw8xYpPQEUS1n
 w3T4Q/hpfzW19vbNF65IdEt+i+zQxFJS1XQ9uD4gP/VBser7qZx0ar1DpJHfro5Vvbg4JwwhTNn
 cY7svBBH33KsIiGElkK/hFGQnvtPrmfymodDpBFcpX6gBJ2JIGNu4S0hRH7MxE
X-Received: by 2002:a05:7300:e614:b0:2be:d62:abfc with SMTP id
 5a478bee46e88-2c0e5147e44mr1828874eec.31.1773846348960; 
 Wed, 18 Mar 2026 08:05:48 -0700 (PDT)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55ee672sm5066723eec.28.2026.03.18.08.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:05:48 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/8] lib: take out duplicate assert
Date: Wed, 18 Mar 2026 17:05:10 +0200
Message-ID: <20260318150517.4049206-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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

