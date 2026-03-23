Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508C1F483C8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124710E4AC;
	Mon, 23 Mar 2026 16:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KLCUj6B4";
	dkim-atps=neutral
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94210E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:53 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2c1092cc08cso620755eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283392; x=1774888192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwyEr+DIPcp1ylgP1oWQolCaEYqPl9SSwoJsrykbeUg=;
 b=KLCUj6B47u37SV3iB83KW6kgi3stSi5zn4JRh41eiEYhblcq3gDAdSB0NDlfNH3t99
 dm+cUhDQTr20BAI5CoG+BUo+Yc0bmhoL0WM+RtyDrknA0DpXRTrsWeu8pzOyjmoC+i12
 s42lERKXe0qPcaXu8lVErS7tJezL5tKXLAfgm/vsoywMKj6/flxcSvQdugPLQ6PC6Bl2
 A8ULrs1GIwXBvyvEB8Ripy04K/t4KuBiS4E1rEVibT7CZ7tGuQ1nwnFp8e2+oLBz26tA
 MdDG5WERHJ4PpB1Rg+W7De6Brevty4NIXUuHy8sPwAkYF8UFWIoHJ+LN5ZPfigcK0ySM
 2qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283392; x=1774888192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uwyEr+DIPcp1ylgP1oWQolCaEYqPl9SSwoJsrykbeUg=;
 b=gt6XSASpXlaIQAPVuLvIom4cckPbJk8XBZM26Bmo46fn4MyKxHQ5JXKmS3qjYgZVgS
 Py2M1DNvz0J8ytfa9PsCdB+tJ2sdywOMmbwWqgjjt6hkmAh7xy96XcRVk3LZg+1FDy/D
 jMNwQTPfcJROyesNXJdqejUiAwi+4Dv7gVhesdje+3aNeY6Lr1BqjIizNq2t3rmw4KEA
 U1YD6Y59KKDF9UyacpHsaCSBvW2IGjOd7nMeZZbRLv8jGrahOXJ/4HX+aOFIrO73pYX5
 bqMVSSVIrNYW8t0WMwhbw+0H0HABm5NRdHn7jvmDvE2517iSAPRQDT85Vq7NlFNKh3O0
 TmKg==
X-Gm-Message-State: AOJu0YxTXSFdbFpZE3riighU8T/MHNq1hMxhqEsf7FMJehJoOpBNa6DD
 XBeGVMfFskwVunrj8MEMI1rZWO+DLFZ6Zju1Y/R8ucP8XpIvxeaSbKCzs1u7ejHM
X-Gm-Gg: ATEYQzyFpFjKYBHyveuXNwX9uEVANklUHMbuCI+UMXG/YBYXYMJOOtID0ArutgcGmr5
 dUjvxwqIoA7E0DI0kSVji8SUapHtXKGjBx6LZ4MZ2rJnIsGkT1v3YRlROCoJHnTChxJYBFQ6wTY
 DqxsNj71O289nL+nKhx10LCPMYOqIoXyKh0IHZFIe7PNwiphpqSkaMxuBhmfquGno0ZB488xTTY
 Vx/geaWDH2IqmrBYSfg/xvAvz8xTElla0GQ6aeZQfso9j/gmWP3BPvDJwrSsFnsEy89eZWU1t/1
 l/goZHb96lG3c+yAYxZNm9sgzX4oAseBOILO+feDhsaA6BCu70Im4Ra7TVjL38b5ndYhf6MvSyJ
 G6lnsstkeKinQsFO4lYJ5357ZOzvNT1RlVu4poNgIZfgfIa7+MqPiQ32wr5e5EUhdJ3hGAq42dy
 qGT76HvkHL4GnCqXT21zbDgRQ/Pj92IkjcbGwD9UKBAYumVwAurtkUpfJR1DM=
X-Received: by 2002:a05:7300:d704:b0:2b8:6abf:5ebf with SMTP id
 5a478bee46e88-2c109625decmr6157083eec.12.1774283392423; 
 Mon, 23 Mar 2026 09:29:52 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b1961a2sm12974393eec.12.2026.03.23.09.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:52 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Mon, 23 Mar 2026 18:29:08 +0200
Message-ID: <20260323162911.1912755-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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

