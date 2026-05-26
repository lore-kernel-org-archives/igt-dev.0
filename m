Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57557CD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D1B10E6BE;
	Tue, 26 May 2026 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4pGAT5o";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AAB10E6B5
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:18 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2b45cb89f7eso71591415ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806658; x=1780411458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k17Mya1NtIEVcvmAyfvk2tDiCwA4C+Qz+QcQzNB3fnw=;
 b=X4pGAT5oidGQZpUm+UyfW9oTaiMEjcErs0vQUg1oTE3eJbIZA+k02Ooce/ELTjmiSA
 44OjtSjBnT0sRRH0ibxzGPJR7l0HcWzVO8ISX2x+kZDe4Vj3NeQJdULPDU8ZfD+lkOKi
 TaURJCQqh+SwzQF+85dgdScm6v4l6djSKWhMBgf4qMzBwYzo3w7zIHJpTjcceZRRKk+K
 ieQJT0KqSbU0we3up+74tlrUYKKKcXguvohhZnMqC52Vgl8l4O1kuFtGBPZSHfp0dXO1
 wkM0Bp6KqXEQ1LiHg8xEpDq71Oh0wXwi7tUho8M6bdtKrwb6+LfrhqRNbh2FOi8G5SYh
 iypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806658; x=1780411458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k17Mya1NtIEVcvmAyfvk2tDiCwA4C+Qz+QcQzNB3fnw=;
 b=QyGKaPjQy/vkWeZi9w9ow1ESOxDKnVYnFrYcpAYYAJozxOx1g3HkrVuLYMEUoSxJrd
 BMYTAmgtgRhYX4O8ga/nMeWJSlByNJai2RF07wKXxyT43dc978I50UN4sOy1xBG0notZ
 tNoJg2M3Rzpx3A6/hq5Zoa1a1n7nMA58KwiupRdvrFKVjJzyfGiirzClk77yR39rlWR9
 YBcUSYG5H33MdFq9+NHa+cokcGMc9d1mdXxjVjFw57KgIooXrQeBjxbUaTeJYK2U1MBs
 k6IteSTQ0jpsm7BVPmZPIGzffJR7+Vrg0e26q79i/Hy6t3v7T6xwbtiwetwLO/x8zw9w
 q5tg==
X-Gm-Message-State: AOJu0YwMJmVuCEillxCwmI+hL6CRBzPa2fZjaAmEqwgtrsdEmEZ6SmY1
 B2BoF95N/yB1EhKd9lA9EyQS01+yx1KeQmYoqMVgn3UPRMqoKbyzIVDJTHqxZ8oK
X-Gm-Gg: Acq92OFoemMmTVAqsnP8OMAYtY9aB4Y1lmbqO/xyLxOyhT9wisvGPb6xDL5UYC4CzQ5
 CmqutPzT/Fb5bM2fQmpYOrmG6rTHtu+4YGEaFsOYSeENez+VvYPyC8CdAPRJHaE38NXoj9IpCPv
 I69gN06KWVJZKBUsEkA/W9vek5CY1CiaU/9cl+bZ6ey2GenphlnzDxNn1b/HEaynii6UG5uXO9O
 uqeQuFkv95Sy1GqWPguB9lQypzvQKmyRiW0uXC3CfFSg0BempwqGOoEWsz142xirUhkHw75zQvU
 nwn5TsjlOzKeAPigpNMQW31ne6B/6Axtd4YpSplmToLQqXMU+Dup155JR9lECMKWz1f9fIo9soC
 mWwXvw8/An+Gbm/P4GbkoQU5O3fNecUUayHPrPXfJCKhKp5ifmvgNSZZAU92KY7hazhg2RaCXm/
 D0LjAvQ8yjujtw6scOlgR7FpBH4oZkb6FRrFpvZXyQJNQgIPikReCP8TuipaEXTQ==
X-Received: by 2002:a17:902:fc4e:b0:2bd:2de3:51b1 with SMTP id
 d9443c01a7336-2beb0624631mr204017155ad.32.1779806657653; 
 Tue, 26 May 2026 07:44:17 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58fd888sm131982805ad.73.2026.05.26.07.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:17 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/9] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Tue, 26 May 2026 17:43:39 +0300
Message-ID: <20260526144343.2531299-6-juhapekka.heikkila@gmail.com>
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

Move engine class selection to helper to avoid duplicate code

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 94b0a99d7..79a4e357b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2472,6 +2472,26 @@ static void update_offsets(struct intel_bb *ibb,
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
@@ -2514,26 +2534,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

