Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C13103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3C210E859;
	Wed, 18 Mar 2026 15:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A2RdK1sx";
	dkim-atps=neutral
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8908710E85A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:06:04 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-82735a41920so11190b3a.2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846364; x=1774451164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXcPvSTuM6ofqZX92NzFhP2wdoXKumpJZXtEaVrE1NQ=;
 b=A2RdK1sx35RgDM8+dkQvaOJJWSXC+d5HAXIx1ziDvmjO0ju2/eID6Us8knSgnCG04R
 mmcHv5sl8med772t/Dzshq0wMTdpXPRfPhi0EZ+IO9cDCoHOkQQQZIIlHjVIkXBHbjXg
 BAJ2LlNG/SE5O8o2iZTDKsj70Do7kv+adRTiVIqLx5RJ3hW2WRPp1Y47RTQA9pGqD1Wp
 Lxw7nMtdYY/DnBXQ0LTRV6+W4BjZIy/xra6bL3JEVVMNqz8O7LcBGd2qNNjCEmiCAEbk
 +vgYQdi3O0qZduqaDs5tvZf0/4S1ScBBE4sMjZ2jv/9OggvFgCk2gVo/de8zel5fdRV9
 mBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846364; x=1774451164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rXcPvSTuM6ofqZX92NzFhP2wdoXKumpJZXtEaVrE1NQ=;
 b=QAVovmHjDSPgfuyDhZxI3OJ9dY47V6L/IIlw19s44qSVnddJ56qscv9yrONTns0JGK
 RuaCuFkGB5irMHqZA5OAZqmxv6wL1KXIsT4QUi58Qm43DSMIeltAdaZk76OGZZZgqnF6
 OB3UZ3OuHD3HaW8HDW6obG30WbTn/NM6cj1mCk+HZ+cCalXBT0Uup3c9kILAU4OwgZ8K
 4kv5bn6EdcvU6bfEWMgyA/vXJVrXFFT9klmAc3o5BhloCnFTKJyaZSQ3QP2ADOh4Cnjc
 OV1wEefrplGVCvbM1prwVyhr9kdknJgBOBTy/lslqkXX2MbDdtBUK1Sr0qOiqSvYp+RX
 MSHg==
X-Gm-Message-State: AOJu0YzEifYQkOunOcglxTyJ7ocYduT1nb0w45ChxgbfRHzPobahbWNq
 4mo8N7R7lzarb9Etj74EuUwg3pjUJaXADAVN2X+FbBmURvdRQYSgIil/ZM3M02TH
X-Gm-Gg: ATEYQzwqw0dcgNBYm8URL2BTSqapYanaxGirV4/i/ekz/440d0HZ02Pup6n4zxHNF47
 wOyGCcmpS6flbLo66xdmvLS66q2pATSKp2rX8tzHgjmcnOUS+MNuI9QI5vdrE3IaMwAK9WLuFKV
 WTdvNHhCBa8B8/+89krnLagHaYY7W0CIvfbTMDUbnzL8gJHzaLyOOVPHj2CEHk5SLJ64gWP3idQ
 zVpNsSQwGwj8ZUTrHwCZUTsiwLyYmVq3HnsNT8fPgWAkXmcea/ImCZzti8fWlDvfGFjsGBcqzsE
 TTvxHS/pRvfhWOqf5f+N/Z3+IOATmkL3Pz4jfprC2RJiNq4/k2kUJx9kU1kd6TsbbJUJfj5upo3
 oImEzJyW/3cuH2dJZCfZhFyuLUg0Z07g4PPMj9OJ40Mot13hiK1XLM8DsT5HvHQtyzDoMW40XPM
 xX94e0YF8xlfXZgitzujWvxJAefmnFm12wCqUFJjXVs4GRIRuRroJtvjXocst6Yg==
X-Received: by 2002:aa7:8896:0:b0:81d:dd3a:b8f5 with SMTP id
 d2e1a72fcca58-82a6aed7753mr3756412b3a.38.1773846363466; 
 Wed, 18 Mar 2026 08:06:03 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b565930sm3000132b3a.14.2026.03.18.08.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:06:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/8] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Wed, 18 Mar 2026 17:05:13 +0200
Message-ID: <20260318150517.4049206-5-juhapekka.heikkila@gmail.com>
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

