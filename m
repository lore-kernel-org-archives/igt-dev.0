Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAC6C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BE310E5D6;
	Tue, 25 Mar 2025 19:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XjDKNjag";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295F310E5D6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:09:06 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-223fd89d036so124293285ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929745; x=1743534545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQmVpd5yYDrahCGMWPQYYvXXDggLiOOMJ21CD/MGbgY=;
 b=XjDKNjagbf1CJNKWF679wNjMKkhHPQ6xDUF1YPv/SZMIPeZA5vHYJ4silSCfiInrxU
 UFp1HdP951HiU7qsJI1RBFuxC5whdc9PmYyzbtGSNsEIC+JyDCJI+hO07fwrMyxgCSjB
 XYZKGkaGH+xwR6C/fyFTY85h2AxW2A0hQLBUd/IKsm9e5mKx/casvt6UTu3+zENp3zh3
 YQfLq685G1PcRGtAY1090Zgh0w/mQsir8WTlVsR9TuUiJ9ij+FhcpkaiaRDPkRnrQ7V5
 6NvT3SYVNpJJJsEW7qRNiNCTYX6uqO4YZSgbsrTfYN3IRi45yz6q6vzBxMPsCI1jgtix
 /3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929745; x=1743534545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQmVpd5yYDrahCGMWPQYYvXXDggLiOOMJ21CD/MGbgY=;
 b=qmeWArMFHZY3Ep6FGcof13MPfQuvMatVE2UntMMAcWai73fk/y1qZ7EsPYCiZf8SgK
 R0hxK23Dvqq+sn3a94dduP3yaVJ3WAtdoXj8fQOCsmI2HtOJrxCBeStCAaET/i78iXWl
 N8SVaC5CE+jC/9K4CuX3aAzJY7zTU01MRZybbLbDnhAULXXIZ1lAo7SW3u99NKDFcAP1
 QMinKzsjbCSwzLNXc0J45QPdCtFJh/cjT6W9Lh4lWxNuEObv4Xr7G9EX+1PO263HvNkc
 Zv4n6j7/tfW/wEmtUENJ5Ue954weyYhSHGs5aC5W/IN2kLmqvZlRfZksNC8MRGuRbU6y
 NB9Q==
X-Gm-Message-State: AOJu0Yzm1CHT17qWWhxBXq3GXcNfqLe/HsyqeV7jM+cQzKOg4AJCcXjf
 Imp2d4haMZ7UcUcFrpCxPd3ZdayPzoBrFPNCvyFpj0WM1j9/uA7t0bsMw1aoy9w=
X-Gm-Gg: ASbGncvrvGKqSJSl6iKUDB8BLDqxsHs8RWxUbVe0Go90Ei8CvvjeDl2/armgHLvo80d
 wQArxdej7hb1asY1iVx3+uYlSz2QS6KSybkzszkcljCVJUFR81lUD3bmiizamnXIaHvTM9jwz9J
 zyLxEUl0q2pA6bgLeuyb4yNSH/wwHCxozAUcWpF3P/HTHnPXjXt/h76XzhtmS4tkxnvhhvG6lff
 ltkfXoXfAxqRhFg+k30cHzmpRNagIypp53CccLKA/G0gW0NNfcwK2s5ATTp6sCxXODitXZQg59k
 chhntsFpodkE1MWG2Z1ziqh+4xOCnRG6CmFbe9B25nzeErjxh/0u2g==
X-Google-Smtp-Source: AGHT+IG6Lxrcs73981Bp3YnQHgGscy/Zio4nSmO4Cpp+p99yo/dWnLPYvUASFa7sda4xWtHOMXPCpw==
X-Received: by 2002:a17:902:e886:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-227eb615177mr28289375ad.25.1742929745303; 
 Tue, 25 Mar 2025 12:09:05 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811bd195sm94126415ad.132.2025.03.25.12.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:09:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/7] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Tue, 25 Mar 2025 21:08:36 +0200
Message-ID: <20250325190839.1984723-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
References: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
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
 lib/intel_batchbuffer.c | 43 ++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index baf34a837..0c21ff77a 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2432,6 +2432,27 @@ static void update_offsets(struct intel_bb *ibb,
 
 #define LINELEN 76
 
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
+		break;
+	default:
+		igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
+	}
+}
+
 static int
 __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 {
@@ -2455,26 +2476,8 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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
2.45.2

