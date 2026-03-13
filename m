Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58846105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41EC10E06F;
	Fri, 13 Mar 2026 13:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aygn98Ia";
	dkim-atps=neutral
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5082310E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:43 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-128d7db88b9so2649309c88.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409962; x=1774014762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqbSvS13g5ne9eTYL+aRZmY9zcSMMhmRK7PLah08484=;
 b=aygn98IaOS84j4DxNNrPc7K+WDGe1ad8dNYZjidBIkBXeFzgSwth3U4R865EuT+uLD
 rk0XhLWQXsKgREd8OifLdlOriP8OzkCcPQ5TxrEt1iTIrvp6ZSVYjPl7UYVo29gdry7V
 gmuk8cDlCGH2x/5k6tKH27Jz43qTs+PmLqdNnQN+HywjUChmWhOTtSJCPUsEbCF4i/vH
 eB57X0sBcZuZlfE6jBM5DdWEa7Sss88/k85AS9dJj4OPUXwj5eBw+yWY2csUD9H45EOG
 kT5Zs0IgDA4BWq8iRy7FPD6yBE5PUE2GqKEYxWpltKOTHCRtoOePUCBKUGVPxcuGRx/i
 Qx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409962; x=1774014762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nqbSvS13g5ne9eTYL+aRZmY9zcSMMhmRK7PLah08484=;
 b=iOIIm0X09phRlgwLZda5OJznJKQ5xjlpvjOdzkZ2M0Vn2X6nnUQcNiqA4fC/C6g1JM
 VjQlC9aKUG1fwDJV7nelFUPwELd0sd+XxdZFSRgLflPZ6W4tjMa6GrzaFdtRMNwrOunO
 8Bxi1BXLp6Q3qsrhYLgTF1PoI77P2/7OXTRrSVz0f/+TSvyvqI6Ujuagv9DbsZkrfQI7
 UxHyMblJttsynQnr0cqLo4kKyFwMfw2M2Vjn0auh2X3jRIJ8a6g41Si+ISp3ijEVkfA6
 2nO478SqYWWPzJUsE0Gre1/6tpm62ufQ/D8r0b7/ARiPJcC2a2Yx2VF3UeQtnTY9RQSl
 gYDw==
X-Gm-Message-State: AOJu0YzlNvVHmpORBVkITWlUFXLSPyWV5AtJGdz/gsOEcByitHtHKBvD
 3VksbJTBGxyyvrncqVB2+ND8e89uyfoRMx/FjxBsD7qk5zw/+AxIxTIIdhSg5lJi
X-Gm-Gg: ATEYQzxQELllolHuLeq8fGbaLZhVO50BPmPSvIpV4Rq9217pB3MMgwlu1mkd3JEGZO7
 ezpriFQYTdsEuy3yh8SmTIlya4vMAJxfra65feq+c+SBfz3aMGezwKcJ9X8VgVsHSWgMsBsdDsp
 H90AJ5cR3A06bLLDe7u5kn67bbpG6MoodCrHXsfuzUbmIcz9JMwrVyqfn7bFrS2caXusOCFfSg4
 BEMtehuehoClbuxpEUiICMr3K/kfP/fzWtbT66X5GWBArj/zq7LBpjTQcIcStjr5BnZuKCStPxK
 d87dVTUMCmBLYX3qhCwfQNDYEa5Zb407h+NvfB/BefybwDwpPcxmOLDd4BqQfgkripax9628reR
 jjNbD6aqoXB2nChQIPC5+9u9UI8kQbMP5OXizP7rtc1z1ICdnwwexJPyfbOIhd0Jng2/3fGX7vJ
 P/fW6cb8Pib3AqBApwqCvqkQAlF5p6mblOdYUEDbHzNC6zylIiDr6QPIqk5H4=
X-Received: by 2002:a05:7022:f97:b0:128:d4be:7433 with SMTP id
 a92af1059eb24-128f3dd31e1mr1365011c88.34.1773409962148; 
 Fri, 13 Mar 2026 06:52:42 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128f63b6a34sm2470142c88.14.2026.03.13.06.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:41 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class selection
 to helper
Date: Fri, 13 Mar 2026 15:52:00 +0200
Message-ID: <20260313135203.1782240-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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
index d8e5816ee..365976be5 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2466,6 +2466,26 @@ static void update_offsets(struct intel_bb *ibb,
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
@@ -2508,26 +2528,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

