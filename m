Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3A5103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02CB10E856;
	Wed, 18 Mar 2026 15:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TQdyl5q3";
	dkim-atps=neutral
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8813F10E859
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:06:09 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c7393c6832bso336165a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846369; x=1774451169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwyEr+DIPcp1ylgP1oWQolCaEYqPl9SSwoJsrykbeUg=;
 b=TQdyl5q3T9vB7ERQ0tqywjATx1ZELPl5OztKUOPTK7IgfCa5UHrw39KJiXms4gpsg2
 M/N/MkliEPh/W752CD2Kw9Jm+RBnVLa/SEzhLoSX+HRebahUmnZ0SGbbOz+lYtEjCIqz
 EnNEdIbiDBwUaPttREdKQuu76Cv4FU731q+a2zLqtQbOtGHg9qD9HUtN3tUprcRq4mrT
 oQWRQLPMich+5tap4T55QOxd2IyaHiirTHgTaCi8UGBG9Vchw+jd1GJ5WB6qB2QM+2zO
 eHxqa3ak6zhyreWyjYLNqxF7wFsn6+saeG9EiWi6iqCSeu2Uof79t//VxE3vQ59Tfa0y
 /SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846369; x=1774451169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uwyEr+DIPcp1ylgP1oWQolCaEYqPl9SSwoJsrykbeUg=;
 b=F2a4ltd65fwEUwaKsfFxM++eKNnvqzqJE1i4YvIweNgyY5ncLlELRPuoXNvi/69MRH
 l5pZMQ32FaF/AborUbcWQ4Lfy6z8BQJ8fNT928OzugrSJmklLzg+wFuIOZKwZSJxz8cg
 DvmEUbQ08YmmLd07AQ2sDRzykwUYycIQwujFVKbmM9cUFMayFeuEFwOxTokYUFoJjQro
 i5RkFGAPPkFrZlQp87byu6ZaV3PTOSOXzAmSkzuYZtbhDL2DmGUU3p4UGStWgX71Peuc
 2XTTRjkLTeM/NycTRAKrIGbZ0tIYrpWyQ01peTw8HhWMy5cF2Vo8HVsZ2dYcDArLppFc
 PTig==
X-Gm-Message-State: AOJu0YwW/drkSzjWewinIvK3pmYeBXrKbgoqRr4MhC95IrK9G7ifgKyv
 Pr7j5QpcjUGJqbb64ayTlCuGVDv38/vSTP+ntVmgxyeDdkTev3E4mFqcbmzy7sa0
X-Gm-Gg: ATEYQzzKPVHJyq2bITty3vNNBsa9SQGNPuWUCwS5I1+v8Gup/UHy4fb4RGqLs4XmvEJ
 7eLEIdIIIsGjIwqQHCUdIRAEV1aT6b/ynFhEgiItlqWYDXfQJ2D7C14xsQL5XEb1DzM/Uw3sgTJ
 ok4CKLwKbxaoBh/9FubBHUH1UYpUiAntWAz2UPVPoArxdP2GFlE4Vj4aHDnN4IgtYsHfwc29X/C
 1zmlrfwnXgAKuOLtKRFhOvSPkjTwHzFzGMbd/2d6sgrBG66t4e1HjT62/1eCEJ1MJLnti5lCjtz
 WVxkD6NC9I9YSE+AqzXusQASKqYvQxmDegrQJxNXp52Ioah0AZoGd0FyNyL7FeYspdFXdeNA/Ha
 Gj3vBry1uIVBVz7ha865qfI5sEjbMuIgl9pHxH2eGBGQVlhA2JJCOKhnCjwg01KT9VtBk73DtuI
 TGFVFeVMBS244fUI7G+aqJchzk+HjGi6zLpm29J0/JAlpWs7FI8c7wLAnHnmqnbw==
X-Received: by 2002:a17:902:d50e:b0:2b0:6df2:8cdb with SMTP id
 d9443c01a7336-2b06e21de42mr42259735ad.0.1773846368552; 
 Wed, 18 Mar 2026 08:06:08 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b06e5ef354sm30854115ad.48.2026.03.18.08.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:06:08 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Wed, 18 Mar 2026 17:05:14 +0200
Message-ID: <20260318150517.4049206-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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

