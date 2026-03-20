Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90821098781
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA6110E466;
	Fri, 20 Mar 2026 13:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gS+locMM";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE3F10E8CC
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:30 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-35a09e0dd63so792843a91.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014390; x=1774619190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=gS+locMMrukjWPMHQ01pCz211QQ5TlZuNkV2dM3Hh4EgihBLSLZE6w9YHRodE5dg4N
 Dvq7xIWAbEsoKT4ZOA+7W+zNKaI9uMkh59C4YO/2WQfBf4YlLgAIOyWJEfYr5OGLCYQe
 /Te5r3cU5QrDI2z9Uo7bsG80LcwZaLmGJpix29PiP5eXwa65wx9ZR71MfFkOgepwvAB8
 ZPAHlyzdALs/c7daRvSLbyMAC39DmFJfu8Wd5mcEVt52w3BBA40IP/22IbfShWac5Et/
 +fOknKf3s9PISN/P1N8OZwNnFvmAWyqbFn1zOpOZ75gCS8StGFNbtdhAn9loV+LrkBSa
 CZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014390; x=1774619190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=KZnanSYFOwhbO360M7i9MaAeyf5aS2Eg8pGEBtWg0dn5cwbdQWjJ0TpC0onq3AlEmN
 5qdj3ZD5+d3ko/17ykjTSl9TWqFaY3MPGvTBjJ4zI7T5CK0t1j6XR0hdcHgcY2UWZUbS
 9zBF+Ep1imsO3w0Qh3G3zYs1SywVgXYvbtqFrXQtJKMywgZ4tjBfH+dV4Q/9huNsuOmJ
 rFdARxQ5bT1MJkLzOKa0xFRDGJ15LnOMflmufxcQJ7bBzY02PZ2Z0fd7T2QUJPrGib6y
 kIByh1rjUBvQo9GmDcmRM96L04G0CpjTFCy6CpEDjMQYT4rZk2kQXAL5wlsjvRgHErvS
 z0jQ==
X-Gm-Message-State: AOJu0YzlkrPvLHUM+1nmtLa/YgKiqFjdXwYcVDGklwUxeGabRfHH5N0H
 aQWa9I8BV6xXmU3yS6U83NOJSSEzLn9DBiuExYbmzy9JDv/ZmCS3nG+ntxWVrzC3
X-Gm-Gg: ATEYQzzEG6p/V5NL3OIMWmEMzvPagydTvsZythKF4OJd2gnF4pmlH0rC8YD2OjjYxoC
 a25O6cAnutLwfzPcR3jvaqeoPrFhyT3XNxppPDwBuXj7zorNpmU+NJo4IkRo3Qvswl5KUY2iqw3
 ssSbzsuskGk2DZPrRAi3bQHgvCBCiPSr2ROxY+Ueb+sQMdTDW5Mdni6E5xmx9e/uRsyWItQciTr
 ancWYN8JQxadD8iX0F8nPEghZqeldGYRUJK2WX+sv7C+OisDVizebOHxcRoLY/mOOBXcZ3bvfPx
 PVGY6j2qTIvDK1kr8Orb6Dm1nDWRA+jlbIqjoWwif9yBoZrXgVA06AiuvyJ51N2n8qzaB2+WZv5
 gy1mV3h4Ns4F98Vsqpnkrz4o1aX9CTbjhJKUKKJ6409l85v38tWL1CjiORLw/VPjLSvsVn9DZmG
 KPNyNUTN24t+Df2teZXUTrc+RMGRMzq0QMRCDpdFKFbLRQRm0f0jmVySYzPB17zg==
X-Received: by 2002:a17:90a:d406:b0:35b:9c13:30cc with SMTP id
 98e67ed59e1d1-35bd2d3fbffmr2386854a91.23.1774014390158; 
 Fri, 20 Mar 2026 06:46:30 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bd364f0cesm780460a91.8.2026.03.20.06.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/8] lib: take out duplicate assert
Date: Fri, 20 Mar 2026 15:46:04 +0200
Message-ID: <20260320134611.876379-2-juhapekka.heikkila@gmail.com>
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

