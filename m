Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79127EA3F22
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DA710E5CE;
	Tue, 10 Feb 2026 16:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMchpEaF";
	dkim-atps=neutral
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AED10E5D1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:23 +0000 (UTC)
Received: by mail-dl1-f68.google.com with SMTP id
 a92af1059eb24-1248d27f293so167844c88.0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739822; x=1771344622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uidwY+ItjIP3p2MgFzadCEq3egU62jiKI0BZ3Efc4ms=;
 b=gMchpEaFE1lzTtQhEREKJXBg+K2Lyrnjrrv0SWpzFPZ0bPTRl4lceJfS0uUi9DZXj7
 /J6fvwVtN1j2YYLzHcZhXXpghD29SqE6aemY0cmtB3VitnOHhq3Y78Feam2c7zlMHSMZ
 +gkkDD7x99nu/rwWu2VO4cjzbIIRNF1bCaoN805Tr5bY7Ra+095vyyU/mJPmdlu8GMxb
 fhQkD2gLvhObWW8ka0BpKgt7+z11rdcz6HlT3v/DXT31cYFCqzleTjM5gpawIB2Lxlhf
 0/76/b3fOcH1TSXYuBSLB0U0eXXl6/gL2ezOqkEAqfNe8W9W750jf6gpVUTIOMx0U8J/
 Z2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739822; x=1771344622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uidwY+ItjIP3p2MgFzadCEq3egU62jiKI0BZ3Efc4ms=;
 b=xCnUhAWSEK0i5RSHvB2QGUnqN8O0UTE9DcOZrlxKsCWKoPtG6L8hRIPNKqcU1FJ49a
 vrFrvr/MlS4n8fiErUfYfN8qtS1Ih8PKTkBlYMkseCcrfI7pOYfUWSPlYBQlL41dyVCa
 eApRl8XPXICXPyZK0CACsYsanusLLBgzAUPSXqyenaq5M2AoLzxxI/XMdjwHegbysE65
 40uHk7mT2oN1enAvJFmVILsRI0zL7sP3s0hIfm1dK8mSFhjAvq2m2dr7zNq3h3V4C5dL
 xPbQtYqQAG4iBBQo/FwWRTwsbBjm7USTe8jGtAUfpwG1Kk8W3sazRn4FmivOW2YF8Ajg
 AizA==
X-Gm-Message-State: AOJu0YxTHjI2FGYOhqOrtqR0AeVlmR8ipvB2nCM7geRtoQ6jRaRrIajj
 TtqEUTN/4/7aPFGqenrrCl7K0fQz4axTbanHmCbn74I2LB8B65w06dfx2IIDtD5zfYE=
X-Gm-Gg: AZuq6aIlg+oOzsskpriY9MPSJKCPanX/myPdIjWyV1eK7jATTgQpWG+7Y8g6yhhVyoe
 HFg0HcsjBo7JW5CX8Vf+NwnpN5JYMpxbJxUGNSiZ1peXR1wf7WKdv33jEvdYpayHjvGIlSywqT/
 LP0ZPeFTjmWX1pTNC2DcwS6xm45lxvcxwYdyESSLOfwvqw9IZ8LNAiSx/xgD7u8RYCIPLedew8U
 +1PKpYts0zhZFpG4iZuqE9lxbUr8mqM2nC3NRsLYPg0/RDuFwsxpyRUqPHifyMMtQ7vEcJkN+bv
 V7SQo/4rxdxiYuqjUt3aJUejtxpyqVMUYl3TBG6+nC1qCmyBGNLyoZEICwwUdjVdq57F0ep4J5W
 JyDPGeTUD8KyTmApQOT5J4SNBKBW4sczZ9usdr0B0GqZgPN5KwHL4r/6iYt7qeszG9Xx94X02qz
 Gw7kjkSmUXX4+vL+0IvLRAK8M6QWAoZVyA11QKXh5brVGwHnv/DHD1nqqfUVDP
X-Received: by 2002:a05:7022:6894:b0:122:153:d161 with SMTP id
 a92af1059eb24-12704001972mr7862209c88.17.1770739822102; 
 Tue, 10 Feb 2026 08:10:22 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-127041e61b9sm13464642c88.8.2026.02.10.08.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:21 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/7] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Tue, 10 Feb 2026 18:09:38 +0200
Message-ID: <20260210160942.2219370-5-juhapekka.heikkila@gmail.com>
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

move engine class selection to helper to avoid duplicate code

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index c12beed46..198adf85b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2463,6 +2463,26 @@ static void update_offsets(struct intel_bb *ibb,
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
@@ -2505,26 +2525,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

