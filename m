Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD1EDF173
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CE310E822;
	Fri, 13 Feb 2026 15:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lobzqnde";
	dkim-atps=neutral
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42910E81D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:16:56 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-8249fc726e9so606212b3a.2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995816; x=1771600616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uidwY+ItjIP3p2MgFzadCEq3egU62jiKI0BZ3Efc4ms=;
 b=LobzqndePSvhHtN3V1lHRv5lWZInPjhmEmEsnljFPpcvllpWsS84GEdWIqBqOta2aK
 uTMJxIBtghMo6sEMjhWik42bEJLIBGyalAaFoJ3+bCAMyfz+VNN1IMvV4k6GiQ66PZyV
 JSnqfdV5JUmByyEzjNVVz0LiFHuwfhZjioGdcsRRHPnQb9mi24FhM9SsfEVOnEmoiuD5
 +gvrHh34VucTUfiotNfAjadNPZLOLcj2zGuIfDFN9i2FypQc5tpBsFXSMM134tSSKjBo
 7OArDJTIsoRgYnnhAVkGpKQkjWNoO+ZSu0yWbTI1S1Y+W7Tw3QbsdP+JmswS7imSRAnw
 ED+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995816; x=1771600616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uidwY+ItjIP3p2MgFzadCEq3egU62jiKI0BZ3Efc4ms=;
 b=iWMN/L/5LLlNvsO/TVBCqsDfW4NV7P7AgDXOQsLTo0/HOUr+I3v3L1fuG/Ss1W2wOv
 T0AkTlUoq5Ot3oM0Z31rL/XdQBkdT2jCsx7tqx2IYsOCsHdhCEVdpW87XsEwDwImKOTY
 ovksmw9WGXPwC51p3WUcLQRGG3TIHN9NCVW9PPBE8eBA8a6G37+ko9632cGvHIKANjLq
 VErCm5hqLJ/y/nYUjEvT+HTGqbWibLzeG15N/6CYSwsuIrZleg2tmmyQASCCx6gV/geF
 yI4ak6dn3pUNAymo6C6EjapVBhIRSBfipl7q8ReW2H7mzof9jDUcnL9TDexyyPY3KRLa
 Msjw==
X-Gm-Message-State: AOJu0YxaKq5iTN3YYeeyCNZO3JHWrGc+dQr1TmZOY5Pv3Yysd1kJ/x0v
 RnmgsddDwIRTQXLgx94QOdu/qxJgShRstjcBKOlKAOaH4SlKm5FKUuKUXzU1QL+N2yI=
X-Gm-Gg: AZuq6aLS4JRbLw81icoY6jQjLr/YVrNa0iHq3DdxukKS3turkTPWy4E/K2skFXukf81
 sVbiaVIfrrNm+juLM0VzCkpiR304O7xC3qblnAcUnWHgIxuNjzQCovBs+1xx+4ZeFbfflk/RrA3
 wvyJcInz3YPteHVB/EgjJjp0fYKNoGNtjZbdreWnwWxEAyy0z0pbqhs8nqpVz0A7ZIgardqJ72w
 6C8uXEMvqCRzPNrFSlZJr5Pj9LvWrVSzkA0A/Zech1S4+exDHU5t7X0yLrT+uGr8xk3x5MxV4d9
 /ufpeDsYe3BGpex546NexMElYWS5B9A6NTU7BocgiDkRNZWUR1RiDGqmkgx5KelBcWgHuxFJcZw
 Ly/9f3E8KE7rnl7w3LSwYVZ2eg4o/biOdAAvckrdlF0ur3zeuBesF1zX1g05cI+So1Z7ThrvwqD
 3Ls7wNHSeBv2/q5vnz4vmj0P48Y1B2VPopS1G7RBZOdqoiVGyHieyezY4jARMH/va2AOvuqxLM
X-Received: by 2002:a05:6a21:4e02:b0:341:6c8a:5218 with SMTP id
 adf61e73a8af0-3946c8b0556mr1910465637.56.1770995815624; 
 Fri, 13 Feb 2026 07:16:55 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6e197f91b5sm8478279a12.28.2026.02.13.07.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:16:55 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/7] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Fri, 13 Feb 2026 17:16:18 +0200
Message-ID: <20260213151621.1552677-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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

