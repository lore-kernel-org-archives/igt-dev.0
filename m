Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE95CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FF410E3B9;
	Mon, 25 May 2026 16:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="heW9aHv2";
	dkim-atps=neutral
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CAE10E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:17 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c70c112cb61so7788411a12.0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727157; x=1780331957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xz6+Jzq146REQ3znzvMAuixZgM2q6dwIaC4MZR7NMh4=;
 b=heW9aHv2YlEbtwqnsMPRIAnW/bO9W0ZqJIgihnXQ/6gWjHmBItgPs+kWGl33JS3u0N
 uu/iJqtfxmvcBi9wG65jxP/5obJPZeGrNOhhl5txRGcTcI85uztYMGnApqwriGcxNRlV
 2bQXNvZnxEznqVMN2PNj4W/PqcJO8aFy/Ak/eGFjVqULbqvPu4ryFgJkWvGr1BCjkHrx
 8bfywoweeWG3NabG/g7/l2sZ4RYnA8gUi1VP+wA+KNqr6zoLa20qi5OoIgcUeQr52A+m
 u93Cqnh14oQdPuQBQJG2Gyuzd7em37k0WDYLZeiJWa5GJMrH5OIGOZ0UiOdbdSK0JOZ8
 RLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727157; x=1780331957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xz6+Jzq146REQ3znzvMAuixZgM2q6dwIaC4MZR7NMh4=;
 b=i8AClZ2TBUrI66AOyTvRXs+5ElaFcVP9boz9dtd/Bk6bK1I3CEebMVkAvt9y4XqSW1
 q+Pc1X9awgZrdhVwkq5XPRqqHpr+dbWFaMB6d2Yc3LMbljxRBrt1jJ1o0xR3KTA1vhLz
 x54ISqu1K6XRotDRd1u1aEac5sUnJvPpxvNQf8a97ETZfcHuK5G5Z2AaSh4yZa+U9LGG
 rYMReYt7s+ZgLYQMSBwe9mqmzIZLiyg4LlAJshBTxWh3yJ5M6pF4WRc1LfgdObgpT3ka
 5EvHcI27RPZlymhN5Tg/g+RCQMHfti9kQIKaswCYLCgAECpjdjQlR5cfeCTJLCZHwxA0
 TC0w==
X-Gm-Message-State: AOJu0Yyz91D+eiXzyPvq272reDqg3la9sYBx/KjMPN9ymhKaT5kceIb9
 TPUyHEhOVbfH7fiUe1Rr0pEX03Q1oji2hQJvJ7/L9pyP7EB89tun/f0r5cSL0esF
X-Gm-Gg: Acq92OHLZtTgHXmY8RhhFiYNz3iSeBhxMsasOMSjXW/aaMUVIN//F99VAHeAlykOp1M
 7EKV7aTZZACmDnDmyheVRzlW2CKaOrG1Ks1nOhZtZNHytSEQJoFzwcFfyxzgLj12E1gckh3lwRG
 OpKRCpHMJcfiG8Z/enr6hJgRJX7M7eFDAXNXQNMjdhAwCCOEfcbZ20L6MyJETHPvLmnADQ7IAQf
 d+30ffbiniCzGBGYJwk4tZCSJDaoOJug5g3APJSttilaTIwPaiYWgAlUpsu4JRKicejsZnV93lB
 +Ce2bVNXgOabMalPqv/LFXVhqcQGBzvsp/Yjlc1eosG/td14n5QSlCkOdkXG6BgNiN/gz+SRnpI
 pnh9LEHeHRRYnSl2SEdd0bFpnUB+RS4Ud4A/AboLTMWlfdR3A0A8DSA0mWKAIoXcNDQnmKzWBhb
 bYxGfIWRJ0TS7MKkHXgFmE7izLTGebO0Zw46qcOg7wTTcWNjNrWMQDpL7tD4VLdg==
X-Received: by 2002:a05:6300:6d8f:20b0:3b3:62be:3241 with SMTP id
 adf61e73a8af0-3b362be384bmr4616616637.8.1779727157406; 
 Mon, 25 May 2026 09:39:17 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8520561e94sm8901966a12.22.2026.05.25.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:15 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/9] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Mon, 25 May 2026 19:38:45 +0300
Message-ID: <20260525163850.3493602-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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
index 536e8e402..4659b2915 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1165,6 +1165,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt_id: gt id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with gt id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, uint16_t gt_id)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, 0, vm, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0),
+				 gt_id);
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

