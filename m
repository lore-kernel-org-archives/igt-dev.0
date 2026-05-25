Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCA2CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663CB10E3BA;
	Mon, 25 May 2026 16:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I0VuyzzL";
	dkim-atps=neutral
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D94D10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:04 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-83ea84df1d0so3211827b3a.2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727144; x=1780331944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=I0VuyzzLZzxmT4vDbESmzh/seUiG8qbuTXMq4mJt6SzUX3QVf28f1BEsjYLlnOU53e
 KScRiQ6bVCZug7Aq+5KOroSs0YspPdxz+EcrKxWqJjKlO6VXVRmm3w+Y9rBgTM9L3UOm
 s+QzQAAVV3YH/o3VYYFE2qINaglSVxRflnbxx11T/RhF1CNpIDtIskK8D8JBf8m0HAzg
 szh4fxv/8+dhMLyFF69QxyofdsDJtHrYS7PJOQOPu/ZA464vK0RgRC13losTz1GeTFeS
 6vjgGIhYr7AjPIoHTGshzDlaJcOc8tXRE3v2e0YBFk8SfI6OVGud5GQ7SYi8DffXYzNr
 NGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727144; x=1780331944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=HISxljn3ZelLjvNXYtoLkMddYKRmdYI1EzXJodnvAK+AZixvtl1VWL/WMrQ2uiWmeB
 MHFkWbo1QoymJiNftDOv0AJQSmgbYcgnC243nFM/DNlUwngukECBB8doZhiixn46wmc1
 z4wVCddUpTxXCDORVah1Dyms6Esr/ZknY7y8pq3pdteFCUtG4P2Ji4qTHbwYbB4Q/4fi
 PwZ+ic7GTsM5k7cWVjkeF+ouyjv7mYO+c7OXRAnRAcYHFzmjALXM4n2SUQ5v/MKsoa+m
 d2Oc/Ft8Z9eJYXwLEUMDBCJ7jwf5c2yuNspzd5nUynUC+jILxO/jMuHR9jcp4dHZ7Wkp
 42EQ==
X-Gm-Message-State: AOJu0YyDU5pY/2+IFYI6cek1pGg33KauGTpxQiMU4TiTQrqBMCzsjjpS
 Kj66AvmlqP9A1BngKYDKkzAPmOrFuC4Wf5XEphTWSDqFg0DhTJACaKprwqpWF+Mz
X-Gm-Gg: Acq92OG+TIaiyophNbqanPxbUtjTzAfNgUn+oRlT2sn3o3lkOfPgb7rhACElK0tZEsj
 J8Q659EiwS8mbF3wV+OozFCpEq4vyLAA+kdjjDmKJuF5i1X8JK3A+Zg+HP0o3hW71I/fdo11lG7
 BoWv/8YgcDEpsArlBpsTkXxdN67OQLy88rkjwey48svCYR1l7L1qb54TmjSZDWnXdE+2d686SGv
 KJxxVTZ+4QQCzsV63b9iX13RAfzZiXOuGjiN5ntv9Lc8PsBTZKh9lvwfIt4xQs0k6eHpYfSMYI+
 NbROt03wRLdRz4xAM8UkCqXhxkxUHXpXFiiDjwgXQnJRs0YlTgD0OF6TeYGoW3/vVIyzo1yNzlK
 NeXLIi+vIeGjFrXNA8U7FSazeEF2u4p/lIKhsNqkqyQLT5b5J415E+NXYk7asK2F//Av/grM14r
 fIAg6VQrPdaHAeQUpRkGS8t9J0ViXnMZdY5NkXi9p51ycBpvEMRi+km2zzEpmi8A==
X-Received: by 2002:a05:6a00:8c10:b0:82d:62ed:b01d with SMTP id
 d2e1a72fcca58-8415f6e8fc0mr13943079b3a.45.1779727143648; 
 Mon, 25 May 2026 09:39:03 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164af0506sm10041775b3a.16.2026.05.25.09.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/9] lib: take out duplicate assert
Date: Mon, 25 May 2026 19:38:42 +0300
Message-ID: <20260525163850.3493602-2-juhapekka.heikkila@gmail.com>
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

