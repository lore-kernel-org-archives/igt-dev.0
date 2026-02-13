Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5D9EDF170
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F2D10E819;
	Fri, 13 Feb 2026 15:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CaqOx6Pn";
	dkim-atps=neutral
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AE410E819
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:16:41 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-2a77c1d5c3bso4130565ad.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995801; x=1771600601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=CaqOx6Pn/+Z83lR96FzwKYI7YMq2mEMmVGkdtfp7JhRcKkBS3Ldt3TphS/8wM1GVuT
 +tVVlspa5o66dZJkO9ryGzK55ITivzjoljqYaz0/pHeox1eVQnRc7AwJlIH1lE7PZXZQ
 9OooZYI5p8lIL4/QpDG58pkAXqRCD6Ooo8beQEFPZPc7H80/VKmGBu8AsrBrt4/gUXX1
 dGJYpGKUZIWrBYRHC7e478TxOkAnIIzmQidMKhxlOSJqbcgMMHN+xnVRP3Sgozu6tykV
 O2V5I92VDNLqxOLNvxmuocr1qmfge42u80B8sRi+kO2o7fTnQrN3MD3pip6gQS+mW89h
 AZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995801; x=1771600601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=dMWX5JvJ3ucrtPguKt8fWcaEznCGmI0NjIXc06CQcp703YbQEKYUjCK84aYTvvM3FI
 FEqLkkEgWKGm5Jyid5Jn1W29cXIANH+56aBZKFUebVLU6uciahWMcpFS0tw8QTJrvZI7
 31owKvq9izYbUHw6FQtMeSzOcVYdZlo8jXVfTR2A2CQkc5IYHLm+j8CE7HVvpJBouqeG
 l4b986dRnmlE4dDomPEKyKEb5xDgrPCHBXeTvms6clFqfkvzeESR5GVv4i/7BxKA2dBS
 ky0jS8yUxlmGL3f9AAFapPBw2JIeFPmvWekuy+I98VlHanaxuBF/SOMubwcGX2Pu44H0
 qsKA==
X-Gm-Message-State: AOJu0Yyfvdd+WvdMb1WTozP9Mcd4AcCiy4tlgnyhqGMFZY/4KFmPa/sg
 DIVYyW/NKZdNqg5Ha8ID/wfdqXbKIBEui7RBE5yZLSf26WEM8r6ZqGAGbWev+qyYsno=
X-Gm-Gg: AZuq6aJ6XbnPa7av/AJDnbcAwQJbssRdFM22YQ4JFTWX4bzAW6RI7cyrmTHZzcjFAU4
 mI6y5TzFoHAlX+6ljOl1zcv6+24YXygWqE69yy6jlq2BWRX6Cv7jOr7ldFtSvAQZj28Y2MCpo7J
 ZwpiHrUMdBINVXteSuxsh31bws3VsqR28lHmOGS2+pRLXGibhjyoIUVcKTx73PNqGT2EC3nea3g
 hmxPnh5dB9bVtzplDvTPY3f8W+GbQHOOjUrhvOCg+TMtjWA0BJM5tE0JzXqzmwA6SWwU0AD91xt
 +mStGjCSV7zclI2FEffvp1amhzEhOlGqXcIVOAK71Fit9fSUEEcAFiEXcJhXkARSnlpzh+/xT0x
 uXViTWyN4VM+oCDSYz5LRjSMoWbi/NuNn29qNoxk9NtKZ/gJ3dLgu8s6B12V4Erw+KCvbFpqyYp
 4LVySo6Zv/OLU3BdDJLrYjOJ2UB8SDtCnmmmF82ikXUADk72hiSwNS8EbyMInFFg==
X-Received: by 2002:a17:902:c947:b0:29e:bf76:2d91 with SMTP id
 d9443c01a7336-2ab505a365cmr21942805ad.42.1770995800711; 
 Fri, 13 Feb 2026 07:16:40 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2984ad4asm87945925ad.6.2026.02.13.07.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:16:40 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/7] lib: take out duplicate assert
Date: Fri, 13 Feb 2026 17:16:15 +0200
Message-ID: <20260213151621.1552677-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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

