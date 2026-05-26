Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4E9CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335C210E6CB;
	Tue, 26 May 2026 14:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHLDQ3S1";
	dkim-atps=neutral
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1733410E6A7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:14 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c795f441ff7so8108413a12.2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806653; x=1780411453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxvVpdE2artHKbP7gzuHDHbxevu05n0ET3nrcdvikh4=;
 b=YHLDQ3S1ATRELF9bpBj7Z3oolMAUa+ZMg5Q77BkUOnY9kvrilyV8qfaALqv4m9jdfr
 kI5P506aSxhIonYZK3xWY3cBo5lCZQJdV+I1gj489OVIcqBItnwHZJwcSpRbLX6kWimr
 du3SNGNq+pHtgxGHj+FIbblS7p9B/BKVpnpMKVDNbNaztV3HNqCKZAL52jUI4H0s/gAV
 Ihb8yMFiNrWDcaRgrNMZoVhaRSUPIWFoJSp/tVZpr8CoNCmC3ng82IRPLEwu758v3Zsj
 yPnCf9KRNhAiT/kjbe04kuw0+WeOIbf5Hc9u3gTwXYwez2tEj/yQTGGMH7XOOF2uj1ZC
 pSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806653; x=1780411453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gxvVpdE2artHKbP7gzuHDHbxevu05n0ET3nrcdvikh4=;
 b=SInNlImbPHtnndIpqNYYxKETM+gc+z0Jc38zcAb9GZ74EePKAs6Pcu0sXjTzkZ6trs
 5FpSU47+FKbaf5SYUmIK8D57UGehggGIaPG00qC51AancfHTCfEJW6dxnhe/kw42ypMT
 Iru5M1kTD5A8MyJltjAclu2PoruPwPwGripeFOwZ9pyL0clUn1N27ZMkV8TGm2PLdsCB
 F5GVOPz/gBaL+AqQiUqe+nR6r9P9yJ95JGnBk0SsaKU+Jp5+WXMnfwjc867AFrYif0AP
 2LBpVriwMwxlwHAsr/wVY7QEAwQ7+ownDmgggXCRM9+r+gLYkFErBenp890M9cHxo8vI
 RudQ==
X-Gm-Message-State: AOJu0YxtTHMRNznUEZLlVZd4RsT5Ck6CxWxwCMBl789QRwau7VZQiGtl
 P91oDjumTqJW9UZCG4VyeO6Thr9A3PN1k6qulUpDu6XmncpvRJjhrxErxhF1zXpO
X-Gm-Gg: Acq92OEIoPEvGzrFNfJnFfWcnu/mLvRcaEa1AxDtzUvSQLBoF2uqKasOl9UG1/W7lOH
 ou8jWS4+W1u5UeQuKMwwD+vsFzFgWzo761hRlkdXIDgKNBPUAB0Zm6Kqc2WAXd2x9be3TLsFktw
 fBeDaWMWjFtR8ST5tTOc8hX4l/MH/U63XnN0zwNCX9XFJtePUFp8GWttd8ZdpVxDj1mV6xb+3q4
 pNCmVzk/wimFfxi0xmB8bkvgdBpuokEYpXusykHVz3zK2VJYiZW9RQgs9Vq2yrWH50suq5ZyV6Q
 v0Bv8MrrDafFFlAsOGb9DqXXNLxx090+IHQBus9z+who34QP1kbGOiK9QDpStscjEw7eNU3KhTr
 7GsuvJFoOqv1GCdFoqbqtdzDelZkuUYX1Gn7egIQ4NOtVV8r/1e7LxHcYPoOYcELfHCqFEUKGXu
 t7AOO9OLVlmU1u+ZYHkzKgggy3FMyt7LbVMIyCQTIjNvdwwn8usHYnJTx6xF7aNKEioUVAcg==
X-Received: by 2002:a05:7300:aa8c:b0:2f2:2e0b:24cc with SMTP id
 5a478bee46e88-30449192e35mr8747375eec.24.1779806653354; 
 Tue, 26 May 2026 07:44:13 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3045223103bsm10193247eec.16.2026.05.26.07.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:12 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 4/9] lib/intel_batchbuffer: add intel_bb_create_with_gt
 function
Date: Tue, 26 May 2026 17:43:38 +0300
Message-ID: <20260526144343.2531299-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index d53e3e5b8..94b0a99d7 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1166,6 +1166,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt_id: gt id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with gt id passed in @gt_id
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
index 1e8b5b96d..0993d33b7 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -325,6 +325,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 uint16_t gt_id);
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
-- 
2.43.0

