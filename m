Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE4AC5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0742B10E1D0;
	Fri, 20 Feb 2026 16:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IC5yJswr";
	dkim-atps=neutral
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655ED10E806
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:17:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id
 41be03b00d2f7-c6e248aa446so926971a12.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604264; x=1772209064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=IC5yJswrKF1gbEZtFSZrSDQPVK6EpjqmSg8B+XbuUlbmI3YEZZ3U0J94eSumhKGGz3
 WsJBr2SutZZRD75Z/VwQhJ45jJdlkIArlEBRv5F3hzwgfK9rzlHcD/51jg/6KnA6bmZH
 AKaW1YnqYynB+Ee7eqHL+uazROEKWg5o0A9vgLGp85x9ndyli0rAy0F9WqQzEyZ2R8Ik
 1BFwmbRnozK+QIzThcR9+LBdcnZbxfdmEaRYSLoquf6p0LLbBO+hRSnO6npsC1VD7Y5U
 /nSejO1XsbS2qS6n9awx59IdCZ3lB4mJeTUUKl12jI6jQrot87kuFIhNZnhHt6GPBPYx
 uVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604264; x=1772209064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gfqX5btUAgIQRqB/Ppk3u9cH6aVYq6CEx0KKTcINtDM=;
 b=PTNv0k99dNo/ZblNuHEePymVJIRlKnLfAvnTf7O22fF7/QO3d5czs6n5/C/tws8uNI
 FnyYJDbqZqRS6PculHIJ25hEkmp76L2trhM0qGPgkmdRpKZ21oSVBUNUWhIOtOf0TtVy
 IixVAbCDIcsrdRU15DQPZggvJabLYiuKzb3okq9SAUSNQD/AOhQuGGLYfk57RjGAco7K
 c+Gv+qG/G+EsveCDRojwc+X/9VM8NaP24TQ9hL4kAbQ5nq+Ubclvejmx3kygKk30BpEc
 uuaOsm6euzQRC0nOANSeXZaPwLTK//ZwVtG88HvC4CRTIW5Uv1hZFfh7DJ4fZVkfq+yG
 3K2w==
X-Gm-Message-State: AOJu0Yz8pLV3eUMBZ1R1x4HqIUokEa23luWIYXWU5z1ZcKNfWXPVskTD
 RWhBSLoOWbrCCk7m823wFMPRTAu0Gmdqs0DlPKd30R6yWb9tAoOkQRP3P36r6rvcHwQ=
X-Gm-Gg: AZuq6aIwSOJKTcMIABRHOEJxXxGDJIpEEXyC8iIdVDKTcFUSOBrx1yU/pYKRtQ+td2A
 ciwKWv73eFeUOG6fFscNY9onpIL+Sr7vEd67LDBjJdfxfQS9trCOeHzY/HKswEB+6g0fnHsEoEP
 VW6TISF/AizRgqyvIMV2DwLsxpK965BhE7W7vXzdR1UURABYSJj3lsJezGKSWZMvu+ZnSpBiEOa
 cTzKB48Ydg9GFRLrWA955VX7y8XvylRvcLk00t3wVRm6JMhyeXneU0ThnQ7s2b0Kg/7gCEJGaeb
 FM7uBowquXtH7IfD71b+lppHPlqIpWDFWsI6xu5qZz6vvHkyDZuKwcNDuSwvoB1T9uQnj6f3nXf
 EbojA8qXzUN30MZOIZCeeFgzNin4iLx4p8FwTudhjLWuBvmslrzDu+v8ym/ove0kiQt74PGzjrt
 ru2/4CN3h6bhDxCjG7DUonHNy6NIIn6oW6GfBt2cnAqaToanSXn/oDpEg/HyvfVw==
X-Received: by 2002:a17:903:2c08:b0:2a0:b467:a7cf with SMTP id
 d9443c01a7336-2ad742b9cc1mr1262015ad.0.1771604263553; 
 Fri, 20 Feb 2026 08:17:43 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a714786sm203312215ad.31.2026.02.20.08.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:17:43 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/8] lib: take out duplicate assert
Date: Fri, 20 Feb 2026 18:17:11 +0200
Message-ID: <20260220161718.652862-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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

