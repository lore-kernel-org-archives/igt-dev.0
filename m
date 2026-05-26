Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC38CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1A810E012;
	Tue, 26 May 2026 14:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JyR9S2QD";
	dkim-atps=neutral
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6510E685
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:43:59 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-303dbfbec77so12562507eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806639; x=1780411439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wEXv8FfjwDv/VryaSt9JIqWj3eXMUabmdaKBm3rL1XU=;
 b=JyR9S2QDbdjMq2b/Kb3R/pnYqkOQ+2mwlQ1UEuTjHxrBbsGgnNzTSAw9CX4HMj9RKJ
 Lc1O7SjU5gLwpAKiq2GJlRNakASjmIWuLnlXvvKLULSEGqYoOQXpNA8It56SjrOk3Jzk
 yec7xOrcjdHWUeX2NLVQgQxSBbo/Jgf9bGbteMrt/45LeBEObt+4BDrcYf5O6IZ+6y6H
 H08dR6ek2oIIX4XdPfkwj5PNw9JL7Bdkhfx3ln4RvWRugIO/uErpJYTbOfIqkG0u2xQf
 LrBb8Yx9GvUdPZn6EkUYV3wgJHuJIeLAAXpbmLvoLI9QNEubTPdJACipanQz+FQPsZbF
 M5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806639; x=1780411439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wEXv8FfjwDv/VryaSt9JIqWj3eXMUabmdaKBm3rL1XU=;
 b=IfhEGeybpdMtxJ7kToaKmaDMIJUtGbmmy9cp6sOYbAiFNjC6MqsiesPmtSZLxkbjhA
 3mJAVPElwTG11YT5/75Nhk+y447fmjy9KQHDNAMm71/a3oJoNYBa0xEdbkb3qynCW9vN
 8SP/fsASxAb47DVhGhywIKCUrVNte7PD9LspWU0GqX8jpUs0/TQJVFr7ZwDhTU3JDSuX
 1p+Q8w7ZQYcdVq9mZsQxoBOwtq/ioNabEvYCgwxHZxHxIxvsQe3rM8YOWV0ostsbmIRw
 C7p+SvDVBBns25fnv0gzZ/ieVgbZ2pAAVaAycIMxw+ycfr0IuZon5L8tvS4u+kdk9mxD
 f0pQ==
X-Gm-Message-State: AOJu0YwsJJ1sRkYev7L1SVSX/tvCv4Z6/qcW4SIGzs6fhFvjqMD6L9SJ
 Y4J3Sab8pvygNsbEAXm4bW9uXgf1lAZgUlwP03THaNaxrJ+FHQijoMgGusyX5cSR
X-Gm-Gg: Acq92OHJdrMVljtEqLZ8anwDG5FRouWq5HBS8JEydYr9bk/l7CnxSGkyUtDBKeZH1wN
 uM1edODek0nAyc3OcegObgJG2dgL9IRnHQRca8UD7KpJKmeSrJb5fp1Rh8jZ57+Dup6B19lTnfR
 wBaKf8QGxYUArxY2M9wDLUXordpcmLzayXNzcVbQGlup/BhZTkvJNYKjxawTEVKShvNd64GGSyy
 P+QOshbuoGUOpX1TbPdbZxi8McN6kaNRCgLeZelUihMuZA9gDIDnN65kGwm1rW5/VOcRF0CW6Tx
 foFC+cxBm/w/jTA57oEn8ewsvIxEf7jUkPu6hDES6ISINr/71DxnubOTjl0Cj9AQM+T6WEBXoOJ
 2DjwZeN/Q7+xMbnahaxlobwm6mxfm0Txt4EkpvBSyE6Y49Ug1PcbgrZ4mci2dEjD8FkeUr98Wvz
 38XG++f8W9oxzIz2dMT4UG2R5OFuVNkdC0SWQPKv4npFVf5hfK9GdSNjXS//qMSp7wyP704Q==
X-Received: by 2002:a05:7301:198a:b0:2d8:7302:d3d with SMTP id
 5a478bee46e88-30448f4b600mr9121581eec.8.1779806638905; 
 Tue, 26 May 2026 07:43:58 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20561sm9714264eec.10.2026.05.26.07.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:43:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/9] lib: take out duplicate assert
Date: Tue, 26 May 2026 17:43:35 +0300
Message-ID: <20260526144343.2531299-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
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

