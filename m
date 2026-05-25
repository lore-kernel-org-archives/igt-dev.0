Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72176CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2614210E3BF;
	Mon, 25 May 2026 16:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pMHzJ0Gd";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB4510E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2bc85eda6b6so49082965ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727162; x=1780331962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAcPeWgCHrC8Rvo6rKPm+A5UJKKhnR0pdh04ZifPsCE=;
 b=pMHzJ0GdnAaEjKZo+6Yhv75d3ai/jqk/s/aiz07AlrFhFAOv8vv3YG9xUgHYlJRU5C
 mN//V7XpCkO6L6vfg+UdsyZYR8JdRygwJcCSRVHU/JoMt8VUotTrxalNEJdVVHsf0dOc
 C06X8x5lmQIBnhgqc8thts8aPoynWOkLxUIsnJDWdANYSK+yjzYq/mMCvCZQUNjbHoLf
 duUlOq9+5ZJ1MVCu6m3jVf6BDgdC6wsou2Bw6BsCNUmXU9n6NF3vK+whvoKVIqjlkBd2
 oIODDIBG7EuZdhz2VL63p2JRhe9FAK7ic/mAMD0rKRIO6oO/ttBI3wZFibEDdHHkxjJr
 5hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727162; x=1780331962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OAcPeWgCHrC8Rvo6rKPm+A5UJKKhnR0pdh04ZifPsCE=;
 b=VTx3h8Ds+RESQU7zYs5P5J0WpfBUGyDTsgS6ATJAdAhI224VZUSJU/SllmbxnhFY8A
 1LLzp8MFdM0TCYGW0VTiF0PWGA64YQ+iGmQXv3Ri0e0rjCa7zU8+bPlLq9nmzpm2yjFo
 Ty1REoe3HAqJbbDMpHLaIxXUz6keURGClYRTwAz1C7lSSP8AXo3McsuXaboPmSuGTSa1
 hRwAadzblwnEN/lHLjMM+hhQQA3z0gJlafYq+CYlLUTK0zcHBelEzN98hA6LOp8dvafT
 RhlKtokilespOGHafQNijBRjmDSTT9l2LfWh8vPqbWCIkDXgbdPPGZo+nQL7bnqu9wa3
 O7VQ==
X-Gm-Message-State: AOJu0Yzw9IT2iMkC+3x58oWRKP0hu6A8jkNyNA79OmvYIf5agbX6BGXg
 yjEd7fmkk8a7u8iYGBzjZnuoh6usa0AmWp9pG972Rp8cdHoX0Ws1HKxmLcOKufbf
X-Gm-Gg: Acq92OHR/wM6gcodQaOe5iQU7t620yd8tOyM7wit1lIC0F264lc/H4kwvfhCGh1q6Sn
 19KttsyXqtird9dFMBUlJk9Wdx6FYi4mNqzyt/90Cr0MS3LdRDAh/43W8lb87nd9I++nagYUaQV
 Ba9gwsIGsAslmb49iNEwKmQQZEDW1qytBV1uf2e2W553eWzWd10tv4qzXGDY/wFYNPXQS1RGQ0P
 xwi4FF5JoH7/QXBEEXJuz3xfbUj2uxRAmtnSEKFNgjgqbfBzw9dox+2naYp7GI1Fprai9qTKXqS
 CMj9ukEcHBv3XGSdi40O8YoVmk3Nq+NXMotcr3NiOq4FdmZYz2UwUv7kecEzm/2rFJyGEwtNdS/
 Xa6gd5n3o/C/pdIphOg/P6s3YNlJDTsQgHsZv78fGzO41Eo2oGjxSMpWLjJL/PySyKXFGjlqhEG
 aMQ1BbQyosIhR9Hw2lwKT88JEKXmsT+GskPearma0pV2L4Jcd0ZAJaDnGro47+yA==
X-Received: by 2002:a17:903:4405:b0:2bd:8822:d8c2 with SMTP id
 d9443c01a7336-2beb06bc0a9mr157182925ad.36.1779727161927; 
 Mon, 25 May 2026 09:39:21 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56ce2cdsm101339625ad.29.2026.05.25.09.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:21 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/9] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Mon, 25 May 2026 19:38:46 +0300
Message-ID: <20260525163850.3493602-6-juhapekka.heikkila@gmail.com>
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

Move engine class selection to helper to avoid duplicate code

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 4659b2915..3f89ffd19 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2471,6 +2471,26 @@ static void update_offsets(struct intel_bb *ibb,
 	}
 }
 
+static unsigned short get_engine_class(int fd, uint64_t flags)
+{
+	switch (flags & I915_EXEC_RING_MASK) {
+	case I915_EXEC_DEFAULT:
+	case I915_EXEC_BLT:
+		return DRM_XE_ENGINE_CLASS_COPY;
+	case I915_EXEC_BSD:
+		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	case I915_EXEC_RENDER:
+		if (xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER))
+			return DRM_XE_ENGINE_CLASS_RENDER;
+		else
+			return DRM_XE_ENGINE_CLASS_COMPUTE;
+	case I915_EXEC_VEBOX:
+		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	default:
+		igt_assert_f(false, "Unknown engine: %x", (uint32_t)flags);
+	}
+}
+
 #define LINELEN 76
 
 /*
@@ -2513,26 +2533,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 		inst.engine_instance =
 			(flags & I915_EXEC_BSD_MASK) >> I915_EXEC_BSD_SHIFT;
 
-		switch (flags & I915_EXEC_RING_MASK) {
-		case I915_EXEC_DEFAULT:
-		case I915_EXEC_BLT:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_COPY;
-			break;
-		case I915_EXEC_BSD:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
-			break;
-		case I915_EXEC_RENDER:
-			if (xe_has_engine_class(ibb->fd, DRM_XE_ENGINE_CLASS_RENDER))
-				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
-			else
-				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-			break;
-		case I915_EXEC_VEBOX:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
-			break;
-		default:
-			igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
-		}
+		inst.engine_class = get_engine_class(ibb->fd, flags);
+
 		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
 
 		if (ibb->engine_id)
-- 
2.43.0

