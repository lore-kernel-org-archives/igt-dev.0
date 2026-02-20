Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98423C5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5276010E811;
	Fri, 20 Feb 2026 16:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iblFz1+T";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FB010E813
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:17:58 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3562258142fso1244491a91.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604278; x=1772209078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5inc7nt828JmYVXFg8QMXKP/2DUVrqdfa6R9kcap4s=;
 b=iblFz1+Txud7LM61Ni+QNTtVM8s7S5+bLJLYmBinSmSrCuVJEp1wbq1fEqyIX5CuXT
 EedMc2SefZDWJxSAFGc17yuPCtjLP/t6hdwdMXY7xxnwhe5qkIBI2u23vok5LaASv4e2
 Y2Wi4Iw6EuxxNBFpJVdw4Ph+FGMtirfJWWCRat8+anreduQTPSiO77qOBH3a4fNj/dw2
 tWxyXWDVWSkrCUprq9eMESvauh+xI9FlAPrREjRLRhlICHtDZoGvGK8QKLgSAHFAKCPP
 rl+7z+WViyUc9iMFWyvazUGKbfdoGsNDYb4BlneoaH/9UiCCpBWx3FWPImHpu+TlNooi
 QghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604278; x=1772209078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N5inc7nt828JmYVXFg8QMXKP/2DUVrqdfa6R9kcap4s=;
 b=vzdiODoDEOzsXRz205QBPUQK3CRXeq6pi6QCsdi/VUahhcwBUlA1mofvgJ6U7mElTN
 EHGqfOq32fnC4PTMBXwJbDpWfSkc5khEHbxHmvP+lAe+GhcXdMMN5lLu9+JVAvbAnLOm
 1G7SY8LGT/G/mk5MFJosQBugoDYqa6UOUxvZ5ojYg5l7WAOvsxNXsu50Y3aPTIQczZ55
 ZNxI/Tb09xRjt0VGnDPif8PytmsKWpm2a+Vv8snQjwlmvqv7K9+uEb+lu2k3ID3s7MbR
 nJyrQo47gbM9P5Fr7nnWu5B4uEJScmCM2lMYE5IRat1R5A+pmgwoSW32ev3WaK2N+bJq
 vN2w==
X-Gm-Message-State: AOJu0YwWwtGspsyvEJn6YsdTV5u01cmHS8udPQKZM8ko1ARPbpMHYrTZ
 kYak9sXSqVnsmTBA6M5sghTBq8E/PYFjfF1VxlPTgqR4VqDWFgjoAUnF2vMzcDL8
X-Gm-Gg: AZuq6aJg+gT/R6+GrSrTvlaonXjOGqbJEpHVTO95C+zsZp4iMYrhq5Ymgtd+aPtftnO
 /4bc8zgXbqTz8xBv603GzYMLYsyO2g9hCIb7AzPONd9ezpoJrR6tZR9qixXL4LtDQWrzv3KQemB
 MKoQHySIKw87MwT9yg04n3MMQw0TqDxFBx/ynZ/j3dYr1uPtjCrCJpCf/ZrHjiPdEcGIBJhvGfs
 sETaBQdCeuRDXFfJf8nO0t9dwjEcRCfq6Y3dokfkuWh5ykXdnqC94EF4v3PePkIDOOtonTRMR7x
 hC4IZXUEStUfMMGvP2yZUJdIRFX9HcvcetfnYHETc24AMX43mOCEZ+IDqzpKZ3HW/Zu2YS8m6nO
 zDo19hm4Ow7PtKf9r2t4MijTGSn6UsopSGQXPXjJCwkVbtekyVLneI1GQ5Q7ztyYPWWiWkxfmGa
 kdTyB4IJQxHof6FCkdNz0cUfqAyTP66Veu26zkDuxshnijjqxmxdYAfKLrIVpzwg==
X-Received: by 2002:a17:90b:5687:b0:340:be44:dd0b with SMTP id
 98e67ed59e1d1-358ae8f6728mr142232a91.34.1771604277634; 
 Fri, 20 Feb 2026 08:17:57 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358a278eac6sm1946876a91.2.2026.02.20.08.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:17:57 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/8] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Fri, 20 Feb 2026 18:17:14 +0200
Message-ID: <20260220161718.652862-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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

add possibility to use gt id with batchbuffer when on xe

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 2e1c45335..d8e5816ee 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1160,6 +1160,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt: gt id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with gt id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, uint16_t gt)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, gt, vm, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0),
+				 gt);
+}
+
 /**
  * intel_bb_create_with_context_in_region:
  * @fd: drm fd - i915 or xe
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 7049dd2d0..8d54c6590 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -324,6 +324,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 uint16_t gt);
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
-- 
2.43.0

