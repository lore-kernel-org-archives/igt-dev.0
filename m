Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD0C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33DF10E5D7;
	Tue, 25 Mar 2025 19:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hyzAubZw";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBFF10E5D6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:08:55 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-225477548e1so117581925ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929735; x=1743534535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EXskGopXIe5Z8Wc3+MTk/j8+NuKE00dTCG3yPQYJExM=;
 b=hyzAubZw+Hv+SNWRBSAYJ/WJS9cd+AnIO4ORbW8B0Pub/VesF1atcQaQ5G8+lL1wTB
 HIaog8Qe1kwcweZft2h93hig5mm/VtRKN8ke3D0TsnN50pWRGy+McVTbSDlhshrfsONv
 lUSzn9WD6MSbaF0wak+gKDMJMfi4yKsGWVxgtLHacDtaONaxBcsWeXs7IUhSRx2xqRn2
 a7/tYdgMeSu1FWyIFVYH5Sy4AvxmaEAjVZUqb86mOXMfArhPsE3s65tVeOC4H4v6LlXX
 t4mPDKN/sOzfXbr9OqjkTsdPELYI7e9wlFWcJ2LHqem9uhJIWHLC4vTFC/TEoUZc35EN
 y+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929735; x=1743534535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EXskGopXIe5Z8Wc3+MTk/j8+NuKE00dTCG3yPQYJExM=;
 b=EAuZXEUtPZKw5ENsTgQQf5AIW1MH9SlzP0pGlSHE10c1UXOGA4X14OVrm1EhyoVI9X
 fymKWnzLO/mQr6K+qIaDc/hx7lOTdm9n/uzVBf8/zyaVFcvckyZ4kH+9SH+vGu0fH5/I
 hsaw9jELO1m0DlXaBHGOqZe2chN2ZizwZi9LHxdrcZsyUe3PAZ27M/0vsgCr8JV4aqxb
 W2DqAHS0X9GvGNCwqi2JL20n9S8nnj60DVUAEDumChGglO7lqYb6W4ogj71FQ3Sf9Ywl
 mjgDkbz++LxqGNg5WU6Qb3dDlw22isRZYgFnVxJSuBmLZsE0IhbQWGQ/NL3FS9BAy/FO
 2nMA==
X-Gm-Message-State: AOJu0YxMKHcNzgpGSUT+/R/oo25zvcvQbExqoeJk6xkbAsZ+eTWtohzW
 8z09FSuLoxDWdFGDosEqVQZEJGf6hq1nWqrRf5MPp52DvcjenbzCf+rGHpmAsr8=
X-Gm-Gg: ASbGncswoYHCH9/8YcPb3t1qrPD/Sm8Um3p9jiY4/uFelAMprYdr1eUucNaw57qmaG4
 uxvkESO0MJa2jHovRABaQPNKGQ3RI5Pr5JCV9+qMw7+CdJ4QlW60M7Ljy35Ni7wHwMDUWlafdVA
 bsEIOPpnl41qxosWrX+wWoSh3WkN8cxdSDRm8A2CQCRTnh+3Uf3YHQYRH5YA1ektZdZBsawo5j1
 Sx8tEndCYII+02eew5hejVqGysDn878uuGQCZQlaxVSH0sHwZUCjGluWpXq85MXku1pXSOYTSRw
 xiAJ7yVLaQf5k5EiRgJ5ppD6ulQHPLOlEqLA0EoI6MbksqqKgK9YOA==
X-Google-Smtp-Source: AGHT+IGR6fAsn4k++Czo9k4yn9vFNp/48QHkJ7hEbBRZMh2w2UjGDHA4uKRuUQ2EdDzTg4jPIWBr5A==
X-Received: by 2002:a05:6a00:2c98:b0:739:3f55:b23f with SMTP id
 d2e1a72fcca58-7393f55b36amr7953856b3a.14.1742929734433; 
 Tue, 25 Mar 2025 12:08:54 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73939d2bdb1sm3899746b3a.144.2025.03.25.12.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:08:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/7] lib: take out duplicate assert
Date: Tue, 25 Mar 2025 21:08:33 +0200
Message-ID: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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
index 4e3aefaf1..ef5a978d4 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -310,8 +310,6 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 	uint32_t aux_pgtable_state;
 	int format;
 
-	igt_assert(src->bpp == dst->bpp);
-
 	intel_bb_flush(ibb, I915_EXEC_VEBOX);
 
 	intel_bb_add_intel_buf(ibb, dst, true);
-- 
2.45.2

