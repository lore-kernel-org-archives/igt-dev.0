Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A407C3600D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE69B10E5DC;
	Tue, 25 Mar 2025 19:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kR4FcGf8";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BD410E5DC
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:09:02 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-225df540edcso3102945ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929742; x=1743534542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aN533oPKdbC7UQL6WBgzxNmR3mk4Ew3YoMsV5kRolK0=;
 b=kR4FcGf8A6vWidtSq7FHkWPPFSrKjChqhOtUm+fYAFBu8IuTo7/Ln7JkY4CKcQanwX
 pPwtvbXTOThj2uiYS/wPQ/nyOo9E1WOvt3tYOy18R2wxE8vm/HL+mFO06pwKx4//wfKY
 xu1PkT8Wsc4dRVVivr5k4jLZW6xnTVx8gIyafQCPOirmF2tqK1EBQeLKoXe1rH2agcZw
 5MnXdT9PXZ/Dtc6WfBPU6wDRhQFl+b36wplEbLeyGKUrFYmDOkaW61No7+gcJARptoKt
 e/D3bqjgRaevldJJwomL8M7bLBo+XYtuKHsaAi1uF9VLQ1CT9Mhnr+ZdhrffVQdg3RM4
 rRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929742; x=1743534542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aN533oPKdbC7UQL6WBgzxNmR3mk4Ew3YoMsV5kRolK0=;
 b=cm/nfXNW4HHzs1ujlb0MT3CU70/aKIG1UrPVCU74ys/e8lvSJ9UN4YsH+jhn4n907b
 T68qR06P8rjP4wDfE+MW4my2jxJNabx4Gbn9apsPEkbMP8TgrAVv9sH54g067p8TDO/S
 1Czw483xHGOYVbHYba82Z9vfcezU+KOFqufd8pJCP3nPg4SX9soAWszARgyhrrCwRQvJ
 l9pre4dXwbPakS5PV+gLb89JBk5AKL8Nw3oHFchmb86gDKKkZbSYZFSuyh0RgDmxaz+l
 oRIIZ14RGLvjaOByp/D9rAyyd5II/l3XbgPClHXBjBSU4lYcA3zoH68e9Np41oKnGodr
 9wqQ==
X-Gm-Message-State: AOJu0YwcIHUHdqZg+GBqpQ+yqcftdiMR1S/OMg/30VnCxwFIUnU4iha9
 JD3KJkjcFMH5l+mHOL0whfLtaJfzm2zz95BaIkGCHavvpR2ubIp1m1jqX4DxQA8=
X-Gm-Gg: ASbGncvB3G7icoMYPPc6DsJafbk7Wpgj3ULU4aDWGBqzxNGxDVqhmCNWlylUWtV9eBq
 TdkMv2Yb6uyhvu8xVKKSYsDCarcWu1swCERrDpL8hBirgJvEUnmV/k/jXiDljNHaYpLIA63IapQ
 Dp1MvtCzHzIDAoX7+ySIAd3iK36naqcC5aHHcS3KEkXdr6yNRxJj5DCPXUwnBYacIUF0mbvI3L7
 ctoodHlH7BiabxbNwgT/G7pWfnUISJLxz8ZKdk64QU+oPQe18+1k1T0tRP2Hp6qAjHJPAXVIGGn
 1fUBMqKo22umt5l4SIunKl3LNNyAkMww6mF2a/ctqwVA1b5h1kJASw==
X-Google-Smtp-Source: AGHT+IGGbuKurrAuee33Je9v3NFR780cl3JsdpT2QkrnLk27UdoFqNP4c59daJAi/VJc/+glmZM/6Q==
X-Received: by 2002:a05:6a20:c906:b0:1e1:a449:ff71 with SMTP id
 adf61e73a8af0-1fe937b66b1mr1400995637.1.1742929741783; 
 Tue, 25 Mar 2025 12:09:01 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a27d9a75sm9457067a12.16.2025.03.25.12.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:09:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/7] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Tue, 25 Mar 2025 21:08:35 +0200
Message-ID: <20250325190839.1984723-3-juhapekka.heikkila@gmail.com>
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

add possibility to use gt id with batchbuffer when on xe

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 25 +++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 72bbbf8c6..baf34a837 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1149,6 +1149,31 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with engine id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, int gt)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, gt, vm, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, gt));
+}
+
 /**
  * intel_bb_create_with_context_in_region:
  * @fd: drm fd - i915 or xe
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 178aaa9d8..d0d3f065f 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -323,6 +323,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 int gt);
+
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
-- 
2.45.2

