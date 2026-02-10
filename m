Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0343EA8130
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543FE10E5C5;
	Tue, 10 Feb 2026 16:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gni2z5I9";
	dkim-atps=neutral
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F7710E5C5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:08 +0000 (UTC)
Received: by mail-dl1-f68.google.com with SMTP id
 a92af1059eb24-1233c155a42so1049841c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739808; x=1771344608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=Gni2z5I9+30Wez+hQLCTFcjR5afvhJimGlZeK7uTUWEIDt4Y0oKuNKyWZ7vbq1R5cw
 D8k82ef2Wys/lXLBWLZOOL7xShU39ZdmstJs1+eM6p9T8bgJUNrQjo7w2N0PrgJl4r30
 G8N6YZYXTcNHGw5BQVaOOGH9vGbLtHMX3ft6mfH7YqXngJTaoSZtdmbbcCsVhdtlOS6l
 KJUWps1REnyL+uAtom74VaJiDKYIPJPo54K4U/Q1ni1VfK+XKbb3Vukb2PhJKGXvNvUV
 zEzv/XUTDDJFvovzad7ELefjYZi0IFSKDue6uiDtuxfFiFNLIM1pzstNQ4T8OV0awJFG
 fzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739808; x=1771344608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=pCIGG5/XOXbevSFIZ/r5Fv06/zOIgGLBU+wvzoNulWibHl8W0PNvQjM7YceyIRJNv6
 QTd2YDTagVocddw4C14bsMf+9uGVr7I4GNPurQyWUkZNfj8a+V/goXqNkW0bymB7jfiS
 HX/6ZcX+GCmwOTVlQWPyOaJMscMyHeUreeCsxOxkZ7AXsD/D3s+O1s3LyeqCHGZDDatk
 q/fJAuIhx17PoKUonBk30WzNew9FMqo09WHKCHK+xTPH25yFtgtoQUMMJp3saQtxbRjo
 9V+KOg+Co5fy9e85ktJ/TiEIMjUxtukDZzTPSvRDxcl5gCIbpoS+PJ5kXGpY1xM4AQ9Z
 pVXQ==
X-Gm-Message-State: AOJu0YyDTe1m5mCdKTagV0WyevaT+e0jCpD16VoBFeM8l8Kvp4l/+KJT
 KeNVy518704hXYF2zeg1FWwijiSbF6MhBHHxWVA2ovmMhZdvc7rLDtOyGEM71iZwrbo=
X-Gm-Gg: AZuq6aKyRdSUWbz+pgciwvbR7Vbz+MKEq+g6Y1R0d8D+D8pYej/YXCo1foxc11D6XZW
 TvD18oFch7ZNR+qyLqlVxIplsuvNlruYKur4sVfhUhAR1KWU461eYYjbR+jToMkylSi0+u5gy5r
 gb6hTsgrX+blMhJkLI3uFBBaqV6mheqKo6GcpZmYHaqaa3lbkvTzEj3eRKy836Alprk1W0YlhWh
 lgceVd1hFVWxLGjgAaFD4up4P4jVjtZbx29FKoo8OBLqTImrOIdW2IwaHd93JLRW8yolknV15fS
 ipzx+uAzHtqh2Ag/xN/ptNxv72EU9V664fXX3+sHwW+Iw2DBvqLqnY201UDwXM8MlaG06Mbhnnr
 0y51MhPY/DZQuAvb+RD9AoW8cJuSOjvNdqZ8WDQGf6TMZC1l4k9oLn3t3nJh7xXZds/FH4/K40J
 A6FSK1uqjoZkw7/YGO7WrbTSJ35q1DRAvXhpc1el6ZHYkpKbcMxAFYhyXGkRo4
X-Received: by 2002:a05:7022:6612:b0:11b:9386:826c with SMTP id
 a92af1059eb24-1270405f72cmr7760552c88.41.1770739807599; 
 Tue, 10 Feb 2026 08:10:07 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-127041d9a67sm12066092c88.4.2026.02.10.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:07 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/7] lib: take out duplicate assert
Date: Tue, 10 Feb 2026 18:09:35 +0200
Message-ID: <20260210160942.2219370-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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

