Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBBA1098782
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85F10E8CC;
	Fri, 20 Mar 2026 13:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FRmhZrfF";
	dkim-atps=neutral
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863410E8CC
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:46 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-82bae83318bso310839b3a.2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014405; x=1774619205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXcPvSTuM6ofqZX92NzFhP2wdoXKumpJZXtEaVrE1NQ=;
 b=FRmhZrfF+nOUhKb/e2nKDT8wQw4OahSQaaYJ5WWxXQwDf0qK21sPev+o7ea5IO1tLM
 StxmDgWpD+1G/YRQkFNGi7nj4ReWJhcKO77U1/Kq0mG+Guz20uDqwMxHMA+vYRXCE7yC
 YJKffvUpsO6x9MF8PzFxVrbLcIltYqPHmZGz0vWowpnkNV4/NRmFgqo1OJM3fIpyDoX0
 /K1Bb1dqrL3PyWgnPsQ1jUXFTLqxKITGihiDZbSauf148Pk9WEPH2AJgylDcnIOVMHnA
 Kw+G1y43cH1rF6MOzWGwzcVFtgH6K9qKm6uDMZEO59vgMrEt3YgBtFn57BZrar6pnQMK
 ZDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014405; x=1774619205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rXcPvSTuM6ofqZX92NzFhP2wdoXKumpJZXtEaVrE1NQ=;
 b=M8FDLHuLqR476juofza9aO6Ol3MWte2f101BRaGLwGnHA0GJN4dKsR3sEMkwzlZ+Wg
 50d/EHXzJ7c+exNMTdx3kIm56FnIDs2dFOz6kj7QQcdwbeliDhRCJVqBdMcPoiWVmmbb
 z1Ntidlf8a1r0nIAgpQWWZYycVoogIdQpeAF7jJUIa0vjLySazS+yNfG0NdJFVgqJ9pS
 nOK8QZIqxGnml0Ss68UbqUmlteFRqtNhTl0q9xgTHXLX5j+bq9LKCNexYLNF4lQ4WiOv
 qjYKH/KqqMKlFxWIkjYNKpgcfHgbsZguszVuZ+KtyPMu1yM9RILtgDyRkJbOtQgTd0R1
 SeWQ==
X-Gm-Message-State: AOJu0Yxh/ECF/VeYchmQdiGQxEgAjk5G7P6sDLqYvzF45q3835ACfIvy
 4aAPXa0WS9cbSITWq55XFz3ng1GyyfgRydnj0dqGFaOJdAg+2FVygvt6QL29tCVF
X-Gm-Gg: ATEYQzwsM2qzF7+35xTTxoI8Q3/Nif7X6Ec6l/T7BdzLM9d2lfrzkU67iAFBMpWYAhV
 QWAca7m1CZMOu6eVAKBsTHR/l+6nrxXPL4vf+gDY+qI235vvEB5u2IV8iUSxUQ8FAEgjnDXKLPZ
 HWhyrcbDNcCrf2svmtzNWkHS6ccyPC/UjsIAuyqJTRGcNUQ+PhqLTWA0AkP+pAf2QKcVI7HA4Pj
 WrISW4XDjUiB0d3NstYzUUnoxIJrgSEiSXDCPjiPokJqxE0S4OLhgNep72k0JQ6dpRWiaKzlv4V
 jOkQyW62SqMEFH+vtGWEncSG/dS0lZxkEzEV1ABtNJ1g0xGH67iok3rp7LpJ1lGlr9qJBbRvRA8
 v8sU2z+WqaHypOhXZ/DY/AeY5rCp+YRTNpWE+vUmyKxvdfwzmMBZzm8iJDtCDCefpzlqTH/mjhu
 pCH7/eRB/G8GoC2NwWvoRg3Ty5mfAIYQMNuncmM9REzRmX5Iqh5AQJOwXIS74WZg==
X-Received: by 2002:a05:6a00:2c95:b0:829:7187:1a80 with SMTP id
 d2e1a72fcca58-82a8c37df1amr2347805b3a.45.1774014405453; 
 Fri, 20 Mar 2026 06:46:45 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b03bbf050sm2034419b3a.16.2026.03.20.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/8] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Fri, 20 Mar 2026 15:46:07 +0200
Message-ID: <20260320134611.876379-5-juhapekka.heikkila@gmail.com>
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

add possibility to use gt id with batchbuffer when on xe

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 802e771a4..cfafaecd0 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1162,6 +1162,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
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

