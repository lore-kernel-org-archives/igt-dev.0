Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA02C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 15:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39110EB5D;
	Fri,  7 Feb 2025 15:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UH4TuMWs";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A9010EB5D
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 15:47:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-21634338cfdso55251585ad.2
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Feb 2025 07:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738943221; x=1739548021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j7SdGJnhri/MCoynMmVlcp8tzLVZ1rZRggrVISJua7s=;
 b=UH4TuMWsKAZGNCI7BsdnTs/fOEAzqKaVE5azYwocECnQV5WyIt/8Efma09wWYV5/1C
 XPiqUBom1FbDYkvf68QxjcF69mhWQ49y9CpMUciE2zfB7Q/oCkxigSDGJL/WfeAh9iuN
 fgJZoaRssM0cg4NMfggkO4ooXXkGteyScVQJkBIT5U/W9sHoZvaMcF0kG4xeebPUfmau
 GWrV2aX9f3SDtS/Zu1Y8Et4g6fNJS9zBF6zaZJYpu+/q/aVFQM4O3raa5Ly3npCJWchC
 q0ZGrLfp+RgqlEuGJbicaCNuPnpIU1Fb8taq0Q6lXrM4j5tTtmJ8JmvHSjc+Gt7s68v3
 dcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738943221; x=1739548021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j7SdGJnhri/MCoynMmVlcp8tzLVZ1rZRggrVISJua7s=;
 b=EPnapQEjwr8FHQWn+S58y+n5tRa/miRJeaEbDMZA/vGSa5Ko4RkCZp5w/Kn0kLqX2f
 fPBj5NSJLt5zPzFm1fCk2ZJIrMGU6/EYmp1JFaAmcWBOCc9lHKr0L+ukW3J6pYKrDnFJ
 0Is+je0lxYgS4is+jhu6pvhw9C96hACYAP7Uk0VS4XbNJzI4/bxv/Frf2npP5gzFjkW4
 RlnUwnyOHSKSR9C5m+7HsbpJtbSsJDZte3GknKo9sx/vqgHA6EyWzv/MZv/RvhiUiSqA
 bGqbKRnbs0MioUcDvToBNk90rFLp83ymlvnpzj0/lzpkX0iHoZTJP0gzw6WmcMpjXmwr
 Q0rA==
X-Gm-Message-State: AOJu0Yz5roIYoenQlTmQthAQ683I+ZluVGIVxJi2DK3ZvLSTeVSLD1OR
 pSx5mct2btBd6qthxNRqE9poxXlvFdbUV0F3JA/mG1AKZBN//v3nHgUGPcnzSgU=
X-Gm-Gg: ASbGncsezUyjnJAb/zKOaO+devFr3BMbzN4YoRcJnVCndfGFGOgDsjPK94WirAQB0Ge
 L4gG90NaSpPCt04Psle89VUB69/NMMDgAXSfAke5B3g92YsR5hhfKr/6P3hENtByM6O5eu0Mhc8
 Qo/XVcewW4QnoOpA55s6sUmFBRUcHgMiLyRq6s81TVZxnE4qgEYJ45vRRUZ7tbEJnqZJwwhJ/FC
 N8dYyHayulRcbrIPucHMlRB/51f8oNNn2QaanCOa36RfKxvyAI6ofFHPUXOH3/9aKU3VRXrpOaM
 WNCYz6/84Q1MDkw3dKHo0mUu
X-Google-Smtp-Source: AGHT+IFsumVSuxu4toyXRCGBSqtRd/VPFoiPOrD6uCrDlgluKAfCiZRCc1Tz3qBjT/lg3xSp4aTm6A==
X-Received: by 2002:a05:6a20:394e:b0:1e1:384e:20f1 with SMTP id
 adf61e73a8af0-1ee03a9b2e4mr6456597637.25.1738943221522; 
 Fri, 07 Feb 2025 07:47:01 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048ad2841sm3140005b3a.41.2025.02.07.07.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:47:01 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: add missed include
Date: Fri,  7 Feb 2025 17:51:52 +0200
Message-ID: <20250207155152.2506970-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

seems <fcntl.h> is needed for O_RDONLY flag on some platforms.

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/d3602c12b73fc950da9ea575a95d8b923c7a27ec
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 8be3c063a..ad0ffe589 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -33,6 +33,7 @@
  * Mega feature: E2E Compression
  * Test category: functionality test
  */
+#include <fcntl.h>
 
 #include "igt.h"
 #include "igt_halffloat.h"
-- 
2.45.2

