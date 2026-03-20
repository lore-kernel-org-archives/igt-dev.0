Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF11098782
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A2110E466;
	Fri, 20 Mar 2026 13:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iYLnfb1E";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49910E8CC
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:51 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-356337f058aso1078364a91.2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014411; x=1774619211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwyEr+DIPcp1ylgP1oWQolCaEYqPl9SSwoJsrykbeUg=;
 b=iYLnfb1EI3Isq8EbDIppcL23Gbf5xxhcBJfiCAX0mEcEj8eJ5HyMQP1lJJQSE3rzU0
 8avvIbu0d+t3FanEiMQMOjnUzdG62xJ1vgBLuzO8KuoXApZxbQSqQBBGD28g2h4Ug+h1
 Ye3ue5C1Agc2qrtMR3UtPJVkrpLquU0S/EWEZ1InitM9fRHKB5ax7B7nEJliZoyaDvtv
 qcr2smdevFvc+bkk/sgx+hnkFrILV7cWFjZybEsiUzK7hh86rXQx3oW2g5CC/fcIeL4+
 waBFuTlDfYgdZZKXudApcLyVFNEQI7WRA4S75M/awKGtyTKM2eZcZC/aY1yN6Ka3PyiS
 vM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014411; x=1774619211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uwyEr+DIPcp1ylgP1oWQolCaEYqPl9SSwoJsrykbeUg=;
 b=oD9Jh1Jzho1flZmWi8xO4+rAY9rd0v5IPqH95LJYENOjdDtWKwLWEihoYM25kbTLha
 3pHSnEjDQs5HvjzuX+smvw+GgBoAIabaDl6NTeEhGwtHlY4JxJEd5i/X3gAEJ/AsS9JG
 axSZWkvUEB9gZaeXR3m4lnH917sBQWexinbsa4MeCSZCabmjFmqhnVXZn6dv2eDFtwPe
 9aL0UxD2i0U8ZWiRyklBgvWLNJF1SIvp63+kL6d5gj7P75rqc+WbMzrvb7l+OtdPZR8B
 Gjr6wZi/q2jd7MUbLJmL1JurzixWvq/f0flxktq6LH3Pt9pndADwGV6stQl5o0lkW2xp
 zlDA==
X-Gm-Message-State: AOJu0YyjHUbC8kCjuQT9LLI72P+L1GgSvdekHPJVauPJ3K1iU43qZimc
 WX6HWLRN1RBl4ezDPJhiez094jmECuuMfNbLYRkPh3UR8u2rDIogQppV8jfKz2Eu
X-Gm-Gg: ATEYQzz09v36RUWLc7c7ZxYn3Hz47lt60wbWQ32DRVqxskNkzmcd3mXKLQsfHBkjf9I
 gNoU5muOP1Xdze6icHK2U6j3zuHSUZy+R94KoGRHxxz8jnt6LRdfEHyOBxMgvA2e9JeypZSgnY/
 yC/1//p8kiIOFa318FAUvd+K8exh/cJV/T4Lncch8z3gYMpBASxq/l43+kOdAMe/wRWzzLLf140
 olORP9Qqz5+0BHUwomNGkvHM1NPO5TCIm9tYtepPxuMDqDI+Rq6GZ/LuAxMV7eDN2CLbs9gLhhI
 C6IOGKonEdeVGXRW7O4DqebYj5nhwa9SStFAHs6urAJBN+dsVclNul43wOFPHqhSuruvCsF1CQu
 Dsbp0kIOBTCxMqQFvXAl/UbpIvV4cHLu5J2KPNWBKuY3kv4MYXfnObCRgnhv1o/UmwBoDBthFSx
 7obZxUuZEcpvuQrAv5rYOIhf/4Aow3gkZVv5drHSrf68QtPqQxvjOAM+fqrlQ/5Q==
X-Received: by 2002:a17:90b:17ca:b0:35b:98d7:a67 with SMTP id
 98e67ed59e1d1-35bd2d0860bmr2471993a91.31.1774014410773; 
 Fri, 20 Mar 2026 06:46:50 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c743a7ff47csm1881733a12.6.2026.03.20.06.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Fri, 20 Mar 2026 15:46:08 +0200
Message-ID: <20260320134611.876379-6-juhapekka.heikkila@gmail.com>
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

move engine class selection to helper to avoid duplicate code

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index cfafaecd0..a3fa58b4f 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2468,6 +2468,26 @@ static void update_offsets(struct intel_bb *ibb,
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
@@ -2510,26 +2530,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

